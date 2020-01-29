package gmod.engine_ents;
#if server
/**
	Headcrab canister
**/
@:forward
abstract Env_headcrabcanister(Entity) to Entity {
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
		Fire the canister
	**/
    public extern inline function FireFireCanister(delay:Float) {
        untyped this.Fire("FireCanister",untyped null,delay);
    }
    
    /**
		Opens the canister (must be called after the OnImpacted output is fired)
	**/
    public extern inline function FireOpenCanister(delay:Float) {
        untyped this.Fire("OpenCanister",untyped null,delay);
    }
    
    /**
		Spawns headcrabs (must be called after the OnImpacted output is fired and after OpenCanister is triggered, if the Wait for Input to open spawnflag is checked.)
	**/
    public extern inline function FireSpawnHeadcrabs(delay:Float) {
        untyped this.Fire("SpawnHeadcrabs",untyped null,delay);
    }
    
    /**
		Stops the smoke if it's on
	**/
    public extern inline function FireStopSmoke(delay:Float) {
        untyped this.Fire("StopSmoke",untyped null,delay);
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
		Which headcrab to spawn?
	**/
    public var HeadcrabType(get,set):Env_headcrabcanisterHeadcrabTypeChoices;

    @:noCompletion
    public extern inline function get_HeadcrabType():Env_headcrabcanisterHeadcrabTypeChoices {
        return untyped this.GetKeyValues().HeadcrabType;
    }
    
    @:noCompletion
    public extern inline function set_HeadcrabType(value:Env_headcrabcanisterHeadcrabTypeChoices):Env_headcrabcanisterHeadcrabTypeChoices {
        return untyped this.SetKeyValue("HeadcrabType",untyped value);
    }
    
    /**
		Headcrab count

		Number of headcrabs to spawn on impact
	**/
    public var HeadcrabCount(get,set):Int;

    @:noCompletion
    public extern inline function get_HeadcrabCount():Int {
        return untyped this.GetKeyValues().HeadcrabCount;
    }
    
    @:noCompletion
    public extern inline function set_HeadcrabCount(value:Int):Int {
        return untyped this.SetKeyValue("HeadcrabCount",untyped value);
    }
    
    /**
		Flight Speed

		Speed to fly through the air
	**/
    public var FlightSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_FlightSpeed():Float {
        return untyped this.GetKeyValues().FlightSpeed;
    }
    
    @:noCompletion
    public extern inline function set_FlightSpeed(value:Float):Float {
        return untyped this.SetKeyValue("FlightSpeed",untyped value);
    }
    
    /**
		Flight Time

		Time to fly through the air in seconds
	**/
    public var FlightTime(get,set):Float;

    @:noCompletion
    public extern inline function get_FlightTime():Float {
        return untyped this.GetKeyValues().FlightTime;
    }
    
    @:noCompletion
    public extern inline function set_FlightTime(value:Float):Float {
        return untyped this.SetKeyValue("FlightTime",untyped value);
    }
    
    /**
		Starting Height

		Relative height from the landing position at which the canister should be launched. Positive values mean launch it above the impact point, negative values mean launch it below.
	**/
    public var StartingHeight(get,set):Float;

    @:noCompletion
    public extern inline function get_StartingHeight():Float {
        return untyped this.GetKeyValues().StartingHeight;
    }
    
    @:noCompletion
    public extern inline function set_StartingHeight(value:Float):Float {
        return untyped this.SetKeyValue("StartingHeight",untyped value);
    }
    
    /**
		Min Refire Time

		Min number of seconds before the cannister is refired. This will only work for cannisters placed in the skybox.
	**/
    public var MinSkyboxRefireTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MinSkyboxRefireTime():Float {
        return untyped this.GetKeyValues().MinSkyboxRefireTime;
    }
    
    @:noCompletion
    public extern inline function set_MinSkyboxRefireTime(value:Float):Float {
        return untyped this.SetKeyValue("MinSkyboxRefireTime",untyped value);
    }
    
    /**
		Max Refire Time

		Max number of seconds before the cannister is refired. This will only work for cannisters placed in the skybox.
	**/
    public var MaxSkyboxRefireTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MaxSkyboxRefireTime():Float {
        return untyped this.GetKeyValues().MaxSkyboxRefireTime;
    }
    
    @:noCompletion
    public extern inline function set_MaxSkyboxRefireTime(value:Float):Float {
        return untyped this.SetKeyValue("MaxSkyboxRefireTime",untyped value);
    }
    
    /**
		Cannister count

		Number of cannisters to fire in the skybox (0 means fire continuously, forever).
	**/
    public var SkyboxCannisterCount(get,set):Int;

    @:noCompletion
    public extern inline function get_SkyboxCannisterCount():Int {
        return untyped this.GetKeyValues().SkyboxCannisterCount;
    }
    
    @:noCompletion
    public extern inline function set_SkyboxCannisterCount(value:Int):Int {
        return untyped this.SetKeyValue("SkyboxCannisterCount",untyped value);
    }
    
    /**
		Impact damage

		Max damage the canister applies on impact
	**/
    public var Damage(get,set):Float;

    @:noCompletion
    public extern inline function get_Damage():Float {
        return untyped this.GetKeyValues().Damage;
    }
    
    @:noCompletion
    public extern inline function set_Damage(value:Float):Float {
        return untyped this.SetKeyValue("Damage",untyped value);
    }
    
    /**
		Impact damage radius

		Max radius of the impact damage for the canister
	**/
    public var DamageRadius(get,set):Float;

    @:noCompletion
    public extern inline function get_DamageRadius():Float {
        return untyped this.GetKeyValues().DamageRadius;
    }
    
    @:noCompletion
    public extern inline function set_DamageRadius(value:Float):Float {
        return untyped this.SetKeyValue("DamageRadius",untyped value);
    }
    
    /**
		Smoke Duration

		Duration that the canister smokes.  -1 means always smoke.
	**/
    public var SmokeLifetime(get,set):Float;

    @:noCompletion
    public extern inline function get_SmokeLifetime():Float {
        return untyped this.GetKeyValues().SmokeLifetime;
    }
    
    @:noCompletion
    public extern inline function set_SmokeLifetime(value:Float):Float {
        return untyped this.SetKeyValue("SmokeLifetime",untyped value);
    }
    
    /**
		Launch Position Name

		If the canister should launch to it's origin from another point within the world, this should specify an info_target at the launch origin.
	**/
    public var LaunchPositionName(get,set):String;

    @:noCompletion
    public extern inline function get_LaunchPositionName():String {
        return untyped this.GetKeyValues().LaunchPositionName;
    }
    
    @:noCompletion
    public extern inline function set_LaunchPositionName(value:String):String {
        return untyped this.SetKeyValue("LaunchPositionName",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the canister is launched
	**/
    public extern inline function OutputOnLaunched(callback:Callback<{activator:Env_headcrabcanister,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLaunched",callback);
    }
    
    /**
		Fires when canister hits the ground
	**/
    public extern inline function OutputOnImpacted(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnImpacted",callback);
    }
    
    /**
		Fires when canister has finished opening
	**/
    public extern inline function OutputOnOpened(callback:Callback<{activator:Env_headcrabcanister}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOpened",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_headcrabcanisterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_headcrabcanisterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_headcrabcanisterSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_headcrabcanister");
    }
}

enum abstract Env_headcrabcanisterHeadcrabTypeChoices(Int) to Int {
	var NORMAL_HEADCRABS = 0;
	var FAST_HEADCRABS = 1;
	var POISON_HEADCRABS = 2;
}


enum abstract Env_headcrabcanisterSpawnFlags(Int) to Int {
	var NO_IMPACT_SOUND = 1;
	var NO_LAUNCH_SOUND = 2;
	var START_IMPACTED = 4096;
	var LAND_AT_INITIAL_POSITION = 8192;
	var WAIT_FOR_INPUT_TO_OPEN = 16384;
	var WAIT_FOR_INPUT_TO_SPAWN_HEADCRABS = 32768;
	var NO_SMOKE = 65536;
	var NO_SHAKE = 131072;
	var REMOVE_ON_IMPACT = 262144;
	var NO_IMPACT_EFFECTS = 524288;
}

#end
