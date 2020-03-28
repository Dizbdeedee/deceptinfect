package deceptinfect.client;

import deceptinfect.ecswip.GrabSystem;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.InfectedComponent;
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

}

#end