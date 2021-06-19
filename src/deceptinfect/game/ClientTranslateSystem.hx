package deceptinfect.game;

import deceptinfect.macros.ClassToID;
import hxbit.StructSerializable;
import hxbit.Schema;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.ecswip.SystemManager;
import hxbit.Serializable;
import hxbit.Serializer;

using Lambda;
using Safety;

class Net_RemoveClientEnt implements hxbit.Serializable {
	@:s public var who:Int;

	public function new(who:Int) {
		who = 5;
	}
}
class ClientComponent extends Component implements hxbit.Serializable {
	public var who:Int = 5;

	
}

@:keep
class TestComponent extends ClientComponent {
	@:s public var test:Int = 10;

	public function new(x:Int) {
		super();
		test = x;
	}


}


@:keep
class Net_NewServerEnt implements hxbit.Serializable {

	@:s public var initalComponents:Array<ClientComponent>;

	@:s public var serverID:Int;

	public function new(arr:Array<ClientComponent>,serverID:Int) {
		initalComponents = arr;
		this.serverID = serverID;
	}

	
}

class Net_UpdateServerEnt implements hxbit.Serializable {

	@:s public var comp:ClientComponent;

}

class Net_ClearServerEnt implements hxbit.Serializable {

	@:s public var serverID:Int;
}


class ClientTranslateSystem extends System {

	@:keep
	static final net_newServerEnt = new NET_Sv<Net_NewServerEnt>(#if client [newEnt] #end);

	static final net_updateServerEnt = new NET_Sv<Net_UpdateServerEnt>(#if client [updateEnt] #end);

	static final net_clearServerEnt = new NET_Sv<Net_ClearServerEnt>(#if client [clearEnt] #end);

	#if client

	static final serverIDToClientID:Map<Int,DI_ID> = [];

	static final components:Map<Int,Component> = [];

	public static function newEnt(x:Net_NewServerEnt) {
		final id = ComponentManager.addEntity();
		for (comp in x.initalComponents) {
			id.add_component(comp);
			components.set(comp.__uid,comp);
		}
		serverIDToClientID.set(id,x.serverID);
	}

	public static function clearEnt(x:Net_ClearServerEnt) {
		final clientID = serverIDToClientID.get(x.serverID);
		ComponentManager.removeEntity(clientID);
	}

	//TODO make it more efficient, use move instead of copy...
	public static function updateEnt(x:Net_UpdateServerEnt) {
		final comp = components.get(x.comp.__uid);
		for (field in Reflect.fields(x.comp)) {
			Reflect.setField(comp,field,Reflect.field(x.comp,field));
		}

	}
	#end

	#if server


	override function run_server() {
				
	}

	
	#end
}

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
