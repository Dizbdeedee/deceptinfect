package gmod.engine_ents;
#if server
/**
	A brush entity that spawns a translucent dust cloud within its volume.
**/
@:forward
abstract Func_dustcloud(Entity) to Entity {
    //Inputs
    
    /**
		Turn on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
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
		Start Disabled
	**/
    public var StartDisabled(get,set):Func_dustcloudStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Func_dustcloudStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Func_dustcloudStartDisabledChoices):Func_dustcloudStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Particle Color (R G B)
	**/
    public var Color(get,set):String;

    @:noCompletion
    public extern inline function get_Color():String {
        return untyped this.GetKeyValues().Color;
    }
    
    @:noCompletion
    public extern inline function set_Color(value:String):String {
        return untyped this.SetKeyValue("Color",untyped value);
    }
    
    /**
		Particle Per Second

		Number of particles to spawn, per second.
	**/
    public var SpawnRate(get,set):Int;

    @:noCompletion
    public extern inline function get_SpawnRate():Int {
        return untyped this.GetKeyValues().SpawnRate;
    }
    
    @:noCompletion
    public extern inline function set_SpawnRate(value:Int):Int {
        return untyped this.SetKeyValue("SpawnRate",untyped value);
    }
    
    /**
		Maximum Particle Speed

		Maximum speed that the particles can move after spawning.
	**/
    public var SpeedMax(get,set):String;

    @:noCompletion
    public extern inline function get_SpeedMax():String {
        return untyped this.GetKeyValues().SpeedMax;
    }
    
    @:noCompletion
    public extern inline function set_SpeedMax(value:String):String {
        return untyped this.SetKeyValue("SpeedMax",untyped value);
    }
    
    /**
		Minimum Particle Lifetime

		Minimum number of seconds until each particle dies. Particles live for a random duration between this and 'Maximum Particle Lifetime'.
	**/
    public var LifetimeMin(get,set):String;

    @:noCompletion
    public extern inline function get_LifetimeMin():String {
        return untyped this.GetKeyValues().LifetimeMin;
    }
    
    @:noCompletion
    public extern inline function set_LifetimeMin(value:String):String {
        return untyped this.SetKeyValue("LifetimeMin",untyped value);
    }
    
    /**
		Maximum Particle Lifetime

		Maximum number of seconds until each particle dies. Particles live for a random duration between 'Minimum Particle Lifetime' and this.
	**/
    public var LifetimeMax(get,set):String;

    @:noCompletion
    public extern inline function get_LifetimeMax():String {
        return untyped this.GetKeyValues().LifetimeMax;
    }
    
    @:noCompletion
    public extern inline function set_LifetimeMax(value:String):String {
        return untyped this.SetKeyValue("LifetimeMax",untyped value);
    }
    
    /**
		Maximum Visible Distance

		Maximum distance at which particles are visible. They fade to translucent at this distance.
	**/
    public var DistMax(get,set):Int;

    @:noCompletion
    public extern inline function get_DistMax():Int {
        return untyped this.GetKeyValues().DistMax;
    }
    
    @:noCompletion
    public extern inline function set_DistMax(value:Int):Int {
        return untyped this.SetKeyValue("DistMax",untyped value);
    }
    
    /**
		Frozen

		When set, this entity spawns the number of particles in SpawnRate immediately, and then goes inactive.
	**/
    public var Frozen(get,set):Func_dustcloudFrozenChoices;

    @:noCompletion
    public extern inline function get_Frozen():Func_dustcloudFrozenChoices {
        return untyped this.GetKeyValues().Frozen;
    }
    
    @:noCompletion
    public extern inline function set_Frozen(value:Func_dustcloudFrozenChoices):Func_dustcloudFrozenChoices {
        return untyped this.SetKeyValue("Frozen",untyped value);
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
		Alpha
	**/
    public var Alpha(get,set):Int;

    @:noCompletion
    public extern inline function get_Alpha():Int {
        return untyped this.GetKeyValues().Alpha;
    }
    
    @:noCompletion
    public extern inline function set_Alpha(value:Int):Int {
        return untyped this.SetKeyValue("Alpha",untyped value);
    }
    
    /**
		Minimum Particle Size
	**/
    public var SizeMin(get,set):String;

    @:noCompletion
    public extern inline function get_SizeMin():String {
        return untyped this.GetKeyValues().SizeMin;
    }
    
    @:noCompletion
    public extern inline function set_SizeMin(value:String):String {
        return untyped this.SetKeyValue("SizeMin",untyped value);
    }
    
    /**
		Maximum Particle Size
	**/
    public var SizeMax(get,set):String;

    @:noCompletion
    public extern inline function get_SizeMax():String {
        return untyped this.GetKeyValues().SizeMax;
    }
    
    @:noCompletion
    public extern inline function set_SizeMax(value:String):String {
        return untyped this.SetKeyValue("SizeMax",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_dustcloud}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_dustcloud}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_dustcloud}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_dustcloud}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_dustcloud");
    }
}

enum abstract Func_dustcloudStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_dustcloudFrozenChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
