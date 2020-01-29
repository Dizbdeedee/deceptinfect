package gmod.engine_ents;
#if server
/**
	AI Relationship - Sets relationships between groups of NPCs in the AI.
**/
@:forward
abstract Ai_relationship(Entity) to Entity {
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
		Apply relationship changes. This will change all Subject entities' relationships to all Target entities. 

IMPORTANT: Once you ApplyRelationships, this entity is then 'ALWAYS ON' until you send a Disable input or RevertRelationship input. During the time this entity is 'ON', any entities that spawn who match the Subject or Target names will be affected. 

IMPORTANT: Unpredictable results may occur when two ai_relationship entities refer to the same set or subset of target or subject entities. This situation should be avoided.
	**/
    public extern inline function FireApplyRelationship(delay:Float) {
        untyped this.Fire("ApplyRelationship",untyped null,delay);
    }
    
    /**
		Revert relationship changes. This will return the relationship to what it was at the time the ApplyRelationship input was called (or when this ai_relationship was spawned if StartActive is set).
	**/
    public extern inline function FireRevertRelationship(delay:Float) {
        untyped this.Fire("RevertRelationship",untyped null,delay);
    }
    
    /**
		Revert relationship changes to the default relationship, which may have changed since this ai_relationship was applied. This returns control of the entity relationship to the code.
	**/
    public extern inline function FireRevertToDefaultRelationship(delay:Float) {
        untyped this.Fire("RevertToDefaultRelationship",untyped null,delay);
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
		Subject(s)

		This is the NPC(s) whose disposition will change. May be a targetname or a classname.
	**/
    public var subject(get,set):String;

    @:noCompletion
    public extern inline function get_subject():String {
        return untyped this.GetKeyValues().subject;
    }
    
    @:noCompletion
    public extern inline function set_subject(value:String):String {
        return untyped this.SetKeyValue("subject",untyped value);
    }
    
    /**
		Target(s)

		This is the NPC(s) about whom the Subject(s) will change their disposition. May be a tarGetname or a classname.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    /**
		Disposition

		Choose the way the Subject(s) should feel about the Target(s)
	**/
    public var disposition(get,set):Ai_relationshipdispositionChoices;

    @:noCompletion
    public extern inline function get_disposition():Ai_relationshipdispositionChoices {
        return untyped this.GetKeyValues().disposition;
    }
    
    @:noCompletion
    public extern inline function set_disposition(value:Ai_relationshipdispositionChoices):Ai_relationshipdispositionChoices {
        return untyped this.SetKeyValue("disposition",untyped value);
    }
    
    /**
		Radius for subject
	**/
    public var radius(get,set):Float;

    @:noCompletion
    public extern inline function get_radius():Float {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:Float):Float {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		Disposition Priority

		How much the Subject(s) should Like/Hate/Fear the Target(s). Higher priority = stronger feeling.
	**/
    public var rank(get,set):Int;

    @:noCompletion
    public extern inline function get_rank():Int {
        return untyped this.GetKeyValues().rank;
    }
    
    @:noCompletion
    public extern inline function set_rank(value:Int):Int {
        return untyped this.SetKeyValue("rank",untyped value);
    }
    
    /**
		Start Active
	**/
    public var StartActive(get,set):Ai_relationshipStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_relationshipStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_relationshipStartActiveChoices):Ai_relationshipStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Reciprocal

		Set this to YES to have the new relationship mirrored by Target
	**/
    public var Reciprocal(get,set):Ai_relationshipReciprocalChoices;

    @:noCompletion
    public extern inline function get_Reciprocal():Ai_relationshipReciprocalChoices {
        return untyped this.GetKeyValues().Reciprocal;
    }
    
    @:noCompletion
    public extern inline function set_Reciprocal(value:Ai_relationshipReciprocalChoices):Ai_relationshipReciprocalChoices {
        return untyped this.SetKeyValue("Reciprocal",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_relationship}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_relationship}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_relationship}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_relationship}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Ai_relationshipSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Ai_relationshipSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Ai_relationshipSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_relationship");
    }
}

enum abstract Ai_relationshipdispositionChoices(Int) to Int {
	var HATE = 1;
	var FEAR = 2;
	var LIKE = 3;
	var NEUTRAL = 4;
}
enum abstract Ai_relationshipStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_relationshipReciprocalChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Ai_relationshipSpawnFlags(Int) to Int {
	var NOTIFY_SUBJECT_OF_TARGETS_LOCATION = 1;
	var NOTIFY_TARGET_OF_SUBJECTS_LOCATION = 2;
}

#end
