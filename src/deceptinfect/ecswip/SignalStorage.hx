package deceptinfect.ecswip;

import deceptinfect.ecswip.ComponentManager;

class SignalStorage {
	public static var onInfected(default, null):Signal<InfectedSig>;
	public static var onInfectedTrigger(default, null):SignalTrigger<InfectedSig>;
	public static var entDamage(default, null):Signal<DamageEvent>;
	public static var entDamageTrigger(default, null):SignalTrigger<DamageEvent> = new SignalTrigger();

	public static function initEvents() {
		entDamage = entDamageTrigger.asSignal();
		onInfected = onInfectedTrigger.asSignal();
	}
}

typedef InfectedSig = {
	victim:DI_ID,
	cause:DI_ID,
}

typedef DamageEvent = {
	entity:GEntCompat,
	vicID:DI_ID,
	dmg:CTakeDamageInfo
}
