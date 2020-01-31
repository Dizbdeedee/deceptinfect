package deceptinfect.ecswip;
import deceptinfect.ecswip.Component;

typedef ComponentArray = Array<Null<Component>>;
typedef SComponentArray<T:Component> = Array<Null<T>>;
class ComponentManager {
    
    public static var components(default,null):haxe.ds.ObjectMap<Class<Dynamic>,ComponentArray> = new haxe.ds.ObjectMap();
    
    // public static var bitset(default,null):Map<DI_ID,
    public static var entities(default,null):Entities = 0;     
    public static var gEntityLookup(default,null):Map<DI_ID,GEntCompat> = [];
    
    public static var gents(default,null):Array<GEntCompat>;

    
    
    
    public static function addGEnt(x:GEntCompat) {
        gEntityLookup.set(addEntity(),x);
        gents.push(x);
    }

    public static function getComponentForID<T:Component>(cls:Class<T>,x:DI_ID):ComponentState<T> {
        var comparray = components.get(cls);
        var comp = comparray[x];
        if (comp != null) {
            return COMPONENT(cast comp);
        } else {
            return NONE;
        }
    }

    public static function getGEnt(x:DI_ID):HasGEnt {
        var look = gEntityLookup.get(x);
        if (look != null) {
            return GEnt(look);
        } else {
            return NONE;
        }
    }

    public static function getComponents<T:Component>(cls:Class<T>):SComponentArray<T> {
        return cast components.get(cls);
    }

    public static function addEntity():DI_ID {
        entities++;
        return entities - 1;
    }

}

abstract Entities(Int) from Int to Int {
    public extern inline function iterator():Iterator<DI_ID> {
        return new IntIterator(0,this);
    }
}

abstract DI_ID(Int) from Int to Int {
    public extern inline function get_component<T:Component>(x:Class<T>):ComponentState<T> {
        return ComponentManager.getComponentForID(x,this);
    }

    public extern inline function get_gent():HasGEnt {
        return ComponentManager.getGEnt(this);
    }

    

}

enum ComponentState<T:Component> {
    NONE;
    COMPONENT(comp:T);
}

enum HasGEnt {
    NONE;
    GEnt(e:GEntCompat);
}