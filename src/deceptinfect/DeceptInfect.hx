package deceptinfect;

import deceptinfect.GEntCompat;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.enums.BUTTON_CODE;
import deceptinfect.ecswip.ComponentManager;

import gmod.Hooks;
import lua.Lua;
import tink.core.Annex;
import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceHaxeReturn;
import gmod.HaxeMultiReturn;
import gmod.libs.MathLib;
import gmod.types.Vector;
import gmod.libs.EntsLib;
import gmod.gclass.Player;
import deceptinfect.DI_Player;
import gmod.types.Entity;
using gmod.PairTools;
using gmod.TableTools;
using deceptinfect.PlayerExt;
import deceptinfect.ecswip.SignalStorage;

@:build(gmod.macros.GamemodeMacro.build())
class DeceptInfect extends gmod.hooks.Gm {
    #if server
    

    
    override function PlayerDeath(victim:Player, inflictor:Entity, attacker:Entity) {
        trace("Player ded!");
    }
    
    override function EntityKeyValue(ent:Entity, key:String, value:String):String {
        // trace(Lua.tostring(ent),key,value);
        return null;
    }

    override function PlayerInitialSpawn(player:Player, transition:Bool) {
        // player.annex = new Annex(player);
        // var ent = new DI_Entity(player);
        // ComponentManager.addEnt(ent);

        // new DI_Player(player); //calls get to initalise
        // new DI_Player(player);
        //FIXME
        // switch (currentState) {
        //     case PLAY(_):
        //         player.KillSilent();
        //         GAMEMODE.PlayerSpawnAsSpectator(player);
        //     default:
        // }

    }

    override function PlayerSpawn(player:gmod.types.Player, transition:Bool) {
        player.UnSpectate();

        player.SetModel(Misc.roundModels[0]);//TODO make random models
        //player.SetWalkthroughable
        player.ShouldDropWeapon(true);
        if (GameManager.state.equals(WAIT)) {
            player.Give(Misc.roundWeapons[0]); //TODO random weapons
            player.ShouldDropWeapon(false);

        }
        //setHiddenHealth
        //lowhealthrate???
        //kill player if round in progress 
    }

    override function PlayerButtonUp(ply:gmod.types.Player, button:BUTTON_CODE) {
        switch (button) {
            case KEY_E:
                trace("e lol");
            default:
            //handle case of infection? use command strategy
        }
    }
    
    override function PlayerSwitchWeapon(player:gmod.types.Player, oldWeapon:Weapon, newWeapon:Weapon):Bool {
        if (newWeapon.GetClass() == "weapon_infect") {
            return true;
        }
        return null;
    }

    override function PlayerButtonDown(ply:gmod.types.Player, button:BUTTON_CODE) {
        switch (button) {
            case KEY_E:
                trace("down");
            default:
        }
    }

    // override function PlayerDeathSound():Bool {
    //     return false;
    // }

    override function PlayerDeathThink(ply:GPlayerCompat):Bool {
        var comp = ply.id.get_component(PlayerComponent).sure();
        if (comp.deathTime == 0.0) {
            comp.deathTime = GlobalLib.CurTime() + 1;
        }
        if (ply.IsBot() && GlobalLib.CurTime() > comp.deathTime) {
            comp.deathTime = 0.0;
            ply.UnSpectate();
            ply.Spawn();
        }
        return true;
    }

    override function Think() {
        switch (GameManager.state) {
            case PLAYING(x):
                x.think();
            default:
        }
    }
    override function IsSpawnpointSuitable(ply:Player, spawnpoint:Entity, makeSuitable:Bool):Bool {
        var pos = spawnpoint.GetPos();
        var blockers = EntsLib.FindInBox(pos + new Vector(-16,-16,0), pos + new Vector(16,16,72));
        for (ent in blockers) {
            if (ent.IsPlayer()) {
                //ply.setWalkthroughable(true);
            }
        }
        return true;
    }
    
    override function PlayerSelectSpawn(ply:Player, transition:Bool):Entity {
        var spawns = EntsLib.FindByClass("info_player_start");
        trace(spawns.length());
        GlobalLib.PrintTable(spawns);
        var random_spawn = MathLib.random(spawns.length());
        if (IsSpawnpointSuitable(ply,spawns[random_spawn],false)) {
            return spawns[random_spawn];
        }
        return null;
    }

    override function EntityTakeDamage(target:GEntCompat, dmg:CTakeDamageInfo):Bool {
        switch (target.has_id()) {
            case Some(id):
                SignalStorage.entDamageTrigger.trigger(
                    {
                        vicID: id,
                        dmg: dmg,
                        entity: target
                    });
            default:
        } 
        return null;
    }


    override function PlayerSay(sender:gmod.types.Player, text:String, teamChat:Bool):String {
        
        return "aaaaple";
    }
    override function PlayerCanHearPlayersVoice(listener:Player, talker:Player):HaxeMultiReturn<GmPlayerCanHearPlayersVoiceHaxeReturn> {
        
        return {a : false, b: false};
        // if (listener.GetPos().Distance(talker.GetPos()) > 1000) {
        //    return {a : false,b : false};
        // }
        // var _talker:DI_Player = talker;
        // if (_talker.grab.isGrabbed) {
        //     return {a : false, b : true}
        // }
        // return {a : true, b : true}
        
        // 
        // if (_talker.) {
        //     return {

        //     }
        // }
    }
    
    #end
}

// enum GAME_STATE {
//     WAIT;
//     PLAY(st:PLAY_STATE);
// }

// enum PLAY_STATE {
//     NORMAL;
//     EVAC;
// }
