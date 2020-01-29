package gmod.engine_ents;
#if server
/**
	Use this entity to mark surfaces that shouldn't receive dynamic shadows. Useful to apply to walls and floors where shadows are drawn improperly, giving away the location of enemies.
**/
@:forward
abstract Info_no_dynamic_shadow(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Brush faces
	**/
    public var sides(get,set):String;

    @:noCompletion
    public extern inline function get_sides():String {
        return untyped this.GetKeyValues().sides;
    }
    
    @:noCompletion
    public extern inline function set_sides(value:String):String {
        return untyped this.SetKeyValue("sides",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_no_dynamic_shadow");
    }
}





#end
