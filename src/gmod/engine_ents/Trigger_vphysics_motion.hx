package gmod.engine_ents;
#if server
/**
	A volumetric trigger that affects the motion of vphysics objects that touch it.
**/
@:forward
abstract Trigger_vphysics_motion(Entity) to Entity {
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
    
    /**
		Scale gravity of objects in the field.
	**/
    public extern inline function FireSetGravityScale(param:Float,delay:Float) {
        untyped this.Fire("SetGravityScale",untyped param,delay);
    }
    
    /**
		Additional air density for drag
	**/
    public extern inline function FireSetAdditionalAirDensity(param:Float,delay:Float) {
        untyped this.Fire("SetAdditionalAirDensity",untyped param,delay);
    }
    
    /**
		Max velocity in field.
	**/
    public extern inline function FireSetVelocityLimit(param:Float,delay:Float) {
        untyped this.Fire("SetVelocityLimit",untyped param,delay);
    }
    
    /**
		Max amount to reduce velocity per second
	**/
    public extern inline function FireSetVelocityLimitDelta(param:Float,delay:Float) {
        untyped this.Fire("SetVelocityLimitDelta",untyped param,delay);
    }
    
    /**
		Accepts two arguments: the first is the new velocity limit, the second is the time it takes to ramp to that value
	**/
    public extern inline function FireSetVelocityLimitTime(param:String,delay:Float) {
        untyped this.Fire("SetVelocityLimitTime",untyped param,delay);
    }
    
    /**
		Velocity scale/drag
	**/
    public extern inline function FireSetVelocityScale(param:Float,delay:Float) {
        untyped this.Fire("SetVelocityScale",untyped param,delay);
    }
    
    /**
		Max angular velocity in field.
	**/
    public extern inline function FireSetAngVelocityLimit(param:Float,delay:Float) {
        untyped this.Fire("SetAngVelocityLimit",untyped param,delay);
    }
    
    /**
		Angular Velocity scale/drag
	**/
    public extern inline function FireSetAngVelocityScale(param:Float,delay:Float) {
        untyped this.Fire("SetAngVelocityScale",untyped param,delay);
    }
    
    /**
		Linear force (0 disables)
	**/
    public extern inline function FireSetLinearForce(param:Float,delay:Float) {
        untyped this.Fire("SetLinearForce",untyped param,delay);
    }
    
    /**
		Enable the trigger.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the trigger.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Toggle enable/disable.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Trigger_vphysics_motionStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Trigger_vphysics_motionStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Trigger_vphysics_motionStartDisabledChoices):Trigger_vphysics_motionStartDisabledChoices {
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
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Trigger_vphysics_motionStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Trigger_vphysics_motionStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Trigger_vphysics_motionStartDisabledChoices):Trigger_vphysics_motionStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
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
    
    /**
		Scale gravity of objects in the field.
	**/
    public var SetGravityScale(get,set):Float;

    @:noCompletion
    public extern inline function get_SetGravityScale():Float {
        return untyped this.GetKeyValues().SetGravityScale;
    }
    
    @:noCompletion
    public extern inline function set_SetGravityScale(value:Float):Float {
        return untyped this.SetKeyValue("SetGravityScale",untyped value);
    }
    
    /**
		Additional air density for drag
	**/
    public var SetAdditionalAirDensity(get,set):Float;

    @:noCompletion
    public extern inline function get_SetAdditionalAirDensity():Float {
        return untyped this.GetKeyValues().SetAdditionalAirDensity;
    }
    
    @:noCompletion
    public extern inline function set_SetAdditionalAirDensity(value:Float):Float {
        return untyped this.SetKeyValue("SetAdditionalAirDensity",untyped value);
    }
    
    /**
		Max velocity in field (0 disables)
	**/
    public var SetVelocityLimit(get,set):Float;

    @:noCompletion
    public extern inline function get_SetVelocityLimit():Float {
        return untyped this.GetKeyValues().SetVelocityLimit;
    }
    
    @:noCompletion
    public extern inline function set_SetVelocityLimit(value:Float):Float {
        return untyped this.SetKeyValue("SetVelocityLimit",untyped value);
    }
    
    /**
		Max amount to reduce velocity per second when it exceeds the velocity limit (0 disables)
	**/
    public var SetVelocityLimitDelta(get,set):Float;

    @:noCompletion
    public extern inline function get_SetVelocityLimitDelta():Float {
        return untyped this.GetKeyValues().SetVelocityLimitDelta;
    }
    
    @:noCompletion
    public extern inline function set_SetVelocityLimitDelta(value:Float):Float {
        return untyped this.SetKeyValue("SetVelocityLimitDelta",untyped value);
    }
    
    /**
		Velocity scale/drag
	**/
    public var SetVelocityScale(get,set):Float;

    @:noCompletion
    public extern inline function get_SetVelocityScale():Float {
        return untyped this.GetKeyValues().SetVelocityScale;
    }
    
    @:noCompletion
    public extern inline function set_SetVelocityScale(value:Float):Float {
        return untyped this.SetKeyValue("SetVelocityScale",untyped value);
    }
    
    /**
		Max angular velocity in field (degrees/s, 0 disables)
	**/
    public var SetAngVelocityLimit(get,set):Float;

    @:noCompletion
    public extern inline function get_SetAngVelocityLimit():Float {
        return untyped this.GetKeyValues().SetAngVelocityLimit;
    }
    
    @:noCompletion
    public extern inline function set_SetAngVelocityLimit(value:Float):Float {
        return untyped this.SetKeyValue("SetAngVelocityLimit",untyped value);
    }
    
    /**
		Angular Velocity scale/drag
	**/
    public var SetAngVelocityScale(get,set):Float;

    @:noCompletion
    public extern inline function get_SetAngVelocityScale():Float {
        return untyped this.GetKeyValues().SetAngVelocityScale;
    }
    
    @:noCompletion
    public extern inline function set_SetAngVelocityScale(value:Float):Float {
        return untyped this.SetKeyValue("SetAngVelocityScale",untyped value);
    }
    
    /**
		Linear force (0 disables)
	**/
    public var SetLinearForce(get,set):Float;

    @:noCompletion
    public extern inline function get_SetLinearForce():Float {
        return untyped this.GetKeyValues().SetLinearForce;
    }
    
    @:noCompletion
    public extern inline function set_SetLinearForce(value:Float):Float {
        return untyped this.SetKeyValue("SetLinearForce",untyped value);
    }
    
    /**
		Direction of linear force (Pitch Yaw Roll (Y Z X))
	**/
    public var SetLinearForceAngles(get,set):Angle;

    @:noCompletion
    public extern inline function get_SetLinearForceAngles():Angle {
        return untyped this.GetKeyValues().SetLinearForceAngles;
    }
    
    @:noCompletion
    public extern inline function set_SetLinearForceAngles(value:Angle):Angle {
        return untyped this.SetKeyValue("SetLinearForceAngles",untyped value);
    }
    
    /**
		Particle Trail Material

		Name of a material to use for the particle trail, no name means no particle trail
	**/
    public var ParticleTrailMaterial(get,set):String;

    @:noCompletion
    public extern inline function get_ParticleTrailMaterial():String {
        return untyped this.GetKeyValues().ParticleTrailMaterial;
    }
    
    @:noCompletion
    public extern inline function set_ParticleTrailMaterial(value:String):String {
        return untyped this.SetKeyValue("ParticleTrailMaterial",untyped value);
    }
    
    /**
		Particle Trail Lifetime

		Lifetime of the particles to emit
	**/
    public var ParticleTrailLifetime(get,set):Float;

    @:noCompletion
    public extern inline function get_ParticleTrailLifetime():Float {
        return untyped this.GetKeyValues().ParticleTrailLifetime;
    }
    
    @:noCompletion
    public extern inline function set_ParticleTrailLifetime(value:Float):Float {
        return untyped this.SetKeyValue("ParticleTrailLifetime",untyped value);
    }
    
    /**
		Particle Trail Starting Sprite Size

		Starting size of the sprite to emit
	**/
    public var ParticleTrailStartSize(get,set):Float;

    @:noCompletion
    public extern inline function get_ParticleTrailStartSize():Float {
        return untyped this.GetKeyValues().ParticleTrailStartSize;
    }
    
    @:noCompletion
    public extern inline function set_ParticleTrailStartSize(value:Float):Float {
        return untyped this.SetKeyValue("ParticleTrailStartSize",untyped value);
    }
    
    /**
		Particle Trail Ending Sprite Size

		Ending size of the sprite to emit
	**/
    public var ParticleTrailEndSize(get,set):Float;

    @:noCompletion
    public extern inline function get_ParticleTrailEndSize():Float {
        return untyped this.GetKeyValues().ParticleTrailEndSize;
    }
    
    @:noCompletion
    public extern inline function set_ParticleTrailEndSize(value:Float):Float {
        return untyped this.SetKeyValue("ParticleTrailEndSize",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnStartTouchAll(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouchAll",callback);
    }
    
    /**
		Fired when an entity stops touching this trigger. Only entities that passed this trigger's filters will cause this output to fire.
	**/
    public extern inline function OutputOnEndTouch(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouch",callback);
    }
    
    /**
		Fires when an entity stops touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnEndTouchAll(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouchAll",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger. The touching entity must pass this trigger's filters to cause this output to fire.
	**/
    public extern inline function OutputOnStartTouch(callback:Callback<{activator:Trigger_vphysics_motion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouch",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Trigger_vphysics_motionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Trigger_vphysics_motionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Trigger_vphysics_motionSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_vphysics_motion");
    }
}

enum abstract Trigger_vphysics_motionStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Trigger_vphysics_motionSpawnFlags(Int) to Int {
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
	var CAN_MOVE_THROUGH_HIERARCHICAL_ATTACHMENT = 4096;
}

#end
