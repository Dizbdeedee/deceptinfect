package deceptinfect;

import deceptinfect.statuses.Walkthroughable;
import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceReturn;
import gmod.gamemode.BuildOverrides;
import gmod.enums.IN;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormSystem;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.Spectate;
import deceptinfect.ecswip.SystemManager;
import deceptinfect.GEntCompat;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.enums.BUTTON_CODE;
import deceptinfect.ecswip.ComponentManager;

import gmod.Hook;
import lua.Lua;
import tink.core.Annex;
import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceHaxeReturn;
import gmod.HaxeMultiReturn;
import gmod.libs.MathLib;
import gmod.types.Vector;
import gmod.libs.EntsLib;
import gmod.gclass.Player;
import gmod.types.Entity;
using gmod.PairTools;
using gmod.TableTools;
using deceptinfect.util.PlayerExt;
import deceptinfect.ecswip.SignalStorage;


class DeceptInfect extends gmod.hooks.Gm implements BuildOverrides {
    
    
    override function Think() {
        
        SystemManager.runAllSystems();
        #if server
        GameManager.think();
        checkPerformance();
        #end
    }

    var timestart = 0;
    var underperforming = false;
    function checkPerformance() {
        if (GlobalLib.FrameTime() > 0.016666666666667 && !underperforming) {
            trace("Server underperforming! ");
            underperforming = true;
        } else if (underperforming) {
            trace("Server recovered");
            underperforming = false;
        }
    }
    override function OnEntityCreated(entity:Entity) {
        if (entity.IsPlayer()) {
            var ent = new GPlayerCompat(new PlayerComponent(cast entity));
            //ent.id.add_component(new InfectionComponent());
        } else {
            //var ent = new GEntCompat(new GEntityComponent(entity));
            
        }
    }

    override function EntityRemoved(ent:GEntCompat) {
        if (ent.IsPlayer()) {
            ComponentManager.removeEntity(ent.id);
            return;
        }
        switch (ent.has_id()) {
        case Some(id):
            ComponentManager.removeEntity(id);
        default:
        }
    }
    #if server
    

    
    override function PlayerDeath(victim:Player, inflictor:Entity, attacker:Entity) {
        
        trace("Player ded!");
    }
    
    override function EntityKeyValue(ent:Entity, key:String, value:String):String {
        // trace(Lua.tostring(ent),key,value);
        return null;
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

    override function PlayerButtonUp(ply:GPlayerCompat, button:BUTTON_CODE) {
        
        switch (button) {
            case KEY_E:
                //GrabSystem.requestStopSearch(ply.id);
                //GameManager.initInfectedPlayer(ply.id);
                //GrabSystem.attemptGrab(ply.id,(PlayerLib.GetByID(2):GPlayerCompat).id);
            case KEY_F:
                FormSystem.attemptChangeForm(ply.id);
            case KEY_SEMICOLON:
                var plyr:GPlayerCompat = PlayerLib.GetByID(1);
                getSystem(InfectionSystem).makeInfected(plyr.id);
            case KEY_M:
                trace(ComponentManager.components.get(PlayerComponent));
            default:
            //handle case of infection? use command strategy
        }
    }

    override function KeyPress(ply:GPlayerCompat, key:IN) {
        switch (key) {
            case IN_USE:
                GrabSystem.requestStartSearch(ply.id);
            default:
        }
    }

    override function KeyRelease(ply:GPlayerCompat, key:IN) {
        switch (key) {
            case IN_USE:
                GrabSystem.requestStopSearch(ply.id);
            default:
        }

    }


    
    
    override function PlayerSwitchWeapon(player:gmod.types.Player, oldWeapon:Weapon, newWeapon:Weapon):Bool {
        if (newWeapon.GetClass() == "weapon_infect") {
            return true;
        }
        return null;
    }

    override function PlayerButtonDown(ply:GPlayerCompat, button:BUTTON_CODE) {
        switch (button) {
            case KEY_E:
                //GrabSystem.requestStartSearch(ply.id);
            default:
        }
    }

    override function PlayerDeathSound():Bool {
        return false;
    }

    override function PlayerDeathThink(ply:GPlayerCompat):Bool {
        
        var comp = ply.id.get(PlayerComponent).sure();
        var reviveTime;
        var revive = false;
        comp.deathTime = switch(comp.deathTime) {
            case ALIVE:
                reviveTime = GlobalLib.CurTime() + 1;
                DEAD(reviveTime);
            case DEAD(rev):
                reviveTime = rev;
                comp.deathTime;
        }
        if (ply.IsBot() && GlobalLib.CurTime() > reviveTime && GameManager.shouldAllowRespawn()) {
            revive = true;
        }
        if (GlobalLib.IsValid(ply.GetObserverTarget())) {
            ply.SetPos(ply.GetObserverTarget().GetPos());
        }
        if (ply.KeyPressed(IN_ATTACK)) {
            if (GlobalLib.CurTime() > reviveTime && GameManager.shouldAllowRespawn()) {
                revive = true;
            }
            Spectate.chooseSpectateTarget(comp,FORWARDS);
        } else if (ply.KeyPressed(IN_ATTACK2)) {

            Spectate.chooseSpectateTarget(comp,BACKWARDS);
        } else if (ply.KeyPressed(IN_JUMP) && ply.shouldFreeRoam()) {
            ply.UnSpectate();
            ply.Spectate(OBS_MODE_ROAMING);
            comp.spec_next = 1;
        }
        if (revive) {
            comp.deathTime = ALIVE;
            ply.UnSpectate();
            ply.Spawn();
            return true;
        } else {
            return false;
        }
    }

    override function IsSpawnpointSuitable(ply:Player, spawnpoint:Entity, makeSuitable:Bool):Bool {
        var pos = spawnpoint.GetPos();
        var blockers = EntsLib.FindInBox(pos + new Vector(-16,-16,0), pos + new Vector(16,16,72));
        for (ent in blockers) {
            if (ent.IsPlayer()) {
                var blockPly:GPlayerCompat = cast ent;
                blockPly.setWalkthroughable(true);
                blockPly.id.add_component(new Walkthroughable());
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
    override function PlayerCanHearPlayersVoice(listener:Player, talker:Player):HaxeMultiReturn_2<GmPlayerCanHearPlayersVoiceReturn> {
        
        
        return {a: false,b: false};
        
    }
    
    #end
    
}
