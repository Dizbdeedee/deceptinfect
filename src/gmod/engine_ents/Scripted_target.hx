package gmod.engine_ents;
#if server
/**
	Scripted Target
**/
@:forward
abstract Scripted_target(Entity) to Entity {
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
		Enable this entity
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity
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
		Start Disabled
	**/
    public var StartDisabled(get,set):Scripted_targetStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Scripted_targetStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Scripted_targetStartDisabledChoices):Scripted_targetStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Target NPC
	**/
    public var m_iszEntity(get,set):String;

    @:noCompletion
    public extern inline function get_m_iszEntity():String {
        return untyped this.GetKeyValues().m_iszEntity;
    }
    
    @:noCompletion
    public extern inline function set_m_iszEntity(value:String):String {
        return untyped this.SetKeyValue("m_iszEntity",untyped value);
    }
    
    /**
		Search Radius (0=everywhere)

		Radius to search within for an NPC to use. 0 searches everywhere.
	**/
    public var m_flRadius(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flRadius():Int {
        return untyped this.GetKeyValues().m_flRadius;
    }
    
    @:noCompletion
    public extern inline function set_m_flRadius(value:Int):Int {
        return untyped this.SetKeyValue("m_flRadius",untyped value);
    }
    
    /**
		Move Speed
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
		Pause Duration
	**/
    public var PauseDuration(get,set):Int;

    @:noCompletion
    public extern inline function get_PauseDuration():Int {
        return untyped this.GetKeyValues().PauseDuration;
    }
    
    @:noCompletion
    public extern inline function set_PauseDuration(value:Int):Int {
        return untyped this.SetKeyValue("PauseDuration",untyped value);
    }
    
    /**
		Effect Duration
	**/
    public var EffectDuration(get,set):Int;

    @:noCompletion
    public extern inline function get_EffectDuration():Int {
        return untyped this.GetKeyValues().EffectDuration;
    }
    
    @:noCompletion
    public extern inline function set_EffectDuration(value:Int):Int {
        return untyped this.SetKeyValue("EffectDuration",untyped value);
    }
    
    /**
		Next Target
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when NPC reaches this target
	**/
    public extern inline function OutputAtTarget(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"AtTarget",callback);
    }
    
    /**
		Fires when NPC leaves this target
	**/
    public extern inline function OutputLeaveTarget(callback:Callback<{activator:Scripted_target}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"LeaveTarget",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("scripted_target");
    }
}

enum abstract Scripted_targetStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
