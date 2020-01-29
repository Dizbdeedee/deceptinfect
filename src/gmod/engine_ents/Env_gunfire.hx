package gmod.engine_ents;
#if server
/**
	Gunfire Effect
**/
@:forward
abstract Env_gunfire(Entity) to Entity {
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
		Start Disabled
	**/
    public var StartDisabled(get,set):Env_gunfireStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Env_gunfireStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Env_gunfireStartDisabledChoices):Env_gunfireStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
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
		Target

		Shoot at this target. REMEMBER - this is an effect only! It does not do damage!
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
		Min Burst Size

		Minimum number of rounds in a burst.
	**/
    public var minburstsize(get,set):Int;

    @:noCompletion
    public extern inline function get_minburstsize():Int {
        return untyped this.GetKeyValues().minburstsize;
    }
    
    @:noCompletion
    public extern inline function set_minburstsize(value:Int):Int {
        return untyped this.SetKeyValue("minburstsize",untyped value);
    }
    
    /**
		Max Burst Size

		Maximum number of rounds in a burst.
	**/
    public var maxburstsize(get,set):Int;

    @:noCompletion
    public extern inline function get_maxburstsize():Int {
        return untyped this.GetKeyValues().maxburstsize;
    }
    
    @:noCompletion
    public extern inline function set_maxburstsize(value:Int):Int {
        return untyped this.SetKeyValue("maxburstsize",untyped value);
    }
    
    /**
		Min Delay Between Bursts

		Minimum delay between bursts. (seconds)
	**/
    public var minburstdelay(get,set):Float;

    @:noCompletion
    public extern inline function get_minburstdelay():Float {
        return untyped this.GetKeyValues().minburstdelay;
    }
    
    @:noCompletion
    public extern inline function set_minburstdelay(value:Float):Float {
        return untyped this.SetKeyValue("minburstdelay",untyped value);
    }
    
    /**
		Max Delay Between Bursts

		Maximum delay between bursts. (seconds)
	**/
    public var maxburstdelay(get,set):Float;

    @:noCompletion
    public extern inline function get_maxburstdelay():Float {
        return untyped this.GetKeyValues().maxburstdelay;
    }
    
    @:noCompletion
    public extern inline function set_maxburstdelay(value:Float):Float {
        return untyped this.SetKeyValue("maxburstdelay",untyped value);
    }
    
    /**
		Rate of fire

		Expressed as rounds per second
	**/
    public var rateoffire(get,set):Float;

    @:noCompletion
    public extern inline function get_rateoffire():Float {
        return untyped this.GetKeyValues().rateoffire;
    }
    
    @:noCompletion
    public extern inline function set_rateoffire(value:Float):Float {
        return untyped this.SetKeyValue("rateoffire",untyped value);
    }
    
    /**
		Bullet spread

		The 'cone of inaccuracy' of the shots fired by this entity.
	**/
    public var spread(get,set):Env_gunfirespreadChoices;

    @:noCompletion
    public extern inline function get_spread():Env_gunfirespreadChoices {
        return untyped this.GetKeyValues().spread;
    }
    
    @:noCompletion
    public extern inline function set_spread(value:Env_gunfirespreadChoices):Env_gunfirespreadChoices {
        return untyped this.SetKeyValue("spread",untyped value);
    }
    
    /**
		Bullet distribution should be...

		How to distribute bullets within the spread. Even distribution is a true scatter throughout the spread. Biased towards the outside makes the shots 'miss' the target by tending towards the outside of the spread.
	**/
    public var bias(get,set):Env_gunfirebiasChoices;

    @:noCompletion
    public extern inline function get_bias():Env_gunfirebiasChoices {
        return untyped this.GetKeyValues().bias;
    }
    
    @:noCompletion
    public extern inline function set_bias(value:Env_gunfirebiasChoices):Env_gunfirebiasChoices {
        return untyped this.SetKeyValue("bias",untyped value);
    }
    
    /**
		Collision detection

		Whether/how to handle bullet collision detection. NOTE: If you select NONE, this entity will be very cheap to use, but all bullets will stop short at their target's position in space and there will be no impact effects. Normal collision detection does the same things NPCs do when they fire their guns (except harm anything).
	**/
    public var collisions(get,set):Env_gunfirecollisionsChoices;

    @:noCompletion
    public extern inline function get_collisions():Env_gunfirecollisionsChoices {
        return untyped this.GetKeyValues().collisions;
    }
    
    @:noCompletion
    public extern inline function set_collisions(value:Env_gunfirecollisionsChoices):Env_gunfirecollisionsChoices {
        return untyped this.SetKeyValue("collisions",untyped value);
    }
    
    /**
		Shoot Sound

		Gunfire sound to make
	**/
    public var shootsound(get,set):Env_gunfireshootsoundChoices;

    @:noCompletion
    public extern inline function get_shootsound():Env_gunfireshootsoundChoices {
        return untyped this.GetKeyValues().shootsound;
    }
    
    @:noCompletion
    public extern inline function set_shootsound(value:Env_gunfireshootsoundChoices):Env_gunfireshootsoundChoices {
        return untyped this.SetKeyValue("shootsound",untyped value);
    }
    
    /**
		Tracer

		Type of tracer to display
	**/
    public var tracertype(get,set):Env_gunfiretracertypeChoices;

    @:noCompletion
    public extern inline function get_tracertype():Env_gunfiretracertypeChoices {
        return untyped this.GetKeyValues().tracertype;
    }
    
    @:noCompletion
    public extern inline function set_tracertype(value:Env_gunfiretracertypeChoices):Env_gunfiretracertypeChoices {
        return untyped this.SetKeyValue("tracertype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_gunfire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_gunfire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_gunfire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_gunfire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_gunfire");
    }
}

enum abstract Env_gunfiretracertypeChoices(String) to String {
	var DEFAULT = "Tracer";
	var AR2 = "AR2TRACER";
}
enum abstract Env_gunfirespreadChoices(Int) to Int {
	var _1_DEGREE = 1;
	var _5_DEGREES = 5;
	var _10_DEGREES = 10;
	var _15_DEGREES = 15;
}
enum abstract Env_gunfireshootsoundChoices(String) to String {
	var AR2 = "Weapon_AR2.NPC_Single";
	var SMG1 = "Weapon_SMG1.NPC_Single";
}
enum abstract Env_gunfirecollisionsChoices(Int) to Int {
	var NONE_CHEAP_FOR_PERFORMANCE = 0;
	var NORMAL_COLLISION_DETECTION = 1;
}
enum abstract Env_gunfirebiasChoices(Int) to Int {
	var EVENLY_DISTRIBUTED = 1;
	var BIASED_TOWARDS_THE_OUTSIDE = -1;
}
enum abstract Env_gunfireStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
