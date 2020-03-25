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
    

}

#end