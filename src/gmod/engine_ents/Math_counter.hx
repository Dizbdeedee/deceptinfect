package gmod.engine_ents;
#if server
/**
	Holds a numeric value and performs arithmetic operations upon it. If either the minimum or maximum legal value is nonzero, OutValue will be clamped to the legal range, and the OnHitMin/OnHitMax outputs will be fired at the appropriate times. If both min and max are set to zero, no clamping is performed and only the OutValue output will be fired.
**/
@:forward
abstract Math_counter(Entity) to Entity {
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
		Add an amount to the counter and fire the OutValue output with the result.
	**/
    public extern inline function FireAdd(param:Int,delay:Float) {
        untyped this.Fire("Add",untyped param,delay);
    }
    
    /**
		Divide the counter by an amount and fire the OutValue output with the result.
	**/
    public extern inline function FireDivide(param:Int,delay:Float) {
        untyped this.Fire("Divide",untyped param,delay);
    }
    
    /**
		Multiply the counter by an amount and fire the OutValue output with the result.
	**/
    public extern inline function FireMultiply(param:Int,delay:Float) {
        untyped this.Fire("Multiply",untyped param,delay);
    }
    
    /**
		Set the counter to a new value and fire the OutValue output with the result.
	**/
    public extern inline function FireSetValue(param:Int,delay:Float) {
        untyped this.Fire("SetValue",untyped param,delay);
    }
    
    /**
		Set the counter to a new value without firing any outputs.
	**/
    public extern inline function FireSetValueNoFire(param:Int,delay:Float) {
        untyped this.Fire("SetValueNoFire",untyped param,delay);
    }
    
    /**
		Subtract an amount from the counter and fire the OutValue output with the result.
	**/
    public extern inline function FireSubtract(param:Int,delay:Float) {
        untyped this.Fire("Subtract",untyped param,delay);
    }
    
    /**
		Set the upper bound of the counter and fire the OutValue output with the current value.
	**/
    public extern inline function FireSetHitMax(param:Int,delay:Float) {
        untyped this.Fire("SetHitMax",untyped param,delay);
    }
    
    /**
		Set the lower bound of the counter and fire the OutValue output with the current value.
	**/
    public extern inline function FireSetHitMin(param:Int,delay:Float) {
        untyped this.Fire("SetHitMin",untyped param,delay);
    }
    
    /**
		Causes the counter fire its OnGetValue output with the current value of the counter. Used for polling the counter when you don't want constant updates from the OutValue output.
	**/
    public extern inline function FireGetValue(delay:Float) {
        untyped this.Fire("GetValue",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Math_counterStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Math_counterStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Math_counterStartDisabledChoices):Math_counterStartDisabledChoices {
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
		Initial Value

		Starting value for the counter.
	**/
    public var startvalue(get,set):Int;

    @:noCompletion
    public extern inline function get_startvalue():Int {
        return untyped this.GetKeyValues().startvalue;
    }
    
    @:noCompletion
    public extern inline function set_startvalue(value:Int):Int {
        return untyped this.SetKeyValue("startvalue",untyped value);
    }
    
    /**
		Minimum Legal Value

		Minimum legal value for the counter. If min=0 and max=0, no clamping is performed.
	**/
    public var min(get,set):Int;

    @:noCompletion
    public extern inline function get_min():Int {
        return untyped this.GetKeyValues().min;
    }
    
    @:noCompletion
    public extern inline function set_min(value:Int):Int {
        return untyped this.SetKeyValue("min",untyped value);
    }
    
    /**
		Maximum Legal Value

		Maximum legal value for the counter. If min=0 and max=0, no clamping is performed.
	**/
    public var max(get,set):Int;

    @:noCompletion
    public extern inline function get_max():Int {
        return untyped this.GetKeyValues().max;
    }
    
    @:noCompletion
    public extern inline function set_max(value:Int):Int {
        return untyped this.SetKeyValue("max",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the counter value changes.
	**/
    public extern inline function OutputOutValue(callback:Callback<{activator:Math_counter,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OutValue",callback);
    }
    
    /**
		Fired when the counter value meets or goes below the min value. The counter must go back above the min value before the output will fire again.
	**/
    public extern inline function OutputOnHitMin(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHitMin",callback);
    }
    
    /**
		Fired when the counter value meets or exceeds the max value. The counter must go below the max value before the output will fire again.
	**/
    public extern inline function OutputOnHitMax(callback:Callback<{activator:Math_counter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHitMax",callback);
    }
    
    /**
		Fired in response to the GetValue input. Used for polling the counter when you don't want constant updates from the OutValue output.
	**/
    public extern inline function OutputOnGetValue(callback:Callback<{activator:Math_counter,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGetValue",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("math_counter");
    }
}

enum abstract Math_counterStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
