package deceptinfect;

// import deceptinfect.ecswip.RadiationManager;
import deceptinfect.ents.Di_entities;
import deceptinfect.ents.Di_charger;
import gmod.EntityClass.BaseEntities;
import deceptinfect.game.SpawnSystem;
import deceptinfect.infection.systems.InfectionSystem;
using gmod.PairTools;
using tink.CoreApi;
/**
    Contains instance of running game. Active during waiting for players.
    ???????????????????????????????????????????????
**/

class GameInstance {
    /**
        Maximum amount of time until everyone's infected
    **/
    public var totalGameTime(default,null):Int = 0;
    public var baseInfection:Ref<Float> = 0.0;


    public function new() {

    }

    public function start() {
        setTime();
        calcBaseInfection();
        #if server
        var chargerSpawn = SpawnSystem.obj.getRandom();
        var ent = EntsLib.Create(Di_entities.di_charger);
        chargerSpawn.spawn(ent);
        var bat1 = EntsLib.Create(Di_entities.di_battery);
        var bat2 = EntsLib.Create(Di_entities.di_battery);
        var spawns = chargerSpawn.getRandomSpawns(2);
        trace(spawns.length);
        trace(untyped spawns[1].claimed);
        spawns[0].spawn(bat1);
        spawns[1].spawn(bat2);
        var nestSpawn = SpawnSystem.nest.getRandom();
        var nest = EntsLib.Create(Di_entities.di_nest);
        nestSpawn.spawn(nest);
        var evacZone = EntsLib.Create(Di_entities.di_evac_zone);
        var evacZoneSpawn:BoundsSpawn = cast SpawnSystem.evac.getRandom();
        evacZoneSpawn.spawn(evacZone);
        #end
    }

    public function think() {
        baseInfection.value = calcBaseInfection();
    }

    public function calcBaseInfection():Float {
        var baseInf = (100 / totalGameTime) * GameManager.diffTime;
        //trace(baseInf);
        return baseInf;
    }

    public function setTime() {
        var time = GameValues.GAME_TIMER;
        var variance = GameValues.GAME_TIMER_VARIANCE;
        totalGameTime = time + MathLib.random(-variance,variance);
        trace('');
        trace('Time until infection: $totalGameTime');
    }

}

enum PLAYING_STATE {
    NORMAL;
    EVAC;
}
