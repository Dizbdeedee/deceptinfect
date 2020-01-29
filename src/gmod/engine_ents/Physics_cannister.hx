package gmod.engine_ents;
#if server
/**
	A physically simulated gas cannister that can have its cap shot off, at which point gas will start escaping and cause the cannister to fly around. If it takes enough damage, it will explode.
**/
@:forward
abstract Physics_cannister(Entity) to Entity {
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
		Start gas escaping from the cannister.
	**/
    public extern inline function FireActivate(param:String,delay:Float) {
        untyped this.Fire("Activate",untyped param,delay);
    }
    
    /**
		Stop gas escaping from the cannister.
	**/
    public extern inline function FireDeactivate(param:String,delay:Float) {
        untyped this.Fire("Deactivate",untyped param,delay);
    }
    
    /**
		Force the cannister to explode.
	**/
    public extern inline function FireExplode(param:String,delay:Float) {
        untyped this.Fire("Explode",untyped param,delay);
    }
    
    /**
		Wakes up the cannister, if it is sleeping.
	**/
    public extern inline function FireWake(delay:Float) {
        untyped this.Fire("Wake",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Pitch Yaw Roll (Y Z X)

		This entity's orientation in the world. Pitch is rotation around the Y axis, yaw is the rotation around the Z axis, roll is the rotation around the X axis.
	**/
    public var angles(get,set):Angle;

    @:noCompletion
    public extern inline function get_angles():Angle {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:Angle):Angle {
        return untyped this.SetKeyValue("angles",untyped value);
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
		World model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Explosion Damage

		The amount of damage done by the explosion created when the cannister blows up.
	**/
    public var expdamage(get,set):String;

    @:noCompletion
    public extern inline function get_expdamage():String {
        return untyped this.GetKeyValues().expdamage;
    }
    
    @:noCompletion
    public extern inline function set_expdamage(value:String):String {
        return untyped this.SetKeyValue("expdamage",untyped value);
    }
    
    /**
		Explosion Radius

		The radius of the explosion to create when the cannister blows up.
	**/
    public var expradius(get,set):String;

    @:noCompletion
    public extern inline function get_expradius():String {
        return untyped this.GetKeyValues().expradius;
    }
    
    @:noCompletion
    public extern inline function set_expradius(value:String):String {
        return untyped this.SetKeyValue("expradius",untyped value);
    }
    
    /**
		Health

		The amount of damage the cannister takes before exploding.
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
		Thrust

		When the cap has been blown off, and the escaping gas is thrusting the cannister about, this is the amount of thrust generated.
	**/
    public var thrust(get,set):String;

    @:noCompletion
    public extern inline function get_thrust():String {
        return untyped this.GetKeyValues().thrust;
    }
    
    @:noCompletion
    public extern inline function set_thrust(value:String):String {
        return untyped this.SetKeyValue("thrust",untyped value);
    }
    
    /**
		Fuel Seconds

		The amount of time that gas leaks from the cannister before being considered empty.
	**/
    public var fuel(get,set):String;

    @:noCompletion
    public extern inline function get_fuel():String {
        return untyped this.GetKeyValues().fuel;
    }
    
    @:noCompletion
    public extern inline function set_fuel(value:String):String {
        return untyped this.SetKeyValue("fuel",untyped value);
    }
    
    /**
		Smoke Color (R G B)
	**/
    public var rendercolor(get,set):String;

    @:noCompletion
    public extern inline function get_rendercolor():String {
        return untyped this.GetKeyValues().rendercolor;
    }
    
    @:noCompletion
    public extern inline function set_rendercolor(value:String):String {
        return untyped this.SetKeyValue("rendercolor",untyped value);
    }
    
    /**
		Smoke Alpha (0 - 255)
	**/
    public var renderamt(get,set):Int;

    @:noCompletion
    public extern inline function get_renderamt():Int {
        return untyped this.GetKeyValues().renderamt;
    }
    
    @:noCompletion
    public extern inline function set_renderamt(value:Int):Int {
        return untyped this.SetKeyValue("renderamt",untyped value);
    }
    
    /**
		Thruster Sound

		The sound played when the gas is escaping from the cannister.
	**/
    public var gassound(get,set):String;

    @:noCompletion
    public extern inline function get_gassound():String {
        return untyped this.GetKeyValues().gassound;
    }
    
    @:noCompletion
    public extern inline function set_gassound(value:String):String {
        return untyped this.SetKeyValue("gassound",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when gas starts to escape from the cannister.
	**/
    public extern inline function OutputOnActivate(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnActivate",callback);
    }
    
    /**
		Fired when this entity becomes awake (collision/force is applied).
	**/
    public extern inline function OutputOnAwakened(callback:Callback<{activator:Physics_cannister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAwakened",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Physics_cannisterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Physics_cannisterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Physics_cannisterSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("physics_cannister");
    }
}



enum abstract Physics_cannisterSpawnFlags(Int) to Int {
	var START_ASLEEP = 1;
	var EXPLODES = 2;
}

#end
