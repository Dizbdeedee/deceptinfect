package gmod.engine_ents;
#if server
/**
	Compares an input value to another value. If the input value is less than the compare value, the OnLessThan output is fired with the input value. If the input value is equal to the compare value, the OnEqualTo output is fired with the input value. If the input value is greater than the compare value, the OnGreaterThan output is fired with the input value.
**/
@:forward
abstract Logic_compare(Entity) to Entity {
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
		Set the value that will be compared against the compare value.
	**/
    public extern inline function FireSetValue(param:Float,delay:Float) {
        untyped this.Fire("SetValue",untyped param,delay);
    }
    
    /**
		Set the value that will be compared against the compare value and performs the comparison.
	**/
    public extern inline function FireSetValueCompare(param:Float,delay:Float) {
        untyped this.Fire("SetValueCompare",untyped param,delay);
    }
    
    /**
		Set the compare value.
	**/
    public extern inline function FireSetCompareValue(param:Float,delay:Float) {
        untyped this.Fire("SetCompareValue",untyped param,delay);
    }
    
    /**
		Force a compare of the input value with the compare value.
	**/
    public extern inline function FireCompare(delay:Float) {
        untyped this.Fire("Compare",untyped null,delay);
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

		Initial value for the input value.
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
    
    /**
		Compare value

		The value to compare against.
	**/
    public var CompareValue(get,set):Int;

    @:noCompletion
    public extern inline function get_CompareValue():Int {
        return untyped this.GetKeyValues().CompareValue;
    }
    
    @:noCompletion
    public extern inline function set_CompareValue(value:Int):Int {
        return untyped this.SetKeyValue("CompareValue",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_compare}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_compare}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_compare}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_compare}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the input value is less than the compare value. Sends the input value as data.
	**/
    public extern inline function OutputOnLessThan(callback:Callback<{activator:Logic_compare,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLessThan",callback);
    }
    
    /**
		Fired when the input value is equal to the compare value. Sends the input value as data.
	**/
    public extern inline function OutputOnEqualTo(callback:Callback<{activator:Logic_compare,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEqualTo",callback);
    }
    
    /**
		Fired when the input value is different from the compare value. Sends the input value as data.
	**/
    public extern inline function OutputOnNotEqualTo(callback:Callback<{activator:Logic_compare,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNotEqualTo",callback);
    }
    
    /**
		Fired when the input value is greater than the compare value. Sends the input value as data.
	**/
    public extern inline function OutputOnGreaterThan(callback:Callback<{activator:Logic_compare,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGreaterThan",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_compare");
    }
}





#end
