package gmod.engine_ents;
#if server
/**
	AI Goal Act Busy Queue
**/
@:forward
abstract Ai_goal_actbusy_queue(Entity) to Entity {
    //Inputs
    
    /**
		Begin acting busy
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Cease acting busy
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Update the busy search range for all actors.
	**/
    public extern inline function FireSetBusySearchRange(param:Float,delay:Float) {
        untyped this.Fire("SetBusySearchRange",untyped param,delay);
    }
    
    /**
		Force an NPC to act busy. Takes parameters, separated by spaces: <Targetname> <hint node targetname> <optional:teleport> <optional:$customactivityorsequence> <maximum time to actbusy>. If no hint node targetname is specified, it'll search for a random one. If no max time is specified, it'll use the default. Specifying 0 as the max time will make the NPC act busy until disturbed. If the optional teleport parameter is specified, the NPC will teleport to the act busy point. A custom move animation can be specified by prepending $ to the name of it. i.e. $ACT_RUN will make the NPC Run. Sequence names can be used instead of activities.
	**/
    public extern inline function FireForceNPCToActBusy(param:String,delay:Float) {
        untyped this.Fire("ForceNPCToActBusy",untyped param,delay);
    }
    
    /**
		Force an NPC outputted from another entity to act busy. (only usable from an output that specifies an entity)
	**/
    public extern inline function FireForceThisNPCToActBusy(param:String,delay:Float) {
        untyped this.Fire("ForceThisNPCToActBusy",untyped param,delay);
    }
    
    /**
		Force an NPC outputted from another entity to find a HINT_NPC_EXIT_POINT hintnode and vanish.
	**/
    public extern inline function FireForceThisNPCToLeave(param:String,delay:Float) {
        untyped this.Fire("ForceThisNPCToLeave",untyped param,delay);
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
		Tell the queue manager that the player has started blocking a spot in the queue.
	**/
    public extern inline function FirePlayerStartedBlocking(param:Float,delay:Float) {
        untyped this.Fire("PlayerStartedBlocking",untyped param,delay);
    }
    
    /**
		Tell the queue manager that the player has stopped blocking a spot in the queue.
	**/
    public extern inline function FirePlayerStoppedBlocking(param:Float,delay:Float) {
        untyped this.Fire("PlayerStoppedBlocking",untyped param,delay);
    }
    
    /**
		Force the queue to move up, sending the front-most NPC out of the queue.
	**/
    public extern inline function FireMoveQueueUp(delay:Float) {
        untyped this.Fire("MoveQueueUp",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Actor(s) to affect

		NPC's that should act busy
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
		Start Active
	**/
    public var StartActive(get,set):Ai_goal_actbusy_queueStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_goal_actbusy_queueStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_goal_actbusy_queueStartActiveChoices):Ai_goal_actbusy_queueStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_actbusy_queueSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_actbusy_queueSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_actbusy_queueSearchTypeChoices):Ai_goal_actbusy_queueSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    /**
		Search Range for Busy Hints
	**/
    public var busysearchrange(get,set):Float;

    @:noCompletion
    public extern inline function get_busysearchrange():Float {
        return untyped this.GetKeyValues().busysearchrange;
    }
    
    @:noCompletion
    public extern inline function set_busysearchrange(value:Float):Float {
        return untyped this.SetKeyValue("busysearchrange",untyped value);
    }
    
    /**
		Visible Busy Hints Only
	**/
    public var visibleonly(get,set):Ai_goal_actbusy_queuevisibleonlyChoices;

    @:noCompletion
    public extern inline function get_visibleonly():Ai_goal_actbusy_queuevisibleonlyChoices {
        return untyped this.GetKeyValues().visibleonly;
    }
    
    @:noCompletion
    public extern inline function set_visibleonly(value:Ai_goal_actbusy_queuevisibleonlyChoices):Ai_goal_actbusy_queuevisibleonlyChoices {
        return untyped this.SetKeyValue("visibleonly",untyped value);
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
		Exit Node

		The name of the node the first NPC in the queue should move to when he leaves the head of the queue.
	**/
    public var node_exit(get,set):String;

    @:noCompletion
    public extern inline function get_node_exit():String {
        return untyped this.GetKeyValues().node_exit;
    }
    
    @:noCompletion
    public extern inline function set_node_exit(value:String):String {
        return untyped this.SetKeyValue("node_exit",untyped value);
    }
    
    /**
		Node 1

		The name of the first actbusy hint node in the queue.
	**/
    public var node01(get,set):String;

    @:noCompletion
    public extern inline function get_node01():String {
        return untyped this.GetKeyValues().node01;
    }
    
    @:noCompletion
    public extern inline function set_node01(value:String):String {
        return untyped this.SetKeyValue("node01",untyped value);
    }
    
    /**
		Node 2

		The name of the second actbusy hint node in the queue.
	**/
    public var node02(get,set):String;

    @:noCompletion
    public extern inline function get_node02():String {
        return untyped this.GetKeyValues().node02;
    }
    
    @:noCompletion
    public extern inline function set_node02(value:String):String {
        return untyped this.SetKeyValue("node02",untyped value);
    }
    
    /**
		Node 3

		The name of the third actbusy hint node in the queue.
	**/
    public var node03(get,set):String;

    @:noCompletion
    public extern inline function get_node03():String {
        return untyped this.GetKeyValues().node03;
    }
    
    @:noCompletion
    public extern inline function set_node03(value:String):String {
        return untyped this.SetKeyValue("node03",untyped value);
    }
    
    /**
		Node 4

		The name of the fourth actbusy hint node in the queue.
	**/
    public var node04(get,set):String;

    @:noCompletion
    public extern inline function get_node04():String {
        return untyped this.GetKeyValues().node04;
    }
    
    @:noCompletion
    public extern inline function set_node04(value:String):String {
        return untyped this.SetKeyValue("node04",untyped value);
    }
    
    /**
		Node 5

		The name of the fifth actbusy hint node in the queue.
	**/
    public var node05(get,set):String;

    @:noCompletion
    public extern inline function get_node05():String {
        return untyped this.GetKeyValues().node05;
    }
    
    @:noCompletion
    public extern inline function set_node05(value:String):String {
        return untyped this.SetKeyValue("node05",untyped value);
    }
    
    /**
		Node 6

		The name of the sixth actbusy hint node in the queue.
	**/
    public var node06(get,set):String;

    @:noCompletion
    public extern inline function get_node06():String {
        return untyped this.GetKeyValues().node06;
    }
    
    @:noCompletion
    public extern inline function set_node06(value:String):String {
        return untyped this.SetKeyValue("node06",untyped value);
    }
    
    /**
		Node 7

		The name of the seventh actbusy hint node in the queue.
	**/
    public var node07(get,set):String;

    @:noCompletion
    public extern inline function get_node07():String {
        return untyped this.GetKeyValues().node07;
    }
    
    @:noCompletion
    public extern inline function set_node07(value:String):String {
        return untyped this.SetKeyValue("node07",untyped value);
    }
    
    /**
		Node 8

		The name of the eighth actbusy hint node in the queue.
	**/
    public var node08(get,set):String;

    @:noCompletion
    public extern inline function get_node08():String {
        return untyped this.GetKeyValues().node08;
    }
    
    @:noCompletion
    public extern inline function set_node08(value:String):String {
        return untyped this.SetKeyValue("node08",untyped value);
    }
    
    /**
		Node 9

		The name of the ninth actbusy hint node in the queue.
	**/
    public var node09(get,set):String;

    @:noCompletion
    public extern inline function get_node09():String {
        return untyped this.GetKeyValues().node09;
    }
    
    @:noCompletion
    public extern inline function set_node09(value:String):String {
        return untyped this.SetKeyValue("node09",untyped value);
    }
    
    /**
		Node 10

		The name of the tenth actbusy hint node in the queue.
	**/
    public var node10(get,set):String;

    @:noCompletion
    public extern inline function get_node10():String {
        return untyped this.GetKeyValues().node10;
    }
    
    @:noCompletion
    public extern inline function set_node10(value:String):String {
        return untyped this.SetKeyValue("node10",untyped value);
    }
    
    /**
		Node 11

		The name of the eleventh actbusy hint node in the queue.
	**/
    public var node11(get,set):String;

    @:noCompletion
    public extern inline function get_node11():String {
        return untyped this.GetKeyValues().node11;
    }
    
    @:noCompletion
    public extern inline function set_node11(value:String):String {
        return untyped this.SetKeyValue("node11",untyped value);
    }
    
    /**
		Node 12

		The name of the twelfth actbusy hint node in the queue.
	**/
    public var node12(get,set):String;

    @:noCompletion
    public extern inline function get_node12():String {
        return untyped this.GetKeyValues().node12;
    }
    
    @:noCompletion
    public extern inline function set_node12(value:String):String {
        return untyped this.SetKeyValue("node12",untyped value);
    }
    
    /**
		Node 13

		The name of the thirteenth actbusy hint node in the queue.
	**/
    public var node13(get,set):String;

    @:noCompletion
    public extern inline function get_node13():String {
        return untyped this.GetKeyValues().node13;
    }
    
    @:noCompletion
    public extern inline function set_node13(value:String):String {
        return untyped this.SetKeyValue("node13",untyped value);
    }
    
    /**
		Node 14

		The name of the fourteenth actbusy hint node in the queue.
	**/
    public var node14(get,set):String;

    @:noCompletion
    public extern inline function get_node14():String {
        return untyped this.GetKeyValues().node14;
    }
    
    @:noCompletion
    public extern inline function set_node14(value:String):String {
        return untyped this.SetKeyValue("node14",untyped value);
    }
    
    /**
		Node 15

		The name of the fifteenth actbusy hint node in the queue.
	**/
    public var node15(get,set):String;

    @:noCompletion
    public extern inline function get_node15():String {
        return untyped this.GetKeyValues().node15;
    }
    
    @:noCompletion
    public extern inline function set_node15(value:String):String {
        return untyped this.SetKeyValue("node15",untyped value);
    }
    
    /**
		Node 16

		The name of the sixteenth actbusy hint node in the queue.
	**/
    public var node16(get,set):String;

    @:noCompletion
    public extern inline function get_node16():String {
        return untyped this.GetKeyValues().node16;
    }
    
    @:noCompletion
    public extern inline function set_node16(value:String):String {
        return untyped this.SetKeyValue("node16",untyped value);
    }
    
    /**
		Node 17

		The name of the seventeenth actbusy hint node in the queue.
	**/
    public var node17(get,set):String;

    @:noCompletion
    public extern inline function get_node17():String {
        return untyped this.GetKeyValues().node17;
    }
    
    @:noCompletion
    public extern inline function set_node17(value:String):String {
        return untyped this.SetKeyValue("node17",untyped value);
    }
    
    /**
		Node 18

		The name of the eighteenth actbusy hint node in the queue.
	**/
    public var node18(get,set):String;

    @:noCompletion
    public extern inline function get_node18():String {
        return untyped this.GetKeyValues().node18;
    }
    
    @:noCompletion
    public extern inline function set_node18(value:String):String {
        return untyped this.SetKeyValue("node18",untyped value);
    }
    
    /**
		Node 19

		The name of the nineteenth actbusy hint node in the queue.
	**/
    public var node19(get,set):String;

    @:noCompletion
    public extern inline function get_node19():String {
        return untyped this.GetKeyValues().node19;
    }
    
    @:noCompletion
    public extern inline function set_node19(value:String):String {
        return untyped this.SetKeyValue("node19",untyped value);
    }
    
    /**
		Node 20

		The name of the twentieth actbusy hint node in the queue.
	**/
    public var node20(get,set):String;

    @:noCompletion
    public extern inline function get_node20():String {
        return untyped this.GetKeyValues().node20;
    }
    
    @:noCompletion
    public extern inline function set_node20(value:String):String {
        return untyped this.SetKeyValue("node20",untyped value);
    }
    
    /**
		Must Reach Front

		If true, NPCs much reach the front node in the queue before they're allowed to leave the queue.
	**/
    public var mustreachfront(get,set):Ai_goal_actbusy_queuemustreachfrontChoices;

    @:noCompletion
    public extern inline function get_mustreachfront():Ai_goal_actbusy_queuemustreachfrontChoices {
        return untyped this.GetKeyValues().mustreachfront;
    }
    
    @:noCompletion
    public extern inline function set_mustreachfront(value:Ai_goal_actbusy_queuemustreachfrontChoices):Ai_goal_actbusy_queuemustreachfrontChoices {
        return untyped this.SetKeyValue("mustreachfront",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when an NPC targeted by this goal starts an ActBusy animation.
	**/
    public extern inline function OutputOnNPCStartedBusy(callback:Callback<{activator:Ai_goal_actbusy_queue,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCStartedBusy",callback);
    }
    
    /**
		Fired when an NPC targeted by this goal finishes an ActBusy.
	**/
    public extern inline function OutputOnNPCFinishedBusy(callback:Callback<{activator:Ai_goal_actbusy_queue,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCFinishedBusy",callback);
    }
    
    /**
		Fired when an NPC target by this goal finishes a forced Leave.
	**/
    public extern inline function OutputOnNPCLeft(callback:Callback<{activator:Ai_goal_actbusy_queue,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCLeft",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_actbusy_queue}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_actbusy_queue}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_actbusy_queue}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_actbusy_queue}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the queue moves. Outputs the number of NPCs left in the queue.
	**/
    public extern inline function OutputOnQueueMoved(callback:Callback<{activator:Ai_goal_actbusy_queue,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnQueueMoved",callback);
    }
    
    /**
		Fired when the NPC at the head of the queue starts to leave. The activator is the NPC, and the string is the name of the NPC.
	**/
    public extern inline function OutputOnNPCStartedLeavingQueue(callback:Callback<{activator:Ai_goal_actbusy_queue,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCStartedLeavingQueue",callback);
    }
    
    /**
		Fired when the NPC at the head of the queue leaves. The activator is the NPC, and the string is the name of the NPC.
	**/
    public extern inline function OutputOnNPCLeftQueue(callback:Callback<{activator:Ai_goal_actbusy_queue,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCLeftQueue",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_actbusy_queue");
    }
}

enum abstract Ai_goal_actbusy_queuevisibleonlyChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_actbusy_queuemustreachfrontChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_actbusy_queueStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_actbusy_queueSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}




#end
