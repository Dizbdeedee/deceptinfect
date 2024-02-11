package deceptinfect.infection.doom;

import gmod.libs.MathLib;
import deceptinfect.infection.doom.components.*;

abstract class DoomedSystem2 extends System {}

class DoomedSystemDef extends DoomedSystem2 {
	#if server
	override function run_server() {
		IterateEnt.iterGet([FutureDoom], [c_future], function(entFuture) {
			switch (c_future.checkStatus) {
				case SCHEDULED_CHECK(roll) if (Gmod.CurTime() > roll):
					var shouldGo = MathLib.random() < c_future.baseChanceToGo;
					if (shouldGo) {
						c_future.curRollBase = c_future.rollTimeBase;
						c_future.checkStatus = NONE;
						var c_active = new ActiveDoom();
						entFuture.add_component(c_active);
						// chance
						{
							c_active.highPercent = c_future.highChance;
							c_active.mediumPercent = c_future.mediumChance;
							c_active.lowPercent = c_future.lowChance;
						}
						// chance modifiers
						{
							if (c_future.timesRolled == 1) {
								c_future.currentModifier = c_future.badRollModifierFirst;
							} else {
								c_future.currentModifier *= c_future.badRollModifierOthers;
							}
							c_active.highPercent *= c_future.currentModifier;
							c_active.mediumPercent *= c_future.currentModifier;
							c_active.lowPercent *= c_future.currentModifier;
							c_future.timesRolled += 1;
						}
						// time active
						{
							var min = c_future.doomMin;
							var max = c_future.doomMax;
							switch (lookupInfectionThresholds(entFuture, c_future)) {
								case NONE:
									trace("unhandled force case");
								case LOW:
									max -= c_future.difficultyModifier * 2;
									c_active.doomPower = LOW_DOOM;
								case MEDIUM:
									min += c_future.difficultyModifier;
									c_active.doomPower = MEDIUM_DOOM;
								case HIGH:
									min += c_future.difficultyModifier * 2;
									c_active.doomPower = HIGH_DOOM;
							}
							var rolledTime = MathLib.random(min, max);
							c_active.originalTime = rolledTime;
							trace("given doom");
						}
					} else {
						// reroll
						var instantReroll = MathLib.random() < c_future.rerollSkipTimer;
						if (instantReroll) {
							c_future.checkStatus = SCHEDULED_CHECK(Gmod.CurTime() + 0);
						} else {
							var reset = MathLib.random() < c_future.rerollReset;
							c_future.curRollBase -= c_future.curRollNeg;
							if (c_future.curRollBase < 3) {
								c_future.curRollBase = 3;
							}
							if (reset) {
								c_future.curRollBase = c_future.rollTimeBase;
							}
							c_future.checkStatus = UNSCHEDULED_CHECK;
						}
					}
				case SCHEDULED_CHECK(_):
				case UNSCHEDULED_CHECK:
					var isHigh = MathLib.random() > 0.5;
					var rollTime = if (isHigh) {c_future.curRollBase
						+ MathLib.random(0, c_future.rollTimeHigh);
					} else {c_future.curRollBase - MathLib.random(0, c_future.rollTimeLow);
					}
					if (rollTime < 3) {
						rollTime = 3;
					}
					c_future.checkStatus = SCHEDULED_CHECK(Gmod.CurTime() + rollTime);
				case NOW:
				case NONE:
				case COOLDOWN(time) if (Gmod.CurTime() > time):
					c_future.checkStatus = UNSCHEDULED_CHECK;

				case COOLDOWN(_):
			}
		});
	}

	function lookupInfectionThresholds(ent:DI_ID, fd:FutureDoom) {
		return switch (ent.get(InfectionComponent)) {
			case Comp({infection: NOT_INFECTED(val)}):
				switch (val.value) {
					case x if (x < fd.lowThreshold):
						NONE;
					case x if (x > fd.lowThreshold):
						LOW;
					case x if (x > fd.mediumThreshold):
						MEDIUM;
					case x if (x > fd.highThreshold):
						HIGH;
					default:
						NONE;
				}
			default:
				NONE;
		}
	}
	#end
}

enum ThresholdResults {
	LOW;
	MEDIUM;
	HIGH;
	NONE;
}
