package gmod.engine_ents;
#if server
/**
	AI Goal Lead (Weapon). A version of the ai_goal_lead entity that requires the player to have the specified weapon before the Actor(s) will lead the player to their target.
**/
@:forward
abstract Ai_goal_lead_weapon(Entity) to Entity {
    //Inputs
    
    /**
		Begin the leading behavior
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Stop the leading behavior
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Notify success of leading
	**/
    public extern inline function FireSetSuccess(delay:Float) {
        untyped this.Fire("SetSuccess",untyped null,delay);
    }
    
    /**
		Notify failure of leading
	**/
    public extern inline function FireSetFailure(delay:Float) {
        untyped this.Fire("SetFailure",untyped null,delay);
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
		Point to wait at if the target's not visible
	**/
    public var WaitPointName(get,set):String;

    @:noCompletion
    public extern inline function get_WaitPointName():String {
        return untyped this.GetKeyValues().WaitPointName;
    }
    
    @:noCompletion
    public extern inline function set_WaitPointName(value:String):String {
        return untyped this.SetKeyValue("WaitPointName",untyped value);
    }
    
    /**
		Wait until player gets this close
	**/
    public var WaitDistance(get,set):Float;

    @:noCompletion
    public extern inline function get_WaitDistance():Float {
        return untyped this.GetKeyValues().WaitDistance;
    }
    
    @:noCompletion
    public extern inline function set_WaitDistance(value:Float):Float {
        return untyped this.SetKeyValue("WaitDistance",untyped value);
    }
    
    /**
		Lead Distance

		The player is considered to be lagging if he's beyond this distance.  The Actor will consider retrieving when the player is 4x 'Lead Distance' away.
	**/
    public var LeadDistance(get,set):Float;

    @:noCompletion
    public extern inline function get_LeadDistance():Float {
        return untyped this.GetKeyValues().LeadDistance;
    }
    
    @:noCompletion
    public extern inline function set_LeadDistance(value:Float):Float {
        return untyped this.SetKeyValue("LeadDistance",untyped value);
    }
    
    /**
		Retrieve Distance

		The distance from the player that the NPC should return to when retrieving a lagging player. Must be between ('Lead Distance' + 24) and ('Lead Distance' * 4) to avoid the leader ping-ponging.
	**/
    public var RetrieveDistance(get,set):Float;

    @:noCompletion
    public extern inline function get_RetrieveDistance():Float {
        return untyped this.GetKeyValues().RetrieveDistance;
    }
    
    @:noCompletion
    public extern inline function set_RetrieveDistance(value:Float):Float {
        return untyped this.SetKeyValue("RetrieveDistance",untyped value);
    }
    
    /**
		Success Distance

		The distance from the player (to the NPC) that the player must be within for the Lead to succeed, once the NPC has reached the goal. If set to 0, it'll use the lead distance instead (for legacy support).
	**/
    public var SuccessDistance(get,set):Float;

    @:noCompletion
    public extern inline function get_SuccessDistance():Float {
        return untyped this.GetKeyValues().SuccessDistance;
    }
    
    @:noCompletion
    public extern inline function set_SuccessDistance(value:Float):Float {
        return untyped this.SetKeyValue("SuccessDistance",untyped value);
    }
    
    /**
		Run instead of Walk
	**/
    public var Run(get,set):Ai_goal_lead_weaponRunChoices;

    @:noCompletion
    public extern inline function get_Run():Ai_goal_lead_weaponRunChoices {
        return untyped this.GetKeyValues().Run;
    }
    
    @:noCompletion
    public extern inline function set_Run(value:Ai_goal_lead_weaponRunChoices):Ai_goal_lead_weaponRunChoices {
        return untyped this.SetKeyValue("Run",untyped value);
    }
    
    /**
		Retrieve player?
	**/
    public var Retrieve(get,set):Ai_goal_lead_weaponRetrieveChoices;

    @:noCompletion
    public extern inline function get_Retrieve():Ai_goal_lead_weaponRetrieveChoices {
        return untyped this.GetKeyValues().Retrieve;
    }
    
    @:noCompletion
    public extern inline function set_Retrieve(value:Ai_goal_lead_weaponRetrieveChoices):Ai_goal_lead_weaponRetrieveChoices {
        return untyped this.SetKeyValue("Retrieve",untyped value);
    }
    
    /**
		Before Coming Back, Wait for speech?
	**/
    public var ComingBackWaitForSpeak(get,set):Ai_goal_lead_weaponComingBackWaitForSpeakChoices;

    @:noCompletion
    public extern inline function get_ComingBackWaitForSpeak():Ai_goal_lead_weaponComingBackWaitForSpeakChoices {
        return untyped this.GetKeyValues().ComingBackWaitForSpeak;
    }
    
    @:noCompletion
    public extern inline function set_ComingBackWaitForSpeak(value:Ai_goal_lead_weaponComingBackWaitForSpeakChoices):Ai_goal_lead_weaponComingBackWaitForSpeakChoices {
        return untyped this.SetKeyValue("ComingBackWaitForSpeak",untyped value);
    }
    
    /**
		On Retrieve, Wait for speech?
	**/
    public var RetrieveWaitForSpeak(get,set):Ai_goal_lead_weaponRetrieveWaitForSpeakChoices;

    @:noCompletion
    public extern inline function get_RetrieveWaitForSpeak():Ai_goal_lead_weaponRetrieveWaitForSpeakChoices {
        return untyped this.GetKeyValues().RetrieveWaitForSpeak;
    }
    
    @:noCompletion
    public extern inline function set_RetrieveWaitForSpeak(value:Ai_goal_lead_weaponRetrieveWaitForSpeakChoices):Ai_goal_lead_weaponRetrieveWaitForSpeakChoices {
        return untyped this.SetKeyValue("RetrieveWaitForSpeak",untyped value);
    }
    
    /**
		Speak start greeting?
	**/
    public var DontSpeakStart(get,set):Ai_goal_lead_weaponDontSpeakStartChoices;

    @:noCompletion
    public extern inline function get_DontSpeakStart():Ai_goal_lead_weaponDontSpeakStartChoices {
        return untyped this.GetKeyValues().DontSpeakStart;
    }
    
    @:noCompletion
    public extern inline function set_DontSpeakStart(value:Ai_goal_lead_weaponDontSpeakStartChoices):Ai_goal_lead_weaponDontSpeakStartChoices {
        return untyped this.SetKeyValue("DontSpeakStart",untyped value);
    }
    
    /**
		Lead during combat?
	**/
    public var LeadDuringCombat(get,set):Ai_goal_lead_weaponLeadDuringCombatChoices;

    @:noCompletion
    public extern inline function get_LeadDuringCombat():Ai_goal_lead_weaponLeadDuringCombatChoices {
        return untyped this.GetKeyValues().LeadDuringCombat;
    }
    
    @:noCompletion
    public extern inline function set_LeadDuringCombat(value:Ai_goal_lead_weaponLeadDuringCombatChoices):Ai_goal_lead_weaponLeadDuringCombatChoices {
        return untyped this.SetKeyValue("LeadDuringCombat",untyped value);
    }
    
    /**
		Gag Leader?
	**/
    public var GagLeader(get,set):Ai_goal_lead_weaponGagLeaderChoices;

    @:noCompletion
    public extern inline function get_GagLeader():Ai_goal_lead_weaponGagLeaderChoices {
        return untyped this.GetKeyValues().GagLeader;
    }
    
    @:noCompletion
    public extern inline function set_GagLeader(value:Ai_goal_lead_weaponGagLeaderChoices):Ai_goal_lead_weaponGagLeaderChoices {
        return untyped this.SetKeyValue("GagLeader",untyped value);
    }
    
    /**
		Attract player concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_ATTRACTPLAYER' concept is spoken.
	**/
    public var AttractPlayerConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_AttractPlayerConceptModifier():String {
        return untyped this.GetKeyValues().AttractPlayerConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_AttractPlayerConceptModifier(value:String):String {
        return untyped this.SetKeyValue("AttractPlayerConceptModifier",untyped value);
    }
    
    /**
		Player wait over concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_WAITOVER' concept is spoken.
	**/
    public var WaitOverConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_WaitOverConceptModifier():String {
        return untyped this.GetKeyValues().WaitOverConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_WaitOverConceptModifier(value:String):String {
        return untyped this.SetKeyValue("WaitOverConceptModifier",untyped value);
    }
    
    /**
		Arrival concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_ARRIVAL' concept is spoken.
	**/
    public var ArrivalConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_ArrivalConceptModifier():String {
        return untyped this.GetKeyValues().ArrivalConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_ArrivalConceptModifier(value:String):String {
        return untyped this.SetKeyValue("ArrivalConceptModifier",untyped value);
    }
    
    /**
		Post-arrival concepts modifier
	**/
    public var PostArrivalConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_PostArrivalConceptModifier():String {
        return untyped this.GetKeyValues().PostArrivalConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_PostArrivalConceptModifier(value:String):String {
        return untyped this.SetKeyValue("PostArrivalConceptModifier",untyped value);
    }
    
    /**
		Success concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_SUCCESS' concept is spoken.
	**/
    public var SuccessConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_SuccessConceptModifier():String {
        return untyped this.GetKeyValues().SuccessConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_SuccessConceptModifier(value:String):String {
        return untyped this.SetKeyValue("SuccessConceptModifier",untyped value);
    }
    
    /**
		Failure concept modifier

		Appended to the keyvalues passed into the response rules when the 'lead_fail' concept is spoken.
	**/
    public var FailureConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_FailureConceptModifier():String {
        return untyped this.GetKeyValues().FailureConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_FailureConceptModifier(value:String):String {
        return untyped this.SetKeyValue("FailureConceptModifier",untyped value);
    }
    
    /**
		Coming Back concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_RETRIEVE' concept is spoken. Spoken as the NPC starts returning to the player to retrieve him.
	**/
    public var ComingBackConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_ComingBackConceptModifier():String {
        return untyped this.GetKeyValues().ComingBackConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_ComingBackConceptModifier(value:String):String {
        return untyped this.SetKeyValue("ComingBackConceptModifier",untyped value);
    }
    
    /**
		Retrieve concept modifier

		Appended to the keyvalues passed into the response rules when the 'TLK_LEAD_COMINGBACK' concept is spoken. Spoken when NPC has finally reached the player to retrieve him.
	**/
    public var RetrieveConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_RetrieveConceptModifier():String {
        return untyped this.GetKeyValues().RetrieveConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_RetrieveConceptModifier(value:String):String {
        return untyped this.SetKeyValue("RetrieveConceptModifier",untyped value);
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
		Weapon
	**/
    public var WeaponName(get,set):Ai_goal_lead_weaponWeaponNameChoices;

    @:noCompletion
    public extern inline function get_WeaponName():Ai_goal_lead_weaponWeaponNameChoices {
        return untyped this.GetKeyValues().WeaponName;
    }
    
    @:noCompletion
    public extern inline function set_WeaponName(value:Ai_goal_lead_weaponWeaponNameChoices):Ai_goal_lead_weaponWeaponNameChoices {
        return untyped this.SetKeyValue("WeaponName",untyped value);
    }
    
    /**
		Missing weapon concept modifier
	**/
    public var MissingWeaponConceptModifier(get,set):String;

    @:noCompletion
    public extern inline function get_MissingWeaponConceptModifier():String {
        return untyped this.GetKeyValues().MissingWeaponConceptModifier;
    }
    
    @:noCompletion
    public extern inline function set_MissingWeaponConceptModifier(value:String):String {
        return untyped this.SetKeyValue("MissingWeaponConceptModifier",untyped value);
    }
    
    /**
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_lead_weaponSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_lead_weaponSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_lead_weaponSearchTypeChoices):Ai_goal_lead_weaponSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    //Outputs
    
    /**
		Fires when NPC reaches the lead point
	**/
    public extern inline function OutputOnArrival(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnArrival",callback);
    }
    
    /**
		Fires when NPC has played out any arrival speech
	**/
    public extern inline function OutputOnArrivalDone(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnArrivalDone",callback);
    }
    
    /**
		Fires when NPC achieves the goal
	**/
    public extern inline function OutputOnSuccess(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSuccess",callback);
    }
    
    /**
		Fires when NPC fails to achieves the goal
	**/
    public extern inline function OutputOnFailure(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFailure",callback);
    }
    
    /**
		Fires when NPC completes behavior (any post-success or fail acting is complete)
	**/
    public extern inline function OutputOnDone(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDone",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_lead_weapon}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Ai_goal_lead_weaponSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Ai_goal_lead_weaponSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Ai_goal_lead_weaponSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_lead_weapon");
    }
}

enum abstract Ai_goal_lead_weaponWeaponNameChoices(String) to String {
	var BUGBAIT = "weapon_bugbait";
	var SMG1 = "weapon_smg1";
	var AR2 = "weapon_ar2";
}
enum abstract Ai_goal_lead_weaponSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}
enum abstract Ai_goal_lead_weaponRunChoices(String) to String {
	var NO = "0";
	var YES = "1";
}
enum abstract Ai_goal_lead_weaponRetrieveWaitForSpeakChoices(Int) to Int {
	var NO_START_LEADING_WHILE_SPEAKING = 0;
	var YES_WAIT_FOR_SPEECH_TO_FINISH = 1;
}
enum abstract Ai_goal_lead_weaponRetrieveChoices(Int) to Int {
	var NO_JUST_IDLE_AND_WAIT = 0;
	var YES_MOVE_TO_RETRIEVE = 1;
}
enum abstract Ai_goal_lead_weaponLeadDuringCombatChoices(Int) to Int {
	var NO_STOP_TO_FIGHT_RESUME_LEADING_WHEN_SAFE = 0;
	var YES_LEAD_WHILE_FIGHTING = 1;
}
enum abstract Ai_goal_lead_weaponGagLeaderChoices(Int) to Int {
	var NO_SPEAK_LEAD_CONCEPTS_NORMALLY_RESPECTING_OTHER_LEAD_SPEECH_SETTINGS = 0;
	var YES_DONT_SPEAK_ANY_LEAD_CONCEPTS_AT_ALL_OVERRIDING_ALL_OTHER_LEAD_SPEECH_SETTINGS = 1;
}
enum abstract Ai_goal_lead_weaponDontSpeakStartChoices(Int) to Int {
	var YES_SPEAK_THE_START_GREETING = 0;
	var NO_DONT_SPEAK_THE_GREETING = 1;
}
enum abstract Ai_goal_lead_weaponComingBackWaitForSpeakChoices(Int) to Int {
	var NO_COME_BACK_WHILE_SPEAKING = 0;
	var YES_WAIT_FOR_SPEECH_TO_FINISH = 1;
}


enum abstract Ai_goal_lead_weaponSpawnFlags(Int) to Int {
	var NO_DEF_SUCCESS = 1;
	var NO_DEF_FAILURE = 2;
	var USE_GOAL_FACING = 4;
}

#end
