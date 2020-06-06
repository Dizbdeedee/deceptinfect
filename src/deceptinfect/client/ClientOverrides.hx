package deceptinfect.client;

import gmod.enums.BUTTON_CODE;
import deceptinfect.game.RagdollSystem;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
#if client
class ClientOverrides extends gmod.gamemode.GMBuild<gmod.gamemode.GM> {

    override function HUDPaint() {
        Hud.paint();
    }
    
    override function NotifyShouldTransmit(ent:Entity, shouldtransmit:Bool) {
        PVS.pvs.set(ent.EntIndex(),shouldtransmit);
        getSystem(RagdollSystem).pvsChange(ent,shouldtransmit);
    }

    override function PlayerButtonDown(ply:Player, button:BUTTON_CODE) {
        switch (button) {
            case KEY_L:
                var sab = SabotagePanel.inst;
                switch (sab.IsVisible()) {
                    case true:
                        sab.SetVisible(false);
                    case false:
                        sab.SetVisible(true);
                }
                sab.SetVisible(true);
            default:
        }
    }
    override function PreDrawOpaqueRenderables(isDrawingDepth:Bool, isDrawSkybox:Bool):Bool {
        GrabSystem.drawCylinders();
        return null;
    }
    
    override function HUDDrawScoreBoard() {
        return untyped false;
    }

    override function HUDShouldDraw(name:gmod.enums.HUDElementList):Bool {
        return switch (name) {
            case CHudDamageIndicator:
                false;
            default:
                true;
        }
    }
}

#end
