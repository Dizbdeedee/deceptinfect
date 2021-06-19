package deceptinfect.ecswip;

import deceptinfect.infection.InfectedComponent;
import deceptinfect.client.GeigerSystem;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SignalStorage;
import deceptinfect.infection.components.HiddenHealthComponent;
import deceptinfect.infection.components.DamagePenaltyHidden;

using deceptinfect.macros.IterateEnt;

class HiddenHealthSystem extends GeigerSystem {
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
		victim.m_getAll([HiddenHealthComponent, GEntityComponent, g_attacker.get(DamagePenaltyHidden)], [c_hidHealth, g_victim, c_dmgpnlty], () -> {
			var damageVal = data.dmg.GetDamage();
			var health = g_victim.entity.Health();
			var dmgInfo = data.dmg;
			if (damageVal >= health) {
				trace('Did $damageVal points of damage to extra health: ${c_hidHealth.extraHealth}');
				c_hidHealth.extraHealth -= damageVal;
				if (c_hidHealth.extraHealth > 0) {
					dmgInfo.SetDamage(health - 1);
				} else {
					dmgInfo.SetDamage(health);
				}
			} else {
				trace('Adding $damageVal to ${damageVal * (1 - c_dmgpnlty.damagepenalty)}');
				c_hidHealth.extraHealth += damageVal * (1 - c_dmgpnlty.damagepenalty);
			}
		});
		trace("SEPERATION");
	}
	#end
}
