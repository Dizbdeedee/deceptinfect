package deceptinfect;

class HumanPointsSystem extends System {
	#if server
	override function init_server() {
		HookLib.Add(GMHook.EntityTakeDamage, "di_humanpoints", function(ent, dmg) {
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
		});
	}
	#end
}
