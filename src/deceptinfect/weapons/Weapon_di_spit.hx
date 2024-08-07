package deceptinfect.weapons;

import deceptinfect.abilities.FormComponent;
import gmod.helpers.swep.SwepBuild.SwepFields;
import deceptinfect.ecswip.compat.GPlayerCompat;
import deceptinfect.ents.EntSetup;

class Weapon_di_spit extends gmod.helpers.swep.SwepBuild<gmod.swep.SWEP> {
	static final properties:SwepFields = {
		Primary: {
			Ammo: "None",
			ClipSize: -1,
			DefaultClip: -1,
			Automatic: true
		},
		Secondary: {
			Ammo: "none",
			ClipSize: 0,
			DefaultClip: 0,
			Automatic: false
		}
	}

	var componentManager:ComponentManager;

	var systemManager:SystemManager;

	override function Initialize() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		self.SetNextSecondaryFire(Gmod.CurTime() + 9999);
	}

	#if server
	override function PrimaryAttack() {
		var owner:GPlayerCompat = self.Owner.cmpPly();
		switch (owner.get(FormComponent)) {
			case Comp({form: INFECTED}):
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
