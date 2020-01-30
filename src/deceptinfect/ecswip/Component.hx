package deceptinfect.ecswip;

class Component {
    public function new() {
        
    }
}

@:forward(iterator,keyValueIterator)
abstract ComponentList(Map<Class<Dynamic>,Component>) {
    
    public inline function getComponent<X:Component>(cls:Class<X>):X {
        return cast this.get(cls);
    }

    public inline function addComponent<X:Component>(cls:Class<X>,comp:X) {
        this.set(cls,comp);
    }

    public inline function removeComponent<X:Component>(cls:Class<X>) {
        this.remove(cls);
    }

    public inline function hasComponent<X:Component>(cls:Class<X>) {
        return this.exists(cls);
    }

    public inline function new() {
        this = untyped new haxe.ds.ObjectMap<Class<Dynamic>,Component>();
    }
}

@:forward
abstract DI_Entity(Entity) to Entity {

    static var entID:Int = 0;

    public var components(get,never):ComponentList;

    public var id(get,never):Int;

    @:noCompletion
    public inline function get_components() {
        return untyped this.components;
    }

    public inline function get_id() {
        return untyped this.id;
    }

    public inline function has_component<X:Component>(cls:Class<X>) {
        return components.hasComponent(cls);
    }

    public inline function switch_component<X:Component>(cls:Class<X>):Option<X> {
        if (components.hasComponent(cls)) {
            return Some(components.getComponent(cls));
        } else {
            return None;
        }
    }
    public inline function get_component<X:Component>(cls:Class<X>):X {
        return components.getComponent(cls);
    }

    public inline function new(x:Entity) {
        untyped x.components = new ComponentList();
        untyped x.id = entID;
        entID++;
        this = x;

    } 
}

