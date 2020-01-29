package gmod.engine_ents;
#if server
/**
	Compares an input to up to 16 preset values. If the input value is the same as any of the preset values, an output corresponding to that value is fired.

For example: if Case01 is set to 2 and Case02 is set to 5, and the input value is 5, the OnCase02 output will be fired.

This entity can also be used to select from a number of random targets via the PickRandom input. One of the OnCase outputs that is connected to another entity will be picked at random and fired.
**/
@:forward
abstract Logic_case(Entity) to Entity {
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
		Compares the Input value to the case values, and fires the appropriate output, if any.
	**/
    public extern inline function FireInValue(param:String,delay:Float) {
        untyped this.Fire("InValue",untyped param,delay);
    }
    
    /**
		Fires a random OnCase output with at least one connection.
	**/
    public extern inline function FirePickRandom(delay:Float) {
        untyped this.Fire("PickRandom",untyped null,delay);
    }
    
    /**
		Fires a random OnCase output with at least one connection, with no repeats until all cases have been picked, at which point the shuffle starts over.
	**/
    public extern inline function FirePickRandomShuffle(delay:Float) {
        untyped this.Fire("PickRandomShuffle",untyped null,delay);
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
		Case 01
	**/
    public var Case01(get,set):String;

    @:noCompletion
    public extern inline function get_Case01():String {
        return untyped this.GetKeyValues().Case01;
    }
    
    @:noCompletion
    public extern inline function set_Case01(value:String):String {
        return untyped this.SetKeyValue("Case01",untyped value);
    }
    
    /**
		Case 02
	**/
    public var Case02(get,set):String;

    @:noCompletion
    public extern inline function get_Case02():String {
        return untyped this.GetKeyValues().Case02;
    }
    
    @:noCompletion
    public extern inline function set_Case02(value:String):String {
        return untyped this.SetKeyValue("Case02",untyped value);
    }
    
    /**
		Case 03
	**/
    public var Case03(get,set):String;

    @:noCompletion
    public extern inline function get_Case03():String {
        return untyped this.GetKeyValues().Case03;
    }
    
    @:noCompletion
    public extern inline function set_Case03(value:String):String {
        return untyped this.SetKeyValue("Case03",untyped value);
    }
    
    /**
		Case 04
	**/
    public var Case04(get,set):String;

    @:noCompletion
    public extern inline function get_Case04():String {
        return untyped this.GetKeyValues().Case04;
    }
    
    @:noCompletion
    public extern inline function set_Case04(value:String):String {
        return untyped this.SetKeyValue("Case04",untyped value);
    }
    
    /**
		Case 05
	**/
    public var Case05(get,set):String;

    @:noCompletion
    public extern inline function get_Case05():String {
        return untyped this.GetKeyValues().Case05;
    }
    
    @:noCompletion
    public extern inline function set_Case05(value:String):String {
        return untyped this.SetKeyValue("Case05",untyped value);
    }
    
    /**
		Case 06
	**/
    public var Case06(get,set):String;

    @:noCompletion
    public extern inline function get_Case06():String {
        return untyped this.GetKeyValues().Case06;
    }
    
    @:noCompletion
    public extern inline function set_Case06(value:String):String {
        return untyped this.SetKeyValue("Case06",untyped value);
    }
    
    /**
		Case 07
	**/
    public var Case07(get,set):String;

    @:noCompletion
    public extern inline function get_Case07():String {
        return untyped this.GetKeyValues().Case07;
    }
    
    @:noCompletion
    public extern inline function set_Case07(value:String):String {
        return untyped this.SetKeyValue("Case07",untyped value);
    }
    
    /**
		Case 08
	**/
    public var Case08(get,set):String;

    @:noCompletion
    public extern inline function get_Case08():String {
        return untyped this.GetKeyValues().Case08;
    }
    
    @:noCompletion
    public extern inline function set_Case08(value:String):String {
        return untyped this.SetKeyValue("Case08",untyped value);
    }
    
    /**
		Case 09
	**/
    public var Case09(get,set):String;

    @:noCompletion
    public extern inline function get_Case09():String {
        return untyped this.GetKeyValues().Case09;
    }
    
    @:noCompletion
    public extern inline function set_Case09(value:String):String {
        return untyped this.SetKeyValue("Case09",untyped value);
    }
    
    /**
		Case 10
	**/
    public var Case10(get,set):String;

    @:noCompletion
    public extern inline function get_Case10():String {
        return untyped this.GetKeyValues().Case10;
    }
    
    @:noCompletion
    public extern inline function set_Case10(value:String):String {
        return untyped this.SetKeyValue("Case10",untyped value);
    }
    
    /**
		Case 11
	**/
    public var Case11(get,set):String;

    @:noCompletion
    public extern inline function get_Case11():String {
        return untyped this.GetKeyValues().Case11;
    }
    
    @:noCompletion
    public extern inline function set_Case11(value:String):String {
        return untyped this.SetKeyValue("Case11",untyped value);
    }
    
    /**
		Case 12
	**/
    public var Case12(get,set):String;

    @:noCompletion
    public extern inline function get_Case12():String {
        return untyped this.GetKeyValues().Case12;
    }
    
    @:noCompletion
    public extern inline function set_Case12(value:String):String {
        return untyped this.SetKeyValue("Case12",untyped value);
    }
    
    /**
		Case 13
	**/
    public var Case13(get,set):String;

    @:noCompletion
    public extern inline function get_Case13():String {
        return untyped this.GetKeyValues().Case13;
    }
    
    @:noCompletion
    public extern inline function set_Case13(value:String):String {
        return untyped this.SetKeyValue("Case13",untyped value);
    }
    
    /**
		Case 14
	**/
    public var Case14(get,set):String;

    @:noCompletion
    public extern inline function get_Case14():String {
        return untyped this.GetKeyValues().Case14;
    }
    
    @:noCompletion
    public extern inline function set_Case14(value:String):String {
        return untyped this.SetKeyValue("Case14",untyped value);
    }
    
    /**
		Case 15
	**/
    public var Case15(get,set):String;

    @:noCompletion
    public extern inline function get_Case15():String {
        return untyped this.GetKeyValues().Case15;
    }
    
    @:noCompletion
    public extern inline function set_Case15(value:String):String {
        return untyped this.SetKeyValue("Case15",untyped value);
    }
    
    /**
		Case 16
	**/
    public var Case16(get,set):String;

    @:noCompletion
    public extern inline function get_Case16():String {
        return untyped this.GetKeyValues().Case16;
    }
    
    @:noCompletion
    public extern inline function set_Case16(value:String):String {
        return untyped this.SetKeyValue("Case16",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the input value equals the Case01 value.
	**/
    public extern inline function OutputOnCase01(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase01",callback);
    }
    
    /**
		Fired when the input value equals the Case02 value.
	**/
    public extern inline function OutputOnCase02(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase02",callback);
    }
    
    /**
		Fired when the input value equals the Case03 value.
	**/
    public extern inline function OutputOnCase03(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase03",callback);
    }
    
    /**
		Fired when the input value equals the Case04 value.
	**/
    public extern inline function OutputOnCase04(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase04",callback);
    }
    
    /**
		Fired when the input value equals the Case05 value.
	**/
    public extern inline function OutputOnCase05(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase05",callback);
    }
    
    /**
		Fired when the input value equals the Case06 value.
	**/
    public extern inline function OutputOnCase06(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase06",callback);
    }
    
    /**
		Fired when the input value equals the Case07 value.
	**/
    public extern inline function OutputOnCase07(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase07",callback);
    }
    
    /**
		Fired when the input value equals the Case08 value.
	**/
    public extern inline function OutputOnCase08(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase08",callback);
    }
    
    /**
		Fired when the input value equals the Case09 value.
	**/
    public extern inline function OutputOnCase09(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase09",callback);
    }
    
    /**
		Fired when the input value equals the Case10 value.
	**/
    public extern inline function OutputOnCase10(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase10",callback);
    }
    
    /**
		Fired when the input value equals the Case11 value.
	**/
    public extern inline function OutputOnCase11(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase11",callback);
    }
    
    /**
		Fired when the input value equals the Case12 value.
	**/
    public extern inline function OutputOnCase12(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase12",callback);
    }
    
    /**
		Fired when the input value equals the Case13 value.
	**/
    public extern inline function OutputOnCase13(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase13",callback);
    }
    
    /**
		Fired when the input value equals the Case14 value.
	**/
    public extern inline function OutputOnCase14(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase14",callback);
    }
    
    /**
		Fired when the input value equals the Case15 value.
	**/
    public extern inline function OutputOnCase15(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase15",callback);
    }
    
    /**
		Fired when the input value equals the Case16 value.
	**/
    public extern inline function OutputOnCase16(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCase16",callback);
    }
    
    /**
		Fired when the input value does not equal any of the Case values.
	**/
    public extern inline function OutputOnDefault(callback:Callback<{activator:Logic_case}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDefault",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_case");
    }
}





#end
