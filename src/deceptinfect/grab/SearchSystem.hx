package deceptinfect.grab;

import deceptinfect.grab.components.*;
import deceptinfect.macros.ClassToID;
import deceptinfect.grab.components.GrabSearchLink;
import deceptinfect.ecswip.VirtualPosition;
import Assert.assert;
import deceptinfect.game.GameSystem;

using Safety;

abstract class SearchSystem extends System {}

class SearchSystemDef extends SearchSystem {
	#if server
	override function init_server() {
		componentManager.getAddSignal(ClassToID.idc(GrabSearchVictim))
			.handle((data) -> {
				IterateEnt.iterGet([GrabSearcher], [_], function(gs) {
					if (gs == data.ent)
						continue;
					final linkEnt = componentManager.addEntity();
					var c_gsl = new GrabSearchLink();
					linkEnt.add_component(c_gsl);
					c_gsl.grabSearcher = gs;
					c_gsl.grabVictim = data.ent;
				});
			});
	}

	override function run_server() {
		var checkGrabStatesForVictims:Map<DI_ID, Array<DI_ID>> = [];
		IterateEnt.iterGet([GrabSearchLink], [
			c_gsl = {grabSearcher: entSearch, grabVictim: entVictim, grabSearchLinkState: linkstate}
		], function(entGSL) {
			var c_gs = entSearch.get_2(GrabSearcher);
			assert(c_gs != null);
			var c_gv = entVictim.get_2(GrabSearchVictim);
			var c_vicPos = entSearch.get_2(VirtualPosition);
			var c_searchPos = entVictim.get_2(VirtualPosition);
			assert(c_gs != null && c_gv != null && c_vicPos != null && c_searchPos != null);
			if (c_gs.searchState == SEARCH_ACTIVE) {
				var dist = c_vicPos.pos.Distance(c_searchPos.pos);
				// do obstruction trace
				if (dist < 150) {
					increaseContribution(c_gs, c_gsl);
					if (behind(c_searchPos.ang, c_vicPos.ang)) {
						increaseAttack(c_gs, c_gsl);
					} else {
						increasedecreaseAttackLimit(c_gs, c_gsl);
					}
					var manyGrabStates = checkGrabStatesForVictims.get(entVictim)
						.or([]);
					manyGrabStates.push(entGSL);
					checkGrabStatesForVictims.set(entVictim, manyGrabStates);
				} else {
					decreaseContribution(c_gs, c_gsl);
					decreaseAttack(c_gs, c_gsl);
				}
			} else {
				decreaseContribution(c_gs, c_gsl);
				decreaseAttack(c_gs, c_gsl);
			}
		});
		for (victim => grabs in checkGrabStatesForVictims) {
			var contributors = 0;
			var attackers = 0;
			var attackerCanSoloGrab = false;
			for (grab in grabs) {
				var attackerTime:ThresholdState;
				var contributorTime:ThresholdState;
				{
					var c_gsl = grab.get_2(GrabSearchLink);
					attackerTime = c_gsl.attackerTime;
					contributorTime = c_gsl.contributorTime;
				}
				switch (attackerTime) {
					case THRESHOLD_REACHED(_):
						attackers++;
						continue; // attackers are not counted as contributors.
					default:
				}
				switch (contributorTime) {
					case THRESHOLD_REACHED(_):
						contributors++;
					default:
				}
			}
			var total = contributors + attackers;
			// trace('ncp total/con/att $total : $contributors : $attackers');
		}
	}

	function behind(meAngle:Angle, targetAngle:Angle) {
		var vec1 = new Angle(0, meAngle.y, 0).Forward();
		var vec2 = new Angle(0, targetAngle.y, 0).Forward();
		var dot = Math.acos(vec1.Dot(vec2));
		return dot < Math.PI / 4;
	}

	function dt() {
		var dt = systemManager.get(GameSystem)
			.diffTime();
		return dt;
	}

	// TODO - unclear naming contributor/attacker c_gs vs c_gsl

