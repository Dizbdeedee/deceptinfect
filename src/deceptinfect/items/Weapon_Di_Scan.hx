package deceptinfect.items;

import deceptinfect.ecswip.compat.GPlayerCompat;
import deceptinfect.ents.EntSetup;

using deceptinfect.util.EntityExt;

class Weapon_Di_Scan extends gmod.helpers.swep.SwepBuild<gmod.swep.SWEP> {
	static final properties:gmod.helpers.swep.SwepBuild.SwepFields = {
		Primary: {
			Ammo: "Smg1",
			ClipSize: -1,
			DefaultClip: -1,
			Automatic: true,
		}
	};

	var systemManager:SystemManager;

	var componentManager:ComponentManager;

	#if server
	var id(default, null):DI_ID;

	override function Initialize() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		id = self.createCompat().id;
		id.add_component(new ScannerComponent());
		if (systemManager == null) {
			trace("WEAPON DI SCAN: NO SYSTEM MANAGER ON CREATION");
		}
		if (componentManager == null) {
			trace("WEAPON DI SCAN: NO COMPONENT MANAGER ON CREATION");
		}
	}

	override function PrimaryAttack() {
		final owner:GPlayerCompat = self.Owner.cmpPly();
		final tr = owner.GetEyeTrace();
		switch (tr.Entity.validID()) {
			case Some(ent_id):
				systemManager.get(ScannerSystem)
					.scan_target(id, ent_id);
			default:
		}
	}

	override function SecondaryAttack() {
		final owner:GPlayerCompat = self.Owner.cmpPly();
		final tr = owner.GetEyeTrace();
		switch (tr.Entity.validID()) {
			case Some(ent_id):
				systemManager.get(ScannerSystem)
					.final_scan(id, ent_id);
			default:
		}
	}
	#end
}
