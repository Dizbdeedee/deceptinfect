package deceptinfect.ents;

import deceptinfect.radiation.RadiationTypes.RadTypes;
import deceptinfect.radiation.RadiationProducer;
import gmod.helpers.sent.SentBuild;
import deceptinfect.game.components.NestComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import gmod.structs.TestCollisionData;
import deceptinfect.ecswip.ReplicatedEntity;

class Di_nest extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {
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

	var nestComp:NestComponent;

	override function Initialize() {
		trace("NEST CREATED");
		self.SetModel("models/props_c17/chair02a.mdl");
		var ent = new GEntCompat(self);
		id = ent.id;
		final nestComp = new NestComponent();
		id.add_component(nestComp);
		id.add_component(new ReplicatedEntity());
		// id.add_component(new NestPos());
		this.nestComp = nestComp;
		nestComp.nestState = INVISIBLE;
		self.PhysicsInit(SOLID_VPHYSICS);
		var physob = self.GetPhysicsObject();
		physob.EnableMotion(false);
		physob.SetContents(CONTENTS_BLOCKLOS);		
	}

	override function OnTakeDamage(damage:CTakeDamageInfo) {
		switch (nestComp.nestState) {
			case VISIBLE:
				nestComp.health -= damage.GetDamage();
				trace(damage.GetDamage());
			default:
		}
	}

	override function Think():Bool {
		IterateEnt.iterGet([PlayerComponent],[{player : ply}],function (ent) {
			switch [ent.has_comp(InfectedComponent),id.get_2(NestComponent)] {
				case [_,{nestState : VISIBLE}]:
					self.SetPreventTransmit(ply,false);
				case [true,_]:
					self.SetPreventTransmit(ply,true);
				case [false,_]:
					self.SetPreventTransmit(ply,false);
				default:
					trace("Whoops");
			}
		});
		return null;
	}
	#end

	override function TestCollision(startpos:Vector, delta:Vector, isbox:Bool, extents:Vector, mask:Float):TestCollisionData {
		return {
			HitPos: startpos,
			Fraction: 0
		}
	}
}
