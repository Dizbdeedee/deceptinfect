package deceptinfect.infection.doom;

import deceptinfect.infection.doom.components.ActiveDoom;
import deceptinfect.infection.doom.components.FutureDoom;
import deceptinfect.infection.doom.components.ActiveDoomClient;

abstract class ActiveDoomSystem extends System {}

class ActiveDoomSystemDef extends ActiveDoomSystem {
	#if server
	override function run_server() {
		var cacheRemoval = [];
		IterateEnt.iterGet([FutureDoom, ActiveDoom], [c_future, c_active], function(entActive) {
			switch (c_active.activeDoomSet) {
				case UNSET:
					var c_doomnotify = new ActiveDoomClient();
					c_doomnotify.doomPower = c_active.doomPower;
					entActive.add_component(c_doomnotify);
					c_doomnotify.fieldsChanged = true;
					c_active.activeDoomSet = ACTIVE(Gmod.CurTime() + c_active.originalTime);
				case ACTIVE(time) if (Gmod.CurTime() > time):
					var roll = switch (c_active.doomPower) {
						case LOW_DOOM:
							c_active.lowPercent;
						case MEDIUM_DOOM:
							c_active.mediumPercent;
						case HIGH_DOOM:
							c_active.highPercent;
					}
					if (MathLib.random() < roll) {
						beginInfectionForSap(entActive);
						trace("DOOM: YOU DIED");
					} else {
						trace("DOOM: you lived");
						if (c_future.timesRolled == 0) {
							c_future.lowChance *= c_future.badRollModifierFirst;
							c_future.mediumChance *= c_future.badRollModifierFirst;
							c_future.highChance *= c_future.badRollModifierFirst;
						} else {
							c_future.lowChance *= c_future.badRollModifierOthers;
							c_future.mediumChance *= c_future.badRollModifierOthers;
							c_future.highChance *= c_future.badRollModifierOthers;
						}
						c_future.timesRolled++;
						c_future.checkStatus = COOLDOWN(Gmod.CurTime() + c_future.overallDoomCooldown);
					}
					cacheRemoval.push(entActive);
				case ACTIVE(_):
			}
		});

		for (ent in cacheRemoval) {
			ent.remove_component(ActiveDoom);
			ent.remove_component(ActiveDoomClient);
		}
	}

	function beginInfectionForSap(ent:DI_ID) {
		switch (ent.get(InfectionComponent)) {
			case Comp({infection: NOT_INFECTED(_)}):
				systemManager.get(InfectionSystem)
					.makeInfected(ent);
			default:
		}
	}
	#end
}
