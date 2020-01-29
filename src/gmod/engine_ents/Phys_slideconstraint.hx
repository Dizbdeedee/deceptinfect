package gmod.engine_ents;
#if server
/**
	A constraint that constrains an entity along a line segment.
**/
@:forward
abstract Phys_slideconstraint(Entity) to Entity {
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
		Force the constraint to break.
	**/
    public extern inline function FireBreak(delay:Float) {
        untyped this.Fire("Break",untyped null,delay);
    }
    
    /**
		Enable the constraint.  Do this when the objects don't exist when the constraint spawns - or when you have deactivated the constraint.  Broken constraints can NOT be turned on.  They have been deleted.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Disable this constraint.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Set linear velocity along the constraint
	**/
    public extern inline function FireSetVelocity(param:Float,delay:Float) {
        untyped this.Fire("SetVelocity",untyped param,delay);
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
		Entity 1
	**/
    public var attach1(get,set):String;

    @:noCompletion
    public extern inline function get_attach1():String {
        return untyped this.GetKeyValues().attach1;
    }
    
    @:noCompletion
    public extern inline function set_attach1(value:String):String {
        return untyped this.SetKeyValue("attach1",untyped value);
    }
    
    /**
		Entity 2
	**/
    public var attach2(get,set):String;

    @:noCompletion
    public extern inline function get_attach2():String {
        return untyped this.GetKeyValues().attach2;
    }
    
    @:noCompletion
    public extern inline function set_attach2(value:String):String {
        return untyped this.SetKeyValue("attach2",untyped value);
    }
    
    /**
		Constraint System Manager

		The name of a phys_constraintsystem that this constraint should be a part of. All constraints on a set of entities should be placed in the same system, or they will fight each other during simulation.
	**/
    public var constraintsystem(get,set):String;

    @:noCompletion
    public extern inline function get_constraintsystem():String {
        return untyped this.GetKeyValues().constraintsystem;
    }
    
    @:noCompletion
    public extern inline function set_constraintsystem(value:String):String {
        return untyped this.SetKeyValue("constraintsystem",untyped value);
    }
    
    /**
		Force Limit to Break (lbs)

		The amount of force an impact must apply to the constraint to break it. A way of calculating this is to set it to the mass of an object that would break this constraint if it were resting on the constrainted objects.
	**/
    public var forcelimit(get,set):Float;

    @:noCompletion
    public extern inline function get_forcelimit():Float {
        return untyped this.GetKeyValues().forcelimit;
    }
    
    @:noCompletion
    public extern inline function set_forcelimit(value:Float):Float {
        return untyped this.SetKeyValue("forcelimit",untyped value);
    }
    
    /**
		Torque Limit to Break (lbs * distance)

		The amount of torque required to break the constraint. A way of calculating this is to multiply any reference mass by the resting distance (from the center of mass of the object) needed to break the constraint.
	**/
    public var torquelimit(get,set):Float;

    @:noCompletion
    public extern inline function get_torquelimit():Float {
        return untyped this.GetKeyValues().torquelimit;
    }
    
    @:noCompletion
    public extern inline function set_torquelimit(value:Float):Float {
        return untyped this.SetKeyValue("torquelimit",untyped value);
    }
    
    /**
		Play Sound on Break

		A sound played when the constraint is broken.
	**/
    public var breaksound(get,set):String;

    @:noCompletion
    public extern inline function get_breaksound():String {
        return untyped this.GetKeyValues().breaksound;
    }
    
    @:noCompletion
    public extern inline function set_breaksound(value:String):String {
        return untyped this.SetKeyValue("breaksound",untyped value);
    }
    
    /**
		Follow teleport distance

		If one object teleports more than this many units away it will cause the other constrained object to teleport to an appropriate relative position.
	**/
    public var teleportfollowdistance(get,set):Float;

    @:noCompletion
    public extern inline function get_teleportfollowdistance():Float {
        return untyped this.GetKeyValues().teleportfollowdistance;
    }
    
    @:noCompletion
    public extern inline function set_teleportfollowdistance(value:Float):Float {
        return untyped this.SetKeyValue("teleportfollowdistance",untyped value);
    }
    
    /**
		Sliding Axis
	**/
    public var slideaxis(get,set):String;

    @:noCompletion
    public extern inline function get_slideaxis():String {
        return untyped this.GetKeyValues().slideaxis;
    }
    
    @:noCompletion
    public extern inline function set_slideaxis(value:String):String {
        return untyped this.SetKeyValue("slideaxis",untyped value);
    }
    
    /**
		Friction

		Resistance/friction in the constraint
	**/
    public var slidefriction(get,set):Float;

    @:noCompletion
    public extern inline function get_slidefriction():Float {
        return untyped this.GetKeyValues().slidefriction;
    }
    
    @:noCompletion
    public extern inline function set_slidefriction(value:Float):Float {
        return untyped this.SetKeyValue("slidefriction",untyped value);
    }
    
    /**
		Load Scale

		Scale of the mass load connected to this constraint (1=just the objects directly connected)
	**/
    public var SystemLoadScale(get,set):Float;

    @:noCompletion
    public extern inline function get_SystemLoadScale():Float {
        return untyped this.GetKeyValues().SystemLoadScale;
    }
    
    @:noCompletion
    public extern inline function set_SystemLoadScale(value:Float):Float {
        return untyped this.SetKeyValue("SystemLoadScale",untyped value);
    }
    
    /**
		Minimum Sound Velocity

		When travelling below this many units/sec, will not play any sound.
	**/
    public var minSoundThreshold(get,set):Float;

    @:noCompletion
    public extern inline function get_minSoundThreshold():Float {
        return untyped this.GetKeyValues().minSoundThreshold;
    }
    
    @:noCompletion
    public extern inline function set_minSoundThreshold(value:Float):Float {
        return untyped this.SetKeyValue("minSoundThreshold",untyped value);
    }
    
    /**
		Full Sound Velocity

		When travelling at this speed or above, will play sound at full volume.
	**/
    public var maxSoundThreshold(get,set):Float;

    @:noCompletion
    public extern inline function get_maxSoundThreshold():Float {
        return untyped this.GetKeyValues().maxSoundThreshold;
    }
    
    @:noCompletion
    public extern inline function set_maxSoundThreshold(value:Float):Float {
        return untyped this.SetKeyValue("maxSoundThreshold",untyped value);
    }
    
    /**
		Travel sound (forward)

		Play this sound when travelling forward on helper axis
	**/
    public var slidesoundfwd(get,set):String;

    @:noCompletion
    public extern inline function get_slidesoundfwd():String {
        return untyped this.GetKeyValues().slidesoundfwd;
    }
    
    @:noCompletion
    public extern inline function set_slidesoundfwd(value:String):String {
        return untyped this.SetKeyValue("slidesoundfwd",untyped value);
    }
    
    /**
		Travel sound (backward)

		Play this sound when travelling backward on helper axis
	**/
    public var slidesoundback(get,set):String;

    @:noCompletion
    public extern inline function get_slidesoundback():String {
        return untyped this.GetKeyValues().slidesoundback;
    }
    
    @:noCompletion
    public extern inline function set_slidesoundback(value:String):String {
        return untyped this.SetKeyValue("slidesoundback",untyped value);
    }
    
    /**
		Reversal sound threshold (small)

		When accelerating by more than this many units/sec^2 opposite to direction of travel, play the small reversal sound.
	**/
    public var reversalsoundthresholdSmall(get,set):Float;

    @:noCompletion
    public extern inline function get_reversalsoundthresholdSmall():Float {
        return untyped this.GetKeyValues().reversalsoundthresholdSmall;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundthresholdSmall(value:Float):Float {
        return untyped this.SetKeyValue("reversalsoundthresholdSmall",untyped value);
    }
    
    /**
		Reversal sound threshold (medium)

		When accelerating by more than this many units/sec^2 opposite to direction of travel, play the medium reversal sound.
	**/
    public var reversalsoundthresholdMedium(get,set):Float;

    @:noCompletion
    public extern inline function get_reversalsoundthresholdMedium():Float {
        return untyped this.GetKeyValues().reversalsoundthresholdMedium;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundthresholdMedium(value:Float):Float {
        return untyped this.SetKeyValue("reversalsoundthresholdMedium",untyped value);
    }
    
    /**
		Reversal sound threshold (large)

		When accelerating by more than this many units/sec^2 opposite to direction of travel, play the large reversal sound.
	**/
    public var reversalsoundthresholdLarge(get,set):Float;

    @:noCompletion
    public extern inline function get_reversalsoundthresholdLarge():Float {
        return untyped this.GetKeyValues().reversalsoundthresholdLarge;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundthresholdLarge(value:Float):Float {
        return untyped this.SetKeyValue("reversalsoundthresholdLarge",untyped value);
    }
    
    /**
		Reversal sound (small)

		Play this sound when making a hard reverse over the small threshold but less than medium
	**/
    public var reversalsoundSmall(get,set):String;

    @:noCompletion
    public extern inline function get_reversalsoundSmall():String {
        return untyped this.GetKeyValues().reversalsoundSmall;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundSmall(value:String):String {
        return untyped this.SetKeyValue("reversalsoundSmall",untyped value);
    }
    
    /**
		Reversal sound (medium)

		Play this sound when making a hard reverse over the medium threshold but less than large
	**/
    public var reversalsoundMedium(get,set):String;

    @:noCompletion
    public extern inline function get_reversalsoundMedium():String {
        return untyped this.GetKeyValues().reversalsoundMedium;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundMedium(value:String):String {
        return untyped this.SetKeyValue("reversalsoundMedium",untyped value);
    }
    
    /**
		Reversal sound (large)

		Play this sound when making a hard reverse over the large threshold
	**/
    public var reversalsoundLarge(get,set):String;

    @:noCompletion
    public extern inline function get_reversalsoundLarge():String {
        return untyped this.GetKeyValues().reversalsoundLarge;
    }
    
    @:noCompletion
    public extern inline function set_reversalsoundLarge(value:String):String {
        return untyped this.SetKeyValue("reversalsoundLarge",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_slideconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_slideconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_slideconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_slideconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the constraint breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Phys_slideconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_slideconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_slideconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_slideconstraintSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_slideconstraint");
    }
}



enum abstract Phys_slideconstraintSpawnFlags(Int) to Int {
	var NO_COLLISION_UNTIL_BREAK = 1;
	var START_INACTIVE = 4;
	var CHANGE_MASS_TO_KEEP_STABLE_ATTACHMENT_TO_WORLD = 8;
	var DO_NOT_CONNECT_ENTITIES_UNTIL_TURNED_ON = 16;
	var NO_COLLISION_UNTIL_BREAK = 1;
	var LIMIT_ENDPOINTS = 2;
}

#end
