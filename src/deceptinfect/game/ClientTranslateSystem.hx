package deceptinfect.game;

import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.ReplicatedEntity;
import deceptinfect.macros.IterateEnt2;
import deceptinfect.macros.ClassToID;
import hxbit.StructSerializable;
import hxbit.Schema;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.ecswip.SystemManager;
import hxbit.Serializable;
import hxbit.Serializer;

using Lambda;
using Safety;
using gmod.helpers.WeakTools;


@:structInit
class Net_ReplicatedEntity implements hxbit.Serializable {
	@:s public var comp:Array<ReplicatedComponent> = [];

	@:s public var serverID:Int;
}

@:structInit
class Net_UpdateServerEnt implements hxbit.Serializable {

	@:s public var replEntities:Array<Net_ReplicatedEntity>;
	
}

#if client
enum ClientClasses {
	Player;
	Entity;
	Other;
}
#end

class ClientTranslateSystem extends System {

	@:keep
	static final net_updateServerEnt = new NET_Sv<Net_UpdateServerEnt>(#if client [updateEnt] #end);

	//clear?

	#if client

	static final serverIDToClientID:Map<Int,DI_ID> = [];

	static final components:Map<Int,Component> = componentsC();

	public static function componentsC() {
		final comp:Map<Int,Component> = [];
		
		return comp;
	}

	//TODO make it more efficient, use move instead of copy...
	public static function updateEnt(x:Net_UpdateServerEnt) {
		trace("uh huh");
		for (ent in x.replEntities) {
			// trace(ent);
			// trace(ent);
			final clientID = serverIDToClientID.get(ent.serverID);
			if (clientID != null) {
				for (comp in ent.comp) {
					final other = components.get(comp.__uid);
					if (!components.exists(comp.__uid)) {
						components.set(comp.__uid,comp);
						ComponentManager.addComponent(comp.getCompID(),comp,clientID);
					}
					for (field in Reflect.fields(comp)) {
						Reflect.setField(other,field,Reflect.field(comp,field));
						// trace(field);
					}

					trace('$comp $other');
				}
			} else {
				var id = null;
				for (comp in ent.comp) {
					final compClass = Type.getClass(comp);
					if (compClass == PlayerComponent || compClass == GEntityComponent) {
						IterateEnt2.iterGet([GEntityComponent],[c_currentEnt = {entity : ent}],function (ent) {
							untyped {
								if (comp.entity == ent) {
									id = c_currentEnt.getOwner();
								}
							}
						});
						IterateEnt2.iterGet([PlayerComponent],[c_currentPlayer = {player : ply}],function (plyEnt) {
							untyped {
								if (comp.player == ply) {
									id = c_currentPlayer.getOwner();
								}
							}
						});
					}
				}
				if (id == null) id = ComponentManager.addEntity();
				
				// final id = ComponentManager.addEntity();
				// for (comp in )

				for (comp in ent.comp) {
					
					components.set(comp.__uid,comp);
					ComponentManager.addComponent(comp.getCompID(),comp,id);
				}
				serverIDToClientID.set(ent.serverID,id);
				
			}
		}
	}
	#end

	#if server

	// public function sendOnce(target:ReplicateTargets,x:DI_ID) {
		
	// }

	public function setReplicate(comp:ReplicatedComponent,target:ReplicatedTarget) {
		final owner = comp.getOwner();
		final repl = owner.getOrAdd(ReplicatedEntity);
		if (target == NONE) {
			repl.ids.remove(comp.getCompID());
		} else {
			repl.ids.set(comp.getCompID(),true);
		}
		
	}

	public function enqueueComponent(comp:ReplicatedComponent,target:ReplicatedTarget,?unreliable:Bool=false) {
		if (target == NONE) throw "What's the next step of your master plan..?";
		final owner = comp.getOwner();
		final repl = owner.getOrAdd(ReplicateOnce);
		comp.unreliable = unreliable;
		repl.ids.set(comp.getCompID(),true);
		
	}

	override function init_server() {
		
	}

	override function run_server() {
		final cr = new ClientReplicationMachine();
		final unreliables = cr.iterate();
		final reliables = cr.iterateSendOnce();
		for (ply => result in unreliables) {
			net_updateServerEnt.send(result,ply,true);
		}
		for (ply => result in reliables) {
			net_updateServerEnt.send(result,ply,false);
		}
	}

	
	#end
}
#if server
class ClientReplicationMachine {
	final sentArray:Map<Player,Net_UpdateServerEnt> = [];

	final reliables:Map<Player,Net_UpdateServerEnt> = [];

	var added:Map<Player,Array<ReplicatedComponent>> = [];

	var addedReliable:Map<Player,Array<ReplicatedComponent>> = [];
	
	public function new() {}

