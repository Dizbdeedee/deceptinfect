package deceptinfect.client;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.InfectedComponent;
#if client
@:build(gmod.macros.GamemodeMacro.build())
class ClientOverrides extends gmod.hooks.Gm {
     
    
    override function HUDPaint() {
        Hud.paint();
    }
    
    override function NotifyShouldTransmit(ent:Entity, shouldtransmit:Bool) {
        PVS.pvs.set(ent.EntIndex(),shouldtransmit);
    }

    override function OnEntityCreated(entity:Entity) {
        if (entity.IsPlayer()) {
            var ent = new GPlayerCompat(new PlayerComponent(GlobalLib.LocalPlayer()));
            ent.id.add_component(new InfectionComponent());
        }
    }
    

}

#end