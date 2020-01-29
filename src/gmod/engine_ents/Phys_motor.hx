package gmod.engine_ents;
#if server
/**
	An entity that tries to spin a target entity at a particular speed.
**/
@:forward
abstract Phys_motor(Entity) to Entity {
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
		Sets target speed
	**/
    public extern inline function FireSetSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetSpeed",untyped param,delay);
    }
    
    /**
		Turns motor on
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turns motor off
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
		Rotation Speed

		Angular speed (units are degress/second)
	**/
    public var speed(get,set):String;

    @:noCompletion
    public extern inline function get_speed():String {
        return untyped this.GetKeyValues().speed;
    }
    
    @:noCompletion
    public extern inline function set_speed(value:String):String {
        return untyped this.SetKeyValue("speed",untyped value);
    }
    
    /**
		Spin up time

		spin up time in seconds (also affects the rate at which speed changes happen)
	**/
    public var spinup(get,set):String;

    @:noCompletion
    public extern inline function get_spinup():String {
        return untyped this.GetKeyValues().spinup;
    }
    
    @:noCompletion
    public extern inline function set_spinup(value:String):String {
        return untyped this.SetKeyValue("spinup",untyped value);
    }
    
    /**
		System Interia Scale

		Make this larger if the object being driven is constrained to a set of heavier objects.
	**/
    public var inertiafactor(get,set):Float;

    @:noCompletion
    public extern inline function get_inertiafactor():Float {
        return untyped this.GetKeyValues().inertiafactor;
    }
    
    @:noCompletion
    public extern inline function set_inertiafactor(value:Float):Float {
        return untyped this.SetKeyValue("inertiafactor",untyped value);
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
    
    /**
		Attached Object

		Object to apply the force to
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_motor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_motor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_motor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_motor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_motorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_motorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_motorSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_motor");
    }
}



enum abstract Phys_motorSpawnFlags(Int) to Int {
	var START_ON = 1;
	var NO_WORLD_COLLISION = 2;
	var HINGE_OBJECT = 4;
}

#end
