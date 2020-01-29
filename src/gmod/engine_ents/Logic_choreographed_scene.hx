package gmod.engine_ents;
#if server
/**
	Manages a choreographed scene of one or more actors.
**/
@:forward
abstract Logic_choreographed_scene(Entity) to Entity {
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
		Starts playback of the scene file
	**/
    public extern inline function FireStart(delay:Float) {
        untyped this.Fire("Start",untyped null,delay);
    }
    
    /**
		Pauses playback of the scene file
	**/
    public extern inline function FirePause(delay:Float) {
        untyped this.Fire("Pause",untyped null,delay);
    }
    
    /**
		Resumes playback of the scene if it has been paused
	**/
    public extern inline function FireResume(delay:Float) {
        untyped this.Fire("Resume",untyped null,delay);
    }
    
    /**
		Cancels playback of the scene
	**/
    public extern inline function FireCancel(delay:Float) {
        untyped this.Fire("Cancel",untyped null,delay);
    }
    
    /**
		Cancels playback of the scene at the next interrupt event in the scene.
	**/
    public extern inline function FireCancelAtNextInterrupt(delay:Float) {
        untyped this.Fire("CancelAtNextInterrupt",untyped null,delay);
    }
    
    /**
		Multiplies the the pitch
	**/
    public extern inline function FirePitchShift(param:Float,delay:Float) {
        untyped this.Fire("PitchShift",untyped param,delay);
    }
    
    /**
		Finds an actor who can respond to the specified concept string while the scene continues playing
	**/
    public extern inline function FireInterjectResponse(param:String,delay:Float) {
        untyped this.Fire("InterjectResponse",untyped param,delay);
    }
    
    /**
		Stop waiting on an actor to stop talking.
	**/
    public extern inline function FireStopWaitingForActor(delay:Float) {
        untyped this.Fire("StopWaitingForActor",untyped null,delay);
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
		Scene file
	**/
    public var SceneFile(get,set):String;

    @:noCompletion
    public extern inline function get_SceneFile():String {
        return untyped this.GetKeyValues().SceneFile;
    }
    
    @:noCompletion
    public extern inline function set_SceneFile(value:String):String {
        return untyped this.SetKeyValue("SceneFile",untyped value);
    }
    
    /**
		Target 1
	**/
    public var target1(get,set):String;

    @:noCompletion
    public extern inline function get_target1():String {
        return untyped this.GetKeyValues().target1;
    }
    
    @:noCompletion
    public extern inline function set_target1(value:String):String {
        return untyped this.SetKeyValue("target1",untyped value);
    }
    
    /**
		Target 2
	**/
    public var target2(get,set):String;

    @:noCompletion
    public extern inline function get_target2():String {
        return untyped this.GetKeyValues().target2;
    }
    
    @:noCompletion
    public extern inline function set_target2(value:String):String {
        return untyped this.SetKeyValue("target2",untyped value);
    }
    
    /**
		Target 3
	**/
    public var target3(get,set):String;

    @:noCompletion
    public extern inline function get_target3():String {
        return untyped this.GetKeyValues().target3;
    }
    
    @:noCompletion
    public extern inline function set_target3(value:String):String {
        return untyped this.SetKeyValue("target3",untyped value);
    }
    
    /**
		Target 4
	**/
    public var target4(get,set):String;

    @:noCompletion
    public extern inline function get_target4():String {
        return untyped this.GetKeyValues().target4;
    }
    
    @:noCompletion
    public extern inline function set_target4(value:String):String {
        return untyped this.SetKeyValue("target4",untyped value);
    }
    
    /**
		Target 5
	**/
    public var target5(get,set):String;

    @:noCompletion
    public extern inline function get_target5():String {
        return untyped this.GetKeyValues().target5;
    }
    
    @:noCompletion
    public extern inline function set_target5(value:String):String {
        return untyped this.SetKeyValue("target5",untyped value);
    }
    
    /**
		Target 6
	**/
    public var target6(get,set):String;

    @:noCompletion
    public extern inline function get_target6():String {
        return untyped this.GetKeyValues().target6;
    }
    
    @:noCompletion
    public extern inline function set_target6(value:String):String {
        return untyped this.SetKeyValue("target6",untyped value);
    }
    
    /**
		Target 7
	**/
    public var target7(get,set):String;

    @:noCompletion
    public extern inline function get_target7():String {
        return untyped this.GetKeyValues().target7;
    }
    
    @:noCompletion
    public extern inline function set_target7(value:String):String {
        return untyped this.SetKeyValue("target7",untyped value);
    }
    
    /**
		Target 8
	**/
    public var target8(get,set):String;

    @:noCompletion
    public extern inline function get_target8():String {
        return untyped this.GetKeyValues().target8;
    }
    
    @:noCompletion
    public extern inline function set_target8(value:String):String {
        return untyped this.SetKeyValue("target8",untyped value);
    }
    
    /**
		If an Actor is talking...

		What to do if an actor this scene needs is already talking when this scene is told to start.
	**/
    public var busyactor(get,set):Logic_choreographed_scenebusyactorChoices;

    @:noCompletion
    public extern inline function get_busyactor():Logic_choreographed_scenebusyactorChoices {
        return untyped this.GetKeyValues().busyactor;
    }
    
    @:noCompletion
    public extern inline function set_busyactor(value:Logic_choreographed_scenebusyactorChoices):Logic_choreographed_scenebusyactorChoices {
        return untyped this.SetKeyValue("busyactor",untyped value);
    }
    
    /**
		On player death

		What should this entity do if the player dies
	**/
    public var onplayerdeath(get,set):Logic_choreographed_sceneonplayerdeathChoices;

    @:noCompletion
    public extern inline function get_onplayerdeath():Logic_choreographed_sceneonplayerdeathChoices {
        return untyped this.GetKeyValues().onplayerdeath;
    }
    
    @:noCompletion
    public extern inline function set_onplayerdeath(value:Logic_choreographed_sceneonplayerdeathChoices):Logic_choreographed_sceneonplayerdeathChoices {
        return untyped this.SetKeyValue("onplayerdeath",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		The scene has started
	**/
    public extern inline function OutputOnStart(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStart",callback);
    }
    
    /**
		The scene has completed
	**/
    public extern inline function OutputOnCompletion(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCompletion",callback);
    }
    
    /**
		The scene has been canceled
	**/
    public extern inline function OutputOnCanceled(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCanceled",callback);
    }
    
    /**
		Scene trigger 1
	**/
    public extern inline function OutputOnTrigger1(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger1",callback);
    }
    
    /**
		Scene trigger 2
	**/
    public extern inline function OutputOnTrigger2(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger2",callback);
    }
    
    /**
		Scene trigger 3
	**/
    public extern inline function OutputOnTrigger3(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger3",callback);
    }
    
    /**
		Scene trigger 4
	**/
    public extern inline function OutputOnTrigger4(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger4",callback);
    }
    
    /**
		Scene trigger 5
	**/
    public extern inline function OutputOnTrigger5(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger5",callback);
    }
    
    /**
		Scene trigger 6
	**/
    public extern inline function OutputOnTrigger6(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger6",callback);
    }
    
    /**
		Scene trigger 7
	**/
    public extern inline function OutputOnTrigger7(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger7",callback);
    }
    
    /**
		Scene trigger 8
	**/
    public extern inline function OutputOnTrigger8(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger8",callback);
    }
    
    /**
		Scene trigger 9
	**/
    public extern inline function OutputOnTrigger9(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger9",callback);
    }
    
    /**
		Scene trigger 10
	**/
    public extern inline function OutputOnTrigger10(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger10",callback);
    }
    
    /**
		Scene trigger 11
	**/
    public extern inline function OutputOnTrigger11(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger11",callback);
    }
    
    /**
		Scene trigger 12
	**/
    public extern inline function OutputOnTrigger12(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger12",callback);
    }
    
    /**
		Scene trigger 13
	**/
    public extern inline function OutputOnTrigger13(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger13",callback);
    }
    
    /**
		Scene trigger 14
	**/
    public extern inline function OutputOnTrigger14(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger14",callback);
    }
    
    /**
		Scene trigger 15
	**/
    public extern inline function OutputOnTrigger15(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger15",callback);
    }
    
    /**
		Scene trigger 16
	**/
    public extern inline function OutputOnTrigger16(callback:Callback<{activator:Logic_choreographed_scene}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTrigger16",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_choreographed_scene");
    }
}

enum abstract Logic_choreographed_sceneonplayerdeathChoices(Int) to Int {
	var DO_NOTHING = 0;
	var CANCEL_SCRIPT_AND_RETURN_TO_AI = 1;
}
enum abstract Logic_choreographed_scenebusyactorChoices(Int) to Int {
	var START_IMMEDIATELY = 0;
	var WAIT_FOR_ACTOR_TO_FINISH = 1;
	var INTERRUPT_AT_NEXT_INTERRUPT_EVENT = 2;
	var CANCEL_AT_NEXT_INTERRUPT_EVENT = 3;
}




#end
