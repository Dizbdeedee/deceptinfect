package gmod.engine_ents;
#if server
/**
	A filter that tests the activator against multiple filters. This allows you to build more complex filters, such as'Allow anyone on Team 1 who is also class engineer', or 'Allow everyone except classes npc_zombie and npc_headcrab'.
**/
@:forward
abstract Filter_multi(Entity) to Entity {
    //Inputs
    
    /**
		Test the activator against the filter and fires OnPass or OnFail output.
	**/
    public extern inline function FireTestActivator(delay:Float) {
        untyped this.Fire("TestActivator",untyped null,delay);
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
		Filter mode

		If set to Allow, only entities who match the criteria will pass the filter. If set to Disallow, only entities who do NOT match the criteria will pass the filter.
	**/
    public var Negated(get,set):Filter_multiNegatedChoices;

    @:noCompletion
    public extern inline function get_Negated():Filter_multiNegatedChoices {
        return untyped this.GetKeyValues().Negated;
    }
    
    @:noCompletion
    public extern inline function set_Negated(value:Filter_multiNegatedChoices):Filter_multiNegatedChoices {
        return untyped this.SetKeyValue("Negated",untyped value);
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
		Logic Type
	**/
    public var filtertype(get,set):Filter_multifiltertypeChoices;

    @:noCompletion
    public extern inline function get_filtertype():Filter_multifiltertypeChoices {
        return untyped this.GetKeyValues().filtertype;
    }
    
    @:noCompletion
    public extern inline function set_filtertype(value:Filter_multifiltertypeChoices):Filter_multifiltertypeChoices {
        return untyped this.SetKeyValue("filtertype",untyped value);
    }
    
    /**
		Negate Outcome

		Whether to negate the result of the subfilters, after combining them using the Logic Type chosen.
Negating the outcome using the AND logic type means that any subfilter must fail for this filter to pass.
Negating the outcome using the OR logic type means that all subfilters must fail for this filter to pass.
	**/
    public var Negated(get,set):Filter_multiNegatedChoices;

    @:noCompletion
    public extern inline function get_Negated():Filter_multiNegatedChoices {
        return untyped this.GetKeyValues().Negated;
    }
    
    @:noCompletion
    public extern inline function set_Negated(value:Filter_multiNegatedChoices):Filter_multiNegatedChoices {
        return untyped this.SetKeyValue("Negated",untyped value);
    }
    
    /**
		Filter 1

		Activator filter to test.
	**/
    public var Filter01(get,set):String;

    @:noCompletion
    public extern inline function get_Filter01():String {
        return untyped this.GetKeyValues().Filter01;
    }
    
    @:noCompletion
    public extern inline function set_Filter01(value:String):String {
        return untyped this.SetKeyValue("Filter01",untyped value);
    }
    
    /**
		Filter 2

		Activator filter to test.
	**/
    public var Filter02(get,set):String;

    @:noCompletion
    public extern inline function get_Filter02():String {
        return untyped this.GetKeyValues().Filter02;
    }
    
    @:noCompletion
    public extern inline function set_Filter02(value:String):String {
        return untyped this.SetKeyValue("Filter02",untyped value);
    }
    
    /**
		Filter 3

		Activator filter to test.
	**/
    public var Filter03(get,set):String;

    @:noCompletion
    public extern inline function get_Filter03():String {
        return untyped this.GetKeyValues().Filter03;
    }
    
    @:noCompletion
    public extern inline function set_Filter03(value:String):String {
        return untyped this.SetKeyValue("Filter03",untyped value);
    }
    
    /**
		Filter 4

		Activator filter to test.
	**/
    public var Filter04(get,set):String;

    @:noCompletion
    public extern inline function get_Filter04():String {
        return untyped this.GetKeyValues().Filter04;
    }
    
    @:noCompletion
    public extern inline function set_Filter04(value:String):String {
        return untyped this.SetKeyValue("Filter04",untyped value);
    }
    
    /**
		Filter 5

		Activator filter to test.
	**/
    public var Filter05(get,set):String;

    @:noCompletion
    public extern inline function get_Filter05():String {
        return untyped this.GetKeyValues().Filter05;
    }
    
    @:noCompletion
    public extern inline function set_Filter05(value:String):String {
        return untyped this.SetKeyValue("Filter05",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to TestActivator input if the activator passes the filter.
	**/
    public extern inline function OutputOnPass(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPass",callback);
    }
    
    /**
		Fired in response to TestActivator input if the activator fails to pass the filter.
	**/
    public extern inline function OutputOnFail(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFail",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Filter_multi}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("filter_multi");
    }
}

enum abstract Filter_multifiltertypeChoices(Int) to Int {
	var AND_ALL_FILTERS_MUST_PASS = 0;
	var OR_ANY_FILTER_MUST_PASS = 1;
}
enum abstract Filter_multiNegatedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
