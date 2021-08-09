package deceptinfect.ents;

import gmod.helpers.sent.SentBuild.EntFields;
import deceptinfect.infection.InfectionComponent;

class Di_spitball extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
	
	static final properties:EntFields = {
		Base: "base_anim",
	}

	static var model = Gmod.Model("models/crossbow_bolt.mdl");

	#if server
	
	var removetime:Float;

	var hit:Bool;

	override function Initialize() {
		self.SetModel(model);
		self.SetMoveType(MOVETYPE_FLYGRAVITY);
		self.SetCollisionGroup(COLLISION_GROUP_WORLD);
		self.SetSolid(SOLID_OBB);
		final bounds = self.GetModelBounds();
		self.SetCollisionBounds(bounds.mins, bounds.maxs);
		self.SetGravity(0.4);
		self.SetTrigger(true);
		removetime = Gmod.CurTime() + 5;
		hit = false;
	}

	override function Touch(entity:Entity) {
		switch [entity.validID(), hit] {
			case [Some(id), false]:
				switch (id.get(InfectionComponent)) {
					case Comp({infection: NOT_INFECTED(inf)}):
						hit = true;
						inf.value += 6;
						self.Remove();
					default:
				}
			default:
		}
		if (entity.IsWorld()) {
			self.Remove();
		}
	}

	override function Think():Bool {
		self.NextThink(Gmod.CurTime() + 1);
		if (Gmod.CurTime() > removetime) {
			self.Remove();
		}
		return null;
	}
	#end
}
