package deceptinfect;

import deceptinfect.infection.InfectionSystem;
import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.game.components.SpreadComponent;
import deceptinfect.game.components.GasDraw;
import gmod.helpers.PrintTimer;
import deceptinfect.util.Util;
import deceptinfect.game.components.Darken;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.stringtypes.Hook.GMHook;
import gmod.helpers.net.NVector;
import deceptinfect.game.EvacSystem;
using Lambda;
import gmod.helpers.net.NET_Server;


typedef Particle = {
    particle : String,
    sizeStart : Int,
    sizeEnd : Int,
    airRecis : Int,
    startAlpha : Int,
    endAlpha : Int,
    randXY : Int,
    randZMin : Int,
    randZMax : Int,
    color : gmod.structs.Color,
    rotRate : Float,
    lifeTimeMin : Float,
    lifeTimeMax : Float
}

@:keep
class Spread extends System {

    var particleTable:Array<Particle> = [{
        particle : "particle/smokesprites_0001",
        sizeStart : 50,
        sizeEnd : 50,
        airRecis : 90,
        startAlpha : 255,
        endAlpha : 100,
        randXY : 10,
        randZMin : 10,
        randZMax : 50,
        color : Gmod.Color(0,0,0),
        rotRate : 0.9,
        lifeTimeMin : 2,
        lifeTimeMax : 3
    }];

    #if client

    var nextGas = .0;

    #end

    var spreadTime = .0;

    #if server
    override function run_server() {
        final infectionSystem = systemManager.get(InfectionSystem);
        if (Gmod.CurTime() > spreadTime) {
            spread();
            spreadTime = Gmod.CurTime() + 10;
        }
        IterateEnt.iterGet([SpreadComponent],[c_spread = {markedMap : markedMap}],function () {
            final inf = MathLib.Remap.bind(infectionSystem.getAverageInfection(),0,100);
            c_spread.percent = inf(0.2,0.7);
            for (ply in PlayerLib.GetAll()) {
                final navmesh = NavmeshLib.GetNearestNavArea(ply.GetPos(),false,10000,false,true);
                if (Gmod.IsValid(navmesh)) {
                    // trace(navmesh);
                    if (markedMap.exists(navmesh.GetID())) {
                        PrintTimer.print_time(1,() -> trace("Player in zone"));
                        (ply : GPlayerCompat).id.add_component(new Darken());
                    } else {
                        PrintTimer.print_time(1,() -> trace("Player not in zone"));
                        (ply : GPlayerCompat).id.remove_component(Darken);
                    }
                }
            }
        });

    }

    public function beginSpread(nav:CNavArea) {
        final ent = componentManager.addEntity();
        var mapSize = .0;
        for (nav in new BFS(nav)) {
            mapSize += nav.GetSizeX() * nav.GetSizeY();
        }
        final c_spread:SpreadComponent = {
            percent: 0.3,
            initial: nav,
            mapSize : mapSize
        };
        ent.add_component(c_spread);
    }

