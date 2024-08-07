package deceptinfect.ents;

import deceptinfect.game.EvacSystem;
import gmod.helpers.sent.SentBuild;
import deceptinfect.ecswip.compat.GEntCompat;
import deceptinfect.game.components.FlareComponent;
import deceptinfect.ecswip.SystemManager;

class Di_flare extends SentBuild<gmod.sent.ENT_ANIM> {
	static final properties:EntFields = {
		Base: "base_entity"
	}

	#if client
	override function Draw(flags:Float) {
		self.DrawModel();
	}
	#end

	#if server
	var id:DI_ID;

	var systemManager:SystemManager;

	var componentManager:ComponentManager;

	override function Initialize() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		self.SetModel("models/props_c17/chair02a.mdl");
		self.PhysicsInit(SOLID_VPHYSICS);
		var physob = self.GetPhysicsObject();
		if (Gmod.IsValid(physob)) {
			physob.Wake();
		}
		id = self.createCompat().id;
		id.add_component(new FlareComponent());
	}

	override function Touch(entity:GEntCompat) {
		final evacSystem = systemManager.get(EvacSystem);
		switch (entity.has_id()) {
			case Some(ent_id):
				evacSystem.addFlare(id, ent_id);
			default:
		}
	}

	override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
		if (self.IsPlayerHolding() || !activator.IsPlayer()) {
			return;
		}
		var _activator:Player = cast activator;
		_activator.PickupObject(self);
	}
	#end
}
