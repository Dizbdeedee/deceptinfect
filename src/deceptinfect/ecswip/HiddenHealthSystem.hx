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
        switch [victim.get(HiddenHealthComponent),victim.get(GEntityComponent),victim.get(InfectedComponent)] {
            case [Comp(c_hidHealth),Comp(g_victim),Comp(_)]:
                var damageVal = data.dmg.GetDamage();
                var health = g_victim.entity.Health();
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