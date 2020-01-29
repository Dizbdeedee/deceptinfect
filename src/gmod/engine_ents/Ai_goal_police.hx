package gmod.engine_ents;
#if server
/**
	AI Goal Police
**/
@:forward
abstract Ai_goal_police(Entity) to Entity {
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
		Tells the goal to make the active policing NPC knock out its target
	**/
    public extern inline function FireEnableKnockOut(delay:Float) {
        untyped this.Fire("EnableKnockOut",untyped null,delay);
    }
    
    /**
		Stop the active policing NPC from trying to knock out its target
	**/
    public extern inline function FireDisableKnockOut(delay:Float) {
        untyped this.Fire("DisableKnockOut",untyped null,delay);
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
		Radius

		Radius to police
	**/
    public var policeradius(get,set):Float;

    @:noCompletion
    public extern inline function get_policeradius():Float {
        return untyped this.GetKeyValues().policeradius;
    }
    
    @:noCompletion
    public extern inline function set_policeradius(value:Float):Float {
        return untyped this.SetKeyValue("policeradius",untyped value);
    }
    
    /**
		Target

		Target to police
	**/
    public var policetarget(get,set):String;

    @:noCompletion
    public extern inline function get_policetarget():String {
        return untyped this.GetKeyValues().policetarget;
    }
    
    @:noCompletion
    public extern inline function set_policetarget(value:String):String {
        return untyped this.SetKeyValue("policetarget",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires the first time a policing cop warns a target
	**/
    public extern inline function OutputOnFirstWarning(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFirstWarning",callback);
    }
    
    /**
		Fires the second time a policing cop warns a target
	**/
    public extern inline function OutputOnSecondWarning(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSecondWarning",callback);
    }
    
    /**
		Fires when a policing cop warns a target for the last time
	**/
    public extern inline function OutputOnLastWarning(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLastWarning",callback);
    }
    
    /**
		Fires when a policing cop starts to suppress (ie. beat) a target
	**/
    public extern inline function OutputOnSupressingTarget(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSupressingTarget",callback);
    }
    
    /**
		Fires when a target has been knocked out
	**/
    public extern inline function OutputOnKnockOut(callback:Callback<{activator:Ai_goal_police}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnKnockOut",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Ai_goal_policeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Ai_goal_policeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Ai_goal_policeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_police");
    }
}



enum abstract Ai_goal_policeSpawnFlags(Int) to Int {
	var KNOCKOUT_TARGET_PAST_CROSSING_PLANE = 2;
	var DO_NOT_LEAVE_POST = 4;
}

#end
