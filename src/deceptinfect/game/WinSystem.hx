package deceptinfect.game;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.System;
import deceptinfect.infection.InfectionComponent;

class WinSystem extends System {
	public var newWinner(default, null):Signal<Win>;

	public var winTrig(default, never):SignalTrigger<Win> = new SignalTrigger();

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
			winTrig.trigger(WIN_INF);
			winTrig.clear();
		}

		var aliveNests = false;
		var deadNests = false;
		for (ent in entities) {
			switch ent.get(NestComponent) {
			case Comp(c_nest):
				if (c_nest.health > 0) {
					aliveNests = true;
					break;
				} else {
					deadNests = true;
				}
			default:
			}

		}
		if (!aliveNests && deadNests) {
			winTrig.trigger(WIN_HUMAN);
		}
	}
	#end
}

enum Win {
	WIN_HUMAN;
	WIN_INF;
	DRAW;
}
