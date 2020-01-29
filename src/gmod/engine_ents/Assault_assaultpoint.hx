package gmod.engine_ents;
#if server
/**
	(Assault) assault point
**/
@:forward
abstract Assault_assaultpoint(Entity) to Entity {
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
		Set the clear on contact flag. NPCs who spot enemies while running to the assault point, or while waiting at it, will immediately Clear it.
	**/
    public extern inline function FireSetClearOnContact(param:Int,delay:Float) {
        untyped this.Fire("SetClearOnContact",untyped param,delay);
    }
    
    /**
		Set the allow diversion flag. NPCs who spot enemies whil running to the assault point, or while waiting on it, will divert away (leave Assault mode) to deal with the enemies. Upon losing enemies, they'll go back to Assault mode, and return to this assault point.
	**/
    public extern inline function FireSetAllowDiversion(param:Int,delay:Float) {
        untyped this.Fire("SetAllowDiversion",untyped param,delay);
    }
    
    /**
		Set the Force Clear flag. NPCs who are currently running to the assault point will Clear it immediately. NPCs who acquire it in the future will Clear it automatically.
	**/
    public extern inline function FireSetForceClear(param:Int,delay:Float) {
        untyped this.Fire("SetForceClear",untyped param,delay);
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
		Assault Hint Group

		NPC's movements are constrained to this hint group once assault has begun
	**/
    public var assaultgroup(get,set):String;

    @:noCompletion
    public extern inline function get_assaultgroup():String {
        return untyped this.GetKeyValues().assaultgroup;
    }
    
    @:noCompletion
    public extern inline function set_assaultgroup(value:String):String {
        return untyped this.SetKeyValue("assaultgroup",untyped value);
    }
    
    /**
		Next assault point (optional)
	**/
    public var nextassaultpoint(get,set):String;

    @:noCompletion
    public extern inline function get_nextassaultpoint():String {
        return untyped this.GetKeyValues().nextassaultpoint;
    }
    
    @:noCompletion
    public extern inline function set_nextassaultpoint(value:String):String {
        return untyped this.SetKeyValue("nextassaultpoint",untyped value);
    }
    
    /**
		Assault time out

		This point is cleared when no enemies are seen for this long (seconds)
	**/
    public var assaulttimeout(get,set):Float;

    @:noCompletion
    public extern inline function get_assaulttimeout():Float {
        return untyped this.GetKeyValues().assaulttimeout;
    }
    
    @:noCompletion
    public extern inline function set_assaulttimeout(value:Float):Float {
        return untyped this.SetKeyValue("assaulttimeout",untyped value);
    }
    
    /**
		Clear on contact with enemies

		If you come in contact with enemies while approaching the assault point, clear our assault point
	**/
    public var clearoncontact(get,set):Assault_assaultpointclearoncontactChoices;

    @:noCompletion
    public extern inline function get_clearoncontact():Assault_assaultpointclearoncontactChoices {
        return untyped this.GetKeyValues().clearoncontact;
    }
    
    @:noCompletion
    public extern inline function set_clearoncontact(value:Assault_assaultpointclearoncontactChoices):Assault_assaultpointclearoncontactChoices {
        return untyped this.SetKeyValue("clearoncontact",untyped value);
    }
    
    /**
		Allow diversion

		If you come in contact with enemies while approaching the assault point, divert to kill them. Resume the assault once contact is lost.
	**/
    public var allowdiversion(get,set):Assault_assaultpointallowdiversionChoices;

    @:noCompletion
    public extern inline function get_allowdiversion():Assault_assaultpointallowdiversionChoices {
        return untyped this.GetKeyValues().allowdiversion;
    }
    
    @:noCompletion
    public extern inline function set_allowdiversion(value:Assault_assaultpointallowdiversionChoices):Assault_assaultpointallowdiversionChoices {
        return untyped this.SetKeyValue("allowdiversion",untyped value);
    }
    
    /**
		Diversion Proximity

		If Allow Diversion is set, NPC will only divert from assault to attack an enemy that is within this distance of the assault point. 0 = No limit.
	**/
    public var allowdiversionradius(get,set):Float;

    @:noCompletion
    public extern inline function get_allowdiversionradius():Float {
        return untyped this.GetKeyValues().allowdiversionradius;
    }
    
    @:noCompletion
    public extern inline function set_allowdiversionradius(value:Float):Float {
        return untyped this.SetKeyValue("allowdiversionradius",untyped value);
    }
    
    /**
		Never Timeout

		If set, the assault never ends for NPCs assaulting this point. Useful for forcing NPCs back to a point.
	**/
    public var nevertimeout(get,set):Assault_assaultpointnevertimeoutChoices;

    @:noCompletion
    public extern inline function get_nevertimeout():Assault_assaultpointnevertimeoutChoices {
        return untyped this.GetKeyValues().nevertimeout;
    }
    
    @:noCompletion
    public extern inline function set_nevertimeout(value:Assault_assaultpointnevertimeoutChoices):Assault_assaultpointnevertimeoutChoices {
        return untyped this.SetKeyValue("nevertimeout",untyped value);
    }
    
    /**
		Strict?
	**/
    public var strict(get,set):Assault_assaultpointstrictChoices;

    @:noCompletion
    public extern inline function get_strict():Assault_assaultpointstrictChoices {
        return untyped this.GetKeyValues().strict;
    }
    
    @:noCompletion
    public extern inline function set_strict(value:Assault_assaultpointstrictChoices):Assault_assaultpointstrictChoices {
        return untyped this.SetKeyValue("strict",untyped value);
    }
    
    /**
		Force Crouch

		NPCs using this assault point are forced into crouching while holding it.
	**/
    public var forcecrouch(get,set):Assault_assaultpointforcecrouchChoices;

    @:noCompletion
    public extern inline function get_forcecrouch():Assault_assaultpointforcecrouchChoices {
        return untyped this.GetKeyValues().forcecrouch;
    }
    
    @:noCompletion
    public extern inline function set_forcecrouch(value:Assault_assaultpointforcecrouchChoices):Assault_assaultpointforcecrouchChoices {
        return untyped this.SetKeyValue("forcecrouch",untyped value);
    }
    
    /**
		Urgent

		If true, NPCs will consider movement to this assault point as Urgent Navigation.
	**/
    public var urgent(get,set):Assault_assaultpointurgentChoices;

    @:noCompletion
    public extern inline function get_urgent():Assault_assaultpointurgentChoices {
        return untyped this.GetKeyValues().urgent;
    }
    
    @:noCompletion
    public extern inline function set_urgent(value:Assault_assaultpointurgentChoices):Assault_assaultpointurgentChoices {
        return untyped this.SetKeyValue("urgent",untyped value);
    }
    
    /**
		Attack Tolerance

		How far this NPC may move from the assault point to try to attack an enemy.
	**/
    public var assaulttolerance(get,set):Assault_assaultpointassaulttoleranceChoices;

    @:noCompletion
    public extern inline function get_assaulttolerance():Assault_assaultpointassaulttoleranceChoices {
        return untyped this.GetKeyValues().assaulttolerance;
    }
    
    @:noCompletion
    public extern inline function set_assaulttolerance(value:Assault_assaultpointassaulttoleranceChoices):Assault_assaultpointassaulttoleranceChoices {
        return untyped this.SetKeyValue("assaulttolerance",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when the NPC reaches this assault point
	**/
    public extern inline function OutputOnArrival(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnArrival",callback);
    }
    
    /**
		Fires when this assault point is cleared of enemies
	**/
    public extern inline function OutputOnAssaultClear(callback:Callback<{activator:Assault_assaultpoint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAssaultClear",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Assault_assaultpointSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Assault_assaultpointSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Assault_assaultpointSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("assault_assaultpoint");
    }
}

enum abstract Assault_assaultpointurgentChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Assault_assaultpointstrictChoices(Int) to Int {
	var NO_NPC_MAY_MOVE_FROM_POINT_TO_ATTACK = 0;
	var YES_NPC_MAY_NOT_MOVE_TO_ATTACK = 1;
}
enum abstract Assault_assaultpointnevertimeoutChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Assault_assaultpointforcecrouchChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Assault_assaultpointclearoncontactChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Assault_assaultpointassaulttoleranceChoices(Int) to Int {
	var TIGHT_3FT = 36;
	var MEDIUM_6FT = 72;
	var LARGE_10FT = 120;
}
enum abstract Assault_assaultpointallowdiversionChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Assault_assaultpointSpawnFlags(Int) to Int {
	var CLEAR_THIS_POINT_UPON_ARRIVAL_UNCONDITIONALLY = 1;
}

#end
