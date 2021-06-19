package deceptinfect.ecswip;

using gmod.helpers.LuaArray;
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

@:transitive
abstract ComponentID<T:Component>(Int) from Int to Int {
	// extern inline function new<T:Component>(int:Int,x:Class<T>) {
	// 	this = int;
	// }
}


abstract Component_<T:Component>(LuaArray<Dynamic>) {

	public var external(get,set):LuaArray<Int>;

	public var internal(get,set):LuaArray<Int>;

	public var components(get,set):LuaArray<Component>;

	public var n(get,set):Int;

	// var n_entities(get,set):Int;

	inline function get_external() {
		return this[1];
	}
	inline function get_internal() {
		return this[2];
	}
	inline function get_components() {
		return this[3];
	}
	inline function get_n() {
		return this[4];
	}
	inline function get_n_entities() {
		return this[5];
	}

	inline function set_external(x:LuaArray<Int>) {
		return this[1] = x;
	}
	inline function set_internal(x:LuaArray<Int>) {
		return this[2] = x;
	}
	inline function set_components(x:LuaArray<Component>) {
		return this[3] = x;
	}
	inline function set_n(x:Int) {
		return this[4] = x;
	}
	inline function set_n_entities(x:Int) {
		return this[5] = x;
	}

	

	public function new() {
		this = new LuaArray();
		external = new LuaArray();
		internal = new LuaArray();
		components = new LuaArray();
		n = 1;
		// n_entities = 0;

	}

	public function init_entity(x:DI_ID,comp:Component) {
		final int_id = n++;
		external[x] = int_id;
		internal[int_id] = x;
		components[int_id] = comp;
	}

	public function remove_entity_comp(x:DI_ID) {
		final last_index = n--;
		final int_id = external[x];
		final last_ent_id = internal[last_index];
		internal[int_id] = internal[last_index];
		components[int_id] = components[last_index];
		external[last_ent_id] = int_id;
		external[x] = null;
	}

	public inline function has_component(x:DI_ID) {
		return external[x] != null;
	}

	public inline function get_component(x:DI_ID):T {
		return cast components[external[x]];
	}

}

@:forward
abstract ComponentStorage(LuaArray<Component_<Dynamic>>) {

	public function new() {
		this = new LuaArray();
	}

	@:op([])
	function get(x:Int):Component_<Dynamic>;
	@:op([])
	function set(x:Int,v:Component_<Dynamic>):Component_<Dynamic>;

	// @:op([])
	// function get_<T:Component>(x:ComponentID<T>):Component_<T> {
	// 	return cast this[x];
	// }
	// @:op([])
	// function set_<T:Component>(x:ComponentID<T>,v:Component_<T>):Component_<T> {
	// 	return cast this[x] = v;
	// }


	public inline function get_component<T:Component>(x:ComponentID<T>):Component_<T> {
		return cast this[x];
	}

	
	public function initComponent(id:Int) {
		this[id] = new Component_();
	}

	public function getFamily(family:Array<Int>) {
		// var lowest = Math.POSITIVE_INFINITY;
		// var lowest_comps = null;
		// for (fam in family) {
		// 	final comps = this[fam];
		// 	if (comps.n < lowest) {
		// 		lowest = comps.n;
		// 		lowest_comps = comps;
		// 	}
		// }
		// final comp1 = this[1];
		// for (int_id in 1...lowest_comps.n) {
		// 	final di_id:DI_ID = lowest_comps.internal[int_id];
		// 	// final comp_lowest = lowest_comps.components[int_id];
		// 	if (comp1.has_component(di_id) && comp2.has_component(di_id) && comp3.has_component(di_id)) {

		// 	}
		// }
	}

	
}

class ComponentManager {

	public static var components_3(default,null):ComponentStorage;

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
			default:
				x;
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

	// public static function addEntity3():DI_ID {
	// 	com
	// }

	// public static function initComponent3(id:Int) { 
		
	// }
}

abstract Entities(Int) from Int to Int {
    public extern inline function iterator():Iterator<DI_ID> {
        return new IntIterator(0,this);
    }
}


@:using(deceptinfect.macros.ClassToID.DI_ID_Use)
abstract DI_ID(Int) from Int to Int {
	
	public extern inline function destroy() {}

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
