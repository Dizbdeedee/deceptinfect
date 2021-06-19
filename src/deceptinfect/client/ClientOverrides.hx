package deceptinfect.client;

import gmod.helpers.LuaArray;
import gmod.enums.BUTTON_CODE;
import deceptinfect.game.RagdollSystem;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
import gmod.gclass.Vector;
#if client
class ClientOverrides extends gmod.helpers.gamemode.GMBuild<gmod.gamemode.GM> {
	override function HUDPaint() {
		Hud.paint();
	}

	override function NotifyShouldTransmit(ent:Entity, shouldtransmit:Bool) {
		PVS.pvs.set(ent.EntIndex(), shouldtransmit);
		getSystem(RagdollSystem).pvsChange(ent, shouldtransmit);
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
		// RenderLib.SetColorMaterial();
		// RenderLib.SetColorModulation(0,0,0);
		// GrabSystem.drawCylinders();
		
		return null;
	}

	var vectors:LuaArrayFast<Vector> = null;
	function getVectors() {
		if (vectors == null) {
			vectors = new LuaArrayFast();
			var tbl:AnyTable = untyped GameLib.GetWorld().GetBrushSurfaces();
			for (si in tbl) {
				// final si:Dynamic = exdee;
				// final ftbl:LuaArrayFast<Vector> = new LuaArrayFast();
				final vtbl:LuaArray<Vector> = si.GetVertices();
				// final isnodraw:Bool = si.IsNoDraw();
				// if (isnodraw) continue;
				final len = vtbl.length();
				final remain = len % 3;
				final upto = Math.floor(len / 3);
				
				if (len < 3) {
					continue;
				}
				if (remain == 0) {
					DebugoverlayLib.Cross(vtbl[1],2,120,Gmod.Color(255,0,0));
					DebugoverlayLib.Cross(vtbl[vtbl.length()],5,120,Gmod.Color(0,255,0));
					// DebugoverlayLib.Cross(vtbl[1],2,120,Gmod.Color(255,0,0));
					// DebugoverlayLib.Cross(vtbl[vtbl.length()],5,120,Gmod.Color(0,255,0));
				} else if (remain == 1) {
					
					// DebugoverlayLib.Cross(vtbl[1],2,120,Gmod.Color(0,255,0));
				} else {
					
				}
				
				DebugoverlayLib.Text(vtbl[1],Gmod.tostring(vtbl.length()),120,false);
				if (len == 3) {
					vectors.add(vtbl[1]);
					vectors.add(vtbl[3]);
					vectors.add(vtbl[2]);
					vectors.add(vtbl[2]);
					continue;
				}
				vectors.add(vtbl[1]);
				vectors.add(vtbl[3]);
				vectors.add(vtbl[2]);
				vectors.add(vtbl[2]);
				// vectors.add(vtbl[1]);
				// vectors.add(vtbl[3]);
				// vectors.add(vtbl[2]);
				// vectors.add(vtbl[2]);
				for (i in 1...upto) {
					vectors.add(vtbl[1]);
					vectors.add(vtbl[i * 3]); //0
					vectors.add(vtbl[i * 3 + 1]); //1 
					vectors.add(vtbl[i * 3 + 2]); //2
					vectors.add(vtbl[1]);
					vectors.add(vtbl[i*3+1]);
					vectors.add(vtbl[i*3+2]);
					vectors.add(vtbl[i*3+3]);
				}
				if (remain == 1) {
					vectors.add(vtbl[1]);
					vectors.add(vtbl[upto*3]);
					vectors.add(vtbl[upto*3+1]);
					vectors.add(vtbl[upto*3+1]);
				} else if (remain == 2) {
					vectors.add(vtbl[1]);
					vectors.add(vtbl[upto*3]);
					vectors.add(vtbl[upto*3+1]);
					vectors.add(vtbl[upto*3+2]);
					// vectors.add(vtbl[1]);
					// vectors.add(vtbl[upto*3+1]);
					// vectors.add(vtbl[upto*3+2]);
					// vectors.add(vtbl[upto*3+2]);
				}
			}

		}
		return vectors;
	}
	

	override function PostDrawTranslucentRenderables(bDrawingDepth:Bool, bDrawingSkybox:Bool) {
		if (bDrawingDepth || bDrawingSkybox) return;
		// CamLib.Start3D();
		// CamLib.IgnoreZ(true);
		RenderLib.SetColorMaterial();
		final getVec:LuaArrayFast<Vector> = getVectors();
		var total = getVec.length;
		var i = 1;
		var c = Gmod.Color(0,0,0,200);
		while (i <= total) {
			
			RenderLib.DrawQuad(getVec[i],getVec[i + 1],getVec[i + 2],getVec[i + 3],c);
			i += 4;
		}
		// var gayness = 0;
		// for (i in 1...untyped getVec._len) {
		// 	RenderLib.DrawQuad(i)
		// }
		CamLib.IgnoreZ(false);
		// CamLib.End3D();
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


// @:forward
// @:transitive
// abstract IterateArr<T>(LuaArray<T>) to LuaArray<T> {

// 	public var length(get,set):Int;

// 	public inline function get_length() {
// 		return untyped this.length;
// 	}

// 	public inline function set_length(x:Int) {
// 		return untyped this.length = x;
// 	}

// 	public inline function iterator():T {
// 		return new IntIterator(1,length);
// 	}

// 	public inline function add() {

// 	}

// }

#end
