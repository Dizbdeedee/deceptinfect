package deceptinfect.items;

import deceptinfect.infection.InfVunerability;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.InfectionComponent;
import gmod.swep.SwepBuild;

class Di_cure extends gmod.swep.SWEP implements SwepBuild {

    final properties:SwepFields = {
        Primary: {
            Ammo: "None",
            ClipSize: -1,
            DefaultClip: -1,
            Automatic: true
        }
    }

    override function Initialize() {
        
    }

    override function PrimaryAttack() {
        self.SetNextPrimaryFire(GlobalLib.CurTime() + 999);
        switch (owner.get(InfectionComponent)) {
        case Comp(c_inf):
            switch (c_inf.infection) {
            case NOT_INFECTED(inf):
                inf.value -= 7.5;
                owner.id.add_component(new InfVunerability(2,10));
            case INFECTED:
                switch (owner.get(FormComponent)) {
                case Comp(c_form):
                    c_form.formMaxHealth /= 2;
                    c_form.cooldown = COOLDOWN(GlobalLib.CurTime() + 15);
                default:


                }
            }
        default:
        }
        self.Remove();
    }



}