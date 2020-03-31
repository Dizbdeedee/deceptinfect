package deceptinfect.game;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.System;
import deceptinfect.infection.InfectionComponent;

class WinSystem extends System {
	public var newWinner(default, null):Signal<Win>;

	var winTrig(default, never):SignalTrigger<Win> = new SignalTrigger();

	#if server
	override function init_server() {
		newWinner = winTrig.asSignal();
	}

	override function run_server() {
		var total = 0;
		var infected = 0;
		for (ent in ComponentManager.entities) {
			switch [ent.get(InfectedComponent), ent.get(PlayerComponent)] {
            case [Comp(_), Comp(_)]:
                infected++;
                total++;
            case [NONE, Comp(_)]:
                total++;
            default:
			}
		}
		if (infected == 0) {
			winTrig.trigger(WIN_HUMAN);
			winTrig.clear();
		} else if (infected >= total) {
			winTrig.trigger(WIN_ALIEN);
			winTrig.clear();
		}
	}
	#end
}

enum Win {
	WIN_HUMAN;
	WIN_ALIEN;
	DRAW;
}
