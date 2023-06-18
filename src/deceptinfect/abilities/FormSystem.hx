package deceptinfect.abilities;

import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.stringtypes.Hook.GMHook;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.PlayerComponent;

class FormSystem extends System {
    #if server
    public function attemptChangeForm(ent:DI_ID) {
        switch [ent.get(FormComponent), ent.get(GEntityComponent)] {
            case [Comp(c_form), Comp(_.entity => g_ent)]:
                switch (c_form.cooldown) {
                    case COOLDOWN(time) if (Gmod.CurTime() < time):

                    default:
                        c_form.cooldown = ACTIVE;
                }
                if (c_form.formHealth > 0 && c_form.cooldown == ACTIVE) {
                    if (g_ent.Health() > 0) {
                        changeForm(ent);
                    }
                }
            default:
        }
    }

    override function init_server() {
        HookLib.Add(GMHook.PlayerSwitchWeapon, "di_supressweapon", supressWeapons);
    }

    function supressWeapons(ply:GPlayerCompat, oldWeapon:Weapon, newWeapon:Weapon):Bool {
        return switch (ply.validID()) {
            case Some(id):
                switch (id.get(FormComponent)) {
                    case Comp({form: INFECTED}):
                        if (oldWeapon.GetName() == "weapon_di_spit") {
                            true;
                        } else if (newWeapon.GetName() != "weapon_di_spit") {
                            true;
                        } else {
                            false;
                        }
                    default:
                        false;
                }
            default:
                false;
        }
    }

    public function changeForm(ent:DI_ID) {
        var c_form = ent.get_sure(FormComponent);
        var g_ent = ent.get_sure(GEntityComponent).entity;
        var curHealth = g_ent.Health();
        var curMaxHealth = g_ent.GetMaxHealth();
        var curModel = g_ent.GetModel();
        g_ent.SetMaxHealth(c_form.formMaxHealth);
        g_ent.SetHealth(c_form.formHealth);
        g_ent.SetModel(c_form.formModel);
        c_form.form = switch (c_form.form) {
            case HUMAN:
                INFECTED;
            case INFECTED:
                HUMAN;
        }
        switch [ent.get(PlayerComponent), c_form.form] {
            case [Comp({player: ply}), INFECTED]:
                ply.Give("weapon_di_spit");
                ply.SelectWeapon("weapon_di_spit");
            case [Comp({player: ply}), HUMAN]:
                ply.StripWeapon("weapon_di_spit");
            default:
        }
        c_form.formHealth = curHealth;
        c_form.formMaxHealth = curMaxHealth;
        c_form.cooldown = COOLDOWN(Gmod.CurTime() + c_form.nextCooldown);
        c_form.formModel = curModel;
    }
    #end
}
