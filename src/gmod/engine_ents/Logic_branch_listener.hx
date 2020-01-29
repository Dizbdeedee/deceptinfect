package gmod.engine_ents;
#if server
/**
	Contains a list of logic_branch entities and fires outputs when the state of any of the logic_branches changes.

This entity is used to fire an event when a set of conditions are all satisfied.
**/
@:forward
abstract Logic_branch_listener(Entity) to Entity {
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
		Tests the state of all the logic_branches in the list and fires the appropriate output.
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
		Logic Branch 01

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch01(get,set):String;

    @:noCompletion
    public extern inline function get_Branch01():String {
        return untyped this.GetKeyValues().Branch01;
    }
    
    @:noCompletion
    public extern inline function set_Branch01(value:String):String {
        return untyped this.SetKeyValue("Branch01",untyped value);
    }
    
    /**
		Logic Branch 02

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch02(get,set):String;

    @:noCompletion
    public extern inline function get_Branch02():String {
        return untyped this.GetKeyValues().Branch02;
    }
    
    @:noCompletion
    public extern inline function set_Branch02(value:String):String {
        return untyped this.SetKeyValue("Branch02",untyped value);
    }
    
    /**
		Logic Branch 03

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch03(get,set):String;

    @:noCompletion
    public extern inline function get_Branch03():String {
        return untyped this.GetKeyValues().Branch03;
    }
    
    @:noCompletion
    public extern inline function set_Branch03(value:String):String {
        return untyped this.SetKeyValue("Branch03",untyped value);
    }
    
    /**
		Logic Branch 04

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch04(get,set):String;

    @:noCompletion
    public extern inline function get_Branch04():String {
        return untyped this.GetKeyValues().Branch04;
    }
    
    @:noCompletion
    public extern inline function set_Branch04(value:String):String {
        return untyped this.SetKeyValue("Branch04",untyped value);
    }
    
    /**
		Logic Branch 05

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch05(get,set):String;

    @:noCompletion
    public extern inline function get_Branch05():String {
        return untyped this.GetKeyValues().Branch05;
    }
    
    @:noCompletion
    public extern inline function set_Branch05(value:String):String {
        return untyped this.SetKeyValue("Branch05",untyped value);
    }
    
    /**
		Logic Branch 06

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch06(get,set):String;

    @:noCompletion
    public extern inline function get_Branch06():String {
        return untyped this.GetKeyValues().Branch06;
    }
    
    @:noCompletion
    public extern inline function set_Branch06(value:String):String {
        return untyped this.SetKeyValue("Branch06",untyped value);
    }
    
    /**
		Logic Branch 07

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch07(get,set):String;

    @:noCompletion
    public extern inline function get_Branch07():String {
        return untyped this.GetKeyValues().Branch07;
    }
    
    @:noCompletion
    public extern inline function set_Branch07(value:String):String {
        return untyped this.SetKeyValue("Branch07",untyped value);
    }
    
    /**
		Logic Branch 08

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch08(get,set):String;

    @:noCompletion
    public extern inline function get_Branch08():String {
        return untyped this.GetKeyValues().Branch08;
    }
    
    @:noCompletion
    public extern inline function set_Branch08(value:String):String {
        return untyped this.SetKeyValue("Branch08",untyped value);
    }
    
    /**
		Logic Branch 09

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch09(get,set):String;

    @:noCompletion
    public extern inline function get_Branch09():String {
        return untyped this.GetKeyValues().Branch09;
    }
    
    @:noCompletion
    public extern inline function set_Branch09(value:String):String {
        return untyped this.SetKeyValue("Branch09",untyped value);
    }
    
    /**
		Logic Branch 10

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch10(get,set):String;

    @:noCompletion
    public extern inline function get_Branch10():String {
        return untyped this.GetKeyValues().Branch10;
    }
    
    @:noCompletion
    public extern inline function set_Branch10(value:String):String {
        return untyped this.SetKeyValue("Branch10",untyped value);
    }
    
    /**
		Logic Branch 11

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch11(get,set):String;

    @:noCompletion
    public extern inline function get_Branch11():String {
        return untyped this.GetKeyValues().Branch11;
    }
    
    @:noCompletion
    public extern inline function set_Branch11(value:String):String {
        return untyped this.SetKeyValue("Branch11",untyped value);
    }
    
    /**
		Logic Branch 12

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch12(get,set):String;

    @:noCompletion
    public extern inline function get_Branch12():String {
        return untyped this.GetKeyValues().Branch12;
    }
    
    @:noCompletion
    public extern inline function set_Branch12(value:String):String {
        return untyped this.SetKeyValue("Branch12",untyped value);
    }
    
    /**
		Logic Branch 13

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch13(get,set):String;

    @:noCompletion
    public extern inline function get_Branch13():String {
        return untyped this.GetKeyValues().Branch13;
    }
    
    @:noCompletion
    public extern inline function set_Branch13(value:String):String {
        return untyped this.SetKeyValue("Branch13",untyped value);
    }
    
    /**
		Logic Branch 14

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch14(get,set):String;

    @:noCompletion
    public extern inline function get_Branch14():String {
        return untyped this.GetKeyValues().Branch14;
    }
    
    @:noCompletion
    public extern inline function set_Branch14(value:String):String {
        return untyped this.SetKeyValue("Branch14",untyped value);
    }
    
    /**
		Logic Branch 15

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch15(get,set):String;

    @:noCompletion
    public extern inline function get_Branch15():String {
        return untyped this.GetKeyValues().Branch15;
    }
    
    @:noCompletion
    public extern inline function set_Branch15(value:String):String {
        return untyped this.SetKeyValue("Branch15",untyped value);
    }
    
    /**
		Logic Branch 16

		The name of one or more logic_branches (wildcards allowed).
	**/
    public var Branch16(get,set):String;

    @:noCompletion
    public extern inline function get_Branch16():String {
        return untyped this.GetKeyValues().Branch16;
    }
    
    @:noCompletion
    public extern inline function set_Branch16(value:String):String {
        return untyped this.SetKeyValue("Branch16",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when all the logic_branches in the list become true.
	**/
    public extern inline function OutputOnAllTrue(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllTrue",callback);
    }
    
    /**
		Fired when all the logic_branches in the list become false.
	**/
    public extern inline function OutputOnAllFalse(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllFalse",callback);
    }
    
    /**
		Fired when one of the logic branches in the list changes, but some are true and some are false.
	**/
    public extern inline function OutputOnMixed(callback:Callback<{activator:Logic_branch_listener}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMixed",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_branch_listener");
    }
}





#end
