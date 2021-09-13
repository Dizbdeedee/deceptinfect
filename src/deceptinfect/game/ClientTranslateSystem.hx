package deceptinfect.game;

import deceptinfect.ecswip.ClientRepresentationTarget;
import gmod.stringtypes.Hook.GMHook;
import lua.lib.luv.Process;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.macros.IterateEnt;
import deceptinfect.macros.ClassToID;
import hxbit.StructSerializable;
import hxbit.Schema;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.ecswip.SystemManager;
import hxbit.Serializable;
import hxbit.Serializer;
import gmod.helpers.net.NET_Client;
using Lambda;
using Safety;
using gmod.helpers.WeakTools;


@:structInit
class Net_ReplicatedEntity implements hxbit.Serializable {
	@:s public var comp:Array<ReplicatedComponent> = [];

	@:s public var serverID:Int;
}

@:structInit
class Net_ReplicatedEntitiesMessage implements hxbit.Serializable {

	@:s public var replEntities:Array<Net_ReplicatedEntity>;
	
}


//May cause problems. Take the caching approach if it does
@:structInit
class Net_RemoveComponentMessage implements hxbit.Serializable {
	@:s public var serverID:Int;

	@:s public var comp:Int;
}

@:structInit
class Net_RemoveEntityMessage implements hxbit.Serializable {
	@:s public var serverID:Int;
}

#if client
enum ClientClasses {
	Player;
	Entity;
	Other;
}
#end


typedef CacheRemove = {
	id : DI_ID,
	comp : Int,
	players : Array<Player>
}

typedef OnRequestFullUpdate = {
	networkid: String,
	name: String,
	userid: Int,
	index: Int
}

typedef ReadyToRecv = NET_CL_Message;

//TODO make it not static? Might cause problems

/**
Note to future self.
Narrow replication targets only, avoid widening.
Could have undefined effects when we want to remove ent
i.e we have our original targets not recieving a remove message, only those we narrowed to.
**/

