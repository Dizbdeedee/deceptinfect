package gmod.engine_ents;
#if server
/**
	An entity that detects if another entity points in a given direction for a period of time.
**/
@:forward
abstract Point_anglesensor(Entity) to Entity {
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
		Toggle the sensor between enabled and disabled.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Check to see if the Target Entity is facing the Look At Entity within the specified tolerance, firing either the OnFacingLookat or OnNotFacingLookat output based on the result.
	**/
    public extern inline function FireTest(delay:Float) {
        untyped this.Fire("Test",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Point_anglesensorStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Point_anglesensorStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Point_anglesensorStartDisabledChoices):Point_anglesensorStartDisabledChoices {
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
		Target Entity Name

		Name of the entity whose angles will be sensed.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    /**
		Look At Entity

		The entity we want to check to see if the Target Entity is looking at.
	**/
    public var lookatname(get,set):String;

    @:noCompletion
    public extern inline function get_lookatname():String {
        return untyped this.GetKeyValues().lookatname;
    }
    
    @:noCompletion
    public extern inline function set_lookatname(value:String):String {
        return untyped this.SetKeyValue("lookatname",untyped value);
    }
    
    /**
		Duration

		The amount of time the Target Entity must look at the 'Look at Entity' to trigger this entity, in seconds.
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
		Tolerance

		The tolerance, in degrees, in the checking to determine when the Target Entity is looking at the Look At Entity.
	**/
    public var tolerance(get,set):Int;

    @:noCompletion
    public extern inline function get_tolerance():Int {
        return untyped this.GetKeyValues().tolerance;
    }
    
    @:noCompletion
    public extern inline function set_tolerance(value:Int):Int {
        return untyped this.SetKeyValue("tolerance",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the forward direction of the Target Entity changes. Passes the new forward direction as a parameter.
	**/
    public extern inline function OutputTargetDir(callback:Callback<{activator:Point_anglesensor,data:Vector}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"TargetDir",callback);
    }
    
    /**
		Fired when the Target Entity points at the Look At Entity for more than the specified Duration, or in response to a Test input.
	**/
    public extern inline function OutputOnFacingLookat(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFacingLookat",callback);
    }
    
    /**
		Fires in response to a Test input when the Target Entity is not pointing at the Look At Entity.
	**/
    public extern inline function OutputOnNotFacingLookat(callback:Callback<{activator:Point_anglesensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNotFacingLookat",callback);
    }
    
    /**
		Normalized value (0..1) where 1 is facing directly at target and 0 is at or beyond the angle of tolerance.
	**/
    public extern inline function OutputFacingPercentage(callback:Callback<{activator:Point_anglesensor,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"FacingPercentage",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_anglesensorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_anglesensorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_anglesensorSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_anglesensor");
    }
}

enum abstract Point_anglesensorStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Point_anglesensorSpawnFlags(Int) to Int {
	var USE_TARGET_ENTITYS_ANGLES_NOT_POSITION = 1;
}

#end
