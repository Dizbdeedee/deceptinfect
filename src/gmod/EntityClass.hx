package gmod;

import gmod.libs.EntsLib;

/**
    Represents an entity class...
**/
abstract EntityClass<T>(String) to String {
    public inline function new(name:String) {
        this = name;
    }
}

class EntityClasses {

    public static var testEnt(default,never) = new EntityClass<Entity>("Blegh");

}

abstract FireEvent<X,PARAM>(String) to String {
    public inline function new<X:Entity,PARAM>(name:String) {
        this = name;
    }

    public extern inline function Fire<X,PARAM>(ent:X,?param:PARAM) {
        untyped ent.Fire(this,param,0);
    } 

    
}

abstract KeyValue<X,PARAM>(String) to String {
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

// @:forward
// abstract EngineEntity(Entity) to Entity {

    
    
// }

@:forward
abstract Light(Entity) to Entity {
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

    public extern inline function fireSetPattern(params:String,delay:Float) {
        this.Fire("TurnOn",params,0);
        // this.
    }

    
    public var radius(get,set):Int;
    
    @:noCompletion
    public extern inline function get_radius():Int {
        return this.GetKeyValues().radius;
    }

    @:noCompletion
    public extern inline function set_radius(x:Int):Int {
        this.SetKeyValue("radius",untyped __lua__("tostring{0}",x));
        return x;
    }
    
    // public static var param(default,never) = new FireEvent<Light>("TurnOn");
    public inline function new() {
        this = EntsLib.Create("Light");
    }

    
    
}

class FireEvents {
    
    public static var testEvent(default,never) = new FireEvent("Blegh2");

    public static function SafeCreate<X,T:EntityClass<X>>(cls:T):X {
        return cast EntsLib.Create(cls);
    }
    public static function SafeFire<X,T:FireEvent<X,Y>,Y>(ent:X,input:T, ?param:Y, ?delay:Float) { //P:FireEventParam<T,X,F>,F
        var p = null;
        if (param != null) {
            p = untyped __lua__("tostring\"{0}\"",param);
        }
        
        return untyped ent.Fire(input,p,delay);
    }

    

    public static function TestFire() {
        var light:Light = new Light();
        SafeFire(light,Light.turnOn);
        light.radius = 5;
        light.radius = 12003;
        
        trace(light.radius);
        SafeFire(light,Light.setPattern,"29");
    }
}