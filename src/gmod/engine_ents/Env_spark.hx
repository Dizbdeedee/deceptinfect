package gmod.engine_ents;
#if server
/**
	An entity used to create sparks at its origin.
**/
@:forward
abstract Env_spark(Entity) to Entity {
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
		Start the spark effect.
	**/
    public extern inline function FireStartSpark(delay:Float) {
        untyped this.Fire("StartSpark",untyped null,delay);
    }
    
    /**
		Stop the spark effect.
	**/
    public extern inline function FireStopSpark(delay:Float) {
        untyped this.Fire("StopSpark",untyped null,delay);
    }
    
    /**
		Toggle the on/off state of the spark effect.
	**/
    public extern inline function FireToggleSpark(delay:Float) {
        untyped this.Fire("ToggleSpark",untyped null,delay);
    }
    
    /**
		Spark once.
	**/
    public extern inline function FireSparkOnce(delay:Float) {
        untyped this.Fire("SparkOnce",untyped null,delay);
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
		Max Delay

		The longest delay between sparks (in seconds).
	**/
    public var MaxDelay(get,set):String;

    @:noCompletion
    public extern inline function get_MaxDelay():String {
        return untyped this.GetKeyValues().MaxDelay;
    }
    
    @:noCompletion
    public extern inline function set_MaxDelay(value:String):String {
        return untyped this.SetKeyValue("MaxDelay",untyped value);
    }
    
    /**
		Magnitude

		The size of the sparks.
	**/
    public var Magnitude(get,set):Env_sparkMagnitudeChoices;

    @:noCompletion
    public extern inline function get_Magnitude():Env_sparkMagnitudeChoices {
        return untyped this.GetKeyValues().Magnitude;
    }
    
    @:noCompletion
    public extern inline function set_Magnitude(value:Env_sparkMagnitudeChoices):Env_sparkMagnitudeChoices {
        return untyped this.SetKeyValue("Magnitude",untyped value);
    }
    
    /**
		Spark Trail Length
	**/
    public var TrailLength(get,set):Env_sparkTrailLengthChoices;

    @:noCompletion
    public extern inline function get_TrailLength():Env_sparkTrailLengthChoices {
        return untyped this.GetKeyValues().TrailLength;
    }
    
    @:noCompletion
    public extern inline function set_TrailLength(value:Env_sparkTrailLengthChoices):Env_sparkTrailLengthChoices {
        return untyped this.SetKeyValue("TrailLength",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_spark}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_spark}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_spark}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_spark}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_sparkSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_sparkSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_sparkSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_spark");
    }
}

enum abstract Env_sparkTrailLengthChoices(Int) to Int {
	var SHORT = 1;
	var MEDIUM = 2;
	var LONG = 3;
}
enum abstract Env_sparkMagnitudeChoices(Int) to Int {
	var SMALL = 1;
	var MEDIUM = 2;
	var LARGE = 5;
	var HUGE = 8;
}


enum abstract Env_sparkSpawnFlags(Int) to Int {
	var START_ON = 64;
	var GLOW = 128;
	var SILENT = 256;
	var DIRECTIONAL = 512;
}

#end
