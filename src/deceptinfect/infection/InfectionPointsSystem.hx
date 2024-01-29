package deceptinfect.infection;

import deceptinfect.infection.components.InfectionPoints;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import gmod.stringtypes.Hook.GMHook;

class InfectionPointsSystem extends System {
	#if server
	override function init_server() {
		HookLib.Add(GMHook.EntityTakeDamage, "di_infectionpoints", function(ent, dmg) {
			switch (ent.validID()) {
				case Some(id) if (id.has_comp(PlayerComponent) && !id.has_comp(InfectedComponent)):
				default:
					return null;
			}
			final attacker = switch (dmg.GetAttacker()
				.validID()) {
				case Some(id)
					if (id.has_comp(PlayerComponent) && id.has_comp(InfectedComponent)
						&& id.has_comp(InfectionPoints)):
					id;
				default:
					return null;
			}
			final points = attacker.get_2(InfectionPoints);
			points.points += Math.floor(dmg.GetDamage() / 2);
			return null;
		});
	}
	#end
}
