package deceptinfect;

import deceptinfect.game.GameSystem;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.util.PrintTimer;
import haxe.io.Bytes;
import haxe.crypto.Crc32;
import gmod.enums.SNDLVL;
import gmod.enums.SND;
import gmod.enums.CHAN;
import deceptinfect.infection.components.GrabAccepter;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.game.RagdollSystem;
import deceptinfect.game.components.AliveComponent;
import deceptinfect.statuses.Walkthroughable;
import gmod.gamemode.GM.GmPlayerCanHearPlayersVoiceReturn;
import gmod.enums.IN;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.abilities.FormSystem;
import deceptinfect.ecswip.GrabSystem;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.Spectate;
import deceptinfect.ecswip.SystemManager;
import deceptinfect.GEntCompat;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.enums.BUTTON_CODE;
import deceptinfect.ecswip.ComponentManager;
import gmod.stringtypes.Hook;
import lua.Lua;
import tink.core.Annex;
import gmod.helpers.HaxeMultiReturn;
import gmod.libs.MathLib;
import gmod.libs.EntsLib;
import gmod.gclass.Player;

using deceptinfect.util.PlayerExt;

import deceptinfect.ecswip.SignalStorage;

@:keep
class DeceptInfect extends gmod.helpers.gamemode.GMBuild<gmod.gamemode.GM> implements deceptinfect.macros.SpamTracker.Spam {
	#if client
	override function CreateClientsideRagdoll(entity:Entity, ragdoll:Entity) {
		// ragdoll.Remove();
		ragdoll.SetNoDraw(true);
	
	}
	#end

	#if server
	override function CreateEntityRagdoll(owner:Entity, ragdoll:Entity) {
		SystemManager.getSystem(RagdollSystem).playerRagdoll(owner, ragdoll);
	}
	#end

	var lastcrc:Int = 0;

	override function Think() {
		SystemManager.runAllSystems();
	}

	var timestart = 0;
	var underperforming = false;

	@:exposeGM function checkPerformance():Void {
		
		if ((1 / Gmod.FrameTime()) < 66.6) {
			PrintTimer.print_time(5, () -> trace("Server is underperforming! ${1 / Gmod.FrameTime()}"));
		}
	}

	override function OnEntityCreated(entity:Entity) {
		if (entity.IsPlayer()) {
			var ent = new GPlayerCompat(new PlayerComponent(cast entity));
		} else {}
	}

	override function EntityRemoved(ent:GEntCompat) {
		if (ent.IsPlayer()) {
			ComponentManager.removeEntity(ent.id);
			return;
		}
		
		switch (ent.has_id()) {
			case Some(id):
				trace('killing ent $id because gent is being removed');
				ComponentManager.removeEntity(id);
			default:
		}
	}

	#if server
	override function PlayerSilentDeath(ply:Player) {

		if (ply.Team() == 5) {
			
		}
	}

	function playerDeath(victim:GPlayerCompat) {
		victim.id.remove_component(AliveComponent);
		victim.id.remove_component(GrabAccepter);
		var sounds = Misc.deathSounds.get(HUMAN_MALE);
		var sound = sounds[MathLib.random(0, sounds.length - 1)];
		victim.EmitSound(sound, 0, null, 0);
		Gmod.EmitSound(sound, victim.GetPos(), victim.EntIndex(), CHAN_VOICE);
		victim.CreateRagdoll();
	}

	override function DoPlayerDeath(ply:Player, attacker:Entity, dmg:CTakeDamageInfo) {
		ply.KillSilent();
		playerDeath(ply);
	
	}

	override function PlayerDeath(victim:GPlayerCompat, inflictor:Entity, attacker:Entity) {
		// victim.id.remove_component(InfectionComponent);
		// victim.id.remove_component(InfectedComponent);
		trace("Player ded!");
	}

	override function EntityKeyValue(ent:Entity, key:String, value:String):String {
		// trace(Lua.tostring(ent),key,value);
		return null;
	}

	override function PlayerSpawn(player:GPlayerCompat, transition:Bool) {
		player.UnSpectate();
		player.SetModel(Misc.roundModels[MathLib.random(0, Misc.roundModels.length - 1)]); // TODO make random models
		player.SetShouldServerRagdoll(true);
		player.ShouldDropWeapon(true);
		player.AllowFlashlight(true);
		switch (GameSystem.get().getGameManager().state) {
			case WAIT | SETTING_UP(_):
				player.Give(Misc.roundWeapons[0]); // TODO random weapons
				player.ShouldDropWeapon(false);
			case ENDING(_) | PLAYING:
				player.KillSilent();
		}
		// player.id.
		// setHiddenHealth
		// lowhealthrate???
		// kill player if round in progress
	}

	override function PlayerDisconnected(ply:GPlayerCompat) {
		ply.id.remove_component(PlayerComponent);
		ply.id.remove_component(GEntityComponent);
		//previous player component?
	}

