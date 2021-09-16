package deceptinfect.ecswip;

import lua.Lua;
import deceptinfect.ecswip.ReplicatedComponent;
using gmod.helpers.LuaArray;
import deceptinfect.game.ClientTranslateSystem;
import deceptinfect.macros.ClassToID;
import haxe.ds.ObjectMap;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.SystemManager.getSystem2;
using gmod.helpers.WeakTools;

typedef ComponentArray = Array<ComponentState<Component>>;
typedef CompAddSignalData<T:Component> = {
	ent:DI_ID,
	comp:T
}

typedef CompRemoveSignalData<T:Component> = {
	ent:DI_ID,
	comp:T 
}

typedef RemoveSignalAll = {
	ent:DI_ID,
	comp:Component,
	compID:ComponentID<Component> 
}

typedef RemoveEntitySignalData = {
	ent:DI_ID,
}


@:transitive
abstract ComponentID<T:Component>(Int) from Int to Int {
	@:to
	public function toString():String {
		return ComponentManager.components_3.getName(this);
	}
}


abstract Component_<T:Component>(LuaArray<Dynamic>) {

	public var external(get,set):LuaArray<Int>;

	public var internal(get,set):LuaArray<Int>;

	public var components(get,set):LuaArray<Component>;

	public var signalAdd(get,set):SignalTrigger<CompAddSignalData<Component>>;

	public var signalRemove(get,set):SignalTrigger<CompRemoveSignalData<Component>>;

	public var n(get,set):Int;

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

	inline function get_signalAdd() {
		return this[6];
	}

	inline function get_signalRemove() {
		return this[7];
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
	inline function set_signalAdd(x:Signal<Dynamic>) {
		return this[6] = x;
	}
	inline function set_signalRemove(x:Signal<Dynamic>) {
		return this[7] = x;
	}


	public function new() {
		this = new LuaArray();
		external = new LuaArray();
		internal = new LuaArray();
		components = new LuaArray();
		signalAdd = new SignalTrigger();
		signalRemove = new SignalTrigger();
		n = 1;
	}

	public inline function get_active():Int {
		return n - 1;
	}

	public inline function getAddSignal():Signal<CompAddSignalData<T>> {
		return cast signalAdd.asSignal();
	}

	public inline function getRemoveSignal():Signal<CompRemoveSignalData<T>> {
		return cast signalRemove.asSignal();
	}

	public function init_entity(x:DI_ID,comp:Component) {
		final int_id = n++;
		external[x] = int_id;
		internal[int_id] = x;
		components[int_id] = comp;
		signalAdd.trigger({ent: x, comp: comp});
	}

	public function set_component(x:DI_ID,comp:Component) {
		components[external[x]] = comp;
		signalAdd.trigger({ent: x, comp: comp});
	}

	public function remove_entity_comp(x:DI_ID) {
		if (!has_component(x)) {
			return;
		}
		signalRemove.trigger({ent: x, comp: components[external[x]]});
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
abstract ComponentStorage(lua.Table<Int,Component_<Dynamic>>) to lua.Table<Int,Component_<Dynamic>> {

	public function new() {
		this = new LuaArray();

	}

	@:op([])
	function get(x:Int):Component_<Dynamic>;
	@:op([])
	function set(x:Int,v:Component_<Dynamic>):Component_<Dynamic>;

	public extern inline function get_component<T:Component>(x:ComponentID<T>):Component_<T> {
		return cast this[x];
	}

	public extern inline function initComponent(id:Int,str) {
		this[id] = new Component_();
	}

	public extern inline function getName(id:Int) {
		return ComponentManager.componentsName.get(id); //ARGH
	}

}



//TODO... why are these public again...?
class ComponentManager {

	public static var components_3(default,null):ComponentStorage;

	public static var componentsName(default,null):Map<Int,String>;

	public static var entities:Entities = 0; // default,null

	public static var activeEntities(default, null):Int = 0;

	public static var lookupEntity(default, null):Map<Component, DI_ID> = lookupEntityC();

	public static var gEntityLookup(default, null):Map<DI_ID, GEntCompat> = [];


	//FIXME... this almost certainly keeps things around after system death... we need to clear signals when we remake systems.

	static final removeSignalTrig:SignalTrigger<CompRemoveSignalData<Component>> = new SignalTrigger();

	static final removeEntityTrig:SignalTrigger<RemoveEntitySignalData> = new SignalTrigger();

	public static final removeSignal:Signal<CompRemoveSignalData<Component>> = removeSignalTrig.asSignal();

	static final addSignalTrig:SignalTrigger<CompAddSignalData<Component>> = new SignalTrigger();

	public static final addSignal:Signal<CompAddSignalData<Component>> = addSignalTrig.asSignal();

	public static final removeEntitySignal:Signal<RemoveEntitySignalData> = removeEntityTrig.asSignal();


	//can't this just be a component variable... ? NUMPTY
	static function lookupEntityC() {
		var map:Map<Component,DI_ID> = [];
		map.setWeakKeysM();
		return map;
	}

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

	public static function initComponent(id:Int,str:String) {
		if (components_3 == null) {
			components_3 = new ComponentStorage();
		}
		if (componentsName == null) componentsName = new Map();
		componentsName.set(id,str);
		components_3.initComponent(id,str);
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

	/**
		Updated
	**/
	public static inline function getComponent<T:Component>(id:ComponentID<T>,diid:DI_ID):T {
		final fam = components_3.get_component(id);
		return if (!fam.has_component(diid))
			null;
		else {
			fam.get_component(diid);
		}
	}

	public static function addComponent<T:Component>(id:ComponentID<T>, x:T, to:DI_ID) {
		final fam = components_3.get_component(id);
		lookupEntity.set(x, to);
		if (!fam.has_component(to)) { //nocheckin check
			addSignalTrig.trigger({ent: to, comp: x});
			fam.init_entity(to,x);
		} else {
			fam.set_component(to,x);
		}
		return x;
	}

	public static inline function getIDFromComponent(comp:Component):DI_ID {
		return lookupEntity.get(comp);
	}

	public static inline function has_component(id:ComponentID<Dynamic>, diID:DI_ID):Bool {
		return components_3[id].external[diID] != null;

	}

	public static inline function getAddSignal<T:Component>(cls:ComponentID<T>):Signal<CompAddSignalData<T>> {
		return components_3.get_component(cls).getAddSignal();
		
	}

	public static inline function getRemoveSignal<T:Component>(cls:ComponentID<T>):Signal<CompRemoveSignalData<T>> {
		return components_3.get_component(cls).getRemoveSignal();

	}

	
	public static function getComponentForIDSure<T:Component>(id:ComponentID<T>, diID:DI_ID):T {
		#if !final
		final fam = components_3.get_component(id);
		if (!fam.has_component(diID)) throw "Component did not exist at sure statement!";
		return fam.get_component(diID);
		#else
		return fam.get_component(diID);
		#end
	}

	public static function removeComponent<T:Component>(id:ComponentID<T>, diID:DI_ID) {
		if (!components_3[id].has_component(diID)) {
			return;
		}
		removeSignalTrig.trigger({
			ent: diID,
			comp: components_3[id].get_component(diID)
		});
		components_3[id].remove_entity_comp(diID);	
	}


	public static function removeEntity(x:DI_ID) {
		removeEntityTrig.trigger({
			ent : x
		});
		for (id in PairTools.keys(components_3)) {
			removeComponent(id,x);
		}
		activeEntities--;
	}

	public static function addEntity():DI_ID {
		final id = entities++;
		activeEntities++;
		return id;
	}
	
	@:expose("COMP_NAME")
	static function getComponentName(id) {
		return componentsName.get(id);
	}


	@:expose("Trace")
	static function traceEnts() {
		var finalOut = new StringBuf();
		for (id in 0...1000) {
			var hasComp = false;
			var output = new StringBuf();
			output.add('ID: $id\n');
			for (ind => comp in components_3) {
				if (comp.has_component(id)) {
					hasComp = true;
					output.add('\t--- ${getComponentName(ind)}\n');
				}
			}
			output.add('\n');
			if (hasComp) {
				Lua.print(output.toString());
				// finalOut.add(output);
			}
		}
		
	}

}

abstract Entities(Int) from Int to Int {
    public extern inline function iterator():Iterator<DI_ID> {
        return new IntIterator(0,this);
    }
}


@:using(deceptinfect.macros.ClassToID.DI_ID_Use)
abstract DI_ID(Int) from Int to Int {
	
	inline function new(x:Int) {
		this = x;
	}

	
}



enum HasGEnt {
	NONE;
	GEnt(e:GEntCompat);
}