	function increaseContribution(c_gs:GrabSearcher, c_gsl:GrabSearchLink) {
		var dt = {
			var dtget = systemManager.get(GameSystem)
				.diffTime();
			if (dtget == null) {
				return;
			} else {
				dtget;
			}
		}
		switch (c_gsl.contributorTime) {
			case THRESHOLD(timeValid):
				timeValid.value += dt;
			case THRESHOLD_REACHED(timeInvalid):
				timeInvalid.value -= dt;
		}
		switch (c_gsl.contributorTime) {
			case THRESHOLD(timeValid):
				if (timeValid.value > c_gs.contributeTime) {
					c_gsl.contributorTime = THRESHOLD_REACHED(.0);
				}
			case THRESHOLD_REACHED(timeInvalid):
				if (timeInvalid.value < 0) {
					timeInvalid.value = 0;
				}
		}
	}

	function increaseAttack(c_gs:GrabSearcher, c_gsl:GrabSearchLink) {
		var dt = {
			var dtget = systemManager.get(GameSystem)
				.diffTime();
			if (dtget == null) {
				return;
			} else {
				dtget;
			}
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD(timeValid):
				timeValid.value += dt;
			case THRESHOLD_REACHED(timeInvalid):
				timeInvalid.value -= dt;
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD(timeValid):
				if (timeValid.value > c_gs.attackTime) {
					c_gsl.attackerTime = THRESHOLD_REACHED(.0);
				}
			case THRESHOLD_REACHED(timeInvalid):
				if (timeInvalid.value < 0) {
					timeInvalid.value = 0;
				}
			default:
		}
	}

	function increasedecreaseAttackLimit(c_gs:GrabSearcher, c_gsl:GrabSearchLink) {
		var dt = {
			var dtget = systemManager.get(GameSystem)
				.diffTime();
			if (dtget == null) {
				return;
			} else {
				dtget;
			}
		}
		var relativeContributeTime = switch (c_gsl.contributorTime) {
			case THRESHOLD(timeValid):
				timeValid.value;
			case THRESHOLD_REACHED(_):
				c_gs.contributeTime;
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD(timeValid):
				timeValid.value = MathLib.Remap(relativeContributeTime, 0, c_gs.contributeTime, 0
					, c_gs.contributeToAttackLimit);
			case THRESHOLD_REACHED(timeInvalid):
				timeInvalid.value += dt;
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD_REACHED(timeInvalid):
				if (timeInvalid.value > c_gs.lagTime) {
					c_gsl.attackerTime = THRESHOLD(c_gs.contributeToAttackLimit);
				}
			default:
		}
	}

	function decreaseContribution(c_gs:GrabSearcher, c_gsl:GrabSearchLink) {
		var dt = {
			var dtget = systemManager.get(GameSystem)
				.diffTime();
			if (dtget == null) {
				return;
			} else {
				dtget;
			}
		}
		switch (c_gsl.contributorTime) {
			case THRESHOLD(timeValid):
				timeValid.value -= dt;
			case THRESHOLD_REACHED(timeInvalid):
				timeInvalid.value += dt;
		}
		switch (c_gsl.contributorTime) {
			case THRESHOLD(timeValid):
				if (timeValid.value < 0) {
					timeValid.value = 0;
				}
			case THRESHOLD_REACHED(timeInvalid):
				if (timeInvalid.value > c_gs.lagTime) {
					c_gsl.contributorTime = THRESHOLD(c_gs.contributeTime - c_gs.lagTime);
				}
			default:
		}
	}

	function decreaseAttack(c_gs:GrabSearcher, c_gsl:GrabSearchLink) {
		var dt = {
			var dtget = systemManager.get(GameSystem)
				.diffTime();
			if (dtget == null) {
				return;
			} else {
				dtget;
			}
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD(timeValid):
				timeValid.value -= dt;
			case THRESHOLD_REACHED(timeInvalid):
				timeInvalid.value += dt;
		}
		switch (c_gsl.attackerTime) {
			case THRESHOLD(timeValid):
				if (timeValid.value < 0) {
					timeValid.value = 0;
				}
			case THRESHOLD_REACHED(timeInvalid):
				if (timeInvalid.value > c_gs.lagTime) {
					c_gsl.contributorTime = THRESHOLD(c_gs.attackTime - c_gs.lagTime);
				}
			default:
		}
	}
	#end
}

enum ValidGrabResult {
	NEW_VALID_GRAB(searchVictim:GrabSearchVictim);
	NONE;
}
