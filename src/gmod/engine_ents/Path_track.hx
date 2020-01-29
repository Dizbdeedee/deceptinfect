package gmod.engine_ents;
#if server
/**
	An entity used to build paths for other entities to follow. Each path_track is a node on the path, each holding the name of the next path_track in the path.
**/
@:forward
abstract Path_track(Entity) to Entity {
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
		Cause the track to toggle to/from its alternate path.
	**/
    public extern inline function FireToggleAlternatePath(delay:Float) {
        untyped this.Fire("ToggleAlternatePath",untyped null,delay);
    }
    
    /**
		Enable the alternate path of the track.
	**/
    public extern inline function FireEnableAlternatePath(delay:Float) {
        untyped this.Fire("EnableAlternatePath",untyped null,delay);
    }
    
    /**
		Disable the alternate path of the track.
	**/
    public extern inline function FireDisableAlternatePath(delay:Float) {
        untyped this.Fire("DisableAlternatePath",untyped null,delay);
    }
    
    /**
		Cause the track to toggle on/off/
	**/
    public extern inline function FireTogglePath(delay:Float) {
        untyped this.Fire("TogglePath",untyped null,delay);
    }
    
    /**
		Enable the track.
	**/
    public extern inline function FireEnablePath(delay:Float) {
        untyped this.Fire("EnablePath",untyped null,delay);
    }
    
    /**
		Disable the track.
	**/
    public extern inline function FireDisablePath(delay:Float) {
        untyped this.Fire("DisablePath",untyped null,delay);
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
		Next Stop Target

		The next path_track in the path.
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
		Branch Path

		An alternative path_track to be the next node in the path. Useful for making branching paths. Use the ToggleAlternatePath / EnableAlternatePath inputs to make the alternative path active.
	**/
    public var altpath(get,set):String;

    @:noCompletion
    public extern inline function get_altpath():String {
        return untyped this.GetKeyValues().altpath;
    }
    
    @:noCompletion
    public extern inline function set_altpath(value:String):String {
        return untyped this.SetKeyValue("altpath",untyped value);
    }
    
    /**
		New Train Speed

		When the train reaches this path_track, it will set its speed to this speed. This speed must be a positive value that is less than the train's max speed. A value of 0 will cause no change in the train's speed.
	**/
    public var speed(get,set):Float;

    @:noCompletion
    public extern inline function get_speed():Float {
        return untyped this.GetKeyValues().speed;
    }
    
    @:noCompletion
    public extern inline function set_speed(value:Float):Float {
        return untyped this.SetKeyValue("speed",untyped value);
    }
    
    /**
		Path radius

		Used by NPCs who follow track paths (attack chopper/gunship). This tells them the maximum distance they're allowed to be from the path at this node.
	**/
    public var radius(get,set):Float;

    @:noCompletion
    public extern inline function get_radius():Float {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:Float):Float {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		Orientation Type

		The way that the path follower faces as it moves through this path track.
	**/
    public var orientationtype(get,set):Path_trackorientationtypeChoices;

    @:noCompletion
    public extern inline function get_orientationtype():Path_trackorientationtypeChoices {
        return untyped this.GetKeyValues().orientationtype;
    }
    
    @:noCompletion
    public extern inline function set_orientationtype(value:Path_trackorientationtypeChoices):Path_trackorientationtypeChoices {
        return untyped this.SetKeyValue("orientationtype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when any entity following this path passes this path_track node.
	**/
    public extern inline function OutputOnPass(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPass",callback);
    }
    
    /**
		Fired when any entity following this path teleports directly to this path_track node.
	**/
    public extern inline function OutputOnTeleport(callback:Callback<{activator:Path_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTeleport",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Path_trackSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Path_trackSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Path_trackSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("path_track");
    }
}

enum abstract Path_trackorientationtypeChoices(Int) to Int {
	var NO_CHANGE = 0;
	var FACE_DIRECTION_OF_MOTION = 1;
	var FACE_THIS_PATHTRACKS_ANGLES = 2;
}


enum abstract Path_trackSpawnFlags(Int) to Int {
	var DISABLED = 1;
	var FIRE_ONCE = 2;
	var BRANCH_REVERSE = 4;
	var DISABLE_TRAIN = 8;
	var TELEPORT_TO_THIS_PATH_TRACK = 16;
	var PART_OF_AN_UPHILL_PATH = 32;
	var PART_OF_A_DOWNHILL_PATH = 64;
}

#end
