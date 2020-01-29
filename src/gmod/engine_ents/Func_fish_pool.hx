package gmod.engine_ents;
#if server
/**
	Creates a school of interactive fish that swim near this entity.
**/
@:forward
abstract Func_fish_pool(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		World model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Fish Count

		Number of Fish in this Pool
	**/
    public var fish_count(get,set):Int;

    @:noCompletion
    public extern inline function get_fish_count():Int {
        return untyped this.GetKeyValues().fish_count;
    }
    
    @:noCompletion
    public extern inline function set_fish_count(value:Int):Int {
        return untyped this.SetKeyValue("fish_count",untyped value);
    }
    
    /**
		Max Range

		How far away a Fish can wander (max 255)
	**/
    public var max_range(get,set):Float;

    @:noCompletion
    public extern inline function get_max_range():Float {
        return untyped this.GetKeyValues().max_range;
    }
    
    @:noCompletion
    public extern inline function set_max_range(value:Float):Float {
        return untyped this.SetKeyValue("max_range",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_fish_pool");
    }
}





#end