class ClientTranslateSystem extends System {
	@:keep
	static final net_replEntsMessage = new NET_Sv<Net_ReplicatedEntitiesMessage>(#if client [updateEntRecv] #end);

	@:keep
	static final net_RemoveComponentMessage = new NET_Sv<Net_RemoveComponentMessage>(#if client [removeCompRecv] #end);

	var clnet_SendReadyToRecv:NET_Cl<ReadyToRecv>;

	@:keep
	static final net_RemoveEntityMessage = new NET_Sv<Net_RemoveEntityMessage>(#if client [removeEntityRecv] #end);


	#if client

	static final serverIDToClientID:Map<Int,DI_ID> = [];

	static final trashed:Map<Int,DI_ID> = [];

	static final components:Map<Int,Component> = componentsC();

	static function componentsC() {
		final comp:Map<Int,Component> = [];
		
		return comp;
	}

	static function removeCompRecv(nremove:Net_RemoveComponentMessage) {

		final clientID = serverIDToClientID.get(nremove.serverID).or(trashed.get(nremove.serverID));
		if (clientID == null) {
			final compName = ComponentManager.componentsName.get(nremove.comp);
			trace('Attempt to remove ${compName} not linked to an ID on the client...');
			return;
		}
		if (!ComponentManager.has_component(nremove.comp,clientID)) {
			final compName = ComponentManager.componentsName.get(nremove.comp);
			trace('Attempt to remove ${compName} that\'s not there...');
			return;
		}
		trace('removing ${Type.getClassName(Type.getClass(ComponentManager.getComponent(nremove.comp,clientID)))}');
		ComponentManager.removeComponent(nremove.comp,clientID);
	}

	static function removeEntityRecv(nremove:Net_RemoveEntityMessage) {
		final clientID = serverIDToClientID.get(nremove.serverID);
		if (clientID == null) {
			trace('Attempt to invalidate invalid id ${nremove.serverID}');
			return;
		}
		trace('Invalidated ${nremove.serverID}');
		serverIDToClientID.remove(nremove.serverID);
		trashed.set(nremove.serverID,clientID);
		
	}

	//TODO make it more efficient, use move instead of copy...
	static function updateEntRecv(x:Net_ReplicatedEntitiesMessage) {
		for (ent in x.replEntities) {
			final clientID = serverIDToClientID.get(ent.serverID);
			if (clientID != null) {
				for (comp in ent.comp) {
					final other = components.get(comp.__uid);
					if (!components.exists(comp.__uid)) {
						components.set(comp.__uid,comp);
						trace('Added ${comp.getName()} to existing ent');
						ComponentManager.addComponent(comp.getCompID(),comp,clientID);
					} else {
						var compTable:AnyTable = cast comp;
						for (name => value in compTable) {
							Reflect.setField(other,name,value);
						}
					}
				}
			} else {
				var id = null;
				for (comp in ent.comp) {
					final compClass = Type.getClass(comp);
					if (compClass == PlayerComponent) {
						IterateEnt.iterGet([GEntityComponent],[c_currentEnt = {entity : ent}],function (ent) {
							untyped {
								if (comp.entity == ent) {
									id = c_currentEnt.getOwner();
								}
							}
						});
						IterateEnt.iterGet([PlayerComponent],[c_currentPlayer = {player : ply}],function (plyEnt) {
							untyped {
								if (comp.player == ply) {
									id = c_currentPlayer.getOwner();
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
					id = ComponentManager.addEntity();
					for (comp in ent.comp) {
						trace('New entity ${comp.getName()}/$id');
					}
				}
				for (comp in ent.comp) {
					components.set(comp.__uid,comp);
					if (comp is PlayerComponent) {
						final c_ply:PlayerComponent = cast comp;
						untyped c_ply.player.id = id;
					}
					ComponentManager.addComponent(comp.getCompID(),comp,id);
				}
				serverIDToClientID.set(ent.serverID,id);
			}
		}
	}
	#end

	#if client
	override function init_client() {
		HookLib.Add(ClientSignOnStateChanged,"di_csosc",(user,_,newState) -> {
			switch (newState) {
				case SIGNONSTATE_FULL:
					clnet_SendReadyToRecv.send({});
				default:
			}
		});
	}
	#end
	
	override function init_shared() {
		clnet_SendReadyToRecv = new NET_Cl<ReadyToRecv>(#if server [readyToRecv] #end);
	}

	#if server

	function readyToRecv(data:ReadyToRecv) {
		playersReadyToRecv.set(data._sentPlayer.UserID(),true);
	}

	var removeplyrs:Map<Player,Bool> = [];

	var removes:Array<CacheRemove> = [];

	function callback(x:CompRemoveSignalData<Component>) {
		if (!(x.comp is ReplicatedComponent)) {
			trace("Not a replicated component...");
			return;
		}
		final repl:ReplicatedComponent = cast x.comp;
		final compID = x.comp.getCompID();
		final plyrs = ClientReplicationMachine.replToPlayers(repl.replicated,x.ent);
		for (plyr in plyrs) {
			removeplyrs.set(plyr,true);
		}
		removes.push({
			id : x.ent,
			comp: compID,
			players: plyrs
		});
		
	}

	var queueReplComponents:Map<Int,Array<ReplicatedComponent>> = [];

	var playersReadyToRecv:Map<Int,Bool> = [];

	function onFieldsChanged(data:FieldsChangedData) {
		final plyrs = ClientReplicationMachine.replToPlayers(data.comp.replicated,data.ent);
		trace('ReplComp added to replEntity: ${Type.getClassName(Type.getClass(data.comp))} ${data.comp} ${plyrs}');
		for (plyr in plyrs) {
			queueReplComponents.get(plyr.UserID()).orGet(
			() -> {
				final arr:Array<ReplicatedComponent> = [];
				queueReplComponents.set(plyr.UserID(),arr);
				arr;
			}).push(data.comp);
		}
		if (plyrs.length == 0) {
			trace("Sent to no one...");
			data.comp.fieldsChanged = false;
		}
	}

	override function init_server() {
		for (player in PlayerLib.GetAll()) {
			playersReadyToRecv.set(player.UserID(),true);
		}
		ComponentManager.removeSignal.handle(callback);
		ReplicatedEntity.getAddSignal().handle((add) -> {
			for (compStore in ComponentManager.components_3) {
				if (compStore.has_component(add.ent)) {
					var comp = compStore.get_component(add.ent);
					if (comp is ReplicatedComponent) {
						var repl:ReplicatedComponent = comp;
						repl.fieldsChangedSig.handle(onFieldsChanged);
						if (repl.fieldsChanged) {
							onFieldsChanged({
								ent: add.ent,
								comp: comp
							});
						}
					}
				}
			}
		});
		ComponentManager.addSignal.handle((add) -> {
			if (add.comp is ReplicatedComponent) {
				if (add.ent.has_comp(ReplicatedEntity)) {
					final c_replComp:ReplicatedComponent = cast add.comp;
					c_replComp.fieldsChangedSig.handle(onFieldsChanged);
					if (c_replComp.fieldsChanged) {
						onFieldsChanged({
							ent : add.ent,
							comp: c_replComp
						});
					}
				}
			}
		});

		PlayerComponent.getAddSignal().handle((sig) -> {
			for (x in 0...ComponentManager.entities) {
				final ent:DI_ID = x;
				for (compStore in ComponentManager.components_3) {
					if (compStore.has_component(ent)) {
						final comp = compStore.get_component(ent);
						if (comp is ReplicatedComponent) {
							final replComp:ReplicatedComponent = cast comp;
							final plyrs = ClientReplicationMachine.replToPlayers(replComp.replicated,ent);
							if (plyrs.contains(sig.comp.player)) {
								onFieldsChanged({ //NOTE: this will update all the targets instead of just the one we want. Unintended concequences?
									ent : ent,
									comp : replComp
								});
							}
						}
					}
				}
			}
		});

		ComponentManager.removeEntitySignal.handle((sig) -> {
			for (x in 0...ComponentManager.entities) {
				final ent:DI_ID = x;
				for (compStore in ComponentManager.components_3) {
					if (compStore.has_component(ent)) {
						final comp = compStore.get_component(ent);
						if (comp is ReplicatedComponent) {
							final replComp:ReplicatedComponent = cast comp;
							final plyrs = ClientReplicationMachine.replToPlayers(replComp.replicated,ent);
							for (plyr in plyrs) {
								net_RemoveEntityMessage.send({
									serverID: sig.ent
								},plyr,false);
							}
						}
					}
				}
			}
		});
		
	}
	static var profile:Profiler = new Profiler();
	@:expose("profilects")
	static function profilects() {
		profile = new Profiler();
		profile.beginProfiling();
		// Profiler.beginProfiling();
	}

	function sendQueuedMessages() {
		final removes = [];
		for (user => replComps in queueReplComponents) {
			if (!playersReadyToRecv.exists(user)) continue;
			var ents:Map<Int,Net_ReplicatedEntity> = [];
			var entsreliable:Map<Int,Net_ReplicatedEntity> = [];
			var entsSize = 0;
			var entsReliableSize = 0;
			for (comp in replComps) {
				final serverID:DI_ID = comp.getOwner();
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
					targetmap.get(serverID).comp.push(comp);
				}
				comp.fieldsChanged = false;
				
			}
			final player = Gmod.Player(user);
			if (entsSize > 0) {
				net_replEntsMessage.send({replEntities: ents.array()},player,true);
			}
			if (entsReliableSize > 0) {
				net_replEntsMessage.send({replEntities: entsreliable.array()},player,false);
			}
			removes.push(user);
		}
		for (remove in removes) {
			queueReplComponents.remove(remove);
		}
	}

	function sendQueuedRemoves() {
		for (plyr in removeplyrs.keys()) {
			var remove = removes.filter((r) -> r.players.contains(plyr));
			for (remve in remove) {
				net_RemoveComponentMessage.send({
					comp: remve.comp, 
					serverID: remve.id
				},plyr);
			}
		}
		removeplyrs = [];
		removes = [];
	}

	override function run_server() {
		sendQueuedMessages();
		sendQueuedRemoves();
	}

	public function flush() {
		run_server();
	}

	

	
	#end
}
#if server

//TODO cleanup this
class ClientReplicationMachine {
	final sentArray:Map<Player,Net_ReplicatedEntitiesMessage> = [];

	final reliables:Map<Player,Net_ReplicatedEntitiesMessage> = [];

	var added:Map<Player,Array<ReplicatedComponent>> = [];

	var addedReliable:Map<Player,Array<ReplicatedComponent>> = [];
	
	public function new() {}

	public static function replToPlayers(x:ReplicatedTarget,diid:DI_ID):Array<Player> {
		var arr:Array<Player> = [];
		switch (x) {
			case NONE:
			case SOME(PVS(ent)):
				final filter = Gmod.RecipientFilter();
				filter.AddPVS(ent.GetPos());
				filter.GetPlayers().map(arr.push);
				// for (ply in filter.GetPlayers()) {
				// 	if (ply.IsBot()) continue;
				// 	arr.push(ply);
				// }
			case SOME(PLAYERS(a)):
				arr = a;
			case SOME(INFECTED):
				IterateEnt.iterGet([InfectedComponent,PlayerComponent],[_,{player : ply}],function () {
					arr.push(ply);
				});
			case SOME(CURRENT_PLAYER):
				
				final ply = diid.get_2(PlayerComponent);
				if (ply != null) {
					arr.push(ply.player);
				} else {
					// throw "Not attatched to a player!";
				}

			case ALL:
				for (ply in PlayerLib.GetHumans()) {
					arr.push(ply);
				}
			case MASTER(target):
				arr = replToPlayers(target.replicated,diid);
		}
		return arr;
	}

	
	
}
#end
