package gmod.engine_ents;
#if server
/**
	Tests a boolean value and fires an output based on whether the value is true or false. Use this entity to branch between two potential sets of events.
**/
@:forward
abstract Logic_branch(Entity) to Entity {
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
		Set the boolean value without performing the comparison. Use this to hold a value for a future test.
	**/
    public extern inline function FireSetValue(param:bool,delay:Float) {
        untyped this.Fire("SetValue",untyped param,delay);
    }
    
    /**
		Set the boolean value and test it, firing OnTrue or OnFalse based on the new value.
	**/
    public extern inline function FireSetValueTest(param:bool,delay:Float) {
        untyped this.Fire("SetValueTest",untyped param,delay);
    }
    
    /**
		Toggle the boolean value between true and false.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Toggle the boolean value and tests it, firing OnTrue or OnFalse based on the new value.
	**/
    public extern inline function FireToggleTest(delay:Float) {
        untyped this.Fire("ToggleTest",untyped null,delay);
    }
    
    /**
		Test the input value and fire OnTrue or OnFalse based on the value.
	**/
    public extern inline function FireTest(delay:Float) {
        untyped this.Fire("Test",untyped null,delay);
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
    
    /**
		Initial value

		Initial value for the boolean value (0 or 1).
	**/
    public var InitialValue(get,set):Int;

    @:noCompletion
    public extern inline function get_InitialValue():Int {
        return untyped this.GetKeyValues().InitialValue;
    }
    
    @:noCompletion
    public extern inline function set_InitialValue(value:Int):Int {
        return untyped this.SetKeyValue("InitialValue",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_branch}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_branch}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_branch}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_branch}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the input value is true (nonzero).
	**/
    public extern inline function OutputOnTrue(callback:Callback<{activator:Logic_branch,data:bool}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrue",callback);
    }
    
    /**
		Fired when the input value is false (zero).
	**/
    public extern inline function OutputOnFalse(callback:Callback<{activator:Logic_branch,data:bool}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFalse",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_branch");
    }
}





#end
