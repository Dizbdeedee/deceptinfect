package gmod.engine_ents;
#if server
/**
	(Assault) rally point
**/
@:forward
abstract Assault_rallypoint(Entity) to Entity {
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
		Assault Point

		Location to move to as assault begins
	**/
    public var assaultpoint(get,set):String;

    @:noCompletion
    public extern inline function get_assaultpoint():String {
        return untyped this.GetKeyValues().assaultpoint;
    }
    
    @:noCompletion
    public extern inline function set_assaultpoint(value:String):String {
        return untyped this.SetKeyValue("assaultpoint",untyped value);
    }
    
    /**
		Assault Delay

		How long to wait after cue is given before assault begins.
	**/
    public var assaultdelay(get,set):Float;

    @:noCompletion
    public extern inline function get_assaultdelay():Float {
        return untyped this.GetKeyValues().assaultdelay;
    }
    
    @:noCompletion
    public extern inline function set_assaultdelay(value:Float):Float {
        return untyped this.SetKeyValue("assaultdelay",untyped value);
    }
    
    /**
		Rally Sequence

		Override the NPC's wait activity by entering a sequence name.
	**/
    public var rallysequence(get,set):String;

    @:noCompletion
    public extern inline function get_rallysequence():String {
        return untyped this.GetKeyValues().rallysequence;
    }
    
    @:noCompletion
    public extern inline function set_rallysequence(value:String):String {
        return untyped this.SetKeyValue("rallysequence",untyped value);
    }
    
    /**
		Priority

		Higher priority rally points get selected first.
	**/
    public var priority(get,set):Int;

    @:noCompletion
    public extern inline function get_priority():Int {
        return untyped this.GetKeyValues().priority;
    }
    
    @:noCompletion
    public extern inline function set_priority(value:Int):Int {
        return untyped this.SetKeyValue("priority",untyped value);
    }
    
    /**
		Force Crouch

		NPCs using this assault point are forced into crouching while holding it.
	**/
    public var forcecrouch(get,set):Assault_rallypointforcecrouchChoices;

    @:noCompletion
    public extern inline function get_forcecrouch():Assault_rallypointforcecrouchChoices {
        return untyped this.GetKeyValues().forcecrouch;
    }
    
    @:noCompletion
    public extern inline function set_forcecrouch(value:Assault_rallypointforcecrouchChoices):Assault_rallypointforcecrouchChoices {
        return untyped this.SetKeyValue("forcecrouch",untyped value);
    }
    
    /**
		Urgent

		If true, NPCs will consider movement to this rally point as Urgent Navigation.
	**/
    public var urgent(get,set):Assault_rallypointurgentChoices;

    @:noCompletion
    public extern inline function get_urgent():Assault_rallypointurgentChoices {
        return untyped this.GetKeyValues().urgent;
    }
    
    @:noCompletion
    public extern inline function set_urgent(value:Assault_rallypointurgentChoices):Assault_rallypointurgentChoices {
        return untyped this.SetKeyValue("urgent",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Assault_rallypoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Assault_rallypoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Assault_rallypoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Assault_rallypoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when the NPC reaches this rally point
	**/
    public extern inline function OutputOnArrival(callback:Callback<{activator:Assault_rallypoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnArrival",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("assault_rallypoint");
    }
}

enum abstract Assault_rallypointurgentChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Assault_rallypointforcecrouchChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
