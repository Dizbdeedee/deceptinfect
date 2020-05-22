package deceptinfect.ents;

import gmod.EntityClass;
import gmod.HaxeGen;
import deceptinfect.GEntCompat;
enum abstract Di_entities<T:Entity>(EntityClass<T>) to String to EntityClass<T> {
    // var di_battery:Di_entities<HaxeGen<GEntCompat,Di_battery>>;

    // var di_charger:Di_entities<HaxeGen<GEntCompat,Di_charger>>;

    // var di_nest:Di_entities<HaxeGen<GEntCompat,Di_nest>>;

    // var di_evac_zone:Di_entities<HaxeGen<GEntCompat,Di_evac_zone>>;

    // var di_flare:Di_entities<HaxeGen<GEntCompat,Di_flare>>;

    // var di_ragdoll:Di_entities<HaxeGen<GEntCompat,Di_ragdoll>>;
    var di_battery:Di_entities<Entity>;

    var di_charger:Di_entities<Entity>;

    var di_nest:Di_entities<Entity>;

    var di_evac_zone:Di_entities<Entity>;

    var di_flare:Di_entities<Entity>;

    var di_ragdoll:Di_entities<Entity>;

}
