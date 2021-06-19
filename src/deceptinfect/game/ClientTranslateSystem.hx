package deceptinfect.game;

import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.infection.InfectedComponent;
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


@:structInit
class Net_ReplicatedEntity implements hxbit.Serializable {
	@:s public var comp:Array<ReplicatedComponent> = [];

	@:s public var serverID:Int;
}

@:structInit
class Net_UpdateServerEnt implements hxbit.Serializable {

	@:s public var replEntities:Array<Net_ReplicatedEntity>;
	
}

class ClientTranslateSystem extends System {

	@:keep
	static final net_updateServerEnt = new NET_Sv<Net_UpdateServerEnt>(#if client [updateEnt] #end);

	//clear?

	#if client

	static final serverIDToClientID:Map<Int,DI_ID> = [];

	static final components:Map<Int,Component> = [];

	//TODO make it more efficient, use move instead of copy...
	public static function updateEnt(x:Net_UpdateServerEnt) {
		for (ent in x.replEntities) {
			// trace(ent);
			final clientID = serverIDToClientID.get(ent.serverID);
			if (clientID != null) {
				for (comp in ent.comp) {
					final other = components.get(comp.__uid);
					for (field in Reflect.fields(comp)) {
						Reflect.setField(other,field,Reflect.field(comp,field));
						trace(field);
					}
					// trace('$comp $other');
				}
			} else {
				final id = ComponentManager.addEntity();
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

	public function setReplicate(owner:DI_ID,comp:ReplicatedComponent,target:ReplicatedTarget) {
		final repl = new ReplicatedEntity();
		owner.add_component(repl)
	}

	public function enqueueComponent(owner:DI_ID,comp:ReplicatedComponent,target:ReplicatedTarget) {
		final repl = new ReplicateOnce();
		owner.add_component(repl);
		repl.ids.

		
		// final queueArr = queue.get(owner).orGet(() -> {var x = []; queue.set(owner,x); x;});
		// queueArr.push({component: comp,repl: target});
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

	function reset() {

	}

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
		reset();
		IterateEnt2.iterGet([ReplicatedEntity],[{ids : arr}],
			function (ent) {
				added = [];
				for (compID in arr.keys()) {
					final repl:ReplicatedComponent = deceptinfect.ecswip.ComponentManager.components_3[compID].get_component(ent);
					final players = replToPlayers(repl.replicated,ent);
					for (ply in players) {
						addToArray(ply,repl);
					}
				}
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
			for (compID in arr.keys()) {
				final repl:ReplicatedComponent = deceptinfect.ecswip.ComponentManager.components_3[compID].get_component(ent);
				final players = replToPlayers(repl.replicated,ent);
				for (ply in players) {
					if (repl.unreliable) {
						addToArray(ply,repl);
					} else {
						addToReliable(ply,repl);
					}
				}	
			}
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
