package deceptinfect.game;

import deceptinfect.infection.InfVunerability;
import deceptinfect.ecswip.PlayerComponent;

class LowHealthSystem extends System {
	#if server
	override function run_server():Void {
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			// PlayerComponentp
			switch (ent.get(PlayerComponent)) {
				case Comp(c_ply):
					if (c_ply.player.Health() < 25) {
						var remap = MathLib.Remap.bind(25 - c_ply.player.Health(), 1, 25);
						var c_inf = ent.getOrAdd(InfVunerability, remap(1.0, 1.6), 99999);
					}
				default:
			}
		}
	}
	#end
}
