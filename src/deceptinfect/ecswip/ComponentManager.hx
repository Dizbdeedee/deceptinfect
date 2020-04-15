package deceptinfect.ecswip;
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

class ComponentManager {
    
    public static var components(default,null):haxe.ds.ObjectMap<Class<Dynamic>,ComponentArray> = new haxe.ds.ObjectMap();
    
    public static var componentSignals(default,null):haxe.ds.ObjectMap<Class<Dynamic>,SignalTrigger<CompAddSignal>> = new haxe.ds.ObjectMap();

    public static var entities(default,null):Entities = 0;     
    
    public static var activeEntities(default,null):Int = 0;

    public static var gEntityLookup(default,null):Map<DI_ID,GEntCompat> = [];
    
    //TODO move
    public static function addGEnt(x:GEntCompat):DI_ID {
        var id = addEntity();
        addComponent(new GEntityComponent(x),id);
        addComponent(new VirtualPosition(ENT(x)),id);
        return id;
    }

    public static function getOrAdd<T:Component>(id:DI_ID,cls:Class<T>,?args:Array<Dynamic>):T {
        return switch (getComponentForID(cls,id)) {
            case Comp(comp):
                comp;
            case NONE:
                if (args == null) args = [];
                var inst = Type.createInstance(cls,args);
                id.add_component(inst);
                inst;
        };
    }

    public static function addPlayer(x:GPlayerCompat):DI_ID {
        var id = addGEnt(cast x);
        addComponent(new PlayerComponent(x),id);
        PlayerManager.addID(x,id);
        return id;
    }

    public static inline function getComponentForID<T:Component>(cls:Class<T>,x:DI_ID):ComponentState<T> {
        var comparray = lazyInit(cls);
        return cast comparray[x];
    }

    public static function addComponent<T:Component>(x:T,to:DI_ID) {
        var cls = Type.getClass(x);
        var comparray = lazyInit(cls);
        if (componentSignals.exists(cls)) {
            componentSignals.get(cls).trigger({
                ent: to,
                comp: x
            });
        } 
        comparray[to] = Comp(x);
    }

    public static function getCreateSignal<T:Component>(cls:Class<T>):Signal<SCompAddSignal<T>> {
        var sigtrig = componentSignals.get(cls);
        if (sigtrig == null) {
            sigtrig = new SignalTrigger();
            componentSignals.set(cls,sigtrig);            
        }
        return cast sigtrig.asSignal();
        
    }


    static function lazyInit(x:Class<Dynamic>):ComponentArray {
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

    public static function removeComponent<T:Component>(x:Class<T>,from:DI_ID) {
        var comparray = lazyInit(x);
        comparray[from] = NONE;
    }

    public static function removeEntity(x:DI_ID) {
        for (component in components) {
            component[x] = NONE;
        }
        activeEntities--;
    }
    public static function addToAllCompArrays() {
        for (compArray in components) {
            compArray.push(NONE);
        }
    }

    public static function getComponents<T:Component>(cls:Class<T>):SComponentArray<T> {
        return cast components.get(cls);
    }

    public static function addEntity():DI_ID {
        entities++;
        activeEntities++;
        addToAllCompArrays();
        return entities - 1;
    }

}

abstract Entities(Int) from Int to Int {
    public extern inline function iterator():Iterator<DI_ID> {
        return new IntIterator(0,this);
    }
}

// @:using(deceptinfect.ecswip.ComponentFamily)
abstract DI_ID(Int) from Int to Int {
    public extern inline function get<T:Component>(x:Class<T>):ComponentState<T> {
        return ComponentManager.getComponentForID(x,this);
    }

    public inline function get_sure<T:Component>(x:Class<T>):T {
        var retrieve_comp = ComponentManager.getComponentForID(x,this).getParameters()[0];
        if (retrieve_comp == null) {throw 'Component does not exist at sure statement ${Type.getClassName(x)}';}
        return retrieve_comp; 
    }

    public extern inline function add_component<T:Component>(x:T) {
        ComponentManager.addComponent(x,this);
    }

    public extern inline function getOrAdd<T:Component>(x:Class<T>,?args:Array<Dynamic>):T {
        return ComponentManager.getOrAdd(this,x,args);
    }

    public extern inline function remove_component<T:Component>(x:Class<T>) {
        ComponentManager.removeComponent(x,this);
    }

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
