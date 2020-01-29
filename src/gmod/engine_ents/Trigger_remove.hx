package gmod.engine_ents;
#if server
/**
	A trigger volume that removes any entities that touch it. Be careful, removing some entities can cause instability. This is not the same as killing entities. i.e. NPCs removed in this manner will not fire their OnKilled outputs.
**/
@:forward
abstract Trigger_remove(Entity) to Entity {
    //Inputs
    
    /**
		Enable this entity.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
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
		Toggles this trigger between enabled and disabled states.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Trigger_removeStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Trigger_removeStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Trigger_removeStartDisabledChoices):Trigger_removeStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Global Entity Name

		Name by which this entity is linked to another entity in a different map. When the player transitions to a new map, entities in the new map with globalnames matching entities in the previous map will have the previous map's state copied over their state.
	**/
    public var globalname(get,set):String;

    @:noCompletion
    public extern inline function get_globalname():String {
        return untyped this.GetKeyValues().globalname;
    }
    
    @:noCompletion
    public extern inline function set_globalname(value:String):String {
        return untyped this.SetKeyValue("globalname",untyped value);
    }
    
    /**
		Origin (X Y Z)

		The position of this entity's center in the world. Rotating entities typically rotate around their origin.
	**/
    public var origin(get,set):String;

    @:noCompletion
    public extern inline function get_origin():String {
        return untyped this.GetKeyValues().origin;
    }
    
    @:noCompletion
    public extern inline function set_origin(value:String):String {
        return untyped this.SetKeyValue("origin",untyped value);
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
		Filter Name

		Filter to use to see if activator triggers me. See filter_activator_name for more explanation.
	**/
    public var filtername(get,set):String;

    @:noCompletion
    public extern inline function get_filtername():String {
        return untyped this.GetKeyValues().filtername;
    }
    
    @:noCompletion
    public extern inline function set_filtername(value:String):String {
        return untyped this.SetKeyValue("filtername",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnStartTouchAll(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouchAll",callback);
    }
    
    /**
		Fired when an entity stops touching this trigger. Only entities that passed this trigger's filters will cause this output to fire.
	**/
    public extern inline function OutputOnEndTouch(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouch",callback);
    }
    
    /**
		Fires when an entity stops touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnEndTouchAll(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouchAll",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger. The touching entity must pass this trigger's filters to cause this output to fire.
	**/
    public extern inline function OutputOnStartTouch(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouch",callback);
    }
    
    /**
		Fired whenever an entity is removed.
	**/
    public extern inline function OutputOnRemove(callback:Callback<{activator:Trigger_remove}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnRemove",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Trigger_removeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Trigger_removeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Trigger_removeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_remove");
    }
}

enum abstract Trigger_removeStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Trigger_removeSpawnFlags(Int) to Int {
	var CLIENTS = 1;
	var NPCS = 2;
	var PUSHABLES = 4;
	var PHYSICS_OBJECTS = 8;
	var ONLY_PLAYER_ALLY_NPCS = 16;
	var ONLY_CLIENTS_IN_VEHICLES = 32;
	var EVERYTHING_NOT_INCLUDING_PHYSICS_DEBRIS = 64;
	var ONLY_CLIENTS_NOT_IN_VEHICLES = 512;
	var PHYSICS_DEBRIS = 1024;
	var ONLY_NPCS_IN_VEHICLES_RESPECTS_PLAYER_ALLY_FLAG = 2048;
	var DISALLOW_BOTS = 4096;
}

#end
