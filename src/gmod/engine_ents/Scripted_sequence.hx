package gmod.engine_ents;
#if server
/**
	Grabs an NPC and makes them play a specified set of animations. The NPC can be told to move to the scripted sequence position or can be told to play the script wherever they currently are. Multiple scripted sequences of the same name will frame-synchronize in the action animation once all the actors have moved to position. This allows tight interaction between actors (one actor grabbing another, hitting them, etc.) The flow is as follows:

1) Move to position using the specified movement animation. If 'Move to Position' is set to NONE, skip to step 2.
2) If forced to wait for another actor to move to position, play the pre-action idle animation, otherwise skip to step 3. If there is no pre-action idle specified, ACT_IDLE is used.
3) Fire the OnBeginSequence output.
4) Play the action animation. If no action animation is specified, skip to step 5.
5) Play the post-action idle animation. If none is specified, skip to step 6. If the 'Loop in Post Idle' spawnflag is set, keep playing the post-action idle until the script is cancelled. If no post-action idle animation is specified, ACT_IDLE is used.
6) Fire the OnEndSequence output.
7) If a next script to play is specified, hand the NPC to the next script and repeat this process for that script.

The MoveToPosition input runs steps 1 and 2, then waits while playing the pre-action idle animation until the BeginSequence input is received.

If the sequence has motion extraction in it, set the 'Don't Teleport NPC On End' spawnflag.
**/
@:forward
abstract Scripted_sequence(Entity) to Entity {
    //Inputs
    
    /**
		Summons an NPC to act out the scripted sequence.
	**/
    public extern inline function FireBeginSequence(delay:Float) {
        untyped this.Fire("BeginSequence",untyped null,delay);
    }
    
    /**
		Summons an NPC to the script location. They will play their scripted idle (or ACT_IDLE if none is specified) until BeginSequence is triggered.
	**/
    public extern inline function FireMoveToPosition(delay:Float) {
        untyped this.Fire("MoveToPosition",untyped null,delay);
    }
    
    /**
		Stops the scripted sequence. If fired after a sequence starts, this input will not take effect until the NPC finishes playing the scripted action animation.
	**/
    public extern inline function FireCancelSequence(delay:Float) {
        untyped this.Fire("CancelSequence",untyped null,delay);
    }
    
    /**
		Changes the entity's parent in the movement hierarchy.
	**/
    public extern inline function FireSetParent(param:String,delay:Float) {
        untyped this.Fire("SetParent",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on its parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment.
	**/
    public extern inline function FireSetParentAttachment(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachment",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on it's parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment. The entity will maintain it's position relative to the parent at the time it is attached.
	**/
    public extern inline function FireSetParentAttachmentMaintainOffset(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachmentMaintainOffset",untyped param,delay);
    }
    
    /**
		Removes this entity from the the movement hierarchy, leaving it free to move independently.
	**/
    public extern inline function FireClearParent(delay:Float) {
        untyped this.Fire("ClearParent",untyped null,delay);
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
		Target NPC

		The name or class name (such as 'npc_zombie') of an NPC to use for this script.
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
		Pre Action Idle Animation

		The name of the sequence (such as 'idle01') or activity (such as 'ACT_IDLE') to play before the action animation if the NPC must wait for the script to be triggered. Use 'Start on Spawn' flag or MoveToPosition input to play this idle animation.
	**/
    public var m_iszIdle(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszIdle():String {
        return untyped this.GetKeyValues().m_iszIdle;
    }
    
    @:noCompletion
    public extern inline function set_m_iszIdle(value:String):String {
        return untyped this.SetKeyValue("m_iszIdle",untyped value);
    }
    
    /**
		Entry Animation

		The name of the sequence (such as 'reload02') or activity (such as 'ACT_RELOAD') to play when the sequence starts, before transitioning to play the main action sequence.
	**/
    public var m_iszEntry(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszEntry():String {
        return untyped this.GetKeyValues().m_iszEntry;
    }
    
    @:noCompletion
    public extern inline function set_m_iszEntry(value:String):String {
        return untyped this.SetKeyValue("m_iszEntry",untyped value);
    }
    
    /**
		Action Animation

		The name of the main sequence (such as 'reload02') or activity (such as 'ACT_RELOAD') to play.
	**/
    public var m_iszPlay(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszPlay():String {
        return untyped this.GetKeyValues().m_iszPlay;
    }
    
    @:noCompletion
    public extern inline function set_m_iszPlay(value:String):String {
        return untyped this.SetKeyValue("m_iszPlay",untyped value);
    }
    
    /**
		Post Action Idle Animation

		The name of the sequence (such as 'idle01') or activity (such as 'ACT_IDLE') to play after the action animation.
	**/
    public var m_iszPostIdle(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszPostIdle():String {
        return untyped this.GetKeyValues().m_iszPostIdle;
    }
    
    @:noCompletion
    public extern inline function set_m_iszPostIdle(value:String):String {
        return untyped this.SetKeyValue("m_iszPostIdle",untyped value);
    }
    
    /**
		Custom Move Animation

		Used in conjunction with the 'Custom movement' setting for the 'Move to Position' property, specifies the sequence (such as 'crouch_run01') or activity (such as 'ACT_RUN') to use while moving to the scripted position.
	**/
    public var m_iszCustomMove(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszCustomMove():String {
        return untyped this.GetKeyValues().m_iszCustomMove;
    }
    
    @:noCompletion
    public extern inline function set_m_iszCustomMove(value:String):String {
        return untyped this.SetKeyValue("m_iszCustomMove",untyped value);
    }
    
    /**
		Loop Action Animation?
	**/
    public var m_bLoopActionSequence(get,set):Choices;

    @:noCompletion
    public extern inline function get_m_bLoopActionSequence():Choices {
        return untyped this.GetKeyValues().m_bLoopActionSequence;
    }
    
    @:noCompletion
    public extern inline function set_m_bLoopActionSequence(value:Choices):Choices {
        return untyped this.SetKeyValue("m_bLoopActionSequence",untyped value);
    }
    
    /**
		Synch Post Idles?
	**/
    public var m_bSynchPostIdles(get,set):Choices;

    @:noCompletion
    public extern inline function get_m_bSynchPostIdles():Choices {
        return untyped this.GetKeyValues().m_bSynchPostIdles;
    }
    
    @:noCompletion
    public extern inline function set_m_bSynchPostIdles(value:Choices):Choices {
        return untyped this.SetKeyValue("m_bSynchPostIdles",untyped value);
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
		Repeat Rate ms
	**/
    public var m_flRepeat(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flRepeat():Int {
        return untyped this.GetKeyValues().m_flRepeat;
    }
    
    @:noCompletion
    public extern inline function set_m_flRepeat(value:Int):Int {
        return untyped this.SetKeyValue("m_flRepeat",untyped value);
    }
    
    /**
		Move to Position
	**/
    public var m_fMoveTo(get,set):Choices;

    @:noCompletion
    public extern inline function get_m_fMoveTo():Choices {
        return untyped this.GetKeyValues().m_fMoveTo;
    }
    
    @:noCompletion
    public extern inline function set_m_fMoveTo(value:Choices):Choices {
        return untyped this.SetKeyValue("m_fMoveTo",untyped value);
    }
    
    /**
		Next Script

		The name of the script to run immediately after this script completes. The NPC will not return to AI between the two scripts.
	**/
    public var m_iszNextScript(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszNextScript():String {
        return untyped this.GetKeyValues().m_iszNextScript;
    }
    
    @:noCompletion
    public extern inline function set_m_iszNextScript(value:String):String {
        return untyped this.SetKeyValue("m_iszNextScript",untyped value);
    }
    
    /**
		Ignore Gravity on NPC during script

		If this is set to 'Yes', the NPC will not be subject to gravity while playing this script.
	**/
    public var m_bIgnoreGravity(get,set):Scripted_sequencem_bIgnoreGravityChoices;

    @:noCompletion
    public extern inline function get_m_bIgnoreGravity():Scripted_sequencem_bIgnoreGravityChoices {
        return untyped this.GetKeyValues().m_bIgnoreGravity;
    }
    
    @:noCompletion
    public extern inline function set_m_bIgnoreGravity(value:Scripted_sequencem_bIgnoreGravityChoices):Scripted_sequencem_bIgnoreGravityChoices {
        return untyped this.SetKeyValue("m_bIgnoreGravity",untyped value);
    }
    
    /**
		Disable NPC collisions during script

		Useful for when NPCs playing scripts must interpenetrate while riding on trains, elevators, etc. This only disables collisions between the NPCs in the script and must be enabled on BOTH scripted_sequences.
	**/
    public var m_bDisableNPCCollisions(get,set):Scripted_sequencem_bDisableNPCCollisionsChoices;

    @:noCompletion
    public extern inline function get_m_bDisableNPCCollisions():Scripted_sequencem_bDisableNPCCollisionsChoices {
        return untyped this.GetKeyValues().m_bDisableNPCCollisions;
    }
    
    @:noCompletion
    public extern inline function set_m_bDisableNPCCollisions(value:Scripted_sequencem_bDisableNPCCollisionsChoices):Scripted_sequencem_bDisableNPCCollisionsChoices {
        return untyped this.SetKeyValue("m_bDisableNPCCollisions",untyped value);
    }
    
    /**
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Scripted_sequencemindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Scripted_sequencemindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Scripted_sequencemindxlevelChoices):Scripted_sequencemindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Scripted_sequencemaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Scripted_sequencemaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Scripted_sequencemaxdxlevelChoices):Scripted_sequencemaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		Parent

		The name of this entity's parent in the movement hierarchy. Entities with parents move with their parent.
	**/
    public var parentname(get,set):String;

    @:noCompletion
    public extern inline function get_parentname():String {
        return untyped this.GetKeyValues().parentname;
    }
    
    @:noCompletion
    public extern inline function set_parentname(value:String):String {
        return untyped this.SetKeyValue("parentname",untyped value);
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
		On player death

		What should this entity do if the player dies
	**/
    public var onplayerdeath(get,set):Scripted_sequenceonplayerdeathChoices;

    @:noCompletion
    public extern inline function get_onplayerdeath():Scripted_sequenceonplayerdeathChoices {
        return untyped this.GetKeyValues().onplayerdeath;
    }
    
    @:noCompletion
    public extern inline function set_onplayerdeath(value:Scripted_sequenceonplayerdeathChoices):Scripted_sequenceonplayerdeathChoices {
        return untyped this.SetKeyValue("onplayerdeath",untyped value);
    }
    
    //Outputs
    
    /**
		Fires when the action animation begins playing.
	**/
    public extern inline function OutputOnBeginSequence(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBeginSequence",callback);
    }
    
    /**
		Fires when the action animation completes.
	**/
    public extern inline function OutputOnEndSequence(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndSequence",callback);
    }
    
    /**
		Fires when the sequence is cancelled.
	**/
    public extern inline function OutputOnCancelSequence(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCancelSequence",callback);
    }
    
    /**
		Fires when the sequence is cancelled without ever playing (OnCancelSequence will also fire).
	**/
    public extern inline function OutputOnCancelFailedSequence(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCancelFailedSequence",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 1 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent01(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent01",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 2 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent02(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent02",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 3 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent03(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent03",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 4 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent04(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent04",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 5 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent05(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent05",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 6 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent06(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent06",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 7 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent07(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent07",callback);
    }
    
    /**
		Fires when a 'trigger' anim event occurs while playing the script. Use { event 1003 framenum 8 } in the QC.
	**/
    public extern inline function OutputOnScriptEvent08(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnScriptEvent08",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Scripted_sequence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Scripted_sequenceSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Scripted_sequenceSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Scripted_sequenceSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("scripted_sequence");
    }
}

enum abstract Scripted_sequenceonplayerdeathChoices(Int) to Int {
	var DO_NOTHING = 0;
	var CANCEL_SCRIPT_AND_RETURN_TO_AI = 1;
}
enum abstract Scripted_sequencemindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Scripted_sequencemaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Scripted_sequencem_bIgnoreGravityChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Scripted_sequencem_bDisableNPCCollisionsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Scripted_sequenceSpawnFlags(Int) to Int {
	var REPEATABLE = 4;
	var LEAVE_CORPSE = 8;
	var START_ON_SPAWN = 16;
	var NO_INTERRUPTIONS = 32;
	var OVERRIDE_AI = 64;
	var DONT_TELEPORT_NPC_ON_END = 128;
	var LOOP_IN_POST_IDLE = 256;
	var PRIORITY_SCRIPT = 512;
	var ALLOW_ACTOR_DEATH = 4096;
}

#end