	inline static function replToPlayers(x:ReplicatedTarget,diid:DI_ID):Array<Player> {
		var arr:Array<Player> = [];
		switch (x) {
			case NONE:
			case SOME(PVS(ent)):
				final filter = Gmod.RecipientFilter();
				filter.AddPVS(ent.GetPos());
				for (ply in filter.GetPlayers()) {
					if (ply.IsBot()) continue;
					arr.push(ply);
				}
			case SOME(PLAYERS(a)):
				arr = a;
			case SOME(INFECTED):
				IterateEnt2.iterGet([InfectedComponent,PlayerComponent],[_,{player : ply}],function () {
					arr.push(ply);
				});
			case SOME(CURRENT_PLAYER):
				final ply = diid.get_2(PlayerComponent);
				if (ply != null) {
					arr.push(ply.player);
				} else {
					throw "Not attatched to a player!";
				}
			case ALL:
				for (ply in PlayerLib.GetHumans()) {
					arr.push(ply);
				}

		}
		return arr;
	}

	public function iterate():Map<Player,Net_UpdateServerEnt> {
		IterateEnt2.iterGet([ReplicatedEntity],[{ids : arr}],
			function (ent) {
				added = [];
				for (compStore in ComponentManager.components_3) {
					if (compStore.has_component(ent)) {
						var comp = compStore.get_component(ent);
						if (comp is ReplicatedComponent) {
							var repl:ReplicatedComponent = comp;
							if (!repl.fieldsChanged) continue;
							repl.fieldsChanged = false;
							final players = replToPlayers(repl.replicated,ent);
							for (ply in players) {
								trace('sending to $ply');
								addToArray(ply,repl);
							}
						}
					}
				}
				// for (compID in arr.keys()) {
				// 	final repl:ReplicatedComponent = deceptinfect.ecswip.ComponentManager.components_3[compID].get_component(ent);
				// 	if (repl == null) {trace('${ComponentManager.components_3.getName(compID)} missing on ${ent}'); continue;}
				// 	if (!repl.fieldsChanged) continue;
					
				// 	repl.fieldsChanged = false;
				// 	final players = replToPlayers(repl.replicated,ent);
				// 	for (ply in players) {
				// 		addToArray(ply,repl);
				// 	}
				// }
				for (ply => arr in added) {
					final replEntities = sentArray.get(ply).orGet(() -> {final x:Net_UpdateServerEnt = {replEntities : []}; sentArray.set(ply,x); x;}).replEntities;
					replEntities.push({
						comp: arr,
						serverID: ent
					});
				}
			});
		return sentArray;
	}

	public function iterateSendOnce() {
		IterateEnt2.iterGet([ReplicateOnce],[{ids : arr}],
		function (ent) {
			added = [];
			addedReliable = [];
			for (compStore in ComponentManager.components_3) {
				if (compStore.has_component(ent)) {
					var comp = compStore.get_component(ent);
					if (comp is ReplicatedComponent) {
						var repl:ReplicatedComponent = comp;
						if (!repl.fieldsChanged) continue;
						repl.fieldsChanged = false;
						final players = replToPlayers(repl.replicated,ent);
						for (ply in players) {
							if (repl.unreliable) {
								addToArray(ply,repl);

							} else {
								addToReliable(ply,repl);
							}
						}
					}
				}
			}
			// for (compID in arr.keys()) {
			// 	final repl:ReplicatedComponent = deceptinfect.ecswip.ComponentManager.components_3[compID].get_component(ent);
			// 	final players = replToPlayers(repl.replicated,ent);
			// 	for (ply in players) {
			// 		if (repl.unreliable) {
			// 			addToArray(ply,repl);
			// 		} else {
			// 			addToReliable(ply,repl);
			// 		}
			// 	}	
			// }
			for (ply => arr in added) {
				final replEntities = sentArray.get(ply).orGet(() -> {final x:Net_UpdateServerEnt = {replEntities : []}; sentArray.set(ply,x); x;}).replEntities;
				replEntities.push({
					comp: arr,
					serverID: ent
				});
			}
			for (ply => arr in addedReliable) {
				final replEntities = reliables.get(ply).orGet(() -> {final x:Net_UpdateServerEnt = {replEntities : []}; reliables.set(ply,x); x;}).replEntities;
				replEntities.push({
					comp: arr,
					serverID: ent
				});
			}
			ent.remove_component(ReplicateOnce);
		});
		return reliables;
	}

	inline function addToArray(ply:Player,comp:ReplicatedComponent) {
		final arr = added.get(ply);
		if (arr != null) {
			arr.push(comp);
		} else {
			added.set(ply,[comp]);
		}
	}

	inline function addToReliable(ply:Player,comp:ReplicatedComponent) { 
		final arr = addedReliable.get(ply);
		if (arr != null) {
			arr.push(comp);
		} else {
			addedReliable.set(ply,[comp]);
		}
	}
}
#end
// abstract ServerID(DI_ID) from Int to Int {
// 	#if client
// 	@:to
// 	public function toID():DI_ID {
// 		return SystemManager.getSystem(ClientTranslateSystem).getID(cast this);
// 	}
// 	#end

// 	#if server
// 	public static function mapTo(id:DI_ID, player:Player):ServerID {
// 		final arr = SystemManager.getSystem(ClientTranslateSystem).idToPlayer.get(id).or([]);
// 		arr.set(player, true);
// 		return cast id;
// 	}
// 	#end
// }
