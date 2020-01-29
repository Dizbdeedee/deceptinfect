package gmod.engine_ents;
#if server
/**
	An entity that remaps a range of input values to a given range of output values.
**/
@:forward
abstract Math_remap(Entity) to Entity {
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
    
    /**
		Input value and fire the output with the remapped value.
	**/
    public extern inline function FireInValue(param:Float,delay:Float) {
        untyped this.Fire("InValue",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Math_remapStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Math_remapStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Math_remapStartDisabledChoices):Math_remapStartDisabledChoices {
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
		Minimum Valid Input Value

		Input values below this value will be ignored.
	**/
    public var in1(get,set):Int;

    @:noCompletion
    public extern inline function get_in1():Int {
        return untyped this.GetKeyValues().in1;
    }
    
    @:noCompletion
    public extern inline function set_in1(value:Int):Int {
        return untyped this.SetKeyValue("in1",untyped value);
    }
    
    /**
		Maximum Valid Input Value

		Input values above this value will be ignored.
	**/
    public var in2(get,set):Int;

    @:noCompletion
    public extern inline function get_in2():Int {
        return untyped this.GetKeyValues().in2;
    }
    
    @:noCompletion
    public extern inline function set_in2(value:Int):Int {
        return untyped this.SetKeyValue("in2",untyped value);
    }
    
    /**
		Output Value When Input Is Min.

		When the input value is equal to 'Minimum Valid Input Value', this is the output value.
	**/
    public var out1(get,set):Int;

    @:noCompletion
    public extern inline function get_out1():Int {
        return untyped this.GetKeyValues().out1;
    }
    
    @:noCompletion
    public extern inline function set_out1(value:Int):Int {
        return untyped this.SetKeyValue("out1",untyped value);
    }
    
    /**
		Output Value When Input Is Max.

		When the input value is equal to 'Maximum Valid Input Value', this is the output value.
	**/
    public var out2(get,set):Int;

    @:noCompletion
    public extern inline function get_out2():Int {
        return untyped this.GetKeyValues().out2;
    }
    
    @:noCompletion
    public extern inline function set_out2(value:Int):Int {
        return untyped this.SetKeyValue("out2",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Math_remap}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Math_remap}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Math_remap}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Math_remap}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the InValue input is received, with the remapped input value as the parameter.
	**/
    public extern inline function OutputOutValue(callback:Callback<{activator:Math_remap,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OutValue",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Math_remapSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Math_remapSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Math_remapSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("math_remap");
    }
}

enum abstract Math_remapStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Math_remapSpawnFlags(Int) to Int {
	var IGNORE_OUT_OF_RANGE_INPUT_VALUES = 1;
	var CLAMP_OUTPUT_TO_OUTPUT_RANGE = 2;
}

#end
