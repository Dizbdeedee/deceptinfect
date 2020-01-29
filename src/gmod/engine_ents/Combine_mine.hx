package gmod.engine_ents;
#if server
/**
	Combine Land Mine
**/
@:forward
abstract Combine_mine(Entity) to Entity {
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
		Disarm this mine (open hooks and shut off) if not placed by player.
	**/
    public extern inline function FireDisarm(delay:Float) {
        untyped this.Fire("Disarm",untyped null,delay);
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
		Bounce

		Whether the mine should bounce up in the air before exploding.
	**/
    public var bounce(get,set):Combine_minebounceChoices;

    @:noCompletion
    public extern inline function get_bounce():Combine_minebounceChoices {
        return untyped this.GetKeyValues().bounce;
    }
    
    @:noCompletion
    public extern inline function set_bounce(value:Combine_minebounceChoices):Combine_minebounceChoices {
        return untyped this.SetKeyValue("bounce",untyped value);
    }
    
    /**
		Lock Silently

		If yes, mine plays no sound when clamps close
	**/
    public var LockSilently(get,set):Combine_mineLockSilentlyChoices;

    @:noCompletion
    public extern inline function get_LockSilently():Combine_mineLockSilentlyChoices {
        return untyped this.GetKeyValues().LockSilently;
    }
    
    @:noCompletion
    public extern inline function set_LockSilently(value:Combine_mineLockSilentlyChoices):Combine_mineLockSilentlyChoices {
        return untyped this.SetKeyValue("LockSilently",untyped value);
    }
    
    /**
		Start Disarmed

		If yes, mine begins dormant.
	**/
    public var StartDisarmed(get,set):Combine_mineStartDisarmedChoices;

    @:noCompletion
    public extern inline function get_StartDisarmed():Combine_mineStartDisarmedChoices {
        return untyped this.GetKeyValues().StartDisarmed;
    }
    
    @:noCompletion
    public extern inline function set_StartDisarmed(value:Combine_mineStartDisarmedChoices):Combine_mineStartDisarmedChoices {
        return untyped this.SetKeyValue("StartDisarmed",untyped value);
    }
    
    /**
		Citizen modified

		'Normal' is default Combine behavior. 'Cavern' detonates earlier in its jump, and has a different default skin.
	**/
    public var Modification(get,set):Combine_mineModificationChoices;

    @:noCompletion
    public extern inline function get_Modification():Combine_mineModificationChoices {
        return untyped this.GetKeyValues().Modification;
    }
    
    @:noCompletion
    public extern inline function set_Modification(value:Combine_mineModificationChoices):Combine_mineModificationChoices {
        return untyped this.SetKeyValue("Modification",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Combine_mine}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Combine_mine}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Combine_mine}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Combine_mine}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when this mine is uprooted with physgun
	**/
    public extern inline function OutputOnPulledUp(callback:Callback<{activator:Combine_mine}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPulledUp",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("combine_mine");
    }
}

enum abstract Combine_minebounceChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Combine_mineStartDisarmedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Combine_mineModificationChoices(Int) to Int {
	var NORMAL = 0;
	var CAVERN = 1;
}
enum abstract Combine_mineLockSilentlyChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
