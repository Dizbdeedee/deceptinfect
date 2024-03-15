package deceptinfect.game;

import deceptinfect.GameManager2.GAME_STATE_2;
import deceptinfect.util.VectorString;
import deceptinfect.util.AngleString;
import deceptinfect.infection.InfectionComponent;
import haxe.Json;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.GEntCompat;
import deceptinfect.infection.components.InfectedComponent;
import gmod.stringtypes.Hook.GMHook; // keep. i guess
import deceptinfect.game.components.StatInfo;
import deceptinfect.game.components.RagInfo;
import deceptinfect.game.components.Ragdoll;
import deceptinfect.game.components.AliveComponent;
import deceptinfect.game.components.Statue;
import deceptinfect.game.components.KeepRestart;
import deceptinfect.game.components.CleanupEnt;
import deceptinfect.game.components.ClientWeaponStatue;

typedef ND_Statue = {
	playerpos:Vector,
	playermodel:String,
	weaponmodel:String,
	playerbones:Table<Int, Vector>,
	playerangle:Table<Int, Angle>
}

typedef JsonStatues = Array<JsonStatue>;

typedef JsonStatue = {
	model:String,
	phys:Array<JsonPhys>,
}

typedef JsonPhys = {
	pos:VectorString,
	ang:AngleString
}

typedef ND_StatInfo = {
	stat:Entity,
	name:String,
	health:Float,
	inf:Float
}

typedef ND_RagInfo = {
	rag:Entity,
	name:String,
	inf:Float,
	attacker:String,
	cause:Int
}

// TODO rework...
class RagdollSystem extends System {
	static var statue = new gmod.helpers.net.NET_Server<"statue", ND_Statue>(); // TODO remove

	static var statueinfo = new gmod.helpers.net.NET_Server<"di_statinfo", ND_StatInfo>();

	static var raginfo = new gmod.helpers.net.NET_Server<"di_raginfo", ND_RagInfo>();
	#if client
	static var ranonce = false;

	override function init_client() {
		HookLib.Add(NotifyShouldTransmit, "di_ragdolltransmit", (ent, shouldTransmit) -> {
			systemManager.getSystem(RagdollSystem)
				.pvsChange(ent, shouldTransmit);
		});
		statue.signal.handle(newStatue);
		raginfo.signal.handle(recvraginfo);
		statueinfo.signal.handle(recvstatinfo);
	}

	function recvraginfo(x:ND_RagInfo) {
		var c_raginfo = switch (x.rag.validID()) {
			case Some(id):
				id.getOrAdd(RagInfo);
			default:
				if (IsValid(x.rag)) {
					var rag = new GEntCompat(x.rag);
					var c_rag = new RagInfo();
					rag.id.add_component(c_rag);
					c_rag;
				} else {
					return;
				}
		}
		c_raginfo.inf = x.inf;
		c_raginfo.name = x.name;
		c_raginfo.attacker = x.attacker;
	}

	function recvstatinfo(x:ND_StatInfo) {
		var c_statinfo = switch (x.stat.validID2()) {
			case HAS_ID(id):
				id.getOrAdd(StatInfo);
			case NO_ID:
				var stat = new GEntCompat(x.stat);
				var c_stat = new StatInfo();
				stat.id.add_component(c_stat);
				c_stat;
			case INVALID:
				return;
		}
		c_statinfo.health = x.health;
		c_statinfo.inf = x.inf;
		c_statinfo.name = x.name;
	}

	public function pvsChange(ent:GEntCompat, shouldTransmit:Bool) {
		switch (ent.has_id()) {
			case Some(id):
				switch [id.get(GEntityComponent), id.get(Statue)] {
					case [Comp(_.entity => gent), Comp(c_wep)]:
						trace("THing changed");
						if (shouldTransmit) {
							c_wep.weapon.SetParent();
							c_wep.weapon.SetParent(gent);
						}
					default:
				}
			default:
		}
	}

