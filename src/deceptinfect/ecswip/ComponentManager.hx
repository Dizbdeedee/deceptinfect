package deceptinfect.ecswip;
import deceptinfect.macros.ClassToID;
import haxe.ds.ObjectMap;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.Component;

typedef ComponentArray = Array<ComponentState<Component>>;
typedef SComponentArray<T:Component> = Array<ComponentState<T>>;

typedef CompAddSignal ={
    ent :DI_ID,

    comp : Component
}
typedef SCompAddSignal<T:Component> = {
    ent : DI_ID,
    comp : T
}

abstract ComponentID<T:Component>(Int) from Int to Int {
    // extern inline function new<T:Component>(int:Int,x:Class<T>) {
    // 	this = int; 
    // }
}

class ComponentManager {
    
    public static var components(default,null):haxe.ds.ObjectMap<Class<Dynamic>,ComponentArray> = new haxe.ds.ObjectMap();
    
    public static var components_2(default,null):Array<ComponentArray>;

    // public static var familyArrays(default,null):Array<

    public static var componentSignals(default,null):haxe.ds.ObjectMap<Class<Dynamic>,SignalTrigger<CompAddSignal>> = new haxe.ds.ObjectMap();

    public static var entities:Entities = 0;     //default,null
    
    public static var activeEntities(default,null):Int = 0;

    public static var gEntityLookup(default,null):Map<DI_ID,GEntCompat> = [];
    
    //TODO move
    public static function addGEnt(x:GEntCompat):DI_ID {
        var id = addEntity();
        addComponent(GEntityComponent.compID,new GEntityComponent(x),id);
        addComponent(VirtualPosition.compID,new VirtualPosition(ENT(x)),id);
        return id;
    }

    // public static function getOrAdd<T:Component>(id:DI_ID,comp:ComponentID<T>,?args:Array<Dynamic>):T {
    //     return switch (getComponentForID(comp,id)) {
    //         case Comp(comp):
    //             comp;
    //         case NONE:
    //             if (args == null) args = [];
    //             var inst = Type.createInstance(cls,args);
    //             id.add_component(inst);
    //             inst;
    //     };
    // }

    public static function addPlayer(x:GPlayerCompat):DI_ID {
        var id = addGEnt(cast x);
        addComponent(PlayerComponent.compID,new PlayerComponent(x),id);
        PlayerManager.addID(x,id);
        return id;
    }

    public static inline function getOldComponentForID<T:Component>(cls:Class<T>,x:DI_ID):ComponentState<T> {
        var comparray = lazyInit(cls);
        return cast comparray[x];
    }

    
    static var lastID:Int;
    public static function initComponent(id:Int) {
	if (components_2 == null) components_2 = [];
	if (lastID == null) lastID = 0;
	if (id > lastID) {
	    for (i in lastID...id + 1) {
		components_2[i] = [];
	    }
	    lastID = id;
	}
    }

    public static inline function getComponentForID<T:Component>(id:ComponentID<T>,diID:DI_ID):ComponentState<T> {
	return cast components_2[id][diID];
    }

    public static inline function addComponent<T:Component>(id:ComponentID<T>,x:T,to:DI_ID) {
	components_2[id][to] = Comp(x);
	return x;
    }

    public static function getCreateSignal<T:Component>(cls:Class<T>):Signal<SCompAddSignal<T>> {
        var sigtrig = componentSignals.get(cls);
        if (sigtrig == null) {
            sigtrig = new SignalTrigger();
            componentSignals.set(cls,sigtrig);            
        }
        return cast sigtrig.asSignal();
        
    }

    public static function getComponentForIDSure<T:Component>(id:ComponentID<T>,diID:DI_ID):T {
	final comp:T = cast components_2[id][diID].getParameters()[0];
	if (comp == null) {
	    throw "Component did not exist at sure statement!"; 
	}
	return comp;
    }


    inline static function lazyInit(x:Class<Dynamic>):ComponentArray {
        var comparray = components.get(x);
        if (comparray == null) {
            comparray = [];
            components.set(x,comparray);
            for (entity in entities) {
                comparray[entity] = NONE;
            }
        }        
        return comparray;
    }

    public static function removeComponent<T:Component>(id:ComponentID<T>,diID:DI_ID) {
        return components_2[id][diID] = NONE;
    }

    public static function removeEntity(x:DI_ID) {
        for (component in components_2) {
            component[x] = NONE;
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
abstract Entities(Int) from Int to Int {
    
    public inline function iterator() {
	return new DI_ID_Iterator();
    }
}

class DI_ID_Iterator {
    
    var current:Int;

    public extern inline function new() {
	current = 0;
    }

    public inline function hasNext() {
	return current < (ComponentManager.entities : Int); 
    }

    public extern inline function next() {
	return (current++ : DI_ID);
    }

    
}

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

    public extern inline function destroy() {

    }

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
