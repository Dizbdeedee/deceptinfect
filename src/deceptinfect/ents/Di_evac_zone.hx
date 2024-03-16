package deceptinfect.ents;

import deceptinfect.ecswip.SystemManager;
import deceptinfect.game.components.EvacZone;
import deceptinfect.game.EvacSystem;
import gmod.helpers.sent.SentBuild;

class Di_evac_zone extends SentBuild<gmod.sent.ENT_BRUSH> {
	var componentManager:ComponentManager;

	var systemManager:SystemManager;

	static final properties:EntFields = {
		Base: "base_brush"
	}

	#if server
	var id:DI_ID;

	override function Initialize() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		self.SetCollisionBounds(new Vector(-250, -250, -250), new Vector(250, 250, 250));
		self.SetTrigger(true);
		self.SetCollisionGroup(COLLISION_GROUP_PLAYER);
		self.UseTriggerBounds(true, 0);
		id = new GEntCompat(self).id;
		id.add_component(new EvacZone());
	}

	public function setPoints(minmax:MinMax) {
		self.SetCollisionBoundsWS(minmax.mins, minmax.maxs);
	}

	override function StartTouch(ent:GEntCompat) {
		switch (ent.has_id()) {
			case Some(ent_id):
				if (id.has_comp(EvacZone)) {
					systemManager.getSystem(EvacSystem)
						.touched(ent_id, id.get_sure(EvacZone));
				}
			default:
		}
	}

	override function EndTouch(ent:GEntCompat) {
		switch (ent.has_id()) {
			case Some(ent_id):
				if (id.has_comp(EvacZone)) {
					systemManager.getSystem(EvacSystem)
						.leave(ent_id, id.get_sure(EvacZone));
				}
			default:
		}
	}
	#end
}
