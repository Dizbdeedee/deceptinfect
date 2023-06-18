package deceptinfect.client;

import gmod.helpers.LuaArray;
import gmod.enums.BUTTON_CODE;
import deceptinfect.game.RagdollSystem;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
import gmod.gclass.Vector;
#if client
class ClientOverrides extends gmod.helpers.gamemode.GMBuild<gmod.gamemode.GM> {

    final componentManager:ComponentManager;

    final systemManager:SystemManager;

    public function new(_componentManager:ComponentManager,_systemManager:SystemManager) {
        componentManager = _componentManager;
        systemManager = _systemManager;
    }

    override function HUDPaint() {
        final hudSystem = systemManager.get(Hud);
        hudSystem.paint();
    }

    override function NotifyShouldTransmit(ent:Entity, shouldtransmit:Bool) {
        PVS.pvs.set(ent.EntIndex(), shouldtransmit);
        systemManager.getSystem(RagdollSystem).pvsChange(ent, shouldtransmit);
    }

    override function PlayerButtonDown(ply:Player, button:BUTTON_CODE) {
        switch (button) {
            case KEY_L:
                trace("l key says hello!");
            // var sab = SabotagePanel.inst;
            // switch (sab.IsVisible()) {
            //     case true:
            //         sab.SetVisible(false);
            //     case false:
            //         sab.SetVisible(true);
            // }
            // sab.SetVisible(true);
            default:
        }
    }

    override function PreDrawOpaqueRenderables(isDrawingDepth:Bool, isDrawSkybox:Bool):Bool {
        //grabsystem.drawCylinders()
        return null;
    }

    //used to be fast!

    var vectors:LuaArray<Vector> = null;

    function getVectors() {
        if (vectors == null) {
            vectors = new LuaArray();
            var tbl:AnyTable = untyped GameLib.GetWorld().GetBrushSurfaces();
            for (id => si in tbl) {
                final vtbl:LuaArray<Vector> = si.GetVertices();
                final isnodraw:Bool = si.IsNoDraw();
                if (isnodraw) continue;
                final len = vtbl.length;
                final remain = len % 3;
                final upto = Math.floor(len / 3);

                if (len < 3) {
                    continue;
                }
                DebugoverlayLib.Line(vtbl[1],vtbl[vtbl.length],120);
                DebugoverlayLib.Cross(vtbl[1],2,120,Gmod.Color(255,0,0));
                DebugoverlayLib.Cross(vtbl[vtbl.length],5,120,Gmod.Color(0,255,0));

                DebugoverlayLib.Text(vtbl[1],Gmod.tostring(vtbl.length),120,false);
                final uno = vtbl[2] - vtbl[1];
                final uno2 = uno.Cross(vtbl[3] - vtbl[1]);
                final x = GameLib.GetWorld().GetBrushPlane(id - 1);
                final windingA = x.b.Dot(uno2) > 0;

                if (windingA) {
                    vectors.push(vtbl[3]);
                    vectors.push(vtbl[2]);
                    vectors.push(vtbl[1]);
                    vectors.push(vtbl[1]);
                } else {
                    vectors.push(vtbl[1]);
                    vectors.push(vtbl[2]);
                    vectors.push(vtbl[3]);
                    vectors.push(vtbl[3]);
                }
                for (i in 1...upto) {

                    if (!windingA) {
                        vectors.push(vtbl[1]); //0
                        vectors.push(vtbl[i * 3]); //1
                        vectors.push(vtbl[i * 3+1]); //2
                        vectors.push(vtbl[i * 3+2]); //3
                        vectors.push(vtbl[1]);
                        vectors.push(vtbl[i*3+1]);
                        vectors.push(vtbl[i*3+2]);
                        vectors.push(vtbl[i*3+3]);
                    } else {
                        vectors.push(vtbl[i*3+2]); //0
                        vectors.push(vtbl[i*3+1]); //1
                        vectors.push(vtbl[i*3]); //2
                        vectors.push(vtbl[1]); //3
                        vectors.push(vtbl[i*3+3]);
                        vectors.push(vtbl[i*3+2]);
                        vectors.push(vtbl[i*3+1]);
                        vectors.push(vtbl[1]);
                    }
                }
            }
        }
        return vectors;
    }




    override function PostDrawTranslucentRenderables(bDrawingDepth:Bool, bDrawingSkybox:Bool) {
        if (bDrawingDepth || bDrawingSkybox) return;
    }

    override function PostRender() {

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
