package deceptinfect.game;

import deceptinfect.macros.IterateEnt;
import deceptinfect.util.PrintTimer;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.System;
import deceptinfect.infection.InfectionComponent;

class WinSystem extends System {

	var winTrig:SignalTrigger<Win> = new SignalTrigger();

	#if server
	override function init_server() {
		var ent = ComponentManager.addEntity();
		var winMan:WinManager = {
			winSignal : winTrig.asSignal(),
			winTrigger : winTrig
		};
		ent.add_component(winMan);
	}

	override function run_server() {
		var playing = false;
		IterateEnt.iterGet([GameManager2],[{state : s}], function () {
			// trace(s);
		});
		IterateEnt.iterGet([GameManager2],[{state : PLAYING}],function () {
			playing = true;
			break;
		});
		if (!playing) return;
		var total = 0;
		var infected = 0;
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(InfectedComponent), ent.get(PlayerComponent), ent.get(AliveComponent)] {
				case [Comp(_), Comp(_), Comp(_)]:
					infected++;
					total++;
				case [NONE, Comp(_), Comp(_)]:
					total++;
				default:
			}
		}
		PrintTimer.print_time(15, () -> trace('Infected : $infected total : $total'));
		if (infected == 0) {
			trace("Debug human");
			winTrig.trigger(WIN_HUMAN);
			winTrig.clear();
			return;
		} else if (infected >= total) {
			trace("Debug infected");
			winTrig.trigger(WIN_INF);
			winTrig.clear();
			return;
		}
		var aliveNests = false;
		var deadNests = false;
		for (x in 0...ComponentManager.entities) {
			final ent:DI_ID = x;
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
		gmod.helpers.PrintTimer.print_time(4,() -> trace('$aliveNests $deadNests'));
		if (!aliveNests && deadNests) {
			trace("Nest debug");
			winTrig.trigger(WIN_HUMAN);
		}
	}

	public function win(x:Win) {
		winTrig.trigger(x);
	}
	#end
}

enum Win {
	WIN_HUMAN;
	WIN_INF;
	DRAW;
}
