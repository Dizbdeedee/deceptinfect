package deceptinfect.statuses;

import deceptinfect.ecswip.PlayerComponent;

using deceptinfect.util.PlayerExt;

class Walkthroughable extends Component {}

class WalkthroughSystem extends System {
	#if server
	var runtime = 0;

	override function run_server() {
		for (x in 0...entities) {
			final ent:DI_ID = x;
			switch [ent.get(Walkthroughable), ent.get(PlayerComponent)] {
				case [Comp(_), Comp(c_ply)]:
					var tooclose = false;
					for (x in 0...entities) {
						final otherEnt:DI_ID = x;
						if (otherEnt == ent) {
							continue;
						}
						switch otherEnt.get(PlayerComponent) {
							case Comp(c_otherPly):
								var dist = c_otherPly.player.GetPos().DistToSqr(c_ply.player.GetPos());
								if (dist < C_square(125)) {
									tooclose = true;
									break;
									// ent.remove_component(Walkthroughable);
								}
							default:
						}
					}
					if (!tooclose) {
						c_ply.player.setWalkthroughable(false);
						ent.remove_component(Walkthroughable);
					}
				// c_ply.player.setWalkthroughable(true);
				default:
			}
		}
	}
	#end
}
