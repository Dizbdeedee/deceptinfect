package deceptinfect;

import gmod.enums.TEAM;
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
import deceptinfect.game.components.GamePlayer;
import deceptinfect.game.components.NotInGamePlayer;

using deceptinfect.util.PlayerExt;

import deceptinfect.ecswip.SignalStorage;

@:keep
class DeceptInfect extends gmod.helpers.gamemode.GMBuild<gmod.gamemode.GM>
		implements deceptinfect.macros.SpamTracker.Spam {
	final systemManager:SystemManager;

	final componentManager:ComponentManager;

	public function new(_systemManager:SystemManager, _componentManager:ComponentManager) {
		systemManager = _systemManager;
		componentManager = _componentManager;
	}

	#if client
	override function CreateClientsideRagdoll(entity:Entity, ragdoll:Entity) {
		final gameSystem = systemManager.get(GameSystem);
		if (gameSystem.gameManagerAvaliable())
			return;
		if (gameSystem.getGameManager()
			.state != WAIT) {
			ragdoll.SetNoDraw(true);
		}
	}
	#end

	#if server
	override function CreateEntityRagdoll(owner:Entity, ragdoll:Entity) {
		final gameSystem = systemManager.get(GameSystem);
		final ragdollSystem = systemManager.get(RagdollSystem);
		final gameManager = gameSystem.getGameManager();
		if (gameManager.state != WAIT) {
			ragdollSystem.playerRagdoll(owner, ragdoll);
		}
	}
	#end

	override function OnGamemodeLoaded() {
		#if debug
		Gmod.RunConsoleCommand("developer", 1);
		#end
		#if server
		ResourceLib.AddFile("sound/deceptinfect/doom.wav");
		ResourceLib.AddFile("sound/deceptinfect/win.wav");
		ResourceLib.AddFile("sound/deceptinfect/lose.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/1.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/2.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/3.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/4.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/5.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/6.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/7.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/8.wav");
		ResourceLib.AddFile("sound/deceptinfect/beats/adrenalin/9.wav");
		#end
	}

	var lastcrc:Int = 0;

	override function Think() {
		systemManager.runAllSystems();
		checkPerformance();
	}

	var timestart = 0;
	var underperforming = false;

	function checkPerformance():Void {
		// if ((1 / Gmod.FrameTime()) < 66.6) {
		//	PrintTimer.print_time(5,
		//		() -> trace('Server is underperforming! ${1 / Gmod.FrameTime()}'));
		// }
	}

	override function OnEntityCreated(entity:Entity) {
		#if server
		if (entity.IsPlayer()) {
			new GPlayerCompat(new PlayerComponent(cast entity));
		}
		#end
	}

	override function EntityRemoved(ent:GEntCompat) {
		if (ent.IsPlayer()) {
			componentManager.removeEntity(ent.id);
			return;
		}
		switch (ent.has_id()) {
			case Some(id):
				trace('killing ent $id because gent is being removed');
				componentManager.removeEntity(id);
			default:
		}
	}

	#if server
	function playerDeath(victim:GPlayerCompat) {
		victim.id.remove_component(AliveComponent); // deprecated
		victim.id.remove_component(GrabAccepter);
		victim.id.remove_component(deceptinfect.game.components.GamePlayer);
		victim.id.add_component(new deceptinfect.game.components.NotInGamePlayer());
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
		trace("Player ded!");
	}

	override function PlayerSpawn(player:GPlayerCompat, transition:Bool) {
		final gameSystem = systemManager.get(GameSystem);
		final gameManager = gameSystem.getGameManager();
		player.SetModel(Misc.roundModels[MathLib.random(0
			, Misc.roundModels.length - 1)]); // TODO make random models
		player.SetWalkSpeed(190);
		player.SetRunSpeed(190);
		player.SetShouldServerRagdoll(true);
		player.ShouldDropWeapon(true);
		player.AllowFlashlight(true);
		if (gameManager.state == WAIT) {
			player.SetShouldServerRagdoll(false);
		} else {
			player.SetShouldServerRagdoll(true);
		}
		switch (gameManager.state) {
			case WAIT | SETTING_UP(_):
				TimerLib.Simple(0.1, () -> player.Give(Misc.roundWeapons[0]));
				player.ShouldDropWeapon(false);
			case ENDING(_) | PLAYING:
				if (!gameManager.spawnAllowed) {
					player.KillSilent();
				}
		}
		player.RemoveAllGestures();
		player.AnimRestartMainSequence();
	}

	override function PlayerDisconnected(ply:GPlayerCompat) {
		ply.id.remove_component(PlayerComponent);
		ply.id.remove_component(deceptinfect.game.components.GamePlayer);
		ply.id.remove_component(GEntityComponent);
		// previous player component?
	}

	override function PlayerButtonUp(ply:GPlayerCompat, button:BUTTON_CODE) {
		final infectionSystem = systemManager.get(InfectionSystem);
		final formSystem = systemManager.get(FormSystem);
		switch (button) {
			case KEY_E:
				switch (ply.get(deceptinfect.grab.components.GrabSearcher)) {
					case Comp(c_gs):
						c_gs.searchState = SEARCH_INACTIVE;
					default:
				}
			// GrabSystem.requestStopSearch(ply.id);
			// GameManager.initInfectedPlayer(ply.id);
			// GrabSystem.attemptGrab(ply.id,(PlayerLib.GetByID(2):GPlayerCompat).id);
			case KEY_F:
				formSystem.attemptChangeForm(ply.id);
			case KEY_SEMICOLON:
				var plyr:GPlayerCompat = PlayerLib.GetByID(1);
				infectionSystem.makeInfected(plyr.id);
			case KEY_M:
			// trace(ComponentManager.components.get(PlayerComponent));
			default:
				// handle case of infection? use command strategy
		}
	}

	override function KeyPress(ply:GPlayerCompat, key:IN) {
		// grabsystem was here
	}

	override function KeyRelease(ply:GPlayerCompat, key:IN) {
		// grabsystem was here
	}

	override function PlayerButtonDown(ply:GPlayerCompat, button:BUTTON_CODE) {
		switch (button) {
			case KEY_E:
				switch (ply.get(deceptinfect.grab.components.GrabSearcher)) {
					case Comp(c_gs):
						c_gs.searchState = SEARCH_ACTIVE;
					default:
				}
			default:
		}
	}

	override function PlayerInitialSpawn(player:Player, transition:Bool) {
		player.SetTeam(TEAM.TEAM_UNASSIGNED);
		#if debug
		// player.ConCommand("developer 1");
		#end
	}

	override function PlayerDeathSound():Bool {
		return false;
	}

	override function PlayerDeathThink(ply:GPlayerCompat):Bool {
		final gameSystem = systemManager.get(GameSystem);
		if (ply.id == null)
			return null;
		if (!ply.id.has_comp(PlayerComponent))
			return null;
		var comp = ply.id.get(PlayerComponent)
			.sure();
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
		if (ply.IsBot() && Gmod.CurTime() > reviveTime && gameSystem.shouldAllowRespawn()) {
			revive = true;
		}
		if (Gmod.IsValid(ply.GetObserverTarget())) {
			ply.SetPos(ply.GetObserverTarget()
				.GetPos());
		}
		if (ply.KeyPressed(IN_ATTACK)) {
			if (Gmod.CurTime() > reviveTime && gameSystem.shouldAllowRespawn()) {
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

	// TODO broken... forever!
	override function IsSpawnpointSuitable(ply:GPlayerCompat, spawnpoint:Entity, makeSuitable:Bool):Bool {
		var pos = spawnpoint.GetPos();
		var blockers = EntsLib.FindInBox(pos + new Vector(-30, -30, 0), pos + new Vector(30, 30, 72));
		var tracehit = UtilLib.TraceEntity({start: pos,
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
		var random_spawn = MathLib.random(untyped spawns.length());
		if (IsSpawnpointSuitable(ply, spawns[random_spawn], false)) {
			return spawns[random_spawn];
		}
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

	#if debug
	override function PlayerNoClip(ply:Player, desiredState:Bool):Bool {
		return true;
	}
	#end

	override function PlayerSay(sender:Player, text:String, teamChat:Bool):String {
		return null;
	}

	override function PlayerCanHearPlayersVoice(listener:GPlayerCompat,
			talker:GPlayerCompat):HaxeMultiReturn<A_GmPlayerCanHearPlayersVoiceReturn> {
		var bothSpec = listener.id.has_comp(NotInGamePlayer) && listener.id.has_comp(NotInGamePlayer);
		return switch [listener.id.has_comp(GamePlayer), talker.id.has_comp(GamePlayer), bothSpec] {
			case [true, true, _]:
				if (listener.GetPos()
					.DistToSqr(talker.GetPos()) < 1210000) {
					{
						a: true,
						b: false
					};
				} else {
					{
						a: false,
						b: false
					};
				}
			case [_, _, true]:
				{a: true, b: false};
			case [false, _, _]:
				{a: true, b: false};
			case [_, false, _]:
				{a: false, b: false};
			default:
				{a: false, b: false};
		}
	}

	override function PlayerCanSeePlayersChat(text, teamOnly, listener:GPlayerCompat, speaker:GPlayerCompat) {
		return if (listener.GetPos()
			.DistToSqr(speaker.GetPos()) > 1210000) {
			false;
		} else {
			true;
		}
	}
	#end
}
