package gmod;

import gmod.libs.EntsLib;

/**
    Represents an entity class...
**/
abstract EntityClass<T:Entity>(String) to String {
    public inline function new(name:String) {
        this = name;
    }
}

class EntityClasses {

    public static var testEnt(default,never) = new EntityClass<Entity>("Blegh");

}

abstract FireEvent<X:Entity,PARAM>(String) to String {
    public inline function new<X:Entity,PARAM>(name:String) {
        this = name;
    }

    
}

abstract KeyValue<X:Entity,PARAM>(String) to String {
    public inline function new<X:Entity,PARAM>(name:String) {
        this = name;
    }
}

abstract FireEventParam<P>(P) {
    @:from
    public static function fromX<P>(x:P):FireEventParam<P> {
        return untyped __lua__("tostring{0}",x);
    }
}

class EngineEntity extends Entity {

    
    
}


class Light extends Entity {
    public static var brass(get,never):EntityClass<Light>;

    public static extern inline function get_brass():EntityClass<Light> {
        return new EntityClass<Light>("light");
    }

    public static var setPattern(get,never):FireEvent<Light,String>;

    public static extern inline function get_setPattern():FireEvent<Light,String> {
        return new FireEvent<Light,String>("SetPattern");
    }
    
    // public static extern inline function get_class():EntityClass<Light>
    /**
        Turn the light on.
    **/
    public static var turnOn(get,never):FireEvent<Light,Void>;

    public static extern inline function get_turnOn():FireEvent<Light,Void> {
        return new FireEvent<Light,Void>("TurnOn");
    }

    

    
    public var radius(get,set):Int;
    
    public extern inline function get_radius():Int {
        return untyped GetKeyValues.radius;
    }

    public extern inline function set_radius(x:Int):Int {
        this.SetKeyValue("radius",untyped __lua__("tostring{0}",x));
        return x;
    }
    
    // public static var param(default,never) = new FireEvent<Light>("TurnOn");
    public extern inline function new() {}

    public extern inline function SafeFire() {

    }
    
}

class FireEvents {
    
    public static var testEvent(default,never) = new FireEvent("Blegh2");

    public static function SafeCreate<X:Entity,T:EntityClass<X>>(cls:T):X {
        return cast EntsLib.Create(cls);
    }
    public static function SafeFire<X:Entity,T:FireEvent<X,Y>,Y>(ent:X,input:T, ?param:Y, ?delay:Float) { //P:FireEventParam<T,X,F>,F
        var p = null;
        if (param != null) {
            p = untyped __lua__("tostring{0}",param);
        }
        
        return ent.Fire(input,p,delay);
    }

    

    public static function TestFire() {
        var light:Light = SafeCreate(Light.brass);
        SafeFire(light,Light.turnOn);
        light.radius = 5;
        SafeFire(light,Light.setPattern,"29");
    }
}