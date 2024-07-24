package deceptinfect.ents;

import gmod.stringtypes.EntityClass;
import gmod.helpers.GLinked;
import deceptinfect.ecswip.compat.GEntCompat;
import deceptinfect.ecswip.compat.GPlayerCompat;

enum abstract Di_entities<T:Entity>(EntityClass<T>) to String to EntityClass<T> {
	var di_battery:Di_entities<GLinked<GEntCompat, Di_battery>>;
	var di_charger:Di_entities<GLinked<GEntCompat, Di_charger>>;
	var di_evac_zone:Di_entities<GLinked<GEntCompat, Di_evac_zone>>;
	var di_flare:Di_entities<GLinked<GEntCompat, Di_flare>>;
	var di_ragdoll:Di_entities<GLinked<GEntCompat, Di_ragdoll>>;
}
