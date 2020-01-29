package gmod.engine_ents;
#if server
/**
	A damage filter that filters by the type of damage inflicted. This can only be used as a damage filter, not as an activator filter.
**/
@:forward
abstract Filter_damage_type(Entity) to Entity {
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
    public var Negated(get,set):Filter_damage_typeNegatedChoices;

    @:noCompletion
    public extern inline function get_Negated():Filter_damage_typeNegatedChoices {
        return untyped this.GetKeyValues().Negated;
    }
    
    @:noCompletion
    public extern inline function set_Negated(value:Filter_damage_typeNegatedChoices):Filter_damage_typeNegatedChoices {
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
		Damage type

		The damage type to filter by. If the filter mode is Allow, only damage types that match will pass the filter. If the filter mode is Disallow, all damage types EXCEPT those who match will pass the filter.
	**/
    public var damagetype(get,set):Filter_damage_typedamagetypeChoices;

    @:noCompletion
    public extern inline function get_damagetype():Filter_damage_typedamagetypeChoices {
        return untyped this.GetKeyValues().damagetype;
    }
    
    @:noCompletion
    public extern inline function set_damagetype(value:Filter_damage_typedamagetypeChoices):Filter_damage_typedamagetypeChoices {
        return untyped this.SetKeyValue("damagetype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to TestActivator input if the activator passes the filter.
	**/
    public extern inline function OutputOnPass(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPass",callback);
    }
    
    /**
		Fired in response to TestActivator input if the activator fails to pass the filter.
	**/
    public extern inline function OutputOnFail(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFail",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Filter_damage_type}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("filter_damage_type");
    }
}

enum abstract Filter_damage_typedamagetypeChoices(Int) to Int {
	var GENERIC = 0;
	var CRUSH = 1;
	var BULLET = 2;
	var SLASH = 4;
	var BURN = 8;
	var FREEZE = 16;
	var FALL = 32;
	var BLAST = 64;
	var CLUB = 128;
	var SHOCK = 256;
	var SONIC = 512;
	var ENERGYBEAM = 1024;
	var DROWN = 16384;
	var PARALYSE = 32768;
	var NERVEGAS = 65536;
	var POISON = 131072;
	var RADIATION = 262144;
	var DROWNRECOVER = 524288;
	var CHEMICAL = 1048576;
	var SLOWBURN = 2097152;
	var SLOWFREEZE = 4194304;
}
enum abstract Filter_damage_typeNegatedChoices(Int) to Int {
	var ALLOW_ENTITIES_THAT_MATCH_CRITERIA = 0;
	var DISALLOW_ENTITIES_THAT_MATCH_CRITERIA = 1;
}




#end
