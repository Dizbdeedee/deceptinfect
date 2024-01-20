package deceptinfect.game;

import deceptinfect.ecswip.PlayerComponent;

class DeathInfoSystem extends System {
	#if server
	override function run_server() {
		for (ent in 0...entities) {
			switch ent.get(PlayerComponent) {
				case Comp(_.player => ply):
					var tr = ply.GetEyeTrace();
					switch (tr.Entity.validID()) {
						case Some(id):
							switch id.get(DeathInfo) {
								case Comp(c_di):
								default:
							}
						default:
					}
				default:
			}
		}
	}
	#end
}
