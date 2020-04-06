package deceptinfect.ecswip;

import deceptinfect.infection.InfectedComponent;
import deceptinfect.client.GeigerSystem;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.SignalStorage;
class HiddenHealthSystem extends GeigerSystem {
    #if server
    override function init_server() {
        SignalStorage.entDamage.handle(hiddenHealthDamage);
    }
    
    @:keep
    static function hiddenHealthDamage(data:DamageEvent) {
        var victim = data.vicID;
        var g_attacker:GEntCompat = data.dmg.GetAttacker();
        
        if (!g_attacker.IsPlayer()) return;
        switch [victim.get(HiddenHealthComponent),victim.get(GEntityComponent),g_attacker.get(DamagePenaltyHidden)] {
        case [Comp(c_hidHealth),Comp(g_victim),Comp(c_dmgpnlty)]:
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
               c_hidHealth.extraHealth += damageVal * (1 - c_dmgpnlty.damagepenalty);
            }
        default:
        }
    }
    #end
}