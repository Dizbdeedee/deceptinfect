package deceptinfect.items;

import gmod.swep.SwepBuild.SwepFields;

class Weapon_Di_cure extends gmod.swep.SwepBuild<gmod.swep.SWEP> {
	static final properties:SwepFields = {
		Primary: {
			Ammo: "Smg1",
			ClipSize: -1,
			DefaultClip: -1,
			Automatic: true,
			
		}
	}

	override function PrimaryAttack() {}
}
