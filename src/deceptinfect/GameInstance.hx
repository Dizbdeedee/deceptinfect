package deceptinfect;

// import deceptinfect.ecswip.RadiationManager;
import deceptinfect.ents.Di_entities;
import deceptinfect.ents.Di_charger;
import gmod.EntityClass.BaseEntities;
import deceptinfect.game.SpawnSystem;
import deceptinfect.infection.InfectionSystem;
using gmod.PairTools;
using tink.CoreApi;
/**
    Contains instance of running game. Active during waiting for players.

**/
class GameInstance {
    public var numPlayers = 0;
    public var players(default,null):Array<Player> = [];
    public var queen:Player;

    /**
        Maximum amount of time until everyone's infected
    **/
    public var totalGameTime(default,null):Int = 0;
    public var diffTime(get,never):Float;
    public var lastTick:Null<Float> = null;
    public var baseInfection:Ref<Float> = 0.0;

    // public var charger:Spawn;

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
        // evacZone.toHaxe().setPoints(evacZoneSpawn.)
        #end
        // var spawns = chargerSpawn.getRandomSpawns(2);

    }

    public function setup() {
        
    }
    public function get_diffTime():Float {
        if (lastTick != null) {
            
            return GlobalLib.CurTime() - lastTick;
        } else {
            return 0;
        }
    }

    public function think() {
        
        baseInfection.value = calcBaseInfection();
        // trace('baseInfection $baseInfection');
        // InfectionSystem.run();
    }

    

    public function addPlayers() {
        for (player in PlayerLib.GetAll()) {
            players.push(player);
        }
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
        trace('Time until infection: $totalGameTime');
    }

    

    

    
    
}

enum PLAYING_STATE {
    NORMAL;
    EVAC;
}