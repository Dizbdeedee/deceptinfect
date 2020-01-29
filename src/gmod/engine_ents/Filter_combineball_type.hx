package gmod.engine_ents;
#if server
/**
	A filter that filters by combine ball type.
**/
@:forward
abstract Filter_combineball_type(Entity) to Entity {
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
    public var Negated(get,set):Filter_combineball_typeNegatedChoices;

    @:noCompletion
    public extern inline function get_Negated():Filter_combineball_typeNegatedChoices {
        return untyped this.GetKeyValues().Negated;
    }
    
    @:noCompletion
    public extern inline function set_Negated(value:Filter_combineball_typeNegatedChoices):Filter_combineball_typeNegatedChoices {
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
		Ball Type
	**/
    public var balltype(get,set):Filter_combineball_typeballtypeChoices;

    @:noCompletion
    public extern inline function get_balltype():Filter_combineball_typeballtypeChoices {
        return untyped this.GetKeyValues().balltype;
    }
    
    @:noCompletion
    public extern inline function set_balltype(value:Filter_combineball_typeballtypeChoices):Filter_combineball_typeballtypeChoices {
        return untyped this.SetKeyValue("balltype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to TestActivator input if the activator passes the filter.
	**/
    public extern inline function OutputOnPass(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPass",callback);
    }
    
    /**
		Fired in response to TestActivator input if the activator fails to pass the filter.
	**/
    public extern inline function OutputOnFail(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFail",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Filter_combineball_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("filter_combineball_type");
    }
}

enum abstract Filter_combineball_typeballtypeChoices(Int) to Int {
	var NOT_THROWN_IN_COMBINE_BALL_FIELD_ETC = 0;
	var THROWNLAUNCHED_BY_THE_PLAYERS_PHYSCANNON = 2;
	var LAUNCHED_BY_POINTCOMBINEBALLLAUNCHER = 3;
}
enum abstract Filter_combineball_typeNegatedChoices(Int) to Int {
	var ALLOW_ENTITIES_THAT_MATCH_CRITERIA = 0;
	var DISALLOW_ENTITIES_THAT_MATCH_CRITERIA = 1;
}




#end
