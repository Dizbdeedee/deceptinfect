package deceptinfect.ecswip;

import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.client.GeigerSystem;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SignalStorage;
import deceptinfect.infection.components.HiddenHealthComponent;
import deceptinfect.infection.components.DamagePenaltyHidden;

using deceptinfect.macros.IterateEnt;

class HiddenHealthSystem extends System {
	#if server
	override function init_server() {
		SignalStorage.entDamageTrigger.clear();
		SignalStorage.entDamage.handle(hiddenHealthDamage);
	}

	@:keep
	function hiddenHealthDamage(data:DamageEvent) {
		final victim = data.vicID;
		var g_attacker:GEntCompat = data.dmg.GetAttacker();
		if (!g_attacker.IsPlayer())
			return;
		trace("SEPERATION");
	}
	#end
}
