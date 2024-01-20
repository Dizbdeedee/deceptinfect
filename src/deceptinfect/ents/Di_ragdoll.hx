package deceptinfect.ents;

import deceptinfect.game.components.CleanupEnt;
import deceptinfect.game.components.Ragdoll;
import deceptinfect.ecswip.GEntityComponent;
import gmod.helpers.sent.SentBuild;

class Di_ragdoll extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
	static final properties:EntFields = {Base: "base_entity"};

	var componentManager:ComponentManager;

	var systemManager:SystemManager;

	public var owner:Entity;
	public var id:DI_ID;

	override function Initialize() {
		var setup:EntSetup = HookLib.Run("di_setupent", this);
		systemManager = setup.systemManager;
		componentManager = setup.componentManager;
		self.SetModel(owner.GetModel());
		id = new GEntCompat(self).id;
		id.add_component(new Ragdoll());
		id.add_component(new CleanupEnt());
	}
}
