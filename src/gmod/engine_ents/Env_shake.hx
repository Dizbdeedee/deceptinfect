package gmod.engine_ents;
#if server
/**
	An entity to control screen shake on players.
**/
@:forward
abstract Env_shake(Entity) to Entity {
    //Inputs
    
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
		Set the amplitude (0-16)
	**/
    public extern inline function FireAmplitude(param:String,delay:Float) {
        untyped this.Fire("Amplitude",untyped param,delay);
    }
    
    /**
		Set the frequence. Should be a value between 0 and 255, where 0.1 = jerk, and 255.0 = rumble.
	**/
    public extern inline function FireFrequency(param:String,delay:Float) {
        untyped this.Fire("Frequency",untyped param,delay);
    }
    
    /**
		Start the shake.
	**/
    public extern inline function FireStartShake(delay:Float) {
        untyped this.Fire("StartShake",untyped null,delay);
    }
    
    /**
		Stop the shake.
	**/
    public extern inline function FireStopShake(delay:Float) {
        untyped this.Fire("StopShake",untyped null,delay);
    }
    
    //Keyvalues
    
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
		Amplitude (0-16)

		The amount of noise in the screen shake. Should be a range between 0 and 16.
	**/
    public var amplitude(get,set):Float;

    @:noCompletion
    public extern inline function get_amplitude():Float {
        return untyped this.GetKeyValues().amplitude;
    }
    
    @:noCompletion
    public extern inline function set_amplitude(value:Float):Float {
        return untyped this.SetKeyValue("amplitude",untyped value);
    }
    
    /**
		Effect Radius

		The radius around this entity in which to affect players.
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
		Duration (seconds)

		The length of time in which to shake the player's screens.
	**/
    public var duration(get,set):Float;

    @:noCompletion
    public extern inline function get_duration():Float {
        return untyped this.GetKeyValues().duration;
    }
    
    @:noCompletion
    public extern inline function set_duration(value:Float):Float {
        return untyped this.SetKeyValue("duration",untyped value);
    }
    
    /**
		Frequency

		The frequency used to apply the screen shake. Should be a value between 0 and 255, where 0.1 = jerk, and 255.0 = rumble.
	**/
    public var frequency(get,set):Float;

    @:noCompletion
    public extern inline function get_frequency():Float {
        return untyped this.GetKeyValues().frequency;
    }
    
    @:noCompletion
    public extern inline function set_frequency(value:Float):Float {
        return untyped this.SetKeyValue("frequency",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_shake}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_shake}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_shake}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_shake}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_shakeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_shakeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_shakeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_shake");
    }
}



enum abstract Env_shakeSpawnFlags(Int) to Int {
	var GLOBALSHAKE = 1;
	var IN_AIR = 4;
	var PHYSICS = 8;
	var ROPES = 16;
	var DONT_SHAKE_VIEW_FOR_SHAKING_ROPES_OR_PHYSICS_ONLY = 32;
	var DONT_RUMBLE_CONTROLLER = 64;
}

#end
