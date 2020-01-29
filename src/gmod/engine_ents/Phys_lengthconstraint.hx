package gmod.engine_ents;
#if server
/**
	A constraint that preserves the distance between two entities. If the 'Keep Rigid' flag is set, think of it as a rod. If not, think off it as a virtual rope.
**/
@:forward
abstract Phys_lengthconstraint(Entity) to Entity {
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
		Additional Length

		Add (or subtract) this amount to the rest length of the rope.
	**/
    public var addlength(get,set):Float;

    @:noCompletion
    public extern inline function get_addlength():Float {
        return untyped this.GetKeyValues().addlength;
    }
    
    @:noCompletion
    public extern inline function set_addlength(value:Float):Float {
        return untyped this.SetKeyValue("addlength",untyped value);
    }
    
    /**
		Minimum Length

		If the constraint is not rigid, this is the minimum length it can be.
	**/
    public var minlength(get,set):Float;

    @:noCompletion
    public extern inline function get_minlength():Float {
        return untyped this.GetKeyValues().minlength;
    }
    
    @:noCompletion
    public extern inline function set_minlength(value:Float):Float {
        return untyped this.SetKeyValue("minlength",untyped value);
    }
    
    /**
		Attached object 2 point
	**/
    public var attachpoint(get,set):String;

    @:noCompletion
    public extern inline function get_attachpoint():String {
        return untyped this.GetKeyValues().attachpoint;
    }
    
    @:noCompletion
    public extern inline function set_attachpoint(value:String):String {
        return untyped this.SetKeyValue("attachpoint",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_lengthconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_lengthconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_lengthconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_lengthconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the constraint breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Phys_lengthconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_lengthconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_lengthconstraintSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_lengthconstraintSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_lengthconstraint");
    }
}



enum abstract Phys_lengthconstraintSpawnFlags(Int) to Int {
	var NO_COLLISION_UNTIL_BREAK = 1;
	var START_INACTIVE = 4;
	var CHANGE_MASS_TO_KEEP_STABLE_ATTACHMENT_TO_WORLD = 8;
	var DO_NOT_CONNECT_ENTITIES_UNTIL_TURNED_ON = 16;
	var NO_COLLISION_UNTIL_BREAK = 1;
	var KEEP_RIGID = 2;
}

#end
