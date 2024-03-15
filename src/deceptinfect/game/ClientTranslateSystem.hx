package deceptinfect.game;

import deceptinfect.ecswip.ClientRepresentationTarget;
import gmod.stringtypes.Hook.GMHook; // keep
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.macros.IterateEnt;
import deceptinfect.macros.ClassToID;
import gmod.helpers.net.NET_Client.NET_CL_Message;
import gmod.helpers.net.NET_Client.NET_Cl;

using Lambda;
using Safety;
using gmod.helpers.WeakTools;

typedef FullUpdate = {
	var networkid:String;
	var name:String;
	var userid:Int;
	var index:Int;
}

@:structInit
class Net_ReplicatedEntity implements hxbit.Serializable {
	@:s public var comp:Array<ReplicatedComponent> = [];

	@:s public var serverID:Int;
}

@:structInit
class Net_ReplicatedEntitiesMessage implements hxbit.Serializable {
	@:s public var replEntities:Array<Net_ReplicatedEntity>;
}

// May cause problems. Take the caching approach if it does

@:structInit
class Net_RemoveComponentMessage implements hxbit.Serializable {
	@:s public var serverID:Int;

	@:s public var comp:Int;
}

@:structInit
class Net_RemoveEntityMessage implements hxbit.Serializable {
	@:s public var serverID:Array<Int>;
}

#if client
enum ClientClasses {
	Player;
	Entity;
	Other;
}
#end

typedef CacheRemove = {
	id:DI_ID,
	comp:Int,
	players:Array<Player>
}

typedef CacheRemoveEnt = {
	id:DI_ID,
	players:Map<Player, Bool>
}

typedef OnRequestFullUpdate = {
	networkid:String,
	name:String,
	userid:Int,
	index:Int
}

typedef ReadyToRecv = NET_CL_Message;

// TODO make it not static? Might cause problems
// The future is now! I didn't say it was a working future..

/**
	Note to future self.
	Narrow replication targets only, avoid widening.
	Could have undefined effects when we want to remove ent
	i.e we have our original targets not recieving a remove message, only those we narrowed to.
**/
class ClientTranslateSystem extends System {
	@:keep
	var net_replEntsMessage:NET_Server<"di_netreplents", Net_ReplicatedEntitiesMessage>;

	@:keep
	var net_RemoveComponentMessage:NET_Server<"di_removecomponent", Net_RemoveComponentMessage>;

	@:keep
	var net_RemoveEntityMessage:NET_Server<"di_removentity", Net_RemoveEntityMessage>;

	var clnet_SendReadyToRecv:NET_Cl<ReadyToRecv>;

	#if client
	var serverIDToClientID:Map<Int, DI_ID> = [];

	var trashed:Map<Int, DI_ID> = [];

	var components:Map<Int, Component>;

	function componentsC() {
		final comp:Map<Int, Component> = [];
		return comp;
	}

	function removeCompRecv(nremove:Net_RemoveComponentMessage) {
		final clientID = serverIDToClientID.get(nremove.serverID)
			.or(trashed.get(nremove.serverID));
		if (clientID == null) {
			final compName = componentManager.componentsName.get(nremove.comp);
			trace('Attempt to remove ${compName} not linked to an ID on the client...');
			return;
		}
		if (!componentManager.has_component(nremove.comp, clientID)) {
			final compName = componentManager.componentsName.get(nremove.comp);
			trace('Attempt to remove ${compName} that\'s not there...');
			return;
		}
		trace('removing ${Type.getClassName(Type.getClass(componentManager.getComponent(nremove.comp, clientID)))}');
		componentManager.removeComponent(nremove.comp, clientID);
	}

	function removeEntityRecv(nremove:Net_RemoveEntityMessage) {
		for (svID in nremove.serverID) {
			final clientID = serverIDToClientID.get(svID);
			if (clientID == null) {
				trace('Attempt to invalidate invalid id ${svID}');
				continue;
			}
			trace('Invalidated ${svID}');
			serverIDToClientID.remove(svID);
			trashed.set(svID, clientID);
			componentManager.removeEntity(clientID);
		}
	}

