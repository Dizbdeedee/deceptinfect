package gmod.engine_ents;
#if server
/**
	An entity that overrides the mass center of the target physics prop, or func_physbox, by moving it to the info_mass_center's location.
**/
@:forward
abstract Info_mass_center(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Target object

		The entity whose mass center will be overridden.
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
        this = cast gmod.libs.EntsLib.Create("info_mass_center");
    }
}





#end
