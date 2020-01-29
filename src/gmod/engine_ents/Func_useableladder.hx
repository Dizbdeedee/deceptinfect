package gmod.engine_ents;
#if server
/**
	A Half-Life 2 ladder. Handles player auto mount/unmount, as well as +use to get onto the ladder. 

See also 'info_ladder_dismount', used to specify ladder auto-dismount points.

Note: This entity is non-functional in Counter-Strike: Source. Use func_ladder instead.
**/
@:forward
abstract Func_useableladder(Entity) to Entity {
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
		Enable this ladder.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this ladder.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    //Keyvalues
    
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
		Start

		Ladder end point.
	**/
    public var point0(get,set):Vector;

    @:noCompletion
    public extern inline function get_point0():Vector {
        return untyped this.GetKeyValues().point0;
    }
    
    @:noCompletion
    public extern inline function set_point0(value:Vector):Vector {
        return untyped this.SetKeyValue("point0",untyped value);
    }
    
    /**
		End

		Ladder end point.
	**/
    public var point1(get,set):Vector;

    @:noCompletion
    public extern inline function get_point1():Vector {
        return untyped this.GetKeyValues().point1;
    }
    
    @:noCompletion
    public extern inline function set_point1(value:Vector):Vector {
        return untyped this.SetKeyValue("point1",untyped value);
    }
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Func_useableladderStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Func_useableladderStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Func_useableladderStartDisabledChoices):Func_useableladderStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Surface properties (optional)
	**/
    public var ladderSurfaceProperties(get,set):String;

    @:noCompletion
    public extern inline function get_ladderSurfaceProperties():String {
        return untyped this.GetKeyValues().ladderSurfaceProperties;
    }
    
    @:noCompletion
    public extern inline function set_ladderSurfaceProperties(value:String):String {
        return untyped this.SetKeyValue("ladderSurfaceProperties",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired whenever a player gets on this ladder.
	**/
    public extern inline function OutputOnPlayerGotOnLadder(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerGotOnLadder",callback);
    }
    
    /**
		Fired whenever a player gets off this ladder.
	**/
    public extern inline function OutputOnPlayerGotOffLadder(callback:Callback<{activator:Func_useableladder}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerGotOffLadder",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_useableladderSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_useableladderSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_useableladderSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_useableladder");
    }
}

enum abstract Func_useableladderStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_useableladderSpawnFlags(Int) to Int {
	var FAKE_LADDER = 1;
}

#end
