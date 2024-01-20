package deceptinfect.ecswip;

import deceptinfect.macros.IterateEnt;
import deceptinfect.infection.components.GrabbableProp;
import deceptinfect.game.components.AliveComponent;
import deceptinfect.util.Cooldown;
import gmod.stringtypes.Hook;
import deceptinfect.ecswip.SignalStorage.DamageEvent;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import deceptinfect.client.PVS;
import deceptinfect.infection.components.GrabAccepter;
import deceptinfect.infection.components.GrabProducer;
import deceptinfect.infection.components.GrabDraw;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.infection.InfectionSystem;

using deceptinfect.util.EntityExt;

typedef Net_GrabPos = {
	index:Int,
	ent:Entity,
	ent2:Entity
}

typedef Net_GrabEnd = {
	index:Int
}

class GrabSystem extends System {
	static var net_grabupdate = new gmod.helpers.net.NET_Server<"grabupdate", Net_GrabPos>();

	static var net_grabend = new gmod.helpers.net.NET_Server<"grabend", {index:Int}>();

	#if client
	static var hycord = Gmod.Material("cable/new_cable_lit")
		.a;

	static var activeDraws:Map<Int, DI_ID> = [];

	override function init_client() {
		// net_grabupdate.signal.handle(updateSig);
		// net_grabend.signal.handle(remove);
	}

