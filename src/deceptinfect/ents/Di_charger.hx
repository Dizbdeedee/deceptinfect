package deceptinfect.ents;

import gmod.helpers.sent.SentBuild;
import deceptinfect.game.components.BatteryAccepter;
import deceptinfect.ecswip.ComponentManager;

class Di_charger extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
	final properties:EntFields = {
		Base: "base_anim",
	}

	#if client
	override function Draw(flags:Float) {
		self.DrawModel();
	}
	#end

	#if server
	public var id:DI_ID;

	override function Initialize() {
		self.SetModel("models/props_c17/chair02a.mdl");
		self.PhysicsInit(SOLID_VPHYSICS);
		var physob = self.GetPhysicsObject();
		if (Gmod.IsValid(physob)) {
			physob.Wake();
		}
		physob.EnableMotion(false);
		var ent = new GEntCompat(self);
		id = ent.id;

		id.add_component(new BatteryAccepter());
		// self.SetUseType(SIMPLE_USE);
	}
	#end
}
