package gmod.engine_ents;
#if server
/**
	An entity to control a game-specific global states.
**/
@:forward
abstract Env_global(Entity) to Entity {
    //Inputs
    
    /**
		Set state of global to ON.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Set state of global to OFF.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggles state of global between ON and OFF.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Set state of global to DEAD.
	**/
    public extern inline function FireRemove(delay:Float) {
        untyped this.Fire("Remove",untyped null,delay);
    }
    
    /**
		Sets the counter value of this global.
	**/
    public extern inline function FireSetCounter(param:Int,delay:Float) {
        untyped this.Fire("SetCounter",untyped param,delay);
    }
    
    /**
		Adds to the counter value of this global. Negative numbers subtract.
	**/
    public extern inline function FireAddToCounter(param:Int,delay:Float) {
        untyped this.Fire("AddToCounter",untyped param,delay);
    }
    
    /**
		Causes the Counter output to be fired, passing the current counter value for this global.
	**/
    public extern inline function FireGetCounter(delay:Float) {
        untyped this.Fire("GetCounter",untyped null,delay);
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
		Initial State
	**/
    public var initialstate(get,set):Env_globalinitialstateChoices;

    @:noCompletion
    public extern inline function get_initialstate():Env_globalinitialstateChoices {
        return untyped this.GetKeyValues().initialstate;
    }
    
    @:noCompletion
    public extern inline function set_initialstate(value:Env_globalinitialstateChoices):Env_globalinitialstateChoices {
        return untyped this.SetKeyValue("initialstate",untyped value);
    }
    
    /**
		Counter

		An integer counter value associated with this global.
	**/
    public var counter(get,set):Int;

    @:noCompletion
    public extern inline function get_counter():Int {
        return untyped this.GetKeyValues().counter;
    }
    
    @:noCompletion
    public extern inline function set_counter(value:Int):Int {
        return untyped this.SetKeyValue("counter",untyped value);
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
		Global State to Set
	**/
    public var globalstate(get,set):Env_globalglobalstateChoices;

    @:noCompletion
    public extern inline function get_globalstate():Env_globalglobalstateChoices {
        return untyped this.GetKeyValues().globalstate;
    }
    
    @:noCompletion
    public extern inline function set_globalstate(value:Env_globalglobalstateChoices):Env_globalglobalstateChoices {
        return untyped this.SetKeyValue("globalstate",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to the GetCounter input, passing the current value of the counter.
	**/
    public extern inline function OutputCounter(callback:Callback<{activator:Env_global,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"Counter",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_global}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_global}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_global}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_global}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_globalSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_globalSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_globalSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_global");
    }
}

enum abstract Env_globalinitialstateChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
	var DEAD = 2;
}
enum abstract Env_globalglobalstateChoices(String) to String {
	var GORDON_PRECRIMINAL = "gordon_precriminal";
	var ANTLIONS_ARE_PLAYER_ALLIES = "antlion_allied";
	var SUIT_SPRINT_FUNCTION_NOT_YET_ENABLED = "suit_no_sprint";
	var SUPER_PHYS_GUN_IS_ENABLED = "super_phys_gun";
	var FRIENDLY_ENCOUNTER_SEQUENCE_LOWER_WEAPONS_ETC = "friendly_encounter";
	var GORDON_IS_INVULNERABLE = "gordon_invulnerable";
	var DONT_SPAWN_SEAGULLS_ON_THE_JEEP = "no_seagulls_on_jeep";
	var EPISODE_2_ALYX_INJURED = "ep2_alyx_injured";
	var EPISODIC_ALYX_DARKNESS_MODE = "ep_alyx_darknessmode";
	var EP2_COUNTER_HUNTERS_TO_RUN_OVER_BEFORE_THEY_DODGE = "hunters_to_run_over";
}


enum abstract Env_globalSpawnFlags(Int) to Int {
	var SET_INITIAL_STATE = 1;
}

#end
