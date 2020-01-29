package gmod.engine_ents;
#if server
/**
	A brush entity that spawns smoke particles within its volume.
**/
@:forward
abstract Func_smokevolume(Entity) to Entity {
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
		Set the particle rotation speed (in degrees per second).
	**/
    public extern inline function FireSetRotationSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetRotationSpeed",untyped param,delay);
    }
    
    /**
		Set the particle movement speed (in inches per second).
	**/
    public extern inline function FireSetMovementSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetMovementSpeed",untyped param,delay);
    }
    
    /**
		Set the particle density. It should be a range from 0 to 1.
	**/
    public extern inline function FireSetDensity(param:Float,delay:Float) {
        untyped this.Fire("SetDensity",untyped param,delay);
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
		Particle Color1 (R G B)
	**/
    public var Color1(get,set):String;

    @:noCompletion
    public extern inline function get_Color1():String {
        return untyped this.GetKeyValues().Color1;
    }
    
    @:noCompletion
    public extern inline function set_Color1(value:String):String {
        return untyped this.SetKeyValue("Color1",untyped value);
    }
    
    /**
		Particle Color2 (R G B)
	**/
    public var Color2(get,set):String;

    @:noCompletion
    public extern inline function get_Color2():String {
        return untyped this.GetKeyValues().Color2;
    }
    
    @:noCompletion
    public extern inline function set_Color2(value:String):String {
        return untyped this.SetKeyValue("Color2",untyped value);
    }
    
    /**
		Material

		The material to use for the particles
	**/
    public var material(get,set):String;

    @:noCompletion
    public extern inline function get_material():String {
        return untyped this.GetKeyValues().material;
    }
    
    @:noCompletion
    public extern inline function set_material(value:String):String {
        return untyped this.SetKeyValue("material",untyped value);
    }
    
    /**
		Particle Draw Width (units)

		The size of the particles, in units/inches.
	**/
    public var ParticleDrawWidth(get,set):Float;

    @:noCompletion
    public extern inline function get_ParticleDrawWidth():Float {
        return untyped this.GetKeyValues().ParticleDrawWidth;
    }
    
    @:noCompletion
    public extern inline function set_ParticleDrawWidth(value:Float):Float {
        return untyped this.SetKeyValue("ParticleDrawWidth",untyped value);
    }
    
    /**
		Particle Spacing Distance (units)

		The distance between the particles inside the volume. The lower the number, the denser the particles, and the more overdraw there will be. It is best to keep it as high as you can without it looking bad.
	**/
    public var ParticleSpacingDistance(get,set):Float;

    @:noCompletion
    public extern inline function get_ParticleSpacingDistance():Float {
        return untyped this.GetKeyValues().ParticleSpacingDistance;
    }
    
    @:noCompletion
    public extern inline function set_ParticleSpacingDistance(value:Float):Float {
        return untyped this.SetKeyValue("ParticleSpacingDistance",untyped value);
    }
    
    /**
		Density Ramp Speed (seconds)

		Time to go from density 0 to density 1, in seconds.
	**/
    public var DensityRampSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_DensityRampSpeed():Float {
        return untyped this.GetKeyValues().DensityRampSpeed;
    }
    
    @:noCompletion
    public extern inline function set_DensityRampSpeed(value:Float):Float {
        return untyped this.SetKeyValue("DensityRampSpeed",untyped value);
    }
    
    /**
		Rotation Speed (degrees/sec)

		The speed that the particles should rotate, in degrees per second.
	**/
    public var RotationSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_RotationSpeed():Float {
        return untyped this.GetKeyValues().RotationSpeed;
    }
    
    @:noCompletion
    public extern inline function set_RotationSpeed(value:Float):Float {
        return untyped this.SetKeyValue("RotationSpeed",untyped value);
    }
    
    /**
		Movement Speed (units/sec)

		The speed that the particles should move around, in units/inches per second.
	**/
    public var MovementSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_MovementSpeed():Float {
        return untyped this.GetKeyValues().MovementSpeed;
    }
    
    @:noCompletion
    public extern inline function set_MovementSpeed(value:Float):Float {
        return untyped this.SetKeyValue("MovementSpeed",untyped value);
    }
    
    /**
		Density [0..1]
	**/
    public var Density(get,set):Float;

    @:noCompletion
    public extern inline function get_Density():Float {
        return untyped this.GetKeyValues().Density;
    }
    
    @:noCompletion
    public extern inline function set_Density(value:Float):Float {
        return untyped this.SetKeyValue("Density",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_smokevolume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_smokevolume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_smokevolume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_smokevolume}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_smokevolumeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_smokevolumeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_smokevolumeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_smokevolume");
    }
}



enum abstract Func_smokevolumeSpawnFlags(Int) to Int {
	var EMISSIVE = 1;
}

#end
