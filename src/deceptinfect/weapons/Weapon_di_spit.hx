package deceptinfect.weapons;

import deceptinfect.abilities.FormComponent;
import gmod.swep.SwepBuild.SwepFields;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.GEntCompat;

class Weapon_di_spit extends gmod.swep.SwepBuild<gmod.swep.SWEP> {
    
    final properties:SwepFields = {
        Primary: {
            Ammo: "None",
            ClipSize: -1,
            DefaultClip: -1,
            Automatic: true
        },
	Secondary : {
	Ammo : "none",
	ClipSize : 0,
	DefaultClip : 0,
	Automatic : false
	}
	
	
    }
    override function Initialize() {
	self.SetNextSecondaryFire(Gmod.CurTime() + 9999);
    }

    #if server
    override function PrimaryAttack() {
        var owner:GPlayerCompat = untyped self.Owner;
	switch (owner.get(FormComponent)) {
	    case Comp({form : INFECTED}):
		final spitball:Entity = EntsLib.Create("di_spitball");
		spitball.SetOwner(owner);
		spitball.SetPos(owner.EyePos() + (owner.GetForward() * 5));
		spitball.Spawn();
		spitball.SetAngles(owner.GetAngles());
		spitball.SetVelocity((owner.GetForward() * 1000) + owner.GetVelocity());
		self.SetNextPrimaryFire(Gmod.CurTime() + 1.5);
	    default:
	}
	
    }
    #end
}