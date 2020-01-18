package deceptinfect;

import gmod.libs.MathLib;
import gmod.types.Vector;
import gmod.libs.EntsLib;
import gmod.gclass.Player;
import gmod.types.Entity;
using gmod.PairTools;
using gmod.TableTools;

@:build(gmod.macros.GamemodeMacro.build())
class DeceptInfect extends gmod.hooks.Gm {
    
    public var currentState:GAME_STATE = WAIT;
    public var shouldAllowInfection:Bool = false;

    

    
    

    #if server


    override function PlayerDeath(victim:Player, inflictor:Entity, attacker:Entity) {
        
    }

    override function PlayerInitialSpawn(player:Player, transition:Bool) {
        new DI_Player(player);
        switch (currentState) {
            case PLAY(_):
                player.KillSilent();
                GAMEMODE.PlayerSpawnAsSpectator(player);
            default:
        }

    }

    override function PlayerDeathThink(ply:Player):Bool {
        return super.PlayerDeathThink(ply);
    }

    override function Think() {
        
    }
    override function IsSpawnpointSuitable(ply:Player, spawnpoint:Entity, makeSuitable:Bool):Bool {
        var pos = spawnpoint.GetPos();
        var blockers = EntsLib.FindInBox(pos + Vector.New(-16,-16,0), pos + Vector.New(16,16,72));
        for (ent in blockers) {
            if (ent.IsPlayer()) {
                untyped ent.SetWalkthroughable(true);
            }
        }
        return true;
    }
    
    override function PlayerSelectSpawn(ply:Player, transition:Bool):Entity {
        var spawns = EntsLib.FindByClass("info_player_start");
        var random_spawn = MathLib.random(spawns.length());
        if (GAMEMODE.IsSpawnpointSuitable(ply,spawns[random_spawn],false)) {
            return spawns[random_spawn];
        }
        return null;
    }

    override function PlayerCanHearPlayersVoice(listener:Player, talker:Player):Dynamic {
        if (listener.GetPos().Distance(talker.GetPos()) > 1000) 
            return [false];
        return [true,true];
    
    }
    #end
    
}


enum GAME_STATE {
    WAIT;
    PLAY(st:PLAY_STATE);
}

enum PLAY_STATE {
    NORMAL;
    EVAC;
}
