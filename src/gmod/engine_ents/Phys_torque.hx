package gmod.engine_ents;
#if server
/**
	An angular thruster. Use it to apply angular force to an entity.
**/
@:forward
abstract Phys_torque(Entity) to Entity {
    //Inputs
    
    /**
		Turn the force on
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Turn the force off
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Set Force Scale
	**/
    public extern inline function FireScale(param:String,delay:Float) {
        untyped this.Fire("Scale",untyped param,delay);
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
		Attached Object

		Object to apply the force to.
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
		Time of Force (0=inf)

		Automatic shut-off after this time has passed (0 = stay on forever or until deactivated)
	**/
    public var forcetime(get,set):String;

    @:noCompletion
    public extern inline function get_forcetime():String {
        return untyped this.GetKeyValues().forcetime;
    }
    
    @:noCompletion
    public extern inline function set_forcetime(value:String):String {
        return untyped this.SetKeyValue("forcetime",untyped value);
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
		Angular Acceleration
	**/
    public var force(get,set):String;

    @:noCompletion
    public extern inline function get_force():String {
        return untyped this.GetKeyValues().force;
    }
    
    @:noCompletion
    public extern inline function set_force(value:String):String {
        return untyped this.SetKeyValue("force",untyped value);
    }
    
    /**
		Rotation Axis
	**/
    public var axis(get,set):String;

    @:noCompletion
    public extern inline function get_axis():String {
        return untyped this.GetKeyValues().axis;
    }
    
    @:noCompletion
    public extern inline function set_axis(value:String):String {
        return untyped this.SetKeyValue("axis",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_torque}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_torque}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_torque}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_torque}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_torqueSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_torqueSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_torqueSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_torque");
    }
}



enum abstract Phys_torqueSpawnFlags(Int) to Int {
	var START_ON = 1;
	var APPLY_FORCE = 2;
	var APPLY_TORQUE = 4;
	var ORIENT_LOCALLY = 8;
	var IGNORE_MASS = 16;
}

#end