	override function PlayerButtonUp(ply:GPlayerCompat, button:BUTTON_CODE) {
		switch (button) {
			case KEY_E:
			// GrabSystem.requestStopSearch(ply.id);
			// GameManager.initInfectedPlayer(ply.id);
			// GrabSystem.attemptGrab(ply.id,(PlayerLib.GetByID(2):GPlayerCompat).id);
			case KEY_F:
				FormSystem.attemptChangeForm(ply.id);
			case KEY_SEMICOLON:
				var plyr:GPlayerCompat = PlayerLib.GetByID(1);
				SystemManager.getSystem(InfectionSystem).makeInfected(plyr.id);
			case KEY_M:
			// trace(ComponentManager.components.get(PlayerComponent));
			default:
				// handle case of infection? use command strategy
		}
	}

	override function KeyPress(ply:GPlayerCompat, key:IN) {
		switch (key) {
			case IN_USE:
				GrabSystem.requestStartSearch(ply.id);
			default:
		}
	}

	override function KeyRelease(ply:GPlayerCompat, key:IN) {
		switch (key) {
			case IN_USE:
				GrabSystem.requestStopSearch(ply.id);
			default:
		}
	}

	// override function PlayerSwitchWeapon(player:Player, oldWeapon:Weapon, newWeapon:Weapon):Bool {
	//     if (!IsValid(oldWeapon) || !IsValid(newWeapon)) {return null;}
	//     if (oldWeapon.GetClass() == "weapon_infect") {
	//         return true;
	//     }
	//     return null;
	// }

	override function PlayerButtonDown(ply:GPlayerCompat, button:BUTTON_CODE) {
		switch (button) {
			case KEY_E:
			// GrabSystem.requestStartSearch(ply.id);
			default:
		}
	}

	override function PlayerInitialSpawn(player:Player, transition:Bool) {}

	override function PlayerDeathSound():Bool {
		return false;
	}

	override function PlayerDeathThink(ply:GPlayerCompat):Bool {
		var comp = ply.id.get(PlayerComponent).sure();
		var reviveTime;
		var revive = false;
		comp.deathTime = switch (comp.deathTime) {
			case ALIVE:
				reviveTime = Gmod.CurTime() + 1;
				DEAD(reviveTime);
			case DEAD(rev):
				reviveTime = rev;
				comp.deathTime;
		}
		if (ply.IsBot() && Gmod.CurTime() > reviveTime && GameSystem.get().shouldAllowRespawn()) {
			revive = true;
		}
		if (Gmod.IsValid(ply.GetObserverTarget())) {
			ply.SetPos(ply.GetObserverTarget().GetPos());
		}
		if (ply.KeyPressed(IN_ATTACK)) {
			if (Gmod.CurTime() > reviveTime && GameSystem.get().shouldAllowRespawn()) {
				revive = true;
			}
			Spectate.chooseSpectateTarget(comp, FORWARDS);
		} else if (ply.KeyPressed(IN_ATTACK2)) {
			Spectate.chooseSpectateTarget(comp, BACKWARDS);
		} else if (ply.KeyPressed(IN_JUMP) && ply.shouldFreeRoam()) {
			ply.UnSpectate();
			ply.Spectate(OBS_MODE_ROAMING);
			comp.spec_next = 1;
		}
		return if (revive) {
			comp.deathTime = ALIVE;
			ply.UnSpectate();
			ply.Spawn();
			true;
		} else {
			false;
		}
	}

	//TODO broken... forever!
	override function IsSpawnpointSuitable(ply:GPlayerCompat, spawnpoint:Entity, makeSuitable:Bool):Bool {
		var pos = spawnpoint.GetPos();
		var blockers = EntsLib.FindInBox(pos + new Vector(-30, -30, 0), pos + new Vector(30, 30, 72));
		var tracehit = UtilLib.TraceEntity({
			start: pos,
			endpos: pos + new Vector(1, 1, 1),
		}, ply);
		for (ent in blockers) {
			if (ent.IsPlayer()) {
				var blockPly:GPlayerCompat = cast ent;
				blockPly.setWalkthroughable(true);
				blockPly.id.add_component(new Walkthroughable());
				ply.setWalkthroughable(true);
				ply.id.add_component(new Walkthroughable());
				// ply.setWalkthroughable(true);
			} else {
				// return false;
				// return false;
			}
		}
		if (tracehit.HitWorld) {
			trace("not valid..");
			return false;
		}
		return true;
	}

	override function PlayerSelectSpawn(ply:Player, transition:Bool):Entity {
		var spawns = EntsLib.FindByClass("info_player_start");
		// trace(spawns.length());
		// Gmod.PrintTable(spawns);
		var random_spawn = MathLib.random(spawns.length());
		// for (spawn in spawns) {
		if (IsSpawnpointSuitable(ply, spawns[random_spawn], false)) {
			return spawns[random_spawn];
		}
		// }
		trace("Could not find a spawn!");
		return null;
	}

	override function EntityTakeDamage(target:GEntCompat, dmg:CTakeDamageInfo):Bool {
		switch (target.has_id()) {
			case Some(id):
				SignalStorage.entDamageTrigger.trigger({
					vicID: id,
					dmg: dmg,
					entity: target
				});
			default:
		}
		return null;
	}

	override function PlayerSay(sender:Player, text:String, teamChat:Bool):String {
		return "aaaaple";
	}

	override function PlayerCanHearPlayersVoice(listener:Player, talker:Player):HaxeMultiReturn<A_GmPlayerCanHearPlayersVoiceReturn> {
		return {
			a: false,
			b: false
		};
	}
	#end
}
