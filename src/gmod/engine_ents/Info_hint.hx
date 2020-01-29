package gmod.engine_ents;
#if server
/**
	A hint that is not used for navigation. They don't go into the nodegraph, nor do they fall to the ground. Use these to provide some spatial context for NPCs, such as 'look here if you can't find the player' or 'throw rocks at this spot'.
**/
@:forward
abstract Info_hint(Entity) to Entity {
    //Inputs
    
    /**
		Enable hint.
	**/
    public extern inline function FireEnableHint(delay:Float) {
        untyped this.Fire("EnableHint",untyped null,delay);
    }
    
    /**
		Disable hint.
	**/
    public extern inline function FireDisableHint(delay:Float) {
        untyped this.Fire("DisableHint",untyped null,delay);
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
		Pitch Yaw Roll (Y Z X)

		This entity's orientation in the world. Pitch is rotation around the Y axis, yaw is the rotation around the Z axis, roll is the rotation around the X axis.
	**/
    public var angles(get,set):Angle;

    @:noCompletion
    public extern inline function get_angles():Angle {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:Angle):Angle {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    /**
		Hint
	**/
    public var hinttype(get,set):Info_hinthinttypeChoices;

    @:noCompletion
    public extern inline function get_hinttype():Info_hinthinttypeChoices {
        return untyped this.GetKeyValues().hinttype;
    }
    
    @:noCompletion
    public extern inline function set_hinttype(value:Info_hinthinttypeChoices):Info_hinthinttypeChoices {
        return untyped this.SetKeyValue("hinttype",untyped value);
    }
    
    /**
		Hint Activity

		Activity associated with this hint node. Various parts of the NPC AI play this activity at times. i.e. Actbusy nodes will play this activity when an NPC acts busy on the node.
	**/
    public var hintactivity(get,set):String;

    @:noCompletion
    public extern inline function get_hintactivity():String {
        return untyped this.GetKeyValues().hintactivity;
    }
    
    @:noCompletion
    public extern inline function set_hintactivity(value:String):String {
        return untyped this.SetKeyValue("hintactivity",untyped value);
    }
    
    /**
		Node FOV

		Imagine this node requires that an NPC be in the node's field of view in order to use this hint.
	**/
    public var nodeFOV(get,set):Info_hintnodeFOVChoices;

    @:noCompletion
    public extern inline function get_nodeFOV():Info_hintnodeFOVChoices {
        return untyped this.GetKeyValues().nodeFOV;
    }
    
    @:noCompletion
    public extern inline function set_nodeFOV(value:Info_hintnodeFOVChoices):Info_hintnodeFOVChoices {
        return untyped this.SetKeyValue("nodeFOV",untyped value);
    }
    
    /**
		Start Hint Disabled
	**/
    public var StartHintDisabled(get,set):Info_hintStartHintDisabledChoices;

    @:noCompletion
    public extern inline function get_StartHintDisabled():Info_hintStartHintDisabledChoices {
        return untyped this.GetKeyValues().StartHintDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartHintDisabled(value:Info_hintStartHintDisabledChoices):Info_hintStartHintDisabledChoices {
        return untyped this.SetKeyValue("StartHintDisabled",untyped value);
    }
    
    /**
		Hint Group

		If specified, gives the hint a specific group name.  Useful for hint nodes that need to be logically grouped together. NPCs may also refuse to use hint nodes that don't match their hint group.
	**/
    public var Group(get,set):String;

    @:noCompletion
    public extern inline function get_Group():String {
        return untyped this.GetKeyValues().Group;
    }
    
    @:noCompletion
    public extern inline function set_Group(value:String):String {
        return untyped this.SetKeyValue("Group",untyped value);
    }
    
    /**
		Target node

		The node ID of an associated target node, if any.
	**/
    public var TargetNode(get,set):String;

    @:noCompletion
    public extern inline function get_TargetNode():String {
        return untyped this.GetKeyValues().TargetNode;
    }
    
    @:noCompletion
    public extern inline function set_TargetNode(value:String):String {
        return untyped this.SetKeyValue("TargetNode",untyped value);
    }
    
    /**
		Ignore Facing

		Don't pay attention to the facing of the node. May not apply to a given hint type.
	**/
    public var IgnoreFacing(get,set):Info_hintIgnoreFacingChoices;

    @:noCompletion
    public extern inline function get_IgnoreFacing():Info_hintIgnoreFacingChoices {
        return untyped this.GetKeyValues().IgnoreFacing;
    }
    
    @:noCompletion
    public extern inline function set_IgnoreFacing(value:Info_hintIgnoreFacingChoices):Info_hintIgnoreFacingChoices {
        return untyped this.SetKeyValue("IgnoreFacing",untyped value);
    }
    
    /**
		Minimum State

		Require an NPC have a minimum state to use the hint.
	**/
    public var MinimumState(get,set):Info_hintMinimumStateChoices;

    @:noCompletion
    public extern inline function get_MinimumState():Info_hintMinimumStateChoices {
        return untyped this.GetKeyValues().MinimumState;
    }
    
    @:noCompletion
    public extern inline function set_MinimumState(value:Info_hintMinimumStateChoices):Info_hintMinimumStateChoices {
        return untyped this.SetKeyValue("MinimumState",untyped value);
    }
    
    /**
		Maximum State

		Require an NPC have a maximum state to use the hint.
	**/
    public var MaximumState(get,set):Info_hintMaximumStateChoices;

    @:noCompletion
    public extern inline function get_MaximumState():Info_hintMaximumStateChoices {
        return untyped this.GetKeyValues().MaximumState;
    }
    
    @:noCompletion
    public extern inline function set_MaximumState(value:Info_hintMaximumStateChoices):Info_hintMaximumStateChoices {
        return untyped this.SetKeyValue("MaximumState",untyped value);
    }
    
    /**
		Node ID
	**/
    public var nodeid(get,never):Int;

    @:noCompletion
    public extern inline function get_nodeid():Int {
        return untyped this.GetKeyValues().nodeid;
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
    public extern inline function OutputOnUser1(callback:Callback<{activator:Info_hint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Info_hint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Info_hint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Info_hint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Info_hintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Info_hintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Info_hintSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_hint");
    }
}

enum abstract Info_hintnodeFOVChoices(Int) to Int {
	var _45_DEGREES = 45;
	var _90_DEGREES = 90;
	var _180_DEGREES = 180;
	var _360_DEGREES = 360;
}
enum abstract Info_hinthinttypeChoices(Int) to Int {
	var NONE = 0;
	var WORLD_WINDOW = 2;
	var WORLD_ACT_BUSY_HINT = 12;
	var WORLD_VISUALLY_INTERESTING = 13;
	var WORLD_VISUALLY_INTERESTING_DONT_AIM_AT = 14;
	var WORLD_INHIBIT_COMBINE_MINES_WITHIN_15_FEET = 15;
	var WORLD_VISUALLY_INTERESTING_STEALTH_MODE = 16;
	var CROUCH_COVER_MEDIUM = 100;
	var CROUCH_COVER_LOW = 101;
	var WASTE_SCANNER_SPAWN = 102;
	var ENTRANCE__EXIT_PINCH = 103;
	var ENEMY_DISADVANTAGE_POINT = 105;
	var HEALTH_KIT = 106;
	var ANTLION_BURROW_POINT = 400;
	var ANTLION_THUMPER_FLEE_POINT = 401;
	var HEADCRAB_BURROW_POINT = 450;
	var HEADCRAB_EXIT_POD_POINT = 451;
	var ROLLER_PATROL_POINT = 500;
	var ROLLER_CLEANUP_SPOT = 501;
	var CROW_FLY_TO_POINT = 700;
	var CROW_PERCH_POINT = 701;
	var FOLLOWER_WAIT_POINT = 900;
	var OVERRIDE_JUMP_PERMISSION = 901;
	var PLAYER_SQUAD_TRANSITION_POINT = 902;
	var NPC_EXIT_POINT = 903;
	var STRIDER_NODE = 904;
	var PLAYER_ALLY_PUSH_AWAY_DESTINATION = 950;
	var PLAYER_ALLY_FEAR_WITHDRAWAL_DESTINATION = 951;
	var HL1_WORLD_MACHINERY = 1000;
	var HL1_WORLD_BLINKING_LIGHT = 1001;
	var HL1_WORLD_HUMAN_BLOOD = 1002;
	var HL1_WORLD_ALIEN_BLOOD = 1003;
}
enum abstract Info_hintStartHintDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Info_hintMinimumStateChoices(Int) to Int {
	var IDLE = 1;
	var ALERT = 2;
	var COMBAT = 3;
}
enum abstract Info_hintMaximumStateChoices(Int) to Int {
	var IDLE = 1;
	var ALERT = 2;
	var COMBAT = 3;
}
enum abstract Info_hintIgnoreFacingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DEFAULT = 2;
}


enum abstract Info_hintSpawnFlags(Int) to Int {
	var ALLOW_JUMP_UP = 65536;
}

#end
