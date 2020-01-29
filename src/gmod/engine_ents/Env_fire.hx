package gmod.engine_ents;
#if server
/**
	An entity that handles a single flame at its origin. The flame causes heat 'damage' to other env_fire entities around it, and will eventually ignite non-flaming env_fire entities nearby, causing the fire to spread.
**/
@:forward
abstract Env_fire(Entity) to Entity {
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
    
    /**
		Start the fire.
	**/
    public extern inline function FireStartFire(delay:Float) {
        untyped this.Fire("StartFire",untyped null,delay);
    }
    
    /**
		Puts out the fire permanently in the number of seconds specified.
	**/
    public extern inline function FireExtinguish(param:Float,delay:Float) {
        untyped this.Fire("Extinguish",untyped param,delay);
    }
    
    /**
		Puts out the fire temporarily in the number of seconds specified.
	**/
    public extern inline function FireExtinguishTemporary(param:Float,delay:Float) {
        untyped this.Fire("ExtinguishTemporary",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Env_fireStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Env_fireStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Env_fireStartDisabledChoices):Env_fireStartDisabledChoices {
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
		Duration

		Amount of time the fire will burn.
	**/
    public var health(get,set):Int;

    @:noCompletion
    public extern inline function get_health():Int {
        return untyped this.GetKeyValues().health;
    }
    
    @:noCompletion
    public extern inline function set_health(value:Int):Int {
        return untyped this.SetKeyValue("health",untyped value);
    }
    
    /**
		Size

		Height (in world units) of the flame.
	**/
    public var firesize(get,set):Int;

    @:noCompletion
    public extern inline function get_firesize():Int {
        return untyped this.GetKeyValues().firesize;
    }
    
    @:noCompletion
    public extern inline function set_firesize(value:Int):Int {
        return untyped this.SetKeyValue("firesize",untyped value);
    }
    
    /**
		Attack

		Amount of time the fire takes to grow to full strength.
	**/
    public var fireattack(get,set):Int;

    @:noCompletion
    public extern inline function get_fireattack():Int {
        return untyped this.GetKeyValues().fireattack;
    }
    
    @:noCompletion
    public extern inline function set_fireattack(value:Int):Int {
        return untyped this.SetKeyValue("fireattack",untyped value);
    }
    
    /**
		Type
	**/
    public var firetype(get,set):Env_firefiretypeChoices;

    @:noCompletion
    public extern inline function get_firetype():Env_firefiretypeChoices {
        return untyped this.GetKeyValues().firetype;
    }
    
    @:noCompletion
    public extern inline function set_firetype(value:Env_firefiretypeChoices):Env_firefiretypeChoices {
        return untyped this.SetKeyValue("firetype",untyped value);
    }
    
    /**
		Ignition Point

		Amount of heat 'damage' to take before this flame should ignite.
	**/
    public var ignitionpoint(get,set):Float;

    @:noCompletion
    public extern inline function get_ignitionpoint():Float {
        return untyped this.GetKeyValues().ignitionpoint;
    }
    
    @:noCompletion
    public extern inline function set_ignitionpoint(value:Float):Float {
        return untyped this.SetKeyValue("ignitionpoint",untyped value);
    }
    
    /**
		Damage Scale

		Multiplier of the burn damage done by the flame.
	**/
    public var damagescale(get,set):Float;

    @:noCompletion
    public extern inline function get_damagescale():Float {
        return untyped this.GetKeyValues().damagescale;
    }
    
    @:noCompletion
    public extern inline function set_damagescale(value:Float):Float {
        return untyped this.SetKeyValue("damagescale",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when the fire is first ignited.
	**/
    public extern inline function OutputOnIgnited(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnited",callback);
    }
    
    /**
		Fires when the fire is fully extinguished.
	**/
    public extern inline function OutputOnExtinguished(callback:Callback<{activator:Env_fire}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnExtinguished",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_fireSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_fireSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_fireSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_fire");
    }
}

enum abstract Env_firefiretypeChoices(Int) to Int {
	var NATURAL = 0;
	var PLASMA = 1;
}
enum abstract Env_fireStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_fireSpawnFlags(Int) to Int {
	var INFINITE_DURATION = 1;
	var SMOKELESS = 2;
	var START_ON = 4;
	var START_FULL = 8;
	var DONT_DROP = 16;
	var NO_GLOW = 32;
	var DELETE_WHEN_OUT = 128;
	var VISIBLE_FROM_ABOVE = 256;
}

#end
