package deceptinfect.ecswip;

import deceptinfect.game.ClientTranslateSystem;
import deceptinfect.macros.ClassToID;
import haxe.ds.ObjectMap;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.Component;

typedef ComponentArray = Array<ComponentState<Component>>;
typedef SComponentArray<T:Component> = Array<ComponentState<T>>;

typedef SCompAddSignal = {
	ent:DI_ID,
	comp:Component
}

typedef CompAddSignal<T:Component> = {
	ent:DI_ID,
	comp:T
}

abstract ComponentID<T:Component>(Int) from Int to Int {
	// extern inline function new<T:Component>(int:Int,x:Class<T>) {
	// 	this = int;
	// }
}

class ComponentManager {
	public static var components_2(default, null):Array<ComponentArray>;

	public static var componentSignals(default, null):Array<SignalTrigger<SCompAddSignal>> = [];

	public static var entities:Entities = 0; // default,null

	public static var activeEntities(default, null):Int = 0;

	public static var lookupEntity(default, null):Map<Component, DI_ID> = [];

	public static var gEntityLookup(default, null):Map<DI_ID, GEntCompat> = [];

	// TODO move
	public static function addGEnt(x:GEntCompat):DI_ID {
		var id = addEntity();
		addComponent(GEntityComponent.compID, new GEntityComponent(x), id);
		addComponent(VirtualPosition.compID, new VirtualPosition(ENT(x)), id);
		return id;
	}

	public static function addPlayer(x:GPlayerCompat):DI_ID {
		var id = addGEnt(cast x);
		addComponent(PlayerComponent.compID, new PlayerComponent(x), id);
		PlayerManager.addID(x, id);
		return id;
	}

	static var lastID:Int;

	public static function initComponent(id:Int) {
		if (components_2 == null)
			components_2 = [];
		if (lastID == null)
			lastID = 0;
		if (id > lastID) {
			for (i in lastID...id + 1) {
				components_2[i] = [];
			}
			lastID = id;
		}
	}

	public static inline function getComponentForID<T:Component>(id:ComponentID<T>, diID:DI_ID):ComponentState<T> {
		return cast components_2[id][diID];
	}

	public static inline function addComponent<T:Component>(id:ComponentID<T>, x:T, to:DI_ID) {
		components_2[id][to] = Comp(x);
		lookupEntity.set(x, to);
		return x;
	}

	public static inline function getIDFromComponent(comp:Component):DI_ID {
		return lookupEntity.get(comp);
	}

	public static function getCreateSignal<T:Component>(cls:ComponentID<T>):Signal<CompAddSignal<T>> {
		var sigtrig = componentSignals[cls];
		if (sigtrig == null) {
			sigtrig = new SignalTrigger();
			componentSignals[cls] = sigtrig;
		}
		return cast sigtrig.asSignal();
	}

	public static function getComponentForIDSure<T:Component>(id:ComponentID<T>, diID:DI_ID):T {
		final comp:T = cast components_2[id][diID].getParameters()[0];
		if (comp == null) {
			throw "Component did not exist at sure statement!";
		}
		return comp;
	}

	@:privateAccess(deceptinfect.ecswip.Component)
	public static function removeComponent<T:Component>(id:ComponentID<T>, diID:DI_ID) {
		return components_2[id][diID] = removing(components_2[id][diID]);
	}

	inline static function removing(x:ComponentState<Component>) {
		return switch (x) {
			case Comp(comp):
				comp.onRemove();
				ComponentState.NONE;
			case non = NONE:
				non;
		}
	}

	public static function removeEntity(x:DI_ID) {
		#if server
		switch (getSystem2(ClientTranslateSystem)) {
			case Some(clientTranslate):
				clientTranslate.removeEntity(x);
			default:
		}
		#end
		for (component in components_2) {
			component[x] = removing(component[x]);
		}
		activeEntities--;
	}

	public static function addToAllCompArrays(x:DI_ID) {
		for (compArray in components_2) {
			compArray[x] = NONE;
		}
	}

	public static function addEntity():DI_ID {
		final id = entities++;
		activeEntities++;
		addToAllCompArrays(id);
		return id;
	}
}

@:forward
abstract Entities(Int) from Int to Int {}

// class DI_ID_Iterator {
//     var current:Int;
//     public extern inline function new() {
// 	current = 0;
//     }
//     public inline function hasNext() {
// 	return current < (ComponentManager.entities : Int);
//     }
//     public extern inline function next() {
// 	return (current++ : DI_ID);
//     }
// }
// @:using(deceptinfect.ecswip.ComponentFamily)

@:using(deceptinfect.macros.ClassToID.DI_ID_Use)
abstract DI_ID(Int) from Int to Int {
	// public extern inline function get<T:Component>(x:Class<T>):ComponentState<T> {
	//     return ComponentManager.getComponentForID(x,this);
	// }
	// public inline function get_sure<T:Component>(x:Class<T>):T {
	//     var retrieve_comp = ComponentManager.getOldComponentForID(x,this).getParameters()[0];
	//     if (retrieve_comp == null) {throw 'Component does not exist at sure statement ${Type.getClassName(x)}';}
	//     return retrieve_comp;
	// }
	// public extern inline function add_component<T:Component>(x:T) {
	//     ComponentManager.addComponent(x,this);
	// }
	public extern inline function destroy() {}

	// public extern inline function getOrAdd<T:Component>(x:Class<T>,?args:Array<Dynamic>):T {
	//     return ComponentManager.getOrAdd(this,x,args);
	// }
	// public extern inline function remove_component<T:Component>(x:Class<T>) {
	//     ComponentManager.removeComponent(x,this);
	// }

	inline function new(x:Int) {
		this = x;
	}
}

class ComponentTools {
	public static function sure<T:Component>(x:ComponentState<T>):T {
		return switch (x) {
			case Comp(comp):
				comp;
			default:
				throw "Component not avaliable...";
		}
	}
}

@:using(deceptinfect.ecswip.ComponentManager.ComponentTools)
enum ComponentState<T:Component> {
	NONE;
	Comp(comp:T);
}

enum HasGEnt {
	NONE;
	GEnt(e:GEntCompat);
}
