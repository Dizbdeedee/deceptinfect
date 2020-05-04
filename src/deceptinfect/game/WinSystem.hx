package deceptinfect.game;

import deceptinfect.util.PrintTimer;
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
		switch (GameManager.state) {
			case PLAYING(_):
			default:
				return;
		}
		var total = 0;
		var infected = 0;
		for (ent in ComponentManager.entities) {
			switch [ent.get(InfectedComponent), ent.get(PlayerComponent),ent.get(AliveComponent)] {
            case [Comp(_), Comp(_),Comp(_)]:
                infected++;
                total++;
            case [NONE, Comp(_),Comp(_)]:
                total++;
            default:
			}
		}
		PrintTimer.print_time(15,() -> trace('Infected : $infected total : $total'));
		if (infected == 0) {
			trace("trigg!");
			winTrig.trigger(WIN_HUMAN);
			winTrig.clear();
			return;
		} else if (infected >= total) {
			trace("trugg!");
			winTrig.trigger(WIN_INF);
			winTrig.clear();
			return;
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
