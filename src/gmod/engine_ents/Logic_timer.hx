package gmod.engine_ents;
#if server
/**
	An entity that fires a timer event at regular, or random, intervals. It can also be set to oscillate betweena high and low end, in which case it will fire alternating high/low outputs each time it fires.
**/
@:forward
abstract Logic_timer(Entity) to Entity {
    //Inputs
    
    /**
		Enable this entity.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
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
    
    /**
		Set a new Refire Interval.
	**/
    public extern inline function FireRefireTime(param:Int,delay:Float) {
        untyped this.Fire("RefireTime",untyped param,delay);
    }
    
    /**
		Reset the timer. It will fire after the Refire Interval expires.
	**/
    public extern inline function FireResetTimer(delay:Float) {
        untyped this.Fire("ResetTimer",untyped null,delay);
    }
    
    /**
		Force the timer to fire immediately.
	**/
    public extern inline function FireFireTimer(delay:Float) {
        untyped this.Fire("FireTimer",untyped null,delay);
    }
    
    /**
		Enable the timer.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the timer.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Toggle the timer on/off.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Set a new Minimum Random Interval.
	**/
    public extern inline function FireLowerRandomBound(param:Float,delay:Float) {
        untyped this.Fire("LowerRandomBound",untyped param,delay);
    }
    
    /**
		Set a new Maximum Random Interval.
	**/
    public extern inline function FireUpperRandomBound(param:Float,delay:Float) {
        untyped this.Fire("UpperRandomBound",untyped param,delay);
    }
    
    /**
		Add time to the timer if it is currently enabled.  Does not change the Refire Interval.
	**/
    public extern inline function FireAddToTimer(param:Float,delay:Float) {
        untyped this.Fire("AddToTimer",untyped param,delay);
    }
    
    /**
		Subtract time from the timer if it is currently enabled.  Does not change the Refire Interval.
	**/
    public extern inline function FireSubtractFromTimer(param:Float,delay:Float) {
        untyped this.Fire("SubtractFromTimer",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Logic_timerStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Logic_timerStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Logic_timerStartDisabledChoices):Logic_timerStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
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
		Use Random Time
	**/
    public var UseRandomTime(get,set):Logic_timerUseRandomTimeChoices;

    @:noCompletion
    public extern inline function get_UseRandomTime():Logic_timerUseRandomTimeChoices {
        return untyped this.GetKeyValues().UseRandomTime;
    }
    
    @:noCompletion
    public extern inline function set_UseRandomTime(value:Logic_timerUseRandomTimeChoices):Logic_timerUseRandomTimeChoices {
        return untyped this.SetKeyValue("UseRandomTime",untyped value);
    }
    
    /**
		Minimum Random Interval

		If 'Use Random Time' is set, this is the minimum time between timer fires. The time will be a random number between this and the 'Maximum Random Interval'.
	**/
    public var LowerRandomBound(get,set):String;

    @:noCompletion
    public extern inline function get_LowerRandomBound():String {
        return untyped this.GetKeyValues().LowerRandomBound;
    }
    
    @:noCompletion
    public extern inline function set_LowerRandomBound(value:String):String {
        return untyped this.SetKeyValue("LowerRandomBound",untyped value);
    }
    
    /**
		Maximum Random Interval

		If 'Use Random Time' is set, this is the maximum time between timer fires. The time will be a random number between the 'Minimum Random Interval' and this.
	**/
    public var UpperRandomBound(get,set):String;

    @:noCompletion
    public extern inline function get_UpperRandomBound():String {
        return untyped this.GetKeyValues().UpperRandomBound;
    }
    
    @:noCompletion
    public extern inline function set_UpperRandomBound(value:String):String {
        return untyped this.SetKeyValue("UpperRandomBound",untyped value);
    }
    
    /**
		Refire Interval

		If 'Use Random Time' isn't set, this is the time between timer fires, in seconds.
	**/
    public var RefireTime(get,set):String;

    @:noCompletion
    public extern inline function get_RefireTime():String {
        return untyped this.GetKeyValues().RefireTime;
    }
    
    @:noCompletion
    public extern inline function set_RefireTime(value:String):String {
        return untyped this.SetKeyValue("RefireTime",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the timer expires.
	**/
    public extern inline function OutputOnTimer(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTimer",callback);
    }
    
    /**
		Fired every other time for an oscillating timer.
	**/
    public extern inline function OutputOnTimerHigh(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTimerHigh",callback);
    }
    
    /**
		Fired every other time for an oscillating timer.
	**/
    public extern inline function OutputOnTimerLow(callback:Callback<{activator:Logic_timer}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTimerLow",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Logic_timerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Logic_timerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Logic_timerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_timer");
    }
}

enum abstract Logic_timerUseRandomTimeChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Logic_timerStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Logic_timerSpawnFlags(Int) to Int {
	var OSCILLATOR_ALTERNATES_BETWEEN_ONTIMERHIGH_AND_ONTIMERLOW_OUTPUTS = 1;
}

#end
