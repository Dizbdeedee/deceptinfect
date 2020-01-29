package gmod.engine_ents;
#if server
/**
	AI Goal Injured Follow
**/
@:forward
abstract Ai_goal_injured_follow(Entity) to Entity {
    //Inputs
    
    /**
		Begin the follow behavior
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Cease the follow behavior
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
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
		Actor(s) to affect
	**/
    public var actor(get,set):String;

    @:noCompletion
    public extern inline function get_actor():String {
        return untyped this.GetKeyValues().actor;
    }
    
    @:noCompletion
    public extern inline function set_actor(value:String):String {
        return untyped this.SetKeyValue("actor",untyped value);
    }
    
    /**
		Target Entity

		The name of the entity to follow. If blank, and the actor likes the player, then defaults to player
	**/
    public var goal(get,set):String;

    @:noCompletion
    public extern inline function get_goal():String {
        return untyped this.GetKeyValues().goal;
    }
    
    @:noCompletion
    public extern inline function set_goal(value:String):String {
        return untyped this.SetKeyValue("goal",untyped value);
    }
    
    /**
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_injured_followSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_injured_followSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_injured_followSearchTypeChoices):Ai_goal_injured_followSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    /**
		Start Active
	**/
    public var StartActive(get,set):Ai_goal_injured_followStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_goal_injured_followStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_goal_injured_followStartActiveChoices):Ai_goal_injured_followStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Maximum state
	**/
    public var MaximumState(get,set):Ai_goal_injured_followMaximumStateChoices;

    @:noCompletion
    public extern inline function get_MaximumState():Ai_goal_injured_followMaximumStateChoices {
        return untyped this.GetKeyValues().MaximumState;
    }
    
    @:noCompletion
    public extern inline function set_MaximumState(value:Ai_goal_injured_followMaximumStateChoices):Ai_goal_injured_followMaximumStateChoices {
        return untyped this.SetKeyValue("MaximumState",untyped value);
    }
    
    /**
		Formation
	**/
    public var Formation(get,set):Ai_goal_injured_followFormationChoices;

    @:noCompletion
    public extern inline function get_Formation():Ai_goal_injured_followFormationChoices {
        return untyped this.GetKeyValues().Formation;
    }
    
    @:noCompletion
    public extern inline function set_Formation(value:Ai_goal_injured_followFormationChoices):Ai_goal_injured_followFormationChoices {
        return untyped this.SetKeyValue("Formation",untyped value);
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_injured_follow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_injured_follow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_injured_follow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_injured_follow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_injured_follow");
    }
}

enum abstract Ai_goal_injured_followStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_injured_followSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}
enum abstract Ai_goal_injured_followMaximumStateChoices(Int) to Int {
	var IDLE = 1;
	var ALERT = 2;
	var COMBAT = 3;
}
enum abstract Ai_goal_injured_followFormationChoices(Int) to Int {
	var CLOSE_CIRCLE = 0;
	var WIDE_CIRCLE = 1;
	var MEDIUM_CIRCLE = 5;
	var SIDEKICK = 6;
	var VORTIGAUNT = 8;
}




#end