	// TODO make it more efficient, use move instead of copy...
	function updateEntRecv(x:Net_ReplicatedEntitiesMessage) {
		for (ent in x.replEntities) {
			final clientID = serverIDToClientID.get(ent.serverID);
			if (clientID != null) {
				for (comp in ent.comp) {
					final other = components.get(comp.__uid);
					if (!components.exists(comp.__uid)) {
						components.set(comp.__uid, comp);
						trace('Added ${comp.getName()} to existing ent');
						componentManager.addComponent(comp.getCompID(), comp, clientID);
					} else {
						var compTable:AnyTable = cast comp;
						for (name => value in compTable) {
							Reflect.setField(other, name, value);
						}
					}
				}
			} else {
				var id = null;
				for (comp in ent.comp) {
					final compClass = Type.getClass(comp);
					if (compClass == PlayerComponent) {
						IterateEnt.iterGet([GEntityComponent], [c_currentEnt = {entity: ent}]
							, function(ent) {
								untyped {
									if (comp.entity == ent) {
										id = componentManager.getIDFromComponent(c_currentEnt);
									}
								}
						});
						IterateEnt.iterGet([PlayerComponent], [c_currentPlayer = {player: ply}]
							, function(plyEnt) {
								untyped {
									if (comp.player == ply) {
										id = componentManager.getIDFromComponent(c_currentPlayer);
									}
								}
						});
					} else if (compClass == ClientRepresentationTarget) {
						trace("ClientRepresentationTarget");
						final c_crt:ClientRepresentationTarget = cast comp;
						if (serverIDToClientID.exists(c_crt.target)) {
							id = serverIDToClientID.get(c_crt.target);
							trace("CRT Successful");
						} else {
							trace("CRT unsucessful....");
						}
					}
				}
				if (id == null) {
					id = componentManager.addEntity();
					for (comp in ent.comp) {
						trace('New entity ${comp.getName()}/$id');
					}
				}
				for (comp in ent.comp) {
					components.set(comp.__uid, comp);
					if (comp is PlayerComponent) {
						final c_ply:PlayerComponent = cast comp;
						untyped c_ply.player.id = id;
					}
					componentManager.addComponent(comp.getCompID(), comp, id);
				}
				serverIDToClientID.set(ent.serverID, id);
			}
		}
	}
	#end

	#if client
	override function init_client() {
		HookLib.Add(ClientSignOnStateChanged, "di_csosc", (user, _, newState) -> {
			switch (newState) {
				case SIGNONSTATE_FULL:
					clnet_SendReadyToRecv.send({});
				default:
			}
		});
		components = componentsC();
	}
	#end

