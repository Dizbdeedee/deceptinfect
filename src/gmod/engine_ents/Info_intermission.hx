package gmod.engine_ents;
#if server
/**
	An entity that defines an intermission spot where dead players will float until they respawn.
**/
@:forward
abstract Info_intermission(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Entity to look at

		Name of entity that dead players will face while in intermission at this spot.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_intermission");
    }
}





#end
