package deceptinfect.ents;

import deceptinfect.ecswip.SystemManager;
import deceptinfect.game.SpawnSystem.Spawn;
import gmod.helpers.sent.SentBuild;
import gmod.helpers.sent.SentBuild.EntFields;
import deceptinfect.game.components.BatterySource;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.game.BatterySystem;

@:keep
class Di_battery extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
	static final properties:EntFields = {
		Base: "base_anim",
	}

	#if client
	override function Draw(flags:Float) {
		self.DrawModel();
	}
	#end

	#if server
	var lastplayer:Player = null;

	public var id:DI_ID = null;

	var added = false;

	public var spawnLoc:Spawn;

	override function Initialize() {
		self.SetModel("models/items/car_battery01.mdl");
		self.PhysicsInit(SOLID_VPHYSICS);

		var physob = self.GetPhysicsObject();
		if (IsValid(physob)) {
			physob.Wake();
		}
		self.SetUseType(SIMPLE_USE);
		var ent = new GEntCompat(self);
		id = ent.id;
		id.add_component(new BatterySource());
	}

	override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
		if (self.IsPlayerHolding() || !activator.IsPlayer()) {
			return;
		}
		var _activator:Player = cast activator;
		_activator.PickupObject(self);
		lastplayer = _activator;
	}

	override function Touch(entity:GEntCompat) {
		// trace(id);
		if (added) {
			return;
		}
		switch (entity.has_id()) {
			case Some(otherID):
				var result = SystemManager.getSystem(BatterySystem).addBattery(id, otherID);
				if (result) {
					added = true;
					trace("Battery added :)");
					self.Remove();
				}
			default:
		}
	}
	#end
}
