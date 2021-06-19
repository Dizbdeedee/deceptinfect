package deceptinfect.game;

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

class ClientTranslateSystem extends System {

    static final net_removeClientEnt = new gmod.net.NET_Server<"di_removeclientent",{id : Int}>();

    static final net_removeClientEnt2 = new gmod.net.hxbit.NET_Server<"di_removeclientEnt",Net_RemoveClientEnt>();

    // public final map
    #if client
    public final mapID:Map<ServerID,DI_ID> = [];

    public function getID(servID:ServerID) {
	final ent = mapID.get(servID);
	return if (ent == null) {
	    final id = ComponentManager.addEntity();
	    mapID.set(servID,id);
	    id;
	} else {
	    ent;
	}
    }

    override function init_client() {
	net_removeClientEnt.signal.handle((remove:{id : Int}) -> {
	    ComponentManager.removeEntity(remove.id);
	});
	
    }

    #end

    #if server
    public final idToPlayer:Map<DI_ID,Map<Player,Bool>> = [];

    /**
       Remove the clientside representation for this entity. Does not remove server representation.
    **/
    function removeEntityForClient(client:Player,id:DI_ID) {

	net_removeClientEnt2.send(new Net_RemoveClientEnt(5),client); 
	net_removeClientEnt.send({id : id},client);
    }

    public function removeEntity(id:DI_ID) {
	for (idMap in idToPlayer) {
	    for (player in idMap.keys()) {
		removeEntityForClient(player,id);
	    }
	}
    }

    #end
    
}

abstract ServerID(DI_ID) from Int to Int {

    #if client
    @:to
    public function toID():DI_ID {
	
	return getSystem(ClientTranslateSystem).getID(cast this); 
    }
    #end

    #if server
    public static function mapTo(id:DI_ID,player:Player):ServerID {
	final arr = getSystem(ClientTranslateSystem).idToPlayer.get(id).or([]);
	arr.set(player,true);
	return cast id;
    }
    #end
    
}

