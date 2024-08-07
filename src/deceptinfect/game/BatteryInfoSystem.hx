package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.macros.ClassToID;
import deceptinfect.game.components.BatteryInfo;
import deceptinfect.game.components.BatteryAccepter;

class BatteryInfoSystem extends System {
	#if server
	override function init_server() {
		componentManager.getAddSignal(ClassToID.idc(GameManager))
			.handle((data) -> {
				data.comp.stateChanged.handle((state) -> {
					switch (state) {
						case PLAYING:
							trace("ello");
							var ent = componentManager.addEntity();
							ent.add_component(new BatteryInfo());
							ent.add_component(new ReplicatedEntity());
						default:
					}
				});
			});
	}

	override function run_server() {
		IterateEnt.iterGet([GameManager], [{state: s}], function() {
			if (s != PLAYING) {
				break;
			}
		});
		var charge = .0;
		IterateEnt.iterGet([BatteryAccepter], [{charge: c}], function() {
			charge = c;
			break;
		});
		IterateEnt.iterGet([BatteryInfo], [c_batteryInfo], function() {
			c_batteryInfo.charge = charge;

			break;
		});
	}
	#end
}
