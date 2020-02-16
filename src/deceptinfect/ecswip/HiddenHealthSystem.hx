package deceptinfect.ecswip;

import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SignalStorage;
class HiddenHealthSystem {

    public static function init() {
        SignalStorage.entDamage.handle(hiddenHealthDamage);
    }
    
    @:keep
    static function hiddenHealthDamage(data:DamageEvent) {
        var victim = data.vicID;
        var g_attacker:GEntCompat = data.dmg.GetAttacker();
        if (!g_attacker.IsPlayer()) return;
        switch [victim.get_component(HiddenHealthComponent),victim.get_gent(),victim.get_component(InfectedComponent)] {
            case [COMPONENT(c_hidHealth),GEnt(g_victim),COMPONENT(_)]:
                var damageVal = data.dmg.GetDamage();
                var health = g_victim.Health();
                var dmgInfo = data.dmg;
                if (damageVal >= health) {
                    c_hidHealth.extraHealth -= damageVal;
                    if (c_hidHealth.extraHealth > 0) {
                        dmgInfo.SetDamage(health - 1);
                    } else {
                        dmgInfo.SetDamage(health);
                    }
                } else {
                    
                }
            default:
        }
    }
}