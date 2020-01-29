package gmod.engine_ents;
#if server
/**
	A node entity that marks a point in a rope. The first node in the rope should be a move_rope, followed by 1 or more keyframe_ropes.
**/
@:forward
abstract Keyframe_rope(Entity) to Entity {
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
		Set the speed at which the texture scrolls.
	**/
    public extern inline function FireSetScrollSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetScrollSpeed",untyped param,delay);
    }
    
    /**
		Apply a force instantaneously to the rope. The parameter should be a vector containing the force to be applied (X Y Z).
	**/
    public extern inline function FireSetForce(param:String,delay:Float) {
        untyped this.Fire("SetForce",untyped param,delay);
    }
    
    /**
		Break the rope, if it's marked to do so.
	**/
    public extern inline function FireBreak(delay:Float) {
        untyped this.Fire("Break",untyped null,delay);
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
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Keyframe_ropemindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Keyframe_ropemindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Keyframe_ropemindxlevelChoices):Keyframe_ropemindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Keyframe_ropemaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Keyframe_ropemaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Keyframe_ropemaxdxlevelChoices):Keyframe_ropemaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
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
		Slack

		How much extra length the rope has (by default it has the length between its two endpoints in the editor).
	**/
    public var Slack(get,set):Int;

    @:noCompletion
    public extern inline function get_Slack():Int {
        return untyped this.GetKeyValues().Slack;
    }
    
    @:noCompletion
    public extern inline function set_Slack(value:Int):Int {
        return untyped this.SetKeyValue("Slack",untyped value);
    }
    
    /**
		Type
	**/
    public var Type(get,set):Keyframe_ropeTypeChoices;

    @:noCompletion
    public extern inline function get_Type():Keyframe_ropeTypeChoices {
        return untyped this.GetKeyValues().Type;
    }
    
    @:noCompletion
    public extern inline function set_Type(value:Keyframe_ropeTypeChoices):Keyframe_ropeTypeChoices {
        return untyped this.SetKeyValue("Type",untyped value);
    }
    
    /**
		Subdivision

		Number of subdivisions between each rope segment. Maximum value is 8. Higher values make smoother ropes, but are slower to render.
	**/
    public var Subdiv(get,set):Int;

    @:noCompletion
    public extern inline function get_Subdiv():Int {
        return untyped this.GetKeyValues().Subdiv;
    }
    
    @:noCompletion
    public extern inline function set_Subdiv(value:Int):Int {
        return untyped this.SetKeyValue("Subdiv",untyped value);
    }
    
    /**
		Barbed

		Test effect that makes the rope look sharper and more barbed.
	**/
    public var Barbed(get,set):Keyframe_ropeBarbedChoices;

    @:noCompletion
    public extern inline function get_Barbed():Keyframe_ropeBarbedChoices {
        return untyped this.GetKeyValues().Barbed;
    }
    
    @:noCompletion
    public extern inline function set_Barbed(value:Keyframe_ropeBarbedChoices):Keyframe_ropeBarbedChoices {
        return untyped this.SetKeyValue("Barbed",untyped value);
    }
    
    /**
		Width (1-64)

		Width of the rope.
	**/
    public var Width(get,set):String;

    @:noCompletion
    public extern inline function get_Width():String {
        return untyped this.GetKeyValues().Width;
    }
    
    @:noCompletion
    public extern inline function set_Width(value:String):String {
        return untyped this.SetKeyValue("Width",untyped value);
    }
    
    /**
		Texture Scale

		This changes the texture resolution. The default resolution is 4 pixels per inch. Larger values stretch the texture and smaller values scrunch it up.
	**/
    public var TextureScale(get,set):String;

    @:noCompletion
    public extern inline function get_TextureScale():String {
        return untyped this.GetKeyValues().TextureScale;
    }
    
    @:noCompletion
    public extern inline function set_TextureScale(value:String):String {
        return untyped this.SetKeyValue("TextureScale",untyped value);
    }
    
    /**
		Collide with world
	**/
    public var Collide(get,set):Keyframe_ropeCollideChoices;

    @:noCompletion
    public extern inline function get_Collide():Keyframe_ropeCollideChoices {
        return untyped this.GetKeyValues().Collide;
    }
    
    @:noCompletion
    public extern inline function set_Collide(value:Keyframe_ropeCollideChoices):Keyframe_ropeCollideChoices {
        return untyped this.SetKeyValue("Collide",untyped value);
    }
    
    /**
		Start Dangling

		When set to Yes, the rope starts out detached from its target endpoint.
	**/
    public var Dangling(get,set):Keyframe_ropeDanglingChoices;

    @:noCompletion
    public extern inline function get_Dangling():Keyframe_ropeDanglingChoices {
        return untyped this.GetKeyValues().Dangling;
    }
    
    @:noCompletion
    public extern inline function set_Dangling(value:Keyframe_ropeDanglingChoices):Keyframe_ropeDanglingChoices {
        return untyped this.SetKeyValue("Dangling",untyped value);
    }
    
    /**
		Breakable

		When set to yes, the rope can be detached from either endpoint when shot.
	**/
    public var Breakable(get,set):Keyframe_ropeBreakableChoices;

    @:noCompletion
    public extern inline function get_Breakable():Keyframe_ropeBreakableChoices {
        return untyped this.GetKeyValues().Breakable;
    }
    
    @:noCompletion
    public extern inline function set_Breakable(value:Keyframe_ropeBreakableChoices):Keyframe_ropeBreakableChoices {
        return untyped this.SetKeyValue("Breakable",untyped value);
    }
    
    /**
		Rope Material

		The material to use when rendering the rope.
	**/
    public var RopeMaterial(get,set):String;

    @:noCompletion
    public extern inline function get_RopeMaterial():String {
        return untyped this.GetKeyValues().RopeMaterial;
    }
    
    @:noCompletion
    public extern inline function set_RopeMaterial(value:String):String {
        return untyped this.SetKeyValue("RopeMaterial",untyped value);
    }
    
    /**
		Disable Wind

		When set to Yes, the rope will no longer act as though it's being affected by wind.
	**/
    public var NoWind(get,set):Keyframe_ropeNoWindChoices;

    @:noCompletion
    public extern inline function get_NoWind():Keyframe_ropeNoWindChoices {
        return untyped this.GetKeyValues().NoWind;
    }
    
    @:noCompletion
    public extern inline function set_NoWind(value:Keyframe_ropeNoWindChoices):Keyframe_ropeNoWindChoices {
        return untyped this.SetKeyValue("NoWind",untyped value);
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Keyframe_rope}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Keyframe_rope}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Keyframe_rope}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Keyframe_rope}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Keyframe_ropeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Keyframe_ropeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Keyframe_ropeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("keyframe_rope");
    }
}

enum abstract Keyframe_ropemindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Keyframe_ropemaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Keyframe_ropeTypeChoices(Int) to Int {
	var ROPE = 0;
	var SEMIRIGID = 1;
	var RIGID = 2;
}
enum abstract Keyframe_ropeNoWindChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Keyframe_ropeDanglingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Keyframe_ropeCollideChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Keyframe_ropeBreakableChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Keyframe_ropeBarbedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Keyframe_ropeSpawnFlags(Int) to Int {
	var AUTO_RESIZE = 1;
}

#end
