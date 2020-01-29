package gmod.engine_ents;
#if server
/**
	Track Move Behavior
**/
@:forward
abstract Move_track(Entity) to Entity {
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
    
    //Keyvalues
    
    /**
		Next KeyFrame

		Name of the next keyframe along this keyframe path.
	**/
    public var NextKey(get,set):String;

    @:noCompletion
    public extern inline function get_NextKey():String {
        return untyped this.GetKeyValues().NextKey;
    }
    
    @:noCompletion
    public extern inline function set_NextKey(value:String):String {
        return untyped this.SetKeyValue("NextKey",untyped value);
    }
    
    /**
		Speed (units per second)
	**/
    public var MoveSpeed(get,set):Int;

    @:noCompletion
    public extern inline function get_MoveSpeed():Int {
        return untyped this.GetKeyValues().MoveSpeed;
    }
    
    @:noCompletion
    public extern inline function set_MoveSpeed(value:Int):Int {
        return untyped this.SetKeyValue("MoveSpeed",untyped value);
    }
    
    /**
		Position Interpolator
	**/
    public var PositionInterpolator(get,set):Move_trackPositionInterpolatorChoices;

    @:noCompletion
    public extern inline function get_PositionInterpolator():Move_trackPositionInterpolatorChoices {
        return untyped this.GetKeyValues().PositionInterpolator;
    }
    
    @:noCompletion
    public extern inline function set_PositionInterpolator(value:Move_trackPositionInterpolatorChoices):Move_trackPositionInterpolatorChoices {
        return untyped this.SetKeyValue("PositionInterpolator",untyped value);
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
		Distance between the wheels
	**/
    public var WheelBaseLength(get,set):Int;

    @:noCompletion
    public extern inline function get_WheelBaseLength():Int {
        return untyped this.GetKeyValues().WheelBaseLength;
    }
    
    @:noCompletion
    public extern inline function set_WheelBaseLength(value:Int):Int {
        return untyped this.SetKeyValue("WheelBaseLength",untyped value);
    }
    
    /**
		Damage done to blocking entities
	**/
    public var Damage(get,set):Int;

    @:noCompletion
    public extern inline function get_Damage():Int {
        return untyped this.GetKeyValues().Damage;
    }
    
    @:noCompletion
    public extern inline function set_Damage(value:Int):Int {
        return untyped this.SetKeyValue("Damage",untyped value);
    }
    
    /**
		Turn to face down path
	**/
    public var NoRotate(get,set):Move_trackNoRotateChoices;

    @:noCompletion
    public extern inline function get_NoRotate():Move_trackNoRotateChoices {
        return untyped this.GetKeyValues().NoRotate;
    }
    
    @:noCompletion
    public extern inline function set_NoRotate(value:Move_trackNoRotateChoices):Move_trackNoRotateChoices {
        return untyped this.SetKeyValue("NoRotate",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Move_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Move_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Move_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Move_track}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("move_track");
    }
}

enum abstract Move_trackPositionInterpolatorChoices(Int) to Int {
	var LINEAR = 0;
	var CATMULLROM_SPLINE = 1;
}
enum abstract Move_trackNoRotateChoices(Int) to Int {
	var YES = 0;
	var NO = 1;
}




#end
