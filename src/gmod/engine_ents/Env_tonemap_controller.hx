package gmod.engine_ents;
#if server
/**
	An entity that controls the HDR tonemapping for the player. Think of it as a method of controlling the exposure of the player's eyes.
**/
@:forward
abstract Env_tonemap_controller(Entity) to Entity {
    //Inputs
    
    /**
		Removes this entity from the world.
	**/
    public extern inline function FireKill(delay:Float) {
        untyped this.Fire("Kill",untyped null,delay);
    }
    
    /**
		Removes this entity and all its children from the world.
	**/
    public extern inline function FireKillHierarchy(delay:Float) {
        untyped this.Fire("KillHierarchy",untyped null,delay);
    }
    
    /**
		Adds an entity I/O connection to this entity. Format: <output name> <targetname>:<inputname>:<parameter>:<delay>:<max times to fire (-1 == infinite)>. Very dangerous, use with care.
	**/
    public extern inline function FireAddOutput(param:String,delay:Float) {
        untyped this.Fire("AddOutput",untyped param,delay);
    }
    
    /**
		Causes this entity's OnUser1 output to be fired.
	**/
    public extern inline function FireFireUser1(delay:Float) {
        untyped this.Fire("FireUser1",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser2 output to be fired.
	**/
    public extern inline function FireFireUser2(delay:Float) {
        untyped this.Fire("FireUser2",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser3 output to be fired.
	**/
    public extern inline function FireFireUser3(delay:Float) {
        untyped this.Fire("FireUser3",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser4 output to be fired.
	**/
    public extern inline function FireFireUser4(delay:Float) {
        untyped this.Fire("FireUser4",untyped null,delay);
    }
    
    /**
		Set the player's tonemap scale. It should be a value between 0 and 2, where 0 is the eyes fully closed, 1 is use the unchanged autoexposure (default), and 2 is the eye fully wide open.
	**/
    public extern inline function FireSetTonemapScale(delay:Float) {
        untyped this.Fire("SetTonemapScale",untyped null,delay);
    }
    
    /**
		Blend from the player's current tonemap scale to a new one. The parameter syntax is as follows: <target tonemap scale> <blend duration>. For example: '0.5 10' would blend from the current tonemap scale to 0.5 over a period of 10 seconds. Tonemap scale is a value between 0 and 2, where 0 is the eyes fully closed, 1 is use the unchanged autoexposure (default), and 2 is the eye fully wide open.
	**/
    public extern inline function FireBlendTonemapScale(param:String,delay:Float) {
        untyped this.Fire("BlendTonemapScale",untyped param,delay);
    }
    
    /**
		Revert to using the default tonemap auto exposure.
	**/
    public extern inline function FireUseDefaultAutoExposure(delay:Float) {
        untyped this.Fire("UseDefaultAutoExposure",untyped null,delay);
    }
    
    /**
		Set a custom tonemap auto exposure minimum.
	**/
    public extern inline function FireSetAutoExposureMin(param:Float,delay:Float) {
        untyped this.Fire("SetAutoExposureMin",untyped param,delay);
    }
    
    /**
		Set a custom tonemap auto exposure maximum.
	**/
    public extern inline function FireSetAutoExposureMax(param:Float,delay:Float) {
        untyped this.Fire("SetAutoExposureMax",untyped param,delay);
    }
    
    /**
		Set a custom bloom scale.
	**/
    public extern inline function FireSetBloomScale(param:Float,delay:Float) {
        untyped this.Fire("SetBloomScale",untyped param,delay);
    }
    
    /**
		Set the rate for autoexposure adjustment.
	**/
    public extern inline function FireSetTonemapRate(param:Float,delay:Float) {
        untyped this.Fire("SetTonemapRate",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Name

		The name that other entities refer to this entity by.
	**/
    public var targetname(get,set):String;

    @:noCompletion
    public extern inline function get_targetname():String {
        return untyped this.GetKeyValues().targetname;
    }
    
    @:noCompletion
    public extern inline function set_targetname(value:String):String {
        return untyped this.SetKeyValue("targetname",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_tonemap_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_tonemap_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_tonemap_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_tonemap_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_tonemap_controller");
    }
}





#end
