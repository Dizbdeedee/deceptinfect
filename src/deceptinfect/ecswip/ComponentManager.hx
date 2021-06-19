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

	}

	public function init_entity(x:DI_ID,comp:Component) {
		final int_id = n++;
		external[x] = int_id;
		internal[int_id] = x;
		components[int_id] = comp;
	}

	public function remove_entity_comp(x:DI_ID) {
		if (!has_component(x)) {
			return;
		}
		final last_index = --n;
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

	// public var external(get,set):LuaArray<Int>;

	@:op([])
	function get(x:Int):Component_<Dynamic>;
	@:op([])
	function set(x:Int,v:Component_<Dynamic>):Component_<Dynamic>;

	public extern inline function get_component<T:Component>(x:ComponentID<T>):Component_<T> {
		return cast this[x];
	}

	public extern inline function initComponent(id:Int) {
		this[id] = new Component_();
	}

}



class ComponentManager {

	public static var components_3(default,null):ComponentStorage;

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

	public static function initComponent(id:Int,str:String) {
		if (components_3 == null) {
			components_3 = new ComponentStorage();
		}
		components_3.initComponent(id);
	}
	
	/**
		. **Deprecated**
	**/
	public static inline function getComponentForID<T:Component>(id:ComponentID<T>, diID:DI_ID):ComponentState<T> {
		return switch (components_3[id].has_component(diID)) {
			case false:
				NONE;
			case true:
				Comp(components_3[id].get_component(diID));
		}
	}


	public static inline function addComponent<T:Component>(id:ComponentID<T>, x:T, to:DI_ID) {
		components_3[id].init_entity(to,x);
		lookupEntity.set(x, to);
		return x;
	}

	public static inline function getIDFromComponent(comp:Component):DI_ID {
		return lookupEntity.get(comp);
	}

	public static inline function has_component(id:ComponentID<Dynamic>, diID:DI_ID):Bool {
		return components_3[id].external[diID] != null;

	}

	public static function getCreateSignal<T:Component>(cls:ComponentID<T>):Signal<CompAddSignal<T>> {
		var sigtrig = componentSignals[cls];
		if (sigtrig == null) {
			sigtrig = new SignalTrigger();
			componentSignals[cls] = sigtrig;
		}
		return cast sigtrig.asSignal();
	}

	/** What... Depercated**/
	public static function getComponentForIDSure<T:Component>(id:ComponentID<T>, diID:DI_ID):T {
		
		final fam = components_3.get_component(id);
		if (!fam.has_component(diID)) throw "Component did not exist at sure statement!";
		return fam.get_component(diID);
	}

	@:privateAccess(deceptinfect.ecswip.Component)
	/**
		Deprecated
	**/
	public static function removeComponent<T:Component>(id:ComponentID<T>, diID:DI_ID) {
		removing(cast getComponentForID(id, diID)); //we don't use this anyway...
		components_3[id].remove_entity_comp(diID);	
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
		for (component in components_3) {
			if (component.has_component(x)) {
				component.remove_entity_comp(x);
			}
		}
		activeEntities--;
	}

	public static function addEntity():DI_ID {
		final id = entities++;
		activeEntities++;
		return id;
	}

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
