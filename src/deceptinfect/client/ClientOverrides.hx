package deceptinfect.client;

import deceptinfect.game.RagdollSystem;
import gmod.hooks.Gm.HUDElementList;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
#if client
@:build(gmod.macros.GamemodeMacro.build())
class ClientOverrides extends gmod.hooks.Gm {
     
    
    override function HUDPaint() {
        Hud.paint();
    }
    
    override function NotifyShouldTransmit(ent:Entity, shouldtransmit:Bool) {
        //trace(PVS.pvs);
        
        PVS.pvs.set(ent.EntIndex(),shouldtransmit);
        
        getSystem(RagdollSystem).pvsChange(ent,shouldtransmit);
    }

    override function PreDrawOpaqueRenderables(isDrawingDepth:Bool, isDrawSkybox:Bool):Bool {
        GrabSystem.drawCylinders();
        return null;
    }
    
    override function postIntialize() {
        for (entity in EntsLib.GetAll()) {
            PVS.pvs.set(entity.EntIndex(),true);
        }
        //irace(PVS.pvs);
    }

    override function HUDDrawScoreBoard() {
        return untyped false;
    }

    override function HUDShouldDraw(name:HUDElementList):Bool {
        return switch (name) {
            case CHudDamageIndicator:
                false;
            default:
                true;
        }
    }
    // override function AddDeathNotice(attacker:String, attackerTeam:Float, inflictor:String, victim:String, victimTeam:Float) {
    //     super.AddDeathNotice(attacker, attackerTeam, inflictor, victim, victimTeam);
    // }

    //TODO
    // override function NetworkEntityCreated(ent:Entity) {
        
    // }


}

#end