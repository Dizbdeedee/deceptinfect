package deceptinfect;

import deceptinfect.Darken.NDarken;
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

@:structInit
class NetSpread implements hxbit.Serializable {
    @:s public var endpoints:Array<{southwest : NVector, northeast : NVector}> = [];

    public function new (endpoints:Array<{southwest : Vector, northeast : Vector}>) {
        this.endpoints = endpoints.map((str) -> {southwest : NVector.from(str.southwest), northeast : NVector.from(str.northeast)});
    }
}

@:keep
class Spread extends System {

    static var netSpread = new NET_Sv<NetSpread>(#if client [listen] #end);

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

    #if server
    var markedMap:Map<Int,Bool> = [];

    var marked:Array<CNavArea> = [];

    var endpoints:Array<CNavArea> = [];

    var mapSize = .0;
    #end

    #if client
    static var clendpoints:Array<{southwest : Vector, northeast : Vector}> = [];

    var nextGas = .0;

    #end

  
    #if server
    override function run_server() {
        for (ply in PlayerLib.GetAll()) {
            final navmesh = NavmeshLib.GetNearestNavArea(ply.GetPos(),false,10000,false,true);
            if (Gmod.IsValid(navmesh)) {
                // trace(navmesh);
                if (markedMap.exists(navmesh.GetID())) {
                    Darken.net_darken.send(new NDarken(true),ply);
                } else {
                    Darken.net_darken.send(new NDarken(false),ply);
                }
            }
        }
    }

    @:expose("spreadyweady")
    public function beginSpread(x:CNavArea,tPercent:Int) {
        markedMap = [];
        marked = [];
        endpoints = [];
        mapSize = 0;
        for (nav in new BFS(x)) {
            mapSize += nav.GetSizeX() * nav.GetSizeY();
        }
        final target = tPercent * mapSize;
        var curSize = .0;
        for (nav in new BFS(x)) {
            curSize += nav.GetSizeX() * nav.GetSizeY();
            marked.push(nav);
            markedMap.set(nav.GetID(),true);
            if (curSize > target) {
                break;
            }
        }

        for (mark in marked) {
            for (adjacent in mark.GetAdjacentAreas()) {
                if (!markedMap.exists(adjacent.GetID())) {
                    endpoints.push(mark);
                }
            }
        }
        // trace(endpoints.length);
        for (ep in endpoints) {
            for (ep2 in ep.GetAdjacentAreasAtSide(EAST)) {
                if (!markedMap.exists(ep2.GetID())) {
                    netSpread.broadcast({endpoints : [{southwest: ep.GetCorner(SOUTH_EAST), northeast: ep.GetCorner(NORTH_EAST)}]});
                    break;
                }
            }
            for (ep2 in ep.GetAdjacentAreasAtSide(NORTH)) {
                if (!markedMap.exists(ep2.GetID())) {
                    netSpread.broadcast({endpoints : [{southwest: ep.GetCorner(NORTH_WEST), northeast: ep.GetCorner(NORTH_EAST)}]});
                    break;
                }
            }
            for (ep2 in ep.GetAdjacentAreasAtSide(SOUTH)) {
                if (!markedMap.exists(ep2.GetID())) {
                    netSpread.broadcast({endpoints : [{southwest: ep.GetCorner(SOUTH_WEST), northeast: ep.GetCorner(SOUTH_EAST)}]});
                    break;
                }
            }
            for (ep2 in ep.GetAdjacentAreasAtSide(WEST)) {
                if (!markedMap.exists(ep2.GetID())) {
                    netSpread.broadcast({endpoints : [{southwest: ep.GetCorner(SOUTH_WEST), northeast: ep.GetCorner(NORTH_WEST)}]});
                    break;
                }
            }
        }
    }

    #end

    #if client

    static function listen(ns:NetSpread) {
        trace(ns);
        for (nvec in ns.endpoints) {
            final northeast = nvec.northeast.to();
            final southwest = nvec.southwest.to();
            clendpoints.push({northeast : northeast, southwest : southwest});
            
            final origin = (northeast - southwest) / 2 + southwest;
            
            DebugoverlayLib.Box(origin,southwest - origin,northeast - origin,60,Gmod.Color(255,0,0));
        };
    }

    override function run_client() {
        if (Gmod.CurTime() < nextGas) return;
        // GameValues.MIN_PLAYERS;
        nextGas = Gmod.CurTime() + MathLib.Rand(0.3,0.5);
        for (point in clendpoints) {
            final origin = (point.northeast - point.southwest) / 2 + point.southwest + Gmod.Vector(0,-10,0);
            final vecRan = Gmod.VectorRand();
            vecRan.Normalize();
            final particledata = particleTable[0];
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
            particle.SetStartSize(point.northeast.Distance(point.southwest));
            particle.SetEndSize(point.northeast.Distance(point.southwest));
            particle.SetRollDelta(MathLib.Rand(-particledata.rotRate,particledata.rotRate));

            emitter.Finish();
            emitter = null;
            Gmod.collectgarbage("step",64);
            //collect ze garbage..??
            
        }
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