	function newStatue(x:ND_Statue) {
		var rag = Gmod.ClientsideModel(x.playermodel);
		var wep = Gmod.ClientsideModel(x.weaponmodel);
		rag.SetPos(x.playerpos);
		rag.AddCallback("BuildBonePositions", function(rag:Entity, numbones:Int) {
			for (boneid in 0...numbones) {
				if (x.playerbones[boneid] == null) {
					var bp = rag.GetBonePosition(boneid);
					var offset = bp.a - rag.GetBonePosition(0)
						.a;
					rag.SetBonePosition(boneid, x.playerbones[0] + offset, new Angle(0, 0, 0));
				}
			}
			var done:Map<Int, Bool> = [];
			for (boneid => vec in x.playerbones) {
				var ang = x.playerangle[boneid];
				done[boneid] = true;
				rag.SetBonePosition(boneid, vec, ang);
			}
		});
		wep.SetupBones();
		wep.AddEffects(EF_BONEMERGE);
		wep.AddEffects(EF_BONEMERGE_FASTCULL);
		wep.SetParent(rag);
	}

	override function run_client() {
		for (rag in EntsLib.GetAll()) {
			var mdl:String = rag.GetNWString("showwep");
			if (mdl != null && mdl != "" && untyped rag.showwep == null) {
				var _rag = new GEntCompat(rag);
				var c_stat = new Statue();
				_rag.id.add_component(c_stat);
				_rag.id.add_component(new KeepRestart());
				trace(mdl);
				untyped rag.showwep = true;
				var ent = new GEntCompat(Gmod.ClientsideModel(mdl));
				var c_wep = new ClientWeaponStatue();
				c_wep.parent = rag;

				ent.id.add_component(c_wep);
				ent.id.add_component(new KeepRestart());
				ent.SetupBones();
				ent.AddEffects(EF_BONEMERGE);
				ent.AddEffects(EF_BONEMERGE_FASTCULL);
				ent.SetParent(rag);
				c_stat.weapon = cast ent;
			}
		}
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(GEntityComponent), ent.get(ClientWeaponStatue)] {
				case [Comp(_.entity => gent), Comp(c_stat)]:
					if (!IsValid(c_stat.parent)) {
						gent.Remove();
					}
				default:
			}
		}
	}
	#end

	#if server
	override function init_server() {
		final gameSystem = systemManager.get(GameSystem);
		final slowMotionSystem = systemManager.get(SlowMotionSystem);
		gameSystem.getGameManager()
			.stateChanged.handle(stateChange);
		slowMotionSystem.slowMotionEnd.handle(endSlowMotion); // TODO
	}

	function endSlowMotion(x:Noise) {
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(Ragdoll), ent.get(Statue), ent.get(GEntityComponent)] {
				case [Comp(_), Comp(_), Comp(_.entity => gent)]:
					for (physid in 0...gent.GetPhysicsObjectCount()) {
						var physob = gent.GetPhysicsObjectNum(physid);
						physob.EnableMotion(false);
						physob.Sleep();
					}
					gent.SetCollisionGroup(COLLISION_GROUP_WORLD);
					gent.SetSolid(SOLID_NONE);
				default:
			}
			switch [ent.get(PlayerComponent), ent.get(AliveComponent)] {
				case [Comp(_.player => plyr), Comp(_)]:
					playerStatue(plyr);
					plyr.KillSilent();
				default:
			}
		}
		// writeStatues();
	}

	function stateChange(newstate:GAME_STATE_2) {
		final gameSystem = systemManager.get(GameSystem);
		switch [gameSystem.getGameManager()
			.state, newstate] {
			case [_, ENDING(_)]:
				for (x in 0...componentManager.entities) {
					final ent:DI_ID = x;
					switch [ent.get(PlayerComponent), ent.get(InfectedComponent), ent.get(AliveComponent)] {
						case [Comp(c_ply), Comp(_), Comp(_)]:
							c_ply.player.SetModel(Misc.infModel);
						default:
					}
					switch [ent.get(GEntityComponent), ent.get(Ragdoll)] {
						case [Comp(c_ent), Comp(_.reveal => WAIT(_))]:
							reveal(c_ent.entity);
						default:
					}
				}
			case [_, WAIT]:
				trace("wrote");
				writeStatues();
			case [WAIT, _]:
				for (x in 0...componentManager.entities) {
					final ent:DI_ID = x;
					switch [ent.get(Statue), ent.get(GEntityComponent)] {
						case [Comp(_), Comp(c_gent)]:
							trace("removed statue");
							c_gent.entity.Remove();
						default:
					}
				}
			default:
		}
	}

	override function run_server() {
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(GEntityComponent), ent.get(Ragdoll)] {
				case [Comp(c_ent), Comp(c_rag)]:
					switch (c_rag.reveal) {
						case WAIT(time) if (Gmod.CurTime() > time.value):
							reveal(c_ent.entity);
						// c_ent.entity.SetModel(Misc.infModel);
						default:
					}

				// switch ent.get(Statue) {
				//  case Comp(_):
				//  default:
				//      if (c_rag.owner.get_sure(PlayerComponent).player.Alive()) {
				//          c_ent.entity.Remove(); //TODO invalid entity here??
				//      }
				// }

				default:
			}
			switch ent.get(PlayerComponent) {
				case Comp(c_ply):
					var tr = c_ply.player.GetEyeTrace();

					switch (tr.Entity.validID2()) {
						case HAS_ID(id):
							switch [id.get(GEntityComponent), id.get(StatInfo)] {
								case [Comp(c_gent), Comp(c_stat)]:
									// trace('sending info');
									statueinfo.send({
										stat: c_gent.entity,
										inf: c_stat.inf,
										health: c_stat.health,
										name: c_stat.name
									}, c_ply.player);
								default:
							}
						default:
					}
				default:
			}
		}
	}

	public function playerRagdoll(owner:Entity, ragdoll:Entity) {
		if (owner.IsPlayer()) {
			var ply:GPlayerCompat = cast owner;
			var di_ragdoll = newRagdoll(ply, ragdoll);
			switch (ply.get(InfectedComponent)) {
				case Comp(_):
					di_ragdoll.id.get_sure(Ragdoll)
						.reveal = WAIT(Gmod.CurTime() + 5); // TODO... constant hello
				default:
			}
		}
		ragdoll.SetNoDraw(true);
		ragdoll.Remove();
	}

	public function playerStatue(plyr:GPlayerCompat, ?inf = false) {
		var ent:GEntCompat = new GEntCompat(EntsLib.Create("prop_ragdoll"));
		ent.id.add_component(new Statue());
		var c_stat = new StatInfo();
		c_stat.name = plyr.Name();
		c_stat.inf = switch (plyr.get(InfectionComponent)) {
			case Comp(c_inf):
				c_inf.getInfValue();
			default:
				0.0;
		}
		c_stat.health = plyr.Health();
		ent.id.add_component(c_stat);
		ent.id.add_component(new KeepRestart());
		ent.SetModel(plyr.GetModel());
		ent.SetPos(plyr.GetPos());
		ent.Spawn();
		for (physNum in 0...ent.GetPhysicsObjectCount() - 1) {
			var physob = ent.GetPhysicsObjectNum(physNum);
			var result = plyr.GetBonePosition(ent.TranslatePhysBoneToBone(physNum));
			if (IsValid(physob)) {
				physob.SetPos(result.a);
				physob.SetAngles(result.b);
				physob.EnableMotion(false);
				physob.Sleep();
			}
		}
		ent.SetCollisionGroup(COLLISION_GROUP_WORLD);
		ent.SetTrigger(true);
		ent.SetSolid(SOLID_NONE);
		var plywep:Weapon = plyr.GetActiveWeapon();
		ent.SetNWString("showwep", plywep.GetModel());
	}

	function writeStatues() {
		var tbl:JsonStatues = [];
		for (x in 0...componentManager.entities) {
			final ent:DI_ID = x;
			switch [ent.get(Statue), ent.get(GEntityComponent)] {
				case [Comp(_), Comp(_.entity => gent)]:
					var ar:Array<JsonPhys> = [];
					for (i in 0...gent.GetPhysicsObjectCount()) {
						var physob = gent.GetPhysicsObjectNum(i);
						ar.push({
							pos: physob.GetPos(),
							ang: physob.GetAngles()
						});
					}
					tbl.push({
						model: gent.GetModel(),
						phys: ar
					});
				default:
			}
		}
		FileLib.Write("deceptinfect/lastRoundStatues.txt", Json.stringify(tbl));
	}

	function readStatues() {
		var file = FileLib.Read("deceptinfect/lastRoundStatues.txt", DATA);
		if (file != null && file != "") {
			var json:JsonStatues = Json.parse(file);
			for (stat in json) {
				// ect.
			}
			trace(json);
		}
	}

	public function playerStatue2(plyr:Player) {
		var vecs:Table<Int, Vector> = Table.create();
		var angs:Table<Int, Angle> = Table.create();
		for (boneid in 0...plyr.GetBoneCount() - 1) {
			var bp = plyr.GetBonePosition(boneid);
			vecs[boneid] = bp.a;
			angs[boneid] = bp.b;
		}
		statue.broadcast({
			playerpos: plyr.GetPos(),
			playermodel: plyr.GetModel(),
			weaponmodel: plyr.GetActiveWeapon()
				.GetModel(),
			playerangle: angs,
			playerbones: vecs
		});
	}

	public function newRagdoll(owner:GPlayerCompat, old:Entity):GEntCompat {
		var rag = createProp();
		rag.SetPos(owner.GetPos());
		rag.SetModel(owner.GetModel());
		rag.Spawn();
		rag.id.get_sure(Ragdoll)
			.owner = owner.id;
		for (physNum in 0...rag.GetPhysicsObjectCount() - 1) {
			var physob = rag.GetPhysicsObjectNum(physNum);
			var oldphysob = old.GetPhysicsObjectNum(physNum);
			var result = owner.GetBonePosition(rag.TranslatePhysBoneToBone(physNum));
			if (IsValid(physob)) {
				physob.SetPos(result.a);
				physob.SetAngles(result.b);
				if (IsValid(oldphysob)) {
					physob.SetVelocityInstantaneous(oldphysob.GetVelocity());
					physob.SetVelocity(oldphysob.GetVelocity());
				}
				physob.Wake();
			}
		}
		return rag;
	}

	function createProp():GEntCompat {
		final gameSystem = systemManager.get(GameSystem);
		var rag:Entity = EntsLib.Create("prop_ragdoll");
		var id = new GEntCompat(rag).id;
		id.add_component(new Ragdoll());

		switch (gameSystem.getGameManager()
			.state) {
			case PLAYING:
				id.add_component(new Statue());
				id.add_component(new KeepRestart());
			default:
				id.add_component(new CleanupEnt());
		}
		return rag;
	}

	function reveal(rag:GEntCompat) {
		var newmodel = createProp();
		var c_rag = newmodel.id.get_sure(Ragdoll);
		c_rag.reveal = REVEAL;
		c_rag.owner = rag.id.get_sure(Ragdoll)
			.owner;
		newmodel.SetModel(Misc.infModel);
		newmodel.SetPos(rag.GetPos());
		newmodel.Spawn();
		var newlocpos = newmodel.GetBonePosition(0)
			.a;
		var oldlocpos = rag.GetBonePosition(0)
			.a;
		rag.SetCollisionGroup(COLLISION_GROUP_WORLD);
		for (i in 0...rag.GetPhysicsObjectCount() - 1) {
			var oldphysob = rag.GetPhysicsObjectNum(i);
			if (IsValid(oldphysob)) {
				oldphysob.EnableCollisions(false);
			}
		}
		for (i in 0...newmodel.GetPhysicsObjectCount() - 1) {
			var newphysob = newmodel.GetPhysicsObjectNum(i);
			if (IsValid(newphysob)) {
				var bone = newmodel.TranslatePhysBoneToBone(i);
				var otherbone = rag.LookupBone(newmodel.GetBoneName(bone));
				var oldphysob = switch (rag.TranslateBoneToPhysBone(otherbone)) {
					case -1:
						null;
					case x:
						rag.GetPhysicsObjectNum(x);
				};
				if (otherbone != null) {
					var bp = rag.GetBonePosition(otherbone);
					newphysob.SetPos(bp.a, true);
					newphysob.SetAngles(bp.b);
					if (oldphysob != null) {
						newphysob.SetVelocityInstantaneous(oldphysob.GetVelocity());
						newphysob.SetVelocity(oldphysob.GetVelocity());
					}
				} else {
					var translate = newphysob.GetPos() - newlocpos;
					newphysob.SetPos(translate + oldlocpos, true);
				}
				// newphysob.EnableMotion(false);
				// newphysob.Sleep();
			}
		}
		rag.Remove();
	}
	#end
}
