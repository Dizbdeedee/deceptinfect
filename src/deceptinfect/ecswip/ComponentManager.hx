package deceptinfect.ecswip;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.ecswip.Component;

typedef ComponentArray = Array<ComponentState<Component>>;
typedef SComponentArray<T:Component> = Array<ComponentState<T>>;
class ComponentManager {
    
    public static var components(default,null):haxe.ds.ObjectMap<Class<Dynamic>,ComponentArray> = new haxe.ds.ObjectMap();
    
    // public static var bitset(default,null):Map<DI_ID,
    public static var entities(default,null):Entities = 0;     
    
    public static var activeEntities(default,null):Int = 0;

    //component lookup
    public static var players(default,null):Map<DI_ID,PlayerComponent> = [];
    
    public static var gEntityLookup(default,null):Map<DI_ID,GEntCompat> = [];
    
    public static var gents(default,null):Array<GEntCompat> = [];

    
    
    //TODO move
    public static function addGEnt(x:GEntCompat):DI_ID {
        var id = addEntity();
        addComponent(new GEntityComponent(x),id);
        
        // gEntityLookup.set(id,x);
        // gents.push(x);
        return id;
    }

    public static function addPlayer(x:GPlayerCompat):DI_ID {
        var id = addGEnt(cast x);
        addComponent(new PlayerComponent(x),id);
        return id;
    }

    public static inline function getComponentForID<T:Component>(cls:Class<T>,x:DI_ID):ComponentState<T> {
        var comparray = lazyInit(cls);
        var comp = comparray[x];
        return cast comp;
    }

    public static function getGEnt(x:DI_ID):HasGEnt {
        var look = gEntityLookup.get(x);
        if (GlobalLib.IsValid(look)) {
            return GEnt(look);
        } else {
            return NONE;
        }
    }

   
    public static function addComponent<T:Component>(x:T,to:DI_ID) {
        var comparray = lazyInit(Type.getClass(x));
        trace(to);
        comparray[to] = Comp(x);
    }


    public static inline function lazyInit(x:Class<Dynamic>):ComponentArray {
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

    public extern inline function get_gent():HasGEnt {
        return ComponentManager.getGEnt(this);
    }

    public extern inline function add_component<T:Component>(x:T) {
        ComponentManager.addComponent(x,this);
    }

    public inline function new(x:Int) {
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

enum HasGPlayer {
    NONE;
    GPlayer(p:GPlayerCompat);
}