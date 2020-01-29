package gmod.engine_ents;
#if server
/**
	Issues a command to an NPC without taking the NPC out of its AI. This does not seize control of the NPC as a scripted_sequence does
**/
@:forward
abstract Aiscripted_schedule(Entity) to Entity {
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
		Starts the scripted schedule. This will first locate an NPC that matches the given target, then tell the NPC to run the specified schedule.
	**/
    public extern inline function FireStartSchedule(delay:Float) {
        untyped this.Fire("StartSchedule",untyped null,delay);
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
		Target NPC

		The name or classname of an NPC to use.
	**/
    public var m_iszEntity(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszEntity():String {
        return untyped this.GetKeyValues().m_iszEntity;
    }
    
    @:noCompletion
    public extern inline function set_m_iszEntity(value:String):String {
        return untyped this.SetKeyValue("m_iszEntity",untyped value);
    }
    
    /**
		Search Radius (0=everywhere)

		Radius to search within for an NPC to use. 0 searches everywhere.
	**/
    public var m_flRadius(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flRadius():Int {
        return untyped this.GetKeyValues().m_flRadius;
    }
    
    @:noCompletion
    public extern inline function set_m_flRadius(value:Int):Int {
        return untyped this.SetKeyValue("m_flRadius",untyped value);
    }
    
    /**
		All in radius

		Whether to grab all matching NPCs in the specified radius, instead of just one
	**/
    public var graball(get,set):Aiscripted_schedulegraballChoices;

    @:noCompletion
    public extern inline function get_graball():Aiscripted_schedulegraballChoices {
        return untyped this.GetKeyValues().graball;
    }
    
    @:noCompletion
    public extern inline function set_graball(value:Aiscripted_schedulegraballChoices):Aiscripted_schedulegraballChoices {
        return untyped this.SetKeyValue("graball",untyped value);
    }
    
    /**
		AI state to set
	**/
    public var forcestate(get,set):Aiscripted_scheduleforcestateChoices;

    @:noCompletion
    public extern inline function get_forcestate():Aiscripted_scheduleforcestateChoices {
        return untyped this.GetKeyValues().forcestate;
    }
    
    @:noCompletion
    public extern inline function set_forcestate(value:Aiscripted_scheduleforcestateChoices):Aiscripted_scheduleforcestateChoices {
        return untyped this.SetKeyValue("forcestate",untyped value);
    }
    
    /**
		Schedule to run
	**/
    public var schedule(get,set):Aiscripted_schedulescheduleChoices;

    @:noCompletion
    public extern inline function get_schedule():Aiscripted_schedulescheduleChoices {
        return untyped this.GetKeyValues().schedule;
    }
    
    @:noCompletion
    public extern inline function set_schedule(value:Aiscripted_schedulescheduleChoices):Aiscripted_schedulescheduleChoices {
        return untyped this.SetKeyValue("schedule",untyped value);
    }
    
    /**
		Interruptability
	**/
    public var interruptability(get,set):Aiscripted_scheduleinterruptabilityChoices;

    @:noCompletion
    public extern inline function get_interruptability():Aiscripted_scheduleinterruptabilityChoices {
        return untyped this.GetKeyValues().interruptability;
    }
    
    @:noCompletion
    public extern inline function set_interruptability(value:Aiscripted_scheduleinterruptabilityChoices):Aiscripted_scheduleinterruptabilityChoices {
        return untyped this.SetKeyValue("interruptability",untyped value);
    }
    
    /**
		Goal entity

		Provides the name of a schedule-specific goal entity (see 'Schedule to run')
	**/
    public var goalent(get,set):String;

    @:noCompletion
    public extern inline function get_goalent():String {
        return untyped this.GetKeyValues().goalent;
    }
    
    @:noCompletion
    public extern inline function set_goalent(value:String):String {
        return untyped this.SetKeyValue("goalent",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Aiscripted_schedule}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Aiscripted_schedule}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Aiscripted_schedule}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Aiscripted_schedule}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Aiscripted_scheduleSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Aiscripted_scheduleSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Aiscripted_scheduleSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("aiscripted_schedule");
    }
}

enum abstract Aiscripted_schedulescheduleChoices(Int) to Int {
	var NONE = 0;
	var WALK_TO_GOAL_ENTITY = 1;
	var RUN_TO_GOAL_ENTITY = 2;
	var SET_ENEMY_TO_GOAL_ENTITY = 3;
	var WALK_GOAL_PATH = 4;
	var RUN_GOAL_PATH = 5;
	var SET_ENEMY_TO_GOAL_ENTITY_AND_RUN_TO_GOAL_ENTITY = 6;
}
enum abstract Aiscripted_scheduleinterruptabilityChoices(Int) to Int {
	var GENERAL = 0;
	var DAMAGE_OR_DEATH = 1;
	var DEATH = 2;
}
enum abstract Aiscripted_schedulegraballChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Aiscripted_scheduleforcestateChoices(Int) to Int {
	var NONE = 0;
	var SET_STATE_TO_IDLE = 1;
	var SET_STATE_TO_ALERT = 2;
	var SET_STATE_TO_COMBAT = 3;
}


enum abstract Aiscripted_scheduleSpawnFlags(Int) to Int {
	var REPEATABLE = 4;
	var SEARCH_CYCLICALLY = 1024;
	var DONT_COMPLAIN = 2048;
}

#end