    function spread() {
        var removed = 0;
        IterateEnt.iterGet([GasDraw],[{ownedBy : owner}],
        function (ent) {
            IterateEnt.iterGet([SpreadComponent],[_],function (spread) {
                if (owner == spread) {
                    removed++;
                    componentManager.removeEntity(ent);
                }
            });
        });
        trace('Gases removed : $removed');
        IterateEnt.iterGet([SpreadComponent],[c_spread = {
            initial : initial,
            percent : percent,
            marked : marked,
            markedMap : markedMap,
            mapSize : mapSize
        }],
        function (spreadEnt) {
            markedMap.clear();
            marked.resize(0);
            var endpoints:Array<CNavArea> = [];

            final target = percent * mapSize;
            var curSize = .0;
            for (nav in new BFS(initial)) {
                curSize += nav.GetSizeX() * nav.GetSizeY();
                marked.push(nav);
                markedMap.set(nav.GetID(), true);
                if (curSize > target) {
                    break;
                }
            }
            for (mark in marked){
                for (adjacent in mark.GetAdjacentAreas()) {
                    if (!markedMap.exists(adjacent.GetID())) {
                        endpoints.push(mark);
                    }
                }
            }

            for (ep in endpoints) {
                for (ep2 in ep.GetAdjacentAreasAtSide(EAST)) {
                    if (!markedMap.exists(ep2.GetID())) {
                        final ent = componentManager.addEntity();
                        ent.add_component(new GasDraw(ep.GetCorner(NORTH_EAST),ep.GetCorner(NORTH_WEST),spreadEnt));
                        ent.add_component(new ReplicatedEntity());
                        break;
                    }
                }
                for (ep2 in ep.GetAdjacentAreasAtSide(NORTH)) {
                    if (!markedMap.exists(ep2.GetID())) {
                        final ent = componentManager.addEntity();
                        ent.add_component(new GasDraw(ep.GetCorner(NORTH_EAST),ep.GetCorner(NORTH_WEST),spreadEnt));
                        ent.add_component(new ReplicatedEntity());
                        break;
                    }
                }
                for (ep2 in ep.GetAdjacentAreasAtSide(SOUTH)) {
                    if (!markedMap.exists(ep2.GetID())) {
                        final ent = componentManager.addEntity();
                        ent.add_component(new GasDraw(ep.GetCorner(SOUTH_EAST),ep.GetCorner(SOUTH_WEST),spreadEnt));
                        ent.add_component(new ReplicatedEntity());
                        break;
                    }
                }
                for (ep2 in ep.GetAdjacentAreasAtSide(WEST)) {
                    if (!markedMap.exists(ep2.GetID())) {
                        final ent = componentManager.addEntity();
                        ent.add_component(new GasDraw(ep.GetCorner(NORTH_WEST),ep.GetCorner(SOUTH_WEST),spreadEnt));
                        ent.add_component(new ReplicatedEntity());
                        break;
                    }
                }
            }
        });

    }
    //deleted

    #end

    #if client

    override function run_client() {
        if (Gmod.CurTime() < nextGas) return;
        var gases = 0;
        IterateEnt.iterGet([GasDraw],[{northeast : ne, southwest : sw}],function () {
            gases++;
            final origin = (ne - sw) / 2 + sw + Gmod.Vector(0,-10,0);
            DebugoverlayLib.Box(origin,sw - origin,ne - origin,0.1,Gmod.Color(255,0,0));
            var vecRan = Gmod.VectorRand();
            vecRan.Normalize();
            var particledata = particleTable[0];
            vecRan *= MathLib.Rand(20,40);
            vecRan.z = MathLib.Rand(10,60);
            var emitter = Gmod.ParticleEmitter(origin);
            emitter.SetNearClip(5,10);
            var radiusmul = 400 / 170;

            final particle = emitter.Add(particledata.particle, origin + vecRan);
            particle.SetVelocity(Gmod.Vector(
                MathLib.Rand(-particledata.randXY,particledata.randXY) * radiusmul * 2,
                MathLib.Rand(-particledata.randXY,particledata.randXY) * radiusmul * 2,
                MathLib.Rand(particledata.randZMin,particledata.randZMax) * radiusmul
            ));
            particle.SetColor(particledata.color.r,particledata.color.g,particledata.color.b);
            particle.SetAirResistance(particledata.airRecis);
            particle.SetCollide(false);
            particle.SetDieTime(MathLib.Rand(particledata.lifeTimeMin,particledata.lifeTimeMax));
            particle.SetStartAlpha(particledata.startAlpha);
            particle.SetEndAlpha(particledata.endAlpha);
            particle.SetStartSize(ne.Distance(sw));
            particle.SetEndSize(ne.Distance(sw));
            particle.SetRollDelta(MathLib.Rand(-particledata.rotRate,particledata.rotRate));

            emitter.Finish();
            emitter = null;
            Gmod.collectgarbage("step",64);
        });
        trace('Gases : $gases');
        nextGas = Gmod.CurTime() + MathLib.Rand(0.3,0.5);
    }
    #end

}

#if server
class BFS {

    var que:List<CNavArea> = new List();
    var discovered:Map<Int,Bool> = [];

    public inline function new(init:CNavArea) {
        que.add(init);
    }

    public inline function next() {
        final next = que.pop();
        for (adjacent in next.GetAdjacentAreas()) {
            if (!discovered.exists(adjacent.GetID())) {
                que.add(adjacent);
                discovered.set(adjacent.GetID(),true);
            }
        }
        return next;
    }

    public inline function hasNext() {
        return !que.isEmpty();
    }

}
#end