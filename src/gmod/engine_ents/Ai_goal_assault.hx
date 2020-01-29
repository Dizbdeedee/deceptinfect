package gmod.engine_ents;
#if server
/**
	AI Goal Assault
**/
@:forward
abstract Ai_goal_assault(Entity) to Entity {
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
		Begin the assault behavior
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Cease the assault behavior
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Begin assault phase
	**/
    public extern inline function FireBeginAssault(delay:Float) {
        untyped this.Fire("BeginAssault",untyped null,delay);
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
		Actor(s) to affect

		NPC's that should perform this assault
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
		Rally Point Set

		Root name of rally points for this assault. Use an asterisk '*' after the root name to match all with the same root.
	**/
    public var rallypoint(get,set):String;

    @:noCompletion
    public extern inline function get_rallypoint():String {
        return untyped this.GetKeyValues().rallypoint;
    }
    
    @:noCompletion
    public extern inline function set_rallypoint(value:String):String {
        return untyped this.SetKeyValue("rallypoint",untyped value);
    }
    
    /**
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_assaultSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_assaultSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_assaultSearchTypeChoices):Ai_goal_assaultSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    /**
		Start Active
	**/
    public var StartActive(get,set):Ai_goal_assaultStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_goal_assaultStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_goal_assaultStartActiveChoices):Ai_goal_assaultStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Assault Cue
	**/
    public var AssaultCue(get,set):Ai_goal_assaultAssaultCueChoices;

    @:noCompletion
    public extern inline function get_AssaultCue():Ai_goal_assaultAssaultCueChoices {
        return untyped this.GetKeyValues().AssaultCue;
    }
    
    @:noCompletion
    public extern inline function set_AssaultCue(value:Ai_goal_assaultAssaultCueChoices):Ai_goal_assaultAssaultCueChoices {
        return untyped this.SetKeyValue("AssaultCue",untyped value);
    }
    
    /**
		Rally Point Selection Method
	**/
    public var RallySelectMethod(get,set):Ai_goal_assaultRallySelectMethodChoices;

    @:noCompletion
    public extern inline function get_RallySelectMethod():Ai_goal_assaultRallySelectMethodChoices {
        return untyped this.GetKeyValues().RallySelectMethod;
    }
    
    @:noCompletion
    public extern inline function set_RallySelectMethod(value:Ai_goal_assaultRallySelectMethodChoices):Ai_goal_assaultRallySelectMethodChoices {
        return untyped this.SetKeyValue("RallySelectMethod",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_assault}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_assault}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_assault}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_assault}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_assault");
    }
}

enum abstract Ai_goal_assaultStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_assaultSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}
enum abstract Ai_goal_assaultRallySelectMethodChoices(Int) to Int {
	var PRIORITY_DISTANCE_DEFAULT = 0;
	var RANDOM = 1;
}
enum abstract Ai_goal_assaultAssaultCueChoices(Int) to Int {
	var ENTITY_SYSTEM_INPUT = 1;
	var GUNFIRE = 2;
	var DONT_WAIT_FOR_A_CUE = 3;
}




#end
