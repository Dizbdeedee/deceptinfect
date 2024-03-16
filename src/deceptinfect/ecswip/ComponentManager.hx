package deceptinfect.ecswip;

import deceptinfect.GEntCompat.GPlayerCompat;

using gmod.helpers.WeakTools;
using gmod.helpers.LuaArray;

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
		return "implement:)"; // bah
	}
}

@:forward
abstract Component_<T:Component>(LuaArrayExt<Dynamic>) {
	public var external(get, set):LuaArrayExt<Int>;

	public var internal(get, set):LuaArrayExt<Int>;

	public var components(get, set):LuaArrayExt<Component>;

	public var signalAdd(get, set):SignalTrigger<CompAddSignalData<Component>>;

	public var signalRemove(get, set):SignalTrigger<CompRemoveSignalData<Component>>;

	public var n(get, set):Int;

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

	inline function set_external(x:LuaArrayExt<Int>) {
		return this[1] = x;
	}

	inline function set_internal(x:LuaArrayExt<Int>) {
		return this[2] = x;
	}

	inline function set_components(x:LuaArrayExt<Component>) {
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
		this = new LuaArrayExt();
		external = new LuaArrayExt();
		internal = new LuaArrayExt();
		components = new LuaArrayExt();
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

	public function init_entity(x:DI_ID, comp:Component) {
		final int_id = n++;
		external[x] = int_id;
		internal[int_id] = x;
		components[int_id] = comp;
		signalAdd.trigger({ent: x, comp: comp});
	}

	public function set_component(x:DI_ID, comp:Component) {
		// there were traces here... suggesting there was something wrong.
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
abstract ComponentStorage(lua.Table<Int, Component_<Dynamic>>) to lua.Table<Int, Component_<Dynamic>> {
	public function new() {
		this = new LuaArrayExt();
	}

	@:op([])
	function get(x:Int):Component_<Dynamic>;

	@:op([])
	function set(x:Int, v:Component_<Dynamic>):Component_<Dynamic>;

	// incorrect
	public extern inline function get_component<T:Component>(x:ComponentID<T>):Component_<T> {
		return cast this[x];
	}

	public extern inline function initComponent(id:Int, str) {
		this[id] = new Component_();
	}

	public extern inline function getName(id:Int) {
		return "implement:)"; // ARGH, but again
	}
}

interface ComponentManager {
	var components_3(default, null):ComponentStorage;
	var componentsName(default, null):Map<Int, String>;
	var entities:Entities;
	var activeEntities(default, null):Int;
	var lookupEntity(default, null):Map<Component, DI_ID>;
	var gEntityLookup(default, null):Map<DI_ID, GEntCompat>;
	var deadEnt:Map<DI_ID, Bool>;
	final removeSignal:Signal<CompRemoveSignalData<Component>>;
	final addSignal:Signal<CompAddSignalData<Component>>;
	final removeEntitySignal:Signal<RemoveEntitySignalData>;

	function addGEnt(x:GEntCompat):DI_ID;
	function addPlayer(x:GPlayerCompat):DI_ID;
	function initComponent(id:Int, str:String):Void;
	function getComponentForID<T:Component>(id:ComponentID<T>, diID:DI_ID):ComponentState<T>;
	function getComponent<T:Component>(id:ComponentID<T>, diid:DI_ID):T;
	function addComponent<T:Component>(id:ComponentID<T>, x:T, to:DI_ID):T;
	function getIDFromComponent(comp:Component):DI_ID;
	function has_component(id:ComponentID<Dynamic>, diID:DI_ID):Bool;
	function getAddSignal<T:Component>(cls:ComponentID<T>):Signal<CompAddSignalData<T>>;
	function getRemoveSignal<T:Component>(cls:ComponentID<T>):Signal<CompRemoveSignalData<T>>;
	function getComponentForIDSure<T:Component>(id:ComponentID<T>, diID:DI_ID):T;
	function removeComponent<T:Component>(id:ComponentID<T>, diID:DI_ID):Void;
	function removeEntity(x:DI_ID):Void;
	function addEntity():DI_ID;
}

class ComponentManagerDef implements ComponentManager {
	public var components_3(default, null):ComponentStorage;

	public var componentsName(default, null):Map<Int, String>;

	public var entities:Entities = 0; // default,null

	public var activeEntities(default, null):Int = 0;

	public var lookupEntity(default, null):Map<Component, DI_ID>;

	public var gEntityLookup(default, null):Map<DI_ID, GEntCompat> = [];

	public var deadEnt:Map<DI_ID, Bool> = [];

	// FIXME... this almost certainly keeps things around after system death... we need to clear signals when we remake systems.
	final removeSignalTrig:SignalTrigger<CompRemoveSignalData<Component>> = new SignalTrigger();

	final removeEntityTrig:SignalTrigger<RemoveEntitySignalData> = new SignalTrigger();

	public final removeSignal:Signal<CompRemoveSignalData<Component>>;

	final addSignalTrig:SignalTrigger<CompAddSignalData<Component>> = new SignalTrigger();

	public final addSignal:Signal<CompAddSignalData<Component>>;

	public final removeEntitySignal:Signal<RemoveEntitySignalData>;

	public function new() {
		var components = new ComponentStorage();
		HookLib.Run("di_createComponentsTable", components);
		components_3 = components;
		componentsName = new Map();
		removeSignal = removeSignalTrig.asSignal();
		addSignal = addSignalTrig.asSignal();
		removeEntitySignal = removeEntityTrig.asSignal();
		lookupEntity = lookupEntityC();
	}

	// can't this just be a component variable... ? NUMPTY
	function lookupEntityC() {
		var map:Map<Component, DI_ID> = [];
		map.setWeakKeysM();
		return map;
	}

	// TODO move
	public function addGEnt(x:GEntCompat):DI_ID {
		var id = addEntity();
		addComponent(GEntityComponent.compID, new GEntityComponent(x), id);
		addComponent(VirtualPosition.compID, new VirtualPosition(ENT(x)), id);
		return id;
	}

	public function addPlayer(x:GPlayerCompat):DI_ID {
		var id = addGEnt(cast x);
		addComponent(PlayerComponent.compID, new PlayerComponent(x), id);
		PlayerManager.addID(x, id);
		return id;
	}

	public function initComponent(id:Int, str:String) {
		if (components_3 == null) {
			components_3 = new ComponentStorage();
		}
		if (componentsName == null)
			componentsName = new Map();
		componentsName.set(id, str);
		components_3.initComponent(id, str);
	}

	/**
		. **Deprecated**
	**/
	public inline function getComponentForID<T:Component>(id:ComponentID<T>, diID:DI_ID):ComponentState<T> {
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
	public inline function getComponent<T:Component>(id:ComponentID<T>, diid:DI_ID):T {
		final fam = components_3.get_component(id);
		return if (!fam.has_component(diid)) null; else {
			fam.get_component(diid);
		}
	}

	public function addComponent<T:Component>(id:ComponentID<T>, x:T, to:DI_ID) {
		final fam = components_3.get_component(id);
		lookupEntity.set(x, to);
		if (!fam.has_component(to)) { // check
			addSignalTrig.trigger({ent: to, comp: x});
			fam.init_entity(to, x);
		} else {
			fam.set_component(to, x);
		}
		return x;
	}

	public inline function getIDFromComponent(comp:Component):DI_ID {
		return lookupEntity.get(comp);
	}

	public inline function has_component(id:ComponentID<Dynamic>, diID:DI_ID):Bool {
		return components_3[id].external[diID] != null;
	}

	public inline function getAddSignal<T:Component>(cls:ComponentID<T>):Signal<CompAddSignalData<T>> {
		return components_3.get_component(cls)
			.getAddSignal();
	}

	public inline function getRemoveSignal<T:Component>(cls:ComponentID<T>):Signal<CompRemoveSignalData<T>> {
		return components_3.get_component(cls)
			.getRemoveSignal();
	}

	public function getComponentForIDSure<T:Component>(id:ComponentID<T>, diID:DI_ID):T {
		#if !final
		final fam = components_3.get_component(id);
		if (!fam.has_component(diID))
			throw "Component did not exist at sure statement!";
		return fam.get_component(diID);
		#else
		return fam.get_component(diID);
		#end
	}

	public function removeComponent<T:Component>(id:ComponentID<T>, diID:DI_ID) {
		if (!components_3[id].has_component(diID)) {
			return;
		}
		removeSignalTrig.trigger({
			ent: diID,
			comp: components_3[id].get_component(diID)
		});
		components_3[id].remove_entity_comp(diID);
	}

	public function removeEntity(x:DI_ID) {
		if (x == null) {
			trace("Attempt to remove entity with null id...");
			return;
		}
		deadEnt.set(x, true);
		removeEntityTrig.trigger({
			ent: x
		});
		for (id in PairTools.keys(components_3)) {
			removeComponent(id, x);
		}
		activeEntities--;
	}

	public function addEntity():DI_ID {
		final id = entities++;
		activeEntities++;
		return id;
	}
}

abstract Entities(Int) from Int to Int {
	public extern inline function iterator():Iterator<DI_ID> {
		return new IntIterator(0, this);
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
