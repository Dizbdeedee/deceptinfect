package deceptinfect.items;

import deceptinfect.ecswip.compat.GPlayerCompat;
import deceptinfect.infection.InfVunerability;
import deceptinfect.abilities.FormComponent;
import deceptinfect.infection.InfectionComponent;
import gmod.helpers.swep.SwepBuild;
import deceptinfect.ents.EntSetup;

class Di_cure extends SwepBuild<gmod.swep.SWEP> {
	static final properties:SwepFields = {
		Primary: {
			Ammo: "None",
			ClipSize: -1,
			DefaultClip: -1,
			Automatic: true
		}
	}

	var componentManager:ComponentManager;

	var systemManager:SystemManager;

	#if server
	override function Initialize() {}

	override function PrimaryAttack() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		var owner:GPlayerCompat = self.Owner.cmpPly();
		self.SetNextPrimaryFire(Gmod.CurTime() + 999);
		switch (owner.get(InfectionComponent)) {
			case Comp(c_inf):
				switch (c_inf.infection) {
					case NOT_INFECTED(inf):
						inf.value -= 12.5;
						owner.id.add_component(new InfVunerability(3, 10));
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
