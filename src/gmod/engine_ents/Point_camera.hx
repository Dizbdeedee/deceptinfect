package gmod.engine_ents;
#if server
/**
	Camera
**/
@:forward
abstract Point_camera(Entity) to Entity {
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
		Changes camera's FOV over time
	**/
    public extern inline function FireChangeFOV(param:String,delay:Float) {
        untyped this.Fire("ChangeFOV",untyped param,delay);
    }
    
    /**
		Turn the camera on, and turn all other cameras off.
	**/
    public extern inline function FireSetOnAndTurnOthersOff(delay:Float) {
        untyped this.Fire("SetOnAndTurnOthersOff",untyped null,delay);
    }
    
    /**
		Turn the camera on.
	**/
    public extern inline function FireSetOn(delay:Float) {
        untyped this.Fire("SetOn",untyped null,delay);
    }
    
    /**
		Turn the camera off.
	**/
    public extern inline function FireSetOff(delay:Float) {
        untyped this.Fire("SetOff",untyped null,delay);
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
		FOV

		Field of view in degrees
	**/
    public var FOV(get,set):Float;

    @:noCompletion
    public extern inline function get_FOV():Float {
        return untyped this.GetKeyValues().FOV;
    }
    
    @:noCompletion
    public extern inline function set_FOV(value:Float):Float {
        return untyped this.SetKeyValue("FOV",untyped value);
    }
    
    /**
		Screen Aspect Ratio
	**/
    public var UseScreenAspectRatio(get,set):Point_cameraUseScreenAspectRatioChoices;

    @:noCompletion
    public extern inline function get_UseScreenAspectRatio():Point_cameraUseScreenAspectRatioChoices {
        return untyped this.GetKeyValues().UseScreenAspectRatio;
    }
    
    @:noCompletion
    public extern inline function set_UseScreenAspectRatio(value:Point_cameraUseScreenAspectRatioChoices):Point_cameraUseScreenAspectRatioChoices {
        return untyped this.SetKeyValue("UseScreenAspectRatio",untyped value);
    }
    
    /**
		Fog Enable
	**/
    public var fogEnable(get,set):Point_camerafogEnableChoices;

    @:noCompletion
    public extern inline function get_fogEnable():Point_camerafogEnableChoices {
        return untyped this.GetKeyValues().fogEnable;
    }
    
    @:noCompletion
    public extern inline function set_fogEnable(value:Point_camerafogEnableChoices):Point_camerafogEnableChoices {
        return untyped this.SetKeyValue("fogEnable",untyped value);
    }
    
    /**
		Fog Color
	**/
    public var fogColor(get,set):String;

    @:noCompletion
    public extern inline function get_fogColor():String {
        return untyped this.GetKeyValues().fogColor;
    }
    
    @:noCompletion
    public extern inline function set_fogColor(value:String):String {
        return untyped this.SetKeyValue("fogColor",untyped value);
    }
    
    /**
		Fog Start

		The near fog plane.
	**/
    public var fogStart(get,set):Float;

    @:noCompletion
    public extern inline function get_fogStart():Float {
        return untyped this.GetKeyValues().fogStart;
    }
    
    @:noCompletion
    public extern inline function set_fogStart(value:Float):Float {
        return untyped this.SetKeyValue("fogStart",untyped value);
    }
    
    /**
		Fog End

		The far fog/clipping plane.
	**/
    public var fogEnd(get,set):Float;

    @:noCompletion
    public extern inline function get_fogEnd():Float {
        return untyped this.GetKeyValues().fogEnd;
    }
    
    @:noCompletion
    public extern inline function set_fogEnd(value:Float):Float {
        return untyped this.SetKeyValue("fogEnd",untyped value);
    }
    
    /**
		Fog Max Density [0..1]

		The maximum fog density. 0=no fog, 1=full fog.
	**/
    public var fogMaxDensity(get,set):Float;

    @:noCompletion
    public extern inline function get_fogMaxDensity():Float {
        return untyped this.GetKeyValues().fogMaxDensity;
    }
    
    @:noCompletion
    public extern inline function set_fogMaxDensity(value:Float):Float {
        return untyped this.SetKeyValue("fogMaxDensity",untyped value);
    }
    
    //Outputs
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_cameraSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_cameraSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_cameraSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_camera");
    }
}

enum abstract Point_camerafogEnableChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Point_cameraUseScreenAspectRatioChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Point_cameraSpawnFlags(Int) to Int {
	var START_OFF = 1;
}

#end
