package gmod.engine_ents;
#if server
/**
	Specifies entities that are to be ignored by the hammer_update_safe_entities console command. Enter the targetnames of entities that you want to exclude into the list of fields here. Several of these may exist in a map.
**/
@:forward
abstract Hammer_updateignorelist(Entity) to Entity {
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
		IgnoredName 01

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName01(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName01():String {
        return untyped this.GetKeyValues().IgnoredName01;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName01(value:String):String {
        return untyped this.SetKeyValue("IgnoredName01",untyped value);
    }
    
    /**
		IgnoredName 02

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName02(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName02():String {
        return untyped this.GetKeyValues().IgnoredName02;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName02(value:String):String {
        return untyped this.SetKeyValue("IgnoredName02",untyped value);
    }
    
    /**
		IgnoredName 03

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName03(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName03():String {
        return untyped this.GetKeyValues().IgnoredName03;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName03(value:String):String {
        return untyped this.SetKeyValue("IgnoredName03",untyped value);
    }
    
    /**
		IgnoredName 04

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName04(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName04():String {
        return untyped this.GetKeyValues().IgnoredName04;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName04(value:String):String {
        return untyped this.SetKeyValue("IgnoredName04",untyped value);
    }
    
    /**
		IgnoredName 05

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName05(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName05():String {
        return untyped this.GetKeyValues().IgnoredName05;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName05(value:String):String {
        return untyped this.SetKeyValue("IgnoredName05",untyped value);
    }
    
    /**
		IgnoredName 06

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName06(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName06():String {
        return untyped this.GetKeyValues().IgnoredName06;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName06(value:String):String {
        return untyped this.SetKeyValue("IgnoredName06",untyped value);
    }
    
    /**
		IgnoredName 07

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName07(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName07():String {
        return untyped this.GetKeyValues().IgnoredName07;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName07(value:String):String {
        return untyped this.SetKeyValue("IgnoredName07",untyped value);
    }
    
    /**
		IgnoredName 08

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName08(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName08():String {
        return untyped this.GetKeyValues().IgnoredName08;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName08(value:String):String {
        return untyped this.SetKeyValue("IgnoredName08",untyped value);
    }
    
    /**
		IgnoredName 09

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName09(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName09():String {
        return untyped this.GetKeyValues().IgnoredName09;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName09(value:String):String {
        return untyped this.SetKeyValue("IgnoredName09",untyped value);
    }
    
    /**
		IgnoredName 10

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName10(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName10():String {
        return untyped this.GetKeyValues().IgnoredName10;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName10(value:String):String {
        return untyped this.SetKeyValue("IgnoredName10",untyped value);
    }
    
    /**
		IgnoredName 11

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName11(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName11():String {
        return untyped this.GetKeyValues().IgnoredName11;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName11(value:String):String {
        return untyped this.SetKeyValue("IgnoredName11",untyped value);
    }
    
    /**
		IgnoredName 12

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName12(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName12():String {
        return untyped this.GetKeyValues().IgnoredName12;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName12(value:String):String {
        return untyped this.SetKeyValue("IgnoredName12",untyped value);
    }
    
    /**
		IgnoredName 13

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName13(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName13():String {
        return untyped this.GetKeyValues().IgnoredName13;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName13(value:String):String {
        return untyped this.SetKeyValue("IgnoredName13",untyped value);
    }
    
    /**
		IgnoredName 14

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName14(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName14():String {
        return untyped this.GetKeyValues().IgnoredName14;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName14(value:String):String {
        return untyped this.SetKeyValue("IgnoredName14",untyped value);
    }
    
    /**
		IgnoredName 15

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName15(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName15():String {
        return untyped this.GetKeyValues().IgnoredName15;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName15(value:String):String {
        return untyped this.SetKeyValue("IgnoredName15",untyped value);
    }
    
    /**
		IgnoredName 16

		Do not send this entity's information back to hammer during hammer_update_safe_entities
	**/
    public var IgnoredName16(get,set):String;

    @:noCompletion
    public extern inline function get_IgnoredName16():String {
        return untyped this.GetKeyValues().IgnoredName16;
    }
    
    @:noCompletion
    public extern inline function set_IgnoredName16(value:String):String {
        return untyped this.SetKeyValue("IgnoredName16",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Hammer_updateignorelist}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Hammer_updateignorelist}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Hammer_updateignorelist}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Hammer_updateignorelist}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("hammer_updateignorelist");
    }
}





#end
