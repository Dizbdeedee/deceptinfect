package gmod.engine_ents;
#if server
/**
	An entity that does damage to all entities in a radius around itself, with a specified delay.If 'Target Entity' is specified, the damage is only done to that entity.
**/
@:forward
abstract Point_hurt(Entity) to Entity {
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
		Force a single fire, damaging either the Target Entity or all entities within the radius.
	**/
    public extern inline function FireHurt(delay:Float) {
        untyped this.Fire("Hurt",untyped null,delay);
    }
    
    /**
		Enable this entity. It will start damaging entities everytime it fires, and refire based upon the specified Delay.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Disable this entity. It will stop damaging entities.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggle this entity between On/Off state.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
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
		Target Entity

		If specified, only this entity will take damage. Otherwise, all entities within the Radius will take damage.
	**/
    public var DamageTarget(get,set):String;

    @:noCompletion
    public extern inline function get_DamageTarget():String {
        return untyped this.GetKeyValues().DamageTarget;
    }
    
    @:noCompletion
    public extern inline function set_DamageTarget(value:String):String {
        return untyped this.SetKeyValue("DamageTarget",untyped value);
    }
    
    /**
		Radius

		All entities within this radius of this entity will take damage. If a 'Target Entity' is specified, only that entity will take damage.
	**/
    public var DamageRadius(get,set):Float;

    @:noCompletion
    public extern inline function get_DamageRadius():Float {
        return untyped this.GetKeyValues().DamageRadius;
    }
    
    @:noCompletion
    public extern inline function set_DamageRadius(value:Float):Float {
        return untyped this.SetKeyValue("DamageRadius",untyped value);
    }
    
    /**
		Damage

		Damage done to all affected entities each time this entity fires.
	**/
    public var Damage(get,set):Int;

    @:noCompletion
    public extern inline function get_Damage():Int {
        return untyped this.GetKeyValues().Damage;
    }
    
    @:noCompletion
    public extern inline function set_Damage(value:Int):Int {
        return untyped this.SetKeyValue("Damage",untyped value);
    }
    
    /**
		Delay

		Delay between refires, in seconds.
	**/
    public var DamageDelay(get,set):Float;

    @:noCompletion
    public extern inline function get_DamageDelay():Float {
        return untyped this.GetKeyValues().DamageDelay;
    }
    
    @:noCompletion
    public extern inline function set_DamageDelay(value:Float):Float {
        return untyped this.SetKeyValue("DamageDelay",untyped value);
    }
    
    /**
		Damage Type

		Type of damage to inflict on entities damaged.
	**/
    public var DamageType(get,set):Point_hurtDamageTypeChoices;

    @:noCompletion
    public extern inline function get_DamageType():Point_hurtDamageTypeChoices {
        return untyped this.GetKeyValues().DamageType;
    }
    
    @:noCompletion
    public extern inline function set_DamageType(value:Point_hurtDamageTypeChoices):Point_hurtDamageTypeChoices {
        return untyped this.SetKeyValue("DamageType",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_hurt");
    }
}

enum abstract Point_hurtDamageTypeChoices(Int) to Int {
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




#end
