package deceptinfect.items;

import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.SystemManager.getSystem;

using deceptinfect.util.EntityExt;

class Weapon_Di_Scan extends gmod.helpers.swep.SwepBuild<gmod.swep.SWEP> {
	final properties:gmod.helpers.swep.SwepBuild.SwepFields = {
		Primary: {
			Ammo: "Smg1",
			ClipSize: -1,
			DefaultClip: -1,
			Automatic: true
		}
	};

	#if server
	var id(default, null):DI_ID;

	override function Initialize() {
		id = new GEntCompat(self).id;
		id.add_component(new ScannerComponent());
	}

	override function PrimaryAttack() {
		final owner:GPlayerCompat = untyped self.Owner;
		final tr = owner.GetEyeTrace();
		switch (tr.Entity.validID()) {
			case Some(ent_id):
				getSystem(ScannerSystem).scan_target(id, ent_id);
			default:
		}
	}

	override function SecondaryAttack() {
		final owner:GPlayerCompat = untyped self.Owner;
		final tr = owner.GetEyeTrace();
		switch (tr.Entity.validID()) {
			case Some(ent_id):
				getSystem(ScannerSystem).final_scan(id, ent_id);
			default:
		}
	}
	#end
}
