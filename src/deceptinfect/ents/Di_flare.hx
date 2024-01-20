package deceptinfect.ents;

import deceptinfect.game.EvacSystem;
import gmod.helpers.sent.SentBuild;
import deceptinfect.game.components.FlareComponent;
import deceptinfect.ecswip.SystemManager;

class Di_flare extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
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

	static var systemManager:SystemManager;

	static var componentManager:ComponentManager;

	static function factoryInitialize(_systemManager:SystemManager, _componentManager:ComponentManager) {
		systemManager = _systemManager;
		componentManager = _componentManager;
	}

	override function Initialize() {
		self.SetModel("models/props_c17/chair02a.mdl");
		self.PhysicsInit(SOLID_VPHYSICS);
		var physob = self.GetPhysicsObject();
		if (Gmod.IsValid(physob)) {
			physob.Wake();
		}
		id = new GEntCompat(self).id;
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
