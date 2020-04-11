package deceptinfect.abilities;

import deceptinfect.ecswip.System;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import deceptinfect.ecswip.GEntityComponent;

class FormSystem extends System {



    #if server
    public static function attemptChangeForm(ent:DI_ID) {
        switch [ent.get(FormComponent),ent.get(GEntityComponent)] {
        case [Comp(c_form),Comp(_.entity => g_ent)]:
            switch(c_form.cooldown) {
                case COOLDOWN(time) if (GlobalLib.CurTime() < time):
        
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

    public static function changeForm(ent:DI_ID) {
        var c_form = ent.get_sure(FormComponent);
        var g_ent = ent.get_sure(GEntityComponent).entity;
        var curHealth = g_ent.Health();
        var curMaxHealth = g_ent.GetMaxHealth();
        var curModel = g_ent.GetModel();
        g_ent.SetMaxHealth(c_form.formMaxHealth);
        g_ent.SetHealth(c_form.formHealth);
        g_ent.SetModel(c_form.formModel);
        c_form.form = switch(c_form.form) {
            case HUMAN:
                INFECTED;
            case INFECTED:
                HUMAN;
        }
        c_form.formHealth = curHealth;
        c_form.formMaxHealth = curMaxHealth;
        c_form.cooldown = COOLDOWN(GlobalLib.CurTime() + c_form.nextCooldown);
        c_form.formModel = curModel;
    }
    #end
}