	override function init_shared() {
		net_replEntsMessage = new NET_Server<"di_netreplents", Net_ReplicatedEntitiesMessage>
			(#if client [updateEntRecv] #end);
		net_RemoveComponentMessage = new NET_Server<"di_removecomponent", Net_RemoveComponentMessage>
			(#if client [removeCompRecv] #end);
		net_RemoveEntityMessage = new NET_Server<"di_removentity", Net_RemoveEntityMessage>
			(#if client [removeEntityRecv] #end);
		clnet_SendReadyToRecv = new NET_Cl<ReadyToRecv>(#if server [readyToRecv] #end);
	}

	#if server
	function readyToRecv(data:ReadyToRecv) {
		playersReadyToRecv.set(data._sentPlayer.UserID(), true);
	}

	var removePlyrsFlag:Map<Player, Bool> = [];

	var removeEntPlyrsFlag:Map<Player, Bool> = [];

	var removes:Array<CacheRemove> = [];

	var removesEnt:Array<CacheRemoveEnt> = [];

	var queueReplComponents:Map<Int, Array<ReplicatedComponent>> = [];

	var playersReadyToRecv:Map<Int, Bool> = [];

	var clientReplicationMachine:ClientReplicationMachine;

	function onFieldsChanged(data:FieldsChangedData) {
		final ent = componentManager.getIDFromComponent(data.comp);
		final plyrs = clientReplicationMachine.replToPlayers(data.comp.replicated, ent);
		for (plyr in plyrs) {
			queueReplComponents.get(plyr.UserID())
				.orGet(() -> {
					final arr:Array<ReplicatedComponent> = [];
					queueReplComponents.set(plyr.UserID(), arr);
					arr;
				})
				.push(data.comp);
		}
		if (plyrs.length == 0) {
			trace("Sent to no one...");
			data.comp.fieldsChanged = false;
		}
	}

	function onFieldsChangedTarget(data:FieldsChangedData, playerTarget:Player) {
		final ent = componentManager.getIDFromComponent(data.comp);
		final plyrs = clientReplicationMachine.replToPlayers(data.comp.replicated, ent);
		for (plyr in plyrs) {
			if (plyr != playerTarget)
				continue;
			queueReplComponents.get(plyr.UserID())
				.orGet(() -> {
					final arr:Array<ReplicatedComponent> = [];
					queueReplComponents.set(plyr.UserID(), arr);
					arr;
				})
				.push(data.comp);
		}
		if (plyrs.length == 0) {
			trace("Sent to no one...");
			data.comp.fieldsChanged = false;
		}
	}

	override function init_server() {
		clientReplicationMachine = new ClientReplicationMachine(componentManager);
		for (player in PlayerLib.GetAll()) {
			playersReadyToRecv.set(player.UserID(), true); // TODO what?
		}
		GameeventLib.Listen("OnRequestFullUpdate");
		HookLib.Add("OnRequestFullUpdate", "di_cts_fullupdate", (data:FullUpdate) -> {
			var player = Gmod.Player(data.userid);
			if (player == null) {
				trace("Request full update has a null player...");
				return;
			}
			for (compStore in componentManager.components_3) {
				for (comp in compStore.components) {
					if (comp is ReplicatedComponent) {
						onFieldsChangedTarget({
							comp: cast comp
						}, player);
					}
				}
			}
		});
		componentManager.removeSignal.handle((x) -> {
			if (componentManager.deadEnt.exists(x.ent)) {
				return;
			}
			if (!(x.comp is ReplicatedComponent)) {
				trace("Not a replicated component...");
				return;
			}
			final repl:ReplicatedComponent = cast x.comp;
			final compID = x.comp.getCompID();
			final plyrs = clientReplicationMachine.replToPlayers(repl.replicated, x.ent);
			for (plyr in plyrs) {
				removePlyrsFlag.set(plyr, true);
			}
			removes.push({
				id: x.ent,
				comp: compID,
				players: plyrs
			});
		});
		componentManager.getAddSignal(ClassToID.idc(ReplicatedEntity))
			.handle((add) -> {
				for (compStore in componentManager.components_3) {
					if (compStore.has_component(add.ent)) {
						var comp = compStore.get_component(add.ent);
						if (comp is ReplicatedComponent) {
							var repl:ReplicatedComponent = comp;
							repl.fieldsChangedSig.handle(onFieldsChanged);
							if (repl.fieldsChanged) {
								onFieldsChanged({
									comp: comp
								});
							}
						}
					}
				}
			});
		componentManager.addSignal.handle((add) -> {
			if (add.comp is ReplicatedComponent) {
				if (add.ent.has_comp(ReplicatedEntity)) {
					final c_replComp:ReplicatedComponent = cast add.comp;
					c_replComp.fieldsChangedSig.handle(onFieldsChanged);
					if (c_replComp.fieldsChanged) {
						onFieldsChanged({
							comp: c_replComp
						});
					}
				}
			}
		});

		componentManager.getAddSignal(ClassToID.idc(PlayerComponent))
			.handle((sig) -> {
				// for (x in 0...componentManager.entities) {
				//  final ent:DI_ID = x;
				for (compStore in componentManager.components_3) {
					if (compStore.has_component(sig.ent)) {
						final comp = compStore.get_component(sig.ent);
						if (comp is ReplicatedComponent) {
							final replComp:ReplicatedComponent = cast comp;
							final plyrs = clientReplicationMachine.replToPlayers(replComp.replicated
								, sig.ent);
							if (plyrs.contains(sig.comp.player)) {
								onFieldsChanged({ // NOTE: this will update all the targets instead of just the one we want. Unintended concequences?
									comp: replComp
								});
							}
						}
					}
				}
				// }
			});
		componentManager.removeEntitySignal.handle((sig) -> {
			var playersForCurEnt:Map<Player, Bool> = [];
			for (compStore in componentManager.components_3) {
				if (compStore.has_component(sig.ent)) {
					final comp = compStore.get_component(sig.ent);
					if (comp is ReplicatedComponent) {
						final replComp:ReplicatedComponent = cast comp;
						final plyrs = clientReplicationMachine.replToPlayers(replComp.replicated, sig.ent);
						for (ply in plyrs) {
							removeEntPlyrsFlag.set(ply, true);
							playersForCurEnt.set(ply, true);
						}
					}
				}
			}
			removesEnt.push({
				id: sig.ent,
				players: playersForCurEnt
			});
		});
	}

	var profile:Profiler = new Profiler();

	@:expose("profilects")
	function profilects() {
		profile = new Profiler();
		profile.beginProfiling();
		// Profiler.beginProfiling();
	}

	function sendQueuedMessages() {
		final removes = [];
		for (user => replComps in queueReplComponents) {
			if (!playersReadyToRecv.exists(user)) {
				// not replicating
				continue;
			}
			var ents:Map<Int, Net_ReplicatedEntity> = [];
			var entsreliable:Map<Int, Net_ReplicatedEntity> = [];
			var entsSize = 0;
			var entsReliableSize = 0;
			for (comp in replComps) {
				final serverID:DI_ID = componentManager.getIDFromComponent(comp);
				var targetmap = if (comp.unreliable) {
					entsSize++;
					ents;
				} else {
					entsReliableSize++;
					entsreliable;
				}
				if (!targetmap.exists(serverID)) {
					targetmap.set(serverID, {
						comp: [comp],
						serverID: serverID
					});
				} else {
					targetmap.get(serverID)
						.comp.push(comp);
				}
				comp.fieldsChanged = false;
			}
			final player = Gmod.Player(user);
			if (entsSize > 0) {
				net_replEntsMessage.send({replEntities: ents.array()}, player, true);
			}
			if (entsReliableSize > 0) {
				net_replEntsMessage.send({replEntities: entsreliable.array()}, player, false);
			}
			removes.push(user);
		}
		for (remove in removes) {
			queueReplComponents.remove(remove);
		}
	}

	function sendQueuedRemoves() {
		for (plyr in removePlyrsFlag.keys()) {
			var remove = removes.filter((r) -> r.players.contains(plyr));
			for (remve in remove) {
				net_RemoveComponentMessage.send({
					comp: remve.comp,
					serverID: remve.id
				}, plyr);
			}
		}
		removePlyrsFlag = [];
		removes = [];
	}

	function sendQueuedRemoveEntity() {
		for (plyr in removeEntPlyrsFlag.keys()) {
			var remove = removesEnt.filter((r) -> r.players.exists(plyr));
			var ids = [];
			for (remve in remove) {
				ids.push(remve.id);
			}
			trace("Sending removeEntity Message");
			net_RemoveEntityMessage.send({
				serverID: ids
			}, plyr);
		}
		removeEntPlyrsFlag = [];
		removesEnt = [];
	}

	override function run_server() {
		sendQueuedMessages();
		sendQueuedRemoveEntity();
		sendQueuedRemoves();
	}

	public function flush() {
		run_server();
	}
	#end
}

#if server
// TODO cleanup this
class ClientReplicationMachine {
	final sentArray:Map<Player, Net_ReplicatedEntitiesMessage> = [];

	final reliables:Map<Player, Net_ReplicatedEntitiesMessage> = [];

	var added:Map<Player, Array<ReplicatedComponent>> = [];

	var addedReliable:Map<Player, Array<ReplicatedComponent>> = [];

	var componentManager:ComponentManager;

	public function new(_componentManager:ComponentManager) {
		componentManager = _componentManager;
	}

	public function replToPlayers(x:ReplicatedTarget, diid:DI_ID):Array<Player> {
		var arr:Array<Player> = [];
		switch (x) {
			case NONE:
			case SOME(PVS(ent)):
				final filter = Gmod.RecipientFilter();
				filter.AddPVS(ent.GetPos());
				filter.GetPlayers()
					.map(arr.push);
			// for (ply in filter.GetPlayers()) {
			//  if (ply.IsBot()) continue;
			//  arr.push(ply);
			// }
			case SOME(PLAYERS(a)):
				arr = a;
			case SOME(INFECTED):
				IterateEnt.iterGet([InfectedComponent, PlayerComponent], [_, {player: ply}], function() {
					arr.push(ply);
				});
			case SOME(CURRENT_PLAYER):
				final ply = diid.get_2(PlayerComponent);
				if (ply != null) {
					arr.push(ply.player);
				} else {
					// throw "Not attatched to a player!";
				}
			case SOME(SPECTATORS):
			// TODO
			case ALL:
				for (ply in PlayerLib.GetHumans()) {
					arr.push(ply);
				}
			case MASTER(target):
				arr = replToPlayers(target.replicated, diid);
		}
		return arr;
	}
}
#end
