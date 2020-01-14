package deceptinfect;

import lua.TableTools;
import gmod.libs.MathLib;
import gmod.types.Vector;
import gmod.libs.EntsLib;
import gmod.gclass.Player;
import gmod.types.Entity;
using gmod.PairTools;
using lua.TableTools;
using gmod.TableTools;

@:build(gmod.macros.GamemodeMacro.build())
class DeceptInfect extends gmod.hooks.Gm {
    
    #if server

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
    PLAY;
    EVAC;
}