	public function drawCylinders() {
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			switch ent.get(GrabDraw) {
				case Comp(draw):
					if (PVS.pvs.get(draw.ent1.EntIndex()) || PVS.pvs.get(draw.ent2.EntIndex())) {
						render(draw.ent1.GetPos(), draw.ent2.GetPos());
					} else {
						componentManager.removeEntity(ent);
					}
				default:
			}
		}
		return null;
	}

	static inline function render(posProduce:Vector, posVic:Vector) {
		RenderLib.SetMaterial(hycord);
		RenderLib.DrawBeam(posProduce, posVic, 24, 0, 1, {
			r: 128,
			g: 0,
			b: 255,
			a: 255
		});
	}
	#end

	#if server
	static var grabindex = 0;

	override function init_server() {
		HookLib.Add(GMHook.EntityTakeDamage, "grabDamage", grabDamage);
	}

	function grabDamage(ent:GEntCompat, dmg:CTakeDamageInfo) {
		if (ent.IsPlayer()) {
			switch (ent.id.get(GrabProducer)) {
				case Comp(c_produce = {grabState: GRABBING(_)}):
					c_produce.damage += dmg.GetDamage();
					if (c_produce.damage >= c_produce.threshold) {
						grabStop(ent.id);
						setGrabState(c_produce,
							NOT_READY(COOLDOWN(Gmod.CurTime() + c_produce.nextCooldown)));
					}
				default:
			}
		}
		return null;
	}

	override function run_server() {
		IterateEnt.iterGet([GrabProducer, GEntityComponent], [c_produce, {entity: g_attack}], (attack) -> {
			switch (c_produce.grabState) {
				case READY(SEARCHING):
					IterateEnt.iterGet([GrabAccepter, VirtualPosition], [_, {pos: vicPos}], (victim) -> {
						if (victim == attack)
							continue;
						if (!victim.has_comp(AliveComponent) && !victim.has_comp(GrabbableProp))
							continue;
						if (vicPos.Distance(g_attack.GetPos()) < c_produce.grabDist) {
							attemptTarget(attack, victim);
							// trace('attempting target ${c_produce.grabState}');
							switch (c_produce.grabState) {
								case READY(TARGET(newTarget)) if (newTarget == victim):
									break;
								case GRABBING(_):
									break;
								default:
							}
						}
					});

				case READY(TARGET(prevVic)):
					var prevPos = prevVic.get_sure(VirtualPosition)
						.pos;
					var oldDist = prevPos.Distance(g_attack.GetPos());
					if (oldDist > c_produce.grabDist) {
						setGrabState(c_produce, READY(SEARCHING));
						break;
					}
					attemptSneakAttack(attack, prevVic);
					IterateEnt.iterGet([GrabAccepter, VirtualPosition], [_, {pos: vicPos}], (victim) -> {
						if (victim == prevVic || attack == victim)
							continue;
						if (!victim.has_comp(AliveComponent) && !victim.has_comp(GrabbableProp))
							continue;
						var newDist = vicPos.Distance(g_attack.GetPos());
						if (newDist < oldDist && newDist < c_produce.grabDist) {
							// trace('switching targets ${victim}');
							attemptTarget(attack, victim);
							switch (c_produce.grabState) {
								case READY(TARGET(newTarget)) if (newTarget == victim):
									trace('switching targets $newTarget');
									break;
								case GRABBING(_):
									break;
								default:
							}
						}
					});
				case GRABBING(victim):
					var g_vic = switch (victim.get(GEntityComponent)) {
						case Comp(gent):
							gent.entity;
						default:
							return;
					}
					var filter = Gmod.RecipientFilter();
					filter.AddPVS(g_attack.GetPos());
					filter.AddPVS(g_vic.GetPos());
					net_grabupdate.sendFilter({
						index: c_produce.grabindex,
						ent: g_vic,
						ent2: g_attack
					}, filter, true);

					switch (victim.get(InfectionComponent)) {
						case Comp({infection: NOT_INFECTED(inf)}):
							inf.value += calcGrabIncrease();
						case Comp({infection: INFECTED}):
							trace("infected");
							grabStop(attack);
						// var c_accept = victim.get_sure(GrabAccepter);
						// c_accept.grabState = UNAVALIABLE(UNAVALIABLE);
						default:
							// throw "Victim has no infection component..";
					}
					1;

				case NOT_READY(COOLDOWN(cool)) if (Gmod.CurTime() > cool):
					setGrabState(c_produce, READY(NOT_SEARCHING));

				default:
			}
		});
	}

	function grabStop(attack:DI_ID) {
		var c_produce = attack.get_sure(GrabProducer);
		var attackPos = attack.get_sure(VirtualPosition)
			.pos;
		var vic = switch (c_produce.grabState) {
			case GRABBING(victim):
				victim;
			default:
				return;
		}
		var vicPos = vic.get_sure(VirtualPosition)
			.pos;
		var c_accept = vic.get_sure(GrabAccepter);

		setGrabState(c_produce, NOT_READY(COOLDOWN(Gmod.CurTime() + 2)));
		// c_accept.grabState = NOT_GRABBED;
		c_accept.grabAttacker.set(c_produce, false);
		switch (vic.get(PlayerComponent)) {
			case Comp(plyr):
				plyr.player.Freeze(false);
			default:
		}
		switch (attack.get(PlayerComponent)) {
			case Comp({player: ply}):
				ply.Freeze(false);
			default:
		}
		var filter = Gmod.RecipientFilter();
		filter.AddPVS(attackPos);
		filter.AddPVS(vicPos);
		net_grabend.sendFilter({index: c_produce.grabindex}, filter);
	}

	public function attemptGrab(attack:DI_ID, vic:DI_ID) {
		switch [attack.get(GrabProducer), vic.get(GrabAccepter)] {
			case [
				Comp({
					grabState: READY(TARGET(vic))
				}),
				Comp({
					grabState: NOT_GRABBED(_)
				})
			]:
				// trace('c_accpet ${c_accept.grabState}');
				grabStart(attack, vic);
			default:
		}
	}

	public function requestStartSearch(attack:DI_ID) {
		switch attack.get(GrabProducer) {
			case Comp(c_produce = {grabState: READY(NOT_SEARCHING)}):
				setGrabState(c_produce, READY(SEARCHING));
			default:
		}
	}

	public function requestStopSearch(attack:DI_ID) {
		switch attack.get(GrabProducer) {
			case Comp(c_produce = {grabState: READY(SEARCHING | TARGET(_))}):
				setGrabState(c_produce, READY(NOT_SEARCHING));
			default:
		}
	}

	function attemptSneakAttack(attack:DI_ID, vic:DI_ID) {
		switch [vic.get(GEntityComponent), vic.get(GrabAccepter), attack.get(GEntityComponent)] {
			case [Comp({entity: g_vic}), Comp({canGrabBack: true}), Comp({entity: g_attack})]:
				if (g_vic.facingBehind(g_attack)) {
					attemptGrab(attack, vic);
				}
			default:
		}
	}

	public function attemptTarget(attack:DI_ID, vic:DI_ID) {
		switch [attack.get(GrabProducer), vic.get(GrabAccepter)] {
			case [
				Comp(c_attack = {
					grabState: READY(TARGET(_) | SEARCHING)
				}),
				Comp(c_accept = {
					grabState: NOT_GRABBED(numTargeting)
				})
			]:
				trace(c_accept.grabState);
				attemptSneakAttack(attack, vic);
				target(attack, vic);
				if (numTargeting.value >= c_accept.overwhelm) {
					attemptGrab(attack, vic);
				}
			default:
		}
	}

	// sigh
	function setGrabState(c_produce:GrabProducer, newGrabState:GrabProduceState) {
		switch [c_produce.grabState, newGrabState] {
			case [READY(TARGET(old)), READY(TARGET(newt))] if (old == newt):
			case [READY(TARGET(old)), x]:
				var c_accept = old.get_sure(GrabAccepter);
				switch (c_accept.grabState) {
					case NOT_GRABBED(num):
						num.value = num.value - 1;
					default:
				}
			default:
		}
		c_produce.grabState = newGrabState;
	}

	// TODO cleanup
	function clearTargetingVic(vic:DI_ID) {
		var c_accept = vic.get_sure(GrabAccepter);
		for (c_produce in c_accept.targeting.keys()) {
			switch (c_produce.grabState) {
				case READY(TARGET(target)) if (vic == target):
					setGrabState(c_produce, READY(SEARCHING));
				default:
			}
		}
		c_accept.targeting.clear();
	}

	function grabStart(attack:DI_ID, vic:DI_ID) {
		trace("starting grab");
		var c_produce = attack.get_sure(GrabProducer);
		var c_accept = vic.get_sure(GrabAccepter);
		// c_produce.grab = vic;
		c_accept.grabAttacker.set(c_produce, true);
		c_accept.grabState = GRABBED;
		setGrabState(c_produce, GRABBING(vic));
		c_produce.grabindex = grabindex++;
		clearTargetingVic(vic);
		switch (vic.get(PlayerComponent)) {
			case Comp(plyr):
				plyr.player.Freeze(true);
			default:
		}
		switch (attack.get(PlayerComponent)) {
			case Comp(plyr):
				plyr.player.Freeze(true);
			default:
		}
	}

	function target(attacker:DI_ID, victim:DI_ID) {
		var c_accept = victim.get_sure(GrabAccepter);
		var c_produce = attacker.get_sure(GrabProducer);
		c_accept.targeting.set(c_produce, true);
		switch (c_accept.grabState) {
			case NOT_GRABBED(x):
				x.value += 1;
			default:
				throw "XD";
		}
		setGrabState(c_produce, READY(TARGET(victim)));
	}

	public function stopTargeting(attacker:GrabProducer) {
		switch (attacker.grabState) {
			case READY(TARGET(vic)):
				setGrabState(attacker, READY(SEARCHING));
			default:
		}
	}
	#end

	function calcGrabIncrease():Float {
		return (100 / GameValues.GRAB_TIME) / Math.floor(1 / EngineLib.TickInterval());
	}
}
