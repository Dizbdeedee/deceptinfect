package gmod.engine_ents;
#if server
/**
	An entity that triggers a level change.
Place an info_landmark in both maps that marks the 'same' location in each map.
TIPS & TRICKS: To fire events in the next level, use the OnLevelChange output to turn on an env_global in the current level.  Create a logic_auto in the next level that checks for the state set by the env_global.

To control which entities go through the level transition, create one or more trigger_transitions and give them the same name as the landmark. Any entities within the trigger_transition(s) will go to the next map.
**/
@:forward
abstract Trigger_changelevel(Entity) to Entity {
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
		Cause the level change. Use this when triggering the level change with a button, etc.
	**/
    public extern inline function FireChangeLevel(delay:Float) {
        untyped this.Fire("ChangeLevel",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Trigger_changelevelStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Trigger_changelevelStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Trigger_changelevelStartDisabledChoices):Trigger_changelevelStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Name
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
		New Map Name
	**/
    public var map(get,set):String;

    @:noCompletion
    public extern inline function get_map():String {
        return untyped this.GetKeyValues().map;
    }
    
    @:noCompletion
    public extern inline function set_map(value:String):String {
        return untyped this.SetKeyValue("map",untyped value);
    }
    
    /**
		Landmark Name
	**/
    public var landmark(get,set):String;

    @:noCompletion
    public extern inline function get_landmark():String {
        return untyped this.GetKeyValues().landmark;
    }
    
    @:noCompletion
    public extern inline function set_landmark(value:String):String {
        return untyped this.SetKeyValue("landmark",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when the level changes.
	**/
    public extern inline function OutputOnChangeLevel(callback:Callback<{activator:Trigger_changelevel}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnChangeLevel",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Trigger_changelevelSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Trigger_changelevelSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Trigger_changelevelSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_changelevel");
    }
}

enum abstract Trigger_changelevelStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Trigger_changelevelSpawnFlags(Int) to Int {
	var DISABLE_TOUCH = 2;
	var TO_PREVIOUS_CHAPTER = 4;
}

#end
