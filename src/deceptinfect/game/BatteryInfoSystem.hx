package deceptinfect.game;

class BatteryInfoSystem extends System {

	#if server

	override function init_server() {
		GameManager2.getAddSignal().handle((data) -> {
			data.comp.stateChanged.handle((state) -> {
				switch (state) {
					case PLAYING:
						var ent = ComponentManager.addEntity();
						ent.add_component(new BatteryInfo());
					default:
				}
			});
		});
	}

	
	override function run_server() {
		IterateEnt.iterGet([GameManager2],[{state : s}],
		function () {
			if (s != PLAYING) {
				break;
			}
		});
		var charge = .0;
		IterateEnt.iterGet([BatteryAccepter],[{charge : c}],
		function() {
			charge = c;
			break;
		});
		IterateEnt.iterGet([BatteryInfo],[{charge : c}],
		function () {
			c = charge;
			break;
		});
	}
	#end
}