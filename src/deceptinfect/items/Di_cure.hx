package deceptinfect.items;

import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.infection.InfVunerability;
import deceptinfect.infection.systems.InfectionSystem;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.InfectionComponent;
import gmod.helpers.swep.SwepBuild;

class Di_cure extends SwepBuild<gmod.swep.SWEP> {

    final properties:SwepFields = {
        Primary: {
            Ammo: "None",
            ClipSize: -1,
            DefaultClip: -1,
            Automatic: true
        }
    }
    #if server
    override function Initialize() {
        
    }

    override function PrimaryAttack() {
        var owner:GPlayerCompat = untyped self.Owner;
        self.SetNextPrimaryFire(Gmod.CurTime() + 999);
        switch (owner.get(InfectionComponent)) {
        case Comp(c_inf):
            switch (c_inf.infection) {
            case NOT_INFECTED(inf):
                inf.value -= 12.5;
                owner.id.add_component(new InfVunerability(3,10));
            case INFECTED:
                switch (owner.get(FormComponent)) {
                case Comp(c_form):
                    c_form.formMaxHealth /= 2;
                    c_form.cooldown = COOLDOWN(Gmod.CurTime() + 15);
                default:

                }
            }
        default:
        }
        self.Remove();
    }
    #end


}
