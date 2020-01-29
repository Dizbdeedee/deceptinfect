package gmod.engine_ents;
#if server
/**
	An entity to control the color correction in the map.
**/
@:forward
abstract Color_correction_volume(Entity) to Entity {
    //Inputs
    
    /**
		Enable this entity.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
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
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Color_correction_volumeStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Color_correction_volumeStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Color_correction_volumeStartDisabledChoices):Color_correction_volumeStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
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
    
    /**
		Lookup Fade Duration

		This is the duration for the lookup to fade in/out on extry/exit
	**/
    public var fadeDuration(get,set):Float;

    @:noCompletion
    public extern inline function get_fadeDuration():Float {
        return untyped this.GetKeyValues().fadeDuration;
    }
    
    @:noCompletion
    public extern inline function set_fadeDuration(value:Float):Float {
        return untyped this.SetKeyValue("fadeDuration",untyped value);
    }
    
    /**
		Maximum Weight

		This is the maximum weight for this lookup
	**/
    public var maxweight(get,set):Float;

    @:noCompletion
    public extern inline function get_maxweight():Float {
        return untyped this.GetKeyValues().maxweight;
    }
    
    @:noCompletion
    public extern inline function set_maxweight(value:Float):Float {
        return untyped this.SetKeyValue("maxweight",untyped value);
    }
    
    /**
		Lookup Table Filename

		This is the lookup table filename
	**/
    public var filename(get,set):String;

    @:noCompletion
    public extern inline function get_filename():String {
        return untyped this.GetKeyValues().filename;
    }
    
    @:noCompletion
    public extern inline function set_filename(value:String):String {
        return untyped this.SetKeyValue("filename",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Color_correction_volume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Color_correction_volume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Color_correction_volume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Color_correction_volume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("color_correction_volume");
    }
}

enum abstract Color_correction_volumeStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
