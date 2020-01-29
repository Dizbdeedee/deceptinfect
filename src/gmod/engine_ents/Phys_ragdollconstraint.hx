package gmod.engine_ents;
#if server
/**
	A constraint that fixes the position of two entities, relative to this constraint's origin. Also allows for limits on the rotation around each axis, in the space of this constraint.
**/
@:forward
abstract Phys_ragdollconstraint(Entity) to Entity {
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
		X axis min limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var xmin(get,set):Float;

    @:noCompletion
    public extern inline function get_xmin():Float {
        return untyped this.GetKeyValues().xmin;
    }
    
    @:noCompletion
    public extern inline function set_xmin(value:Float):Float {
        return untyped this.SetKeyValue("xmin",untyped value);
    }
    
    /**
		X axis max limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var xmax(get,set):Float;

    @:noCompletion
    public extern inline function get_xmax():Float {
        return untyped this.GetKeyValues().xmax;
    }
    
    @:noCompletion
    public extern inline function set_xmax(value:Float):Float {
        return untyped this.SetKeyValue("xmax",untyped value);
    }
    
    /**
		Y axis min limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var ymin(get,set):Float;

    @:noCompletion
    public extern inline function get_ymin():Float {
        return untyped this.GetKeyValues().ymin;
    }
    
    @:noCompletion
    public extern inline function set_ymin(value:Float):Float {
        return untyped this.SetKeyValue("ymin",untyped value);
    }
    
    /**
		Y axis max limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var ymax(get,set):Float;

    @:noCompletion
    public extern inline function get_ymax():Float {
        return untyped this.GetKeyValues().ymax;
    }
    
    @:noCompletion
    public extern inline function set_ymax(value:Float):Float {
        return untyped this.SetKeyValue("ymax",untyped value);
    }
    
    /**
		Z axis min limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var zmin(get,set):Float;

    @:noCompletion
    public extern inline function get_zmin():Float {
        return untyped this.GetKeyValues().zmin;
    }
    
    @:noCompletion
    public extern inline function set_zmin(value:Float):Float {
        return untyped this.SetKeyValue("zmin",untyped value);
    }
    
    /**
		Z axis max limit

		-180 min and 180 max = no constraint on this axis.
	**/
    public var zmax(get,set):Float;

    @:noCompletion
    public extern inline function get_zmax():Float {
        return untyped this.GetKeyValues().zmax;
    }
    
    @:noCompletion
    public extern inline function set_zmax(value:Float):Float {
        return untyped this.SetKeyValue("zmax",untyped value);
    }
    
    /**
		X axis friction
	**/
    public var xfriction(get,set):Float;

    @:noCompletion
    public extern inline function get_xfriction():Float {
        return untyped this.GetKeyValues().xfriction;
    }
    
    @:noCompletion
    public extern inline function set_xfriction(value:Float):Float {
        return untyped this.SetKeyValue("xfriction",untyped value);
    }
    
    /**
		Y axis friction
	**/
    public var yfriction(get,set):Float;

    @:noCompletion
    public extern inline function get_yfriction():Float {
        return untyped this.GetKeyValues().yfriction;
    }
    
    @:noCompletion
    public extern inline function set_yfriction(value:Float):Float {
        return untyped this.SetKeyValue("yfriction",untyped value);
    }
    
    /**
		Z axis friction
	**/
    public var zfriction(get,set):Float;

    @:noCompletion
    public extern inline function get_zfriction():Float {
        return untyped this.GetKeyValues().zfriction;
    }
    
    @:noCompletion
    public extern inline function set_zfriction(value:Float):Float {
        return untyped this.SetKeyValue("zfriction",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_ragdollconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_ragdollconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_ragdollconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_ragdollconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the constraint breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Phys_ragdollconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_ragdollconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_ragdollconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_ragdollconstraintSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_ragdollconstraint");
    }
}



enum abstract Phys_ragdollconstraintSpawnFlags(Int) to Int {
	var NO_COLLISION_UNTIL_BREAK = 1;
	var START_INACTIVE = 4;
	var CHANGE_MASS_TO_KEEP_STABLE_ATTACHMENT_TO_WORLD = 8;
	var DO_NOT_CONNECT_ENTITIES_UNTIL_TURNED_ON = 16;
	var NO_COLLISION_UNTIL_BREAK = 1;
	var ONLY_LIMIT_ROTATION_FREE_MOVEMENT = 2;
}

#end
