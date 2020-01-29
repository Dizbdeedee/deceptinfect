package gmod.engine_ents;
#if server
/**
	AI Goal Act Busy
**/
@:forward
abstract Ai_goal_actbusy(Entity) to Entity {
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
    public var StartActive(get,set):Ai_goal_actbusyStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_goal_actbusyStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_goal_actbusyStartActiveChoices):Ai_goal_actbusyStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_actbusySearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_actbusySearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_actbusySearchTypeChoices):Ai_goal_actbusySearchTypeChoices {
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
    public var visibleonly(get,set):Ai_goal_actbusyvisibleonlyChoices;

    @:noCompletion
    public extern inline function get_visibleonly():Ai_goal_actbusyvisibleonlyChoices {
        return untyped this.GetKeyValues().visibleonly;
    }
    
    @:noCompletion
    public extern inline function set_visibleonly(value:Ai_goal_actbusyvisibleonlyChoices):Ai_goal_actbusyvisibleonlyChoices {
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
		Sight Entity

		The Sight Entity (if you provide one) is an entity that will leave the current ActBusy if the Actor playing the ActBusy loses sight of it for the amount of time specified in 'Sight Entity Timeout'. THIS MAY ONLY BE A TARGET NAME. NO CLASSNAMES.
	**/
    public var seeentity(get,set):String;

    @:noCompletion
    public extern inline function get_seeentity():String {
        return untyped this.GetKeyValues().seeentity;
    }
    
    @:noCompletion
    public extern inline function set_seeentity(value:String):String {
        return untyped this.SetKeyValue("seeentity",untyped value);
    }
    
    /**
		Sight Entity Timeout

		If you provide a Sight Entity, the Actor will leave the current ActBusy if the Actor has lost sight of Sight Entity for this many seconds.
	**/
    public var seeentitytimeout(get,set):String;

    @:noCompletion
    public extern inline function get_seeentitytimeout():String {
        return untyped this.GetKeyValues().seeentitytimeout;
    }
    
    @:noCompletion
    public extern inline function set_seeentitytimeout(value:String):String {
        return untyped this.SetKeyValue("seeentitytimeout",untyped value);
    }
    
    /**
		Sight Enemy Method

		The method to use to determine whether the Sight enemy is visible.
	**/
    public var sightmethod(get,set):Ai_goal_actbusysightmethodChoices;

    @:noCompletion
    public extern inline function get_sightmethod():Ai_goal_actbusysightmethodChoices {
        return untyped this.GetKeyValues().sightmethod;
    }
    
    @:noCompletion
    public extern inline function set_sightmethod(value:Ai_goal_actbusysightmethodChoices):Ai_goal_actbusysightmethodChoices {
        return untyped this.SetKeyValue("sightmethod",untyped value);
    }
    
    /**
		Actbusy Type
	**/
    public var type(get,set):Ai_goal_actbusytypeChoices;

    @:noCompletion
    public extern inline function get_type():Ai_goal_actbusytypeChoices {
        return untyped this.GetKeyValues().type;
    }
    
    @:noCompletion
    public extern inline function set_type(value:Ai_goal_actbusytypeChoices):Ai_goal_actbusytypeChoices {
        return untyped this.SetKeyValue("type",untyped value);
    }
    
    /**
		Combat Safe Zone

		Only for combat actbusy. Lets you specify a volume which is the 'safe zone'. The Combat ActBusy will cancel if any enemies are seen in the safe zone.
	**/
    public var safezone(get,set):String;

    @:noCompletion
    public extern inline function get_safezone():String {
        return untyped this.GetKeyValues().safezone;
    }
    
    @:noCompletion
    public extern inline function set_safezone(value:String):String {
        return untyped this.SetKeyValue("safezone",untyped value);
    }
    
    /**
		Allow actor to teleport?
	**/
    public var allowteleport(get,set):Ai_goal_actbusyallowteleportChoices;

    @:noCompletion
    public extern inline function get_allowteleport():Ai_goal_actbusyallowteleportChoices {
        return untyped this.GetKeyValues().allowteleport;
    }
    
    @:noCompletion
    public extern inline function set_allowteleport(value:Ai_goal_actbusyallowteleportChoices):Ai_goal_actbusyallowteleportChoices {
        return untyped this.SetKeyValue("allowteleport",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when an NPC targeted by this goal starts an ActBusy animation.
	**/
    public extern inline function OutputOnNPCStartedBusy(callback:Callback<{activator:Ai_goal_actbusy,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCStartedBusy",callback);
    }
    
    /**
		Fired when an NPC targeted by this goal finishes an ActBusy.
	**/
    public extern inline function OutputOnNPCFinishedBusy(callback:Callback<{activator:Ai_goal_actbusy,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCFinishedBusy",callback);
    }
    
    /**
		Fired when an NPC target by this goal finishes a forced Leave.
	**/
    public extern inline function OutputOnNPCLeft(callback:Callback<{activator:Ai_goal_actbusy,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCLeft",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the NPC loses sight of the see entity (if one is specified).
	**/
    public extern inline function OutputOnNPCLostSeeEntity(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCLostSeeEntity",callback);
    }
    
    /**
		Fired when this NPC leaves his actbusy because of sighting an enemy.
	**/
    public extern inline function OutputOnNPCSeeEnemy(callback:Callback<{activator:Ai_goal_actbusy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNPCSeeEnemy",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_actbusy");
    }
}

enum abstract Ai_goal_actbusyvisibleonlyChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_actbusytypeChoices(Int) to Int {
	var DEFAULT_STANDARD = 0;
	var COMBAT = 1;
}
enum abstract Ai_goal_actbusysightmethodChoices(Int) to Int {
	var DEFAULT_LOS_AND_VIEWCONE = 0;
	var LOS_ONLY_DISREGARD_VIEWCONE = 1;
}
enum abstract Ai_goal_actbusyallowteleportChoices(Int) to Int {
	var NO = 0;
	var YES_ONLY_FOR_COMBAT_ACTBUSY = 1;
}
enum abstract Ai_goal_actbusyStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_actbusySearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}




#end
