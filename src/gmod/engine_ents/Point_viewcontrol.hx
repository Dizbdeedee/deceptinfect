package gmod.engine_ents;
#if server
/**
	A camera entity that controls the player's view. While it's active, the player will see out of the camera.
**/
@:forward
abstract Point_viewcontrol(Entity) to Entity {
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
		Enable the point_viewcontrol, and start controlling the player's view.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the point_viewcontrol, and stop controlling the player's view.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
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
		Entity to Look At

		Name of the entity that the camera should point at and track while active.
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
		Target Attachment Name

		If set, the camera will focus on the specified attachment on the 'Entity to Look At'.
	**/
    public var targetattachment(get,set):String;

    @:noCompletion
    public extern inline function get_targetattachment():String {
        return untyped this.GetKeyValues().targetattachment;
    }
    
    @:noCompletion
    public extern inline function set_targetattachment(value:String):String {
        return untyped this.SetKeyValue("targetattachment",untyped value);
    }
    
    /**
		Hold Time

		The amount of time the camera should control the player's view for, after which it deactivates itself. If the camera should stay active until told to deactive, set the 'Infinite Hold Time' spawnflag.
	**/
    public var wait(get,set):Int;

    @:noCompletion
    public extern inline function get_wait():Int {
        return untyped this.GetKeyValues().wait;
    }
    
    @:noCompletion
    public extern inline function set_wait(value:Int):Int {
        return untyped this.SetKeyValue("wait",untyped value);
    }
    
    /**
		Path Corner

		The first path corner in a track that the camera should move along once it's activated. If not specified, the camera won't move.
	**/
    public var moveto(get,set):String;

    @:noCompletion
    public extern inline function get_moveto():String {
        return untyped this.GetKeyValues().moveto;
    }
    
    @:noCompletion
    public extern inline function set_moveto(value:String):String {
        return untyped this.SetKeyValue("moveto",untyped value);
    }
    
    /**
		Interpolate Position To Player

		Gradually interpolate player's position to here on start. (Episodic only)
	**/
    public var interpolatepositiontoplayer(get,set):Point_viewcontrolinterpolatepositiontoplayerChoices;

    @:noCompletion
    public extern inline function get_interpolatepositiontoplayer():Point_viewcontrolinterpolatepositiontoplayerChoices {
        return untyped this.GetKeyValues().interpolatepositiontoplayer;
    }
    
    @:noCompletion
    public extern inline function set_interpolatepositiontoplayer(value:Point_viewcontrolinterpolatepositiontoplayerChoices):Point_viewcontrolinterpolatepositiontoplayerChoices {
        return untyped this.SetKeyValue("interpolatepositiontoplayer",untyped value);
    }
    
    /**
		Initial Speed

		The starting speed that the camera moves at, if it's on a path track.
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
		Acceleration units/sec^2

		The speed at which the camera accelerates to path corner's desired speeds.
	**/
    public var acceleration(get,set):String;

    @:noCompletion
    public extern inline function get_acceleration():String {
        return untyped this.GetKeyValues().acceleration;
    }
    
    @:noCompletion
    public extern inline function set_acceleration(value:String):String {
        return untyped this.SetKeyValue("acceleration",untyped value);
    }
    
    /**
		Stop Deceleration units/sec^2

		The speed at which the camera decelerates to path corner's desired speeds.
	**/
    public var deceleration(get,set):String;

    @:noCompletion
    public extern inline function get_deceleration():String {
        return untyped this.GetKeyValues().deceleration;
    }
    
    @:noCompletion
    public extern inline function set_deceleration(value:String):String {
        return untyped this.SetKeyValue("deceleration",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_viewcontrol}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_viewcontrol}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_viewcontrol}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_viewcontrol}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the point_viewcontrol deactivates, due to the Disable input being received, the Entity to Look At being destroyed, or the Hold Time expiring.
	**/
    public extern inline function OutputOnEndFollow(callback:Callback<{activator:Point_viewcontrol}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndFollow",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_viewcontrolSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_viewcontrolSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_viewcontrolSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_viewcontrol");
    }
}

enum abstract Point_viewcontrolinterpolatepositiontoplayerChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Point_viewcontrolSpawnFlags(Int) to Int {
	var START_AT_PLAYER = 1;
	var FOLLOW_PLAYER = 2;
	var FREEZE_PLAYER = 4;
	var INFINITE_HOLD_TIME = 8;
	var SNAP_TO_GOAL_ANGLES = 16;
	var MAKE_PLAYER_NONSOLID = 32;
	var INTERRUPTABLE_BY_PLAYER = 64;
}

#end
