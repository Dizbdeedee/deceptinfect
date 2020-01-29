package gmod.engine_ents;
#if server
/**
	Airboat Gun Turret
**/
@:forward
abstract Func_tankairboatgun(Entity) to Entity {
    //Inputs
    
    /**
		Turn the tank on
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Turn the tank off (go dormant)
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		How fast to fire (0 = don't fire)
	**/
    public extern inline function FireSetFireRate(param:String,delay:Float) {
        untyped this.Fire("SetFireRate",untyped param,delay);
    }
    
    /**
		Set the Damage Per Bullet
	**/
    public extern inline function FireSetDamage(param:String,delay:Float) {
        untyped this.Fire("SetDamage",untyped param,delay);
    }
    
    /**
		World position that I should aim at
	**/
    public extern inline function FireSetTargetPosition(param:String,delay:Float) {
        untyped this.Fire("SetTargetPosition",untyped param,delay);
    }
    
    /**
		Direction to aim at.
	**/
    public extern inline function FireSetTargetDir(param:Vector,delay:Float) {
        untyped this.Fire("SetTargetDir",untyped param,delay);
    }
    
    /**
		Name of entity I should follow/attack
	**/
    public extern inline function FireSetTargetEntityName(param:String,delay:Float) {
        untyped this.Fire("SetTargetEntityName",untyped param,delay);
    }
    
    /**
		Entity I should follow/attack (output from other entity only)
	**/
    public extern inline function FireSetTargetEntity(param:String,delay:Float) {
        untyped this.Fire("SetTargetEntity",untyped param,delay);
    }
    
    /**
		Clear the entity I should be attacking.
	**/
    public extern inline function FireClearTargetEntity(delay:Float) {
        untyped this.Fire("ClearTargetEntity",untyped null,delay);
    }
    
    /**
		Find a nearby NPC to man this func_tank.
	**/
    public extern inline function FireFindNPCToManTank(param:String,delay:Float) {
        untyped this.Fire("FindNPCToManTank",untyped param,delay);
    }
    
    /**
		Start searching for NPCs to man this func_tank.
	**/
    public extern inline function FireStartFindingNPCs(delay:Float) {
        untyped this.Fire("StartFindingNPCs",untyped null,delay);
    }
    
    /**
		Stop searching for NPCs to man this func_tank.
	**/
    public extern inline function FireStopFindingNPCs(delay:Float) {
        untyped this.Fire("StopFindingNPCs",untyped null,delay);
    }
    
    /**
		Force the NPC manning this func_tank (if any) to leave.
	**/
    public extern inline function FireForceNPCOff(delay:Float) {
        untyped this.Fire("ForceNPCOff",untyped null,delay);
    }
    
    /**
		Set the max range of the func_tank.
	**/
    public extern inline function FireSetMaxRange(param:Float,delay:Float) {
        untyped this.Fire("SetMaxRange",untyped param,delay);
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
		Set the sprite's alpha (0 - 255).
	**/
    public extern inline function FireAlpha(param:Int,delay:Float) {
        untyped this.Fire("Alpha",untyped param,delay);
    }
    
    /**
		Set the sprite's color (R G B).
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
    }
    
    /**
		Turn shadow off.
	**/
    public extern inline function FireDisableShadow(delay:Float) {
        untyped this.Fire("DisableShadow",untyped null,delay);
    }
    
    /**
		Turn shadow on.
	**/
    public extern inline function FireEnableShadow(delay:Float) {
        untyped this.Fire("EnableShadow",untyped null,delay);
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
		Control Volume

		Name of a trigger the specifies the volume in which a player must be to control this tank.
	**/
    public var control_volume(get,set):String;

    @:noCompletion
    public extern inline function get_control_volume():String {
        return untyped this.GetKeyValues().control_volume;
    }
    
    @:noCompletion
    public extern inline function set_control_volume(value:String):String {
        return untyped this.SetKeyValue("control_volume",untyped value);
    }
    
    /**
		(Team) Master
	**/
    public var master(get,set):String;

    @:noCompletion
    public extern inline function get_master():String {
        return untyped this.GetKeyValues().master;
    }
    
    @:noCompletion
    public extern inline function set_master(value:String):String {
        return untyped this.SetKeyValue("master",untyped value);
    }
    
    /**
		Yaw rate
	**/
    public var yawrate(get,set):String;

    @:noCompletion
    public extern inline function get_yawrate():String {
        return untyped this.GetKeyValues().yawrate;
    }
    
    @:noCompletion
    public extern inline function set_yawrate(value:String):String {
        return untyped this.SetKeyValue("yawrate",untyped value);
    }
    
    /**
		Yaw range
	**/
    public var yawrange(get,set):String;

    @:noCompletion
    public extern inline function get_yawrange():String {
        return untyped this.GetKeyValues().yawrange;
    }
    
    @:noCompletion
    public extern inline function set_yawrange(value:String):String {
        return untyped this.SetKeyValue("yawrange",untyped value);
    }
    
    /**
		Yaw tolerance
	**/
    public var yawtolerance(get,set):String;

    @:noCompletion
    public extern inline function get_yawtolerance():String {
        return untyped this.GetKeyValues().yawtolerance;
    }
    
    @:noCompletion
    public extern inline function set_yawtolerance(value:String):String {
        return untyped this.SetKeyValue("yawtolerance",untyped value);
    }
    
    /**
		Pitch rate
	**/
    public var pitchrate(get,set):String;

    @:noCompletion
    public extern inline function get_pitchrate():String {
        return untyped this.GetKeyValues().pitchrate;
    }
    
    @:noCompletion
    public extern inline function set_pitchrate(value:String):String {
        return untyped this.SetKeyValue("pitchrate",untyped value);
    }
    
    /**
		Pitch range
	**/
    public var pitchrange(get,set):String;

    @:noCompletion
    public extern inline function get_pitchrange():String {
        return untyped this.GetKeyValues().pitchrange;
    }
    
    @:noCompletion
    public extern inline function set_pitchrange(value:String):String {
        return untyped this.SetKeyValue("pitchrange",untyped value);
    }
    
    /**
		Pitch tolerance
	**/
    public var pitchtolerance(get,set):String;

    @:noCompletion
    public extern inline function get_pitchtolerance():String {
        return untyped this.GetKeyValues().pitchtolerance;
    }
    
    @:noCompletion
    public extern inline function set_pitchtolerance(value:String):String {
        return untyped this.SetKeyValue("pitchtolerance",untyped value);
    }
    
    /**
		Barrel Length
	**/
    public var barrel(get,set):String;

    @:noCompletion
    public extern inline function get_barrel():String {
        return untyped this.GetKeyValues().barrel;
    }
    
    @:noCompletion
    public extern inline function set_barrel(value:String):String {
        return untyped this.SetKeyValue("barrel",untyped value);
    }
    
    /**
		Barrel Horizontal
	**/
    public var barrely(get,set):String;

    @:noCompletion
    public extern inline function get_barrely():String {
        return untyped this.GetKeyValues().barrely;
    }
    
    @:noCompletion
    public extern inline function set_barrely(value:String):String {
        return untyped this.SetKeyValue("barrely",untyped value);
    }
    
    /**
		Barrel Vertical
	**/
    public var barrelz(get,set):String;

    @:noCompletion
    public extern inline function get_barrelz():String {
        return untyped this.GetKeyValues().barrelz;
    }
    
    @:noCompletion
    public extern inline function set_barrelz(value:String):String {
        return untyped this.SetKeyValue("barrelz",untyped value);
    }
    
    /**
		Smoke Sprite
	**/
    public var spritesmoke(get,set):String;

    @:noCompletion
    public extern inline function get_spritesmoke():String {
        return untyped this.GetKeyValues().spritesmoke;
    }
    
    @:noCompletion
    public extern inline function set_spritesmoke(value:String):String {
        return untyped this.SetKeyValue("spritesmoke",untyped value);
    }
    
    /**
		Flash Sprite
	**/
    public var spriteflash(get,set):String;

    @:noCompletion
    public extern inline function get_spriteflash():String {
        return untyped this.GetKeyValues().spriteflash;
    }
    
    @:noCompletion
    public extern inline function set_spriteflash(value:String):String {
        return untyped this.SetKeyValue("spriteflash",untyped value);
    }
    
    /**
		Sprite scale
	**/
    public var spritescale(get,set):String;

    @:noCompletion
    public extern inline function get_spritescale():String {
        return untyped this.GetKeyValues().spritescale;
    }
    
    @:noCompletion
    public extern inline function set_spritescale(value:String):String {
        return untyped this.SetKeyValue("spritescale",untyped value);
    }
    
    /**
		Rotate Start Sound
	**/
    public var rotatestartsound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatestartsound():String {
        return untyped this.GetKeyValues().rotatestartsound;
    }
    
    @:noCompletion
    public extern inline function set_rotatestartsound(value:String):String {
        return untyped this.SetKeyValue("rotatestartsound",untyped value);
    }
    
    /**
		Rotate Loop Sound
	**/
    public var rotatesound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatesound():String {
        return untyped this.GetKeyValues().rotatesound;
    }
    
    @:noCompletion
    public extern inline function set_rotatesound(value:String):String {
        return untyped this.SetKeyValue("rotatesound",untyped value);
    }
    
    /**
		Rotate Stop Sound
	**/
    public var rotatestopsound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatestopsound():String {
        return untyped this.GetKeyValues().rotatestopsound;
    }
    
    @:noCompletion
    public extern inline function set_rotatestopsound(value:String):String {
        return untyped this.SetKeyValue("rotatestopsound",untyped value);
    }
    
    /**
		Rate of Fire
	**/
    public var firerate(get,set):String;

    @:noCompletion
    public extern inline function get_firerate():String {
        return untyped this.GetKeyValues().firerate;
    }
    
    @:noCompletion
    public extern inline function set_firerate(value:String):String {
        return untyped this.SetKeyValue("firerate",untyped value);
    }
    
    /**
		Damage Per Bullet

		If set to 0, it'll use the base weapon bullet's damage.
	**/
    public var bullet_damage(get,set):String;

    @:noCompletion
    public extern inline function get_bullet_damage():String {
        return untyped this.GetKeyValues().bullet_damage;
    }
    
    @:noCompletion
    public extern inline function set_bullet_damage(value:String):String {
        return untyped this.SetKeyValue("bullet_damage",untyped value);
    }
    
    /**
		Damage Per Bullet Vs Player

		If set to 0, it'll use the Damage Per Bullet value.
	**/
    public var bullet_damage_vs_player(get,set):String;

    @:noCompletion
    public extern inline function get_bullet_damage_vs_player():String {
        return untyped this.GetKeyValues().bullet_damage_vs_player;
    }
    
    @:noCompletion
    public extern inline function set_bullet_damage_vs_player(value:String):String {
        return untyped this.SetKeyValue("bullet_damage_vs_player",untyped value);
    }
    
    /**
		Firing persistence

		(Seconds) How long to keep firing at last known position after lose sight of target
	**/
    public var persistence(get,set):String;

    @:noCompletion
    public extern inline function get_persistence():String {
        return untyped this.GetKeyValues().persistence;
    }
    
    @:noCompletion
    public extern inline function set_persistence(value:String):String {
        return untyped this.SetKeyValue("persistence",untyped value);
    }
    
    /**
		Firing persistence2

		(Seconds) After lost enemy and persistence time has passed, how long to occasionally fire at enemy's last known position
	**/
    public var persistence2(get,set):String;

    @:noCompletion
    public extern inline function get_persistence2():String {
        return untyped this.GetKeyValues().persistence2;
    }
    
    @:noCompletion
    public extern inline function set_persistence2(value:String):String {
        return untyped this.SetKeyValue("persistence2",untyped value);
    }
    
    /**
		Bullet accuracy
	**/
    public var firespread(get,set):Func_tankairboatgunfirespreadChoices;

    @:noCompletion
    public extern inline function get_firespread():Func_tankairboatgunfirespreadChoices {
        return untyped this.GetKeyValues().firespread;
    }
    
    @:noCompletion
    public extern inline function set_firespread(value:Func_tankairboatgunfirespreadChoices):Func_tankairboatgunfirespreadChoices {
        return untyped this.SetKeyValue("firespread",untyped value);
    }
    
    /**
		Minmum target range
	**/
    public var minRange(get,set):String;

    @:noCompletion
    public extern inline function get_minRange():String {
        return untyped this.GetKeyValues().minRange;
    }
    
    @:noCompletion
    public extern inline function set_minRange(value:String):String {
        return untyped this.SetKeyValue("minRange",untyped value);
    }
    
    /**
		Maximum target range
	**/
    public var maxRange(get,set):String;

    @:noCompletion
    public extern inline function get_maxRange():String {
        return untyped this.GetKeyValues().maxRange;
    }
    
    @:noCompletion
    public extern inline function set_maxRange(value:String):String {
        return untyped this.SetKeyValue("maxRange",untyped value);
    }
    
    /**
		Minimum light level
	**/
    public var _minlight(get,set):String;

    @:noCompletion
    public extern inline function get__minlight():String {
        return untyped this.GetKeyValues()._minlight;
    }
    
    @:noCompletion
    public extern inline function set__minlight(value:String):String {
        return untyped this.SetKeyValue("_minlight",untyped value);
    }
    
    /**
		Gun Base Attachment

		If Parent is specified, this is the attachment point on the parent to aim from.
	**/
    public var gun_base_attach(get,set):String;

    @:noCompletion
    public extern inline function get_gun_base_attach():String {
        return untyped this.GetKeyValues().gun_base_attach;
    }
    
    @:noCompletion
    public extern inline function set_gun_base_attach(value:String):String {
        return untyped this.SetKeyValue("gun_base_attach",untyped value);
    }
    
    /**
		Gun Barrel Attachment

		If Parent is specified, this is the attachment point on the parent to fire from. If you specify this, you'll want to specify the Gun Base Attachment too.
	**/
    public var gun_barrel_attach(get,set):String;

    @:noCompletion
    public extern inline function get_gun_barrel_attach():String {
        return untyped this.GetKeyValues().gun_barrel_attach;
    }
    
    @:noCompletion
    public extern inline function set_gun_barrel_attach(value:String):String {
        return untyped this.SetKeyValue("gun_barrel_attach",untyped value);
    }
    
    /**
		Gun Yaw Pose Param

		If Parent + the Gun Pitch Pose Param is specified, then the gun itself will be invisible and the func_tank will steer a gun on the parent using the pose parameters.
	**/
    public var gun_yaw_pose_param(get,set):String;

    @:noCompletion
    public extern inline function get_gun_yaw_pose_param():String {
        return untyped this.GetKeyValues().gun_yaw_pose_param;
    }
    
    @:noCompletion
    public extern inline function set_gun_yaw_pose_param(value:String):String {
        return untyped this.SetKeyValue("gun_yaw_pose_param",untyped value);
    }
    
    /**
		Gun Yaw Pose Center

		The center yaw pose parameter of the gun on the parent
	**/
    public var gun_yaw_pose_center(get,set):Float;

    @:noCompletion
    public extern inline function get_gun_yaw_pose_center():Float {
        return untyped this.GetKeyValues().gun_yaw_pose_center;
    }
    
    @:noCompletion
    public extern inline function set_gun_yaw_pose_center(value:Float):Float {
        return untyped this.SetKeyValue("gun_yaw_pose_center",untyped value);
    }
    
    /**
		Gun Pitch Pose Param

		If Parent + the Gun Yaw Pose Param is specified, then the gun itself will be invisible and the func_tank will steer a gun on the parent using the pose parameters.
	**/
    public var gun_pitch_pose_param(get,set):String;

    @:noCompletion
    public extern inline function get_gun_pitch_pose_param():String {
        return untyped this.GetKeyValues().gun_pitch_pose_param;
    }
    
    @:noCompletion
    public extern inline function set_gun_pitch_pose_param(value:String):String {
        return untyped this.SetKeyValue("gun_pitch_pose_param",untyped value);
    }
    
    /**
		Gun Pitch Pose Center

		The center pitch pose parameter of the gun on the parent
	**/
    public var gun_pitch_pose_center(get,set):Float;

    @:noCompletion
    public extern inline function get_gun_pitch_pose_center():Float {
        return untyped this.GetKeyValues().gun_pitch_pose_center;
    }
    
    @:noCompletion
    public extern inline function set_gun_pitch_pose_center(value:Float):Float {
        return untyped this.SetKeyValue("gun_pitch_pose_center",untyped value);
    }
    
    /**
		Ammunition Count

		Only applies to player use. -1 = unlimited ammo.
	**/
    public var ammo_count(get,set):Int;

    @:noCompletion
    public extern inline function get_ammo_count():Int {
        return untyped this.GetKeyValues().ammo_count;
    }
    
    @:noCompletion
    public extern inline function set_ammo_count(value:Int):Int {
        return untyped this.SetKeyValue("ammo_count",untyped value);
    }
    
    /**
		Lead Target
	**/
    public var LeadTarget(get,set):Func_tankairboatgunLeadTargetChoices;

    @:noCompletion
    public extern inline function get_LeadTarget():Func_tankairboatgunLeadTargetChoices {
        return untyped this.GetKeyValues().LeadTarget;
    }
    
    @:noCompletion
    public extern inline function set_LeadTarget(value:Func_tankairboatgunLeadTargetChoices):Func_tankairboatgunLeadTargetChoices {
        return untyped this.SetKeyValue("LeadTarget",untyped value);
    }
    
    /**
		NPC Man Point

		Point where NPC must stand to man this func_tank.
	**/
    public var npc_man_point(get,set):String;

    @:noCompletion
    public extern inline function get_npc_man_point():String {
        return untyped this.GetKeyValues().npc_man_point;
    }
    
    @:noCompletion
    public extern inline function set_npc_man_point(value:String):String {
        return untyped this.SetKeyValue("npc_man_point",untyped value);
    }
    
    /**
		Post-NPC Attack Grace Period

		If specified, NPC's manning this func tank won't fire at the player, after firing at a non-player, for this amount of time.
	**/
    public var playergraceperiod(get,set):Float;

    @:noCompletion
    public extern inline function get_playergraceperiod():Float {
        return untyped this.GetKeyValues().playergraceperiod;
    }
    
    @:noCompletion
    public extern inline function set_playergraceperiod(value:Float):Float {
        return untyped this.SetKeyValue("playergraceperiod",untyped value);
    }
    
    /**
		Ignore Grace Upto

		The player grace period is ignored if the player's under this distance from the func_tank.
	**/
    public var ignoregraceupto(get,set):Float;

    @:noCompletion
    public extern inline function get_ignoregraceupto():Float {
        return untyped this.GetKeyValues().ignoregraceupto;
    }
    
    @:noCompletion
    public extern inline function set_ignoregraceupto(value:Float):Float {
        return untyped this.SetKeyValue("ignoregraceupto",untyped value);
    }
    
    /**
		Player Lock Time

		The tank must have the player as a target for this amount of time before it's allowed to fire.
	**/
    public var playerlocktimebeforefire(get,set):Float;

    @:noCompletion
    public extern inline function get_playerlocktimebeforefire():Float {
        return untyped this.GetKeyValues().playerlocktimebeforefire;
    }
    
    @:noCompletion
    public extern inline function set_playerlocktimebeforefire(value:Float):Float {
        return untyped this.SetKeyValue("playerlocktimebeforefire",untyped value);
    }
    
    /**
		Effect Handling
	**/
    public var effecthandling(get,set):Func_tankairboatguneffecthandlingChoices;

    @:noCompletion
    public extern inline function get_effecthandling():Func_tankairboatguneffecthandlingChoices {
        return untyped this.GetKeyValues().effecthandling;
    }
    
    @:noCompletion
    public extern inline function set_effecthandling(value:Func_tankairboatguneffecthandlingChoices):Func_tankairboatguneffecthandlingChoices {
        return untyped this.SetKeyValue("effecthandling",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_tankairboatgungmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_tankairboatgungmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_tankairboatgungmod_allowphysgunChoices):Func_tankairboatgungmod_allowphysgunChoices {
        return untyped this.SetKeyValue("gmod_allowphysgun",untyped value);
    }
    
    /**
		Sandbox Tool Whitelist

		If set, only given tools can be used on this entity.
You need to supply the tool class names, the names of the .lua files of those tools.
This also includes the context menu properties!
	**/
    public var gmod_allowtools(get,set):String;

    @:noCompletion
    public extern inline function get_gmod_allowtools():String {
        return untyped this.GetKeyValues().gmod_allowtools;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowtools(value:String):String {
        return untyped this.SetKeyValue("gmod_allowtools",untyped value);
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
		Render Mode

		Used to set a non-standard rendering mode on this entity. See also 'FX Amount' and 'FX Color'.
	**/
    public var rendermode(get,set):Func_tankairboatgunrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_tankairboatgunrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_tankairboatgunrendermodeChoices):Func_tankairboatgunrendermodeChoices {
        return untyped this.SetKeyValue("rendermode",untyped value);
    }
    
    /**
		FX Amount (0 - 255)

		The FX amount is used by the selected Render Mode.
	**/
    public var renderamt(get,set):Int;

    @:noCompletion
    public extern inline function get_renderamt():Int {
        return untyped this.GetKeyValues().renderamt;
    }
    
    @:noCompletion
    public extern inline function set_renderamt(value:Int):Int {
        return untyped this.SetKeyValue("renderamt",untyped value);
    }
    
    /**
		FX Color (R G B)

		The FX color is used by the selected Render Mode.
	**/
    public var rendercolor(get,set):String;

    @:noCompletion
    public extern inline function get_rendercolor():String {
        return untyped this.GetKeyValues().rendercolor;
    }
    
    @:noCompletion
    public extern inline function set_rendercolor(value:String):String {
        return untyped this.SetKeyValue("rendercolor",untyped value);
    }
    
    /**
		Disable Receiving Shadows
	**/
    public var disablereceiveshadows(get,set):Func_tankairboatgundisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_tankairboatgundisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_tankairboatgundisablereceiveshadowsChoices):Func_tankairboatgundisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_tankairboatgunrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_tankairboatgunrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_tankairboatgunrenderfxChoices):Func_tankairboatgunrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_tankairboatgundisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_tankairboatgundisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_tankairboatgundisableshadowsChoices):Func_tankairboatgundisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
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
		Name of a prop_dynamic which is the airboat gun model
	**/
    public var airboat_gun_model(get,set):String;

    @:noCompletion
    public extern inline function get_airboat_gun_model():String {
        return untyped this.GetKeyValues().airboat_gun_model;
    }
    
    @:noCompletion
    public extern inline function set_airboat_gun_model(value:String):String {
        return untyped this.SetKeyValue("airboat_gun_model",untyped value);
    }
    
    //Outputs
    
    /**
		Fires when the tank fires its bullets
	**/
    public extern inline function OutputOnFire(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFire",callback);
    }
    
    /**
		Fires when target is newly in range and can be shot
	**/
    public extern inline function OutputOnAquireTarget(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAquireTarget",callback);
    }
    
    /**
		Fires when when target goes out of range
	**/
    public extern inline function OutputOnLoseTarget(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLoseTarget",callback);
    }
    
    /**
		Fires when tank runs out of ammo
	**/
    public extern inline function OutputOnAmmoDepleted(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAmmoDepleted",callback);
    }
    
    /**
		Fires when an NPC starts to control this tank. Players do NOT fire this input.
	**/
    public extern inline function OutputOnGotController(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGotController",callback);
    }
    
    /**
		Fires when the NPC controller of the tank stops controlling it. Players do NOT fire this input.
	**/
    public extern inline function OutputOnLostController(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostController",callback);
    }
    
    /**
		Fires when a Player starts to control this tank. NPCs do NOT fire this input.
	**/
    public extern inline function OutputOnGotPlayerController(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGotPlayerController",callback);
    }
    
    /**
		Fires when the Player controller of the tank stops controlling it. NPCs do NOT fire this input.
	**/
    public extern inline function OutputOnLostPlayerController(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostPlayerController",callback);
    }
    
    /**
		Fires once when the tank is done waiting to fire between rounds
	**/
    public extern inline function OutputOnReadyToFire(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnReadyToFire",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_tankairboatgun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_tankairboatgunSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_tankairboatgunSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_tankairboatgunSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_tankairboatgun");
    }
}

enum abstract Func_tankairboatgunrendermodeChoices(Int) to Int {
	var NORMAL = 0;
	var COLOR = 1;
	var TEXTURE = 2;
	var GLOW = 3;
	var SOLID = 4;
	var ADDITIVE = 5;
	var ADDITIVE_FRACTIONAL_FRAME = 7;
	var WORLD_SPACE_GLOW = 9;
	var DONT_RENDER = 10;
}
enum abstract Func_tankairboatgunrenderfxChoices(Int) to Int {
	var NORMAL = 0;
	var SLOW_PULSE = 1;
	var FAST_PULSE = 2;
	var SLOW_WIDE_PULSE = 3;
	var FAST_WIDE_PULSE = 4;
	var SLOW_STROBE = 9;
	var FAST_STROBE = 10;
	var FASTER_STROBE = 11;
	var SLOW_FLICKER = 12;
	var FAST_FLICKER = 13;
	var SLOW_FADE_AWAY = 5;
	var FAST_FADE_AWAY = 6;
	var SLOW_BECOME_SOLID = 7;
	var FAST_BECOME_SOLID = 8;
	var CONSTANT_GLOW = 14;
	var DISTORT = 15;
	var HOLOGRAM_DISTORT__FADE = 16;
	var CULL_BY_DISTANCE_TEST = 23;
	var SPOTLIGHT_FX = 24;
	var FADE_NEAR = 26;
}
enum abstract Func_tankairboatgungmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tankairboatgunfirespreadChoices(Int) to Int {
	var PERFECT_SHOT = 0;
	var SMALL_CONE = 1;
	var MEDIUM_CONE = 2;
	var LARGE_CONE = 3;
	var EXTRALARGE_CONE = 4;
}
enum abstract Func_tankairboatguneffecthandlingChoices(Int) to Int {
	var USE_INDIVIDUAL_SETTINGS = 0;
	var AR2 = 1;
	var COMBINE_CANNON = 2;
}
enum abstract Func_tankairboatgundisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tankairboatgundisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tankairboatgunLeadTargetChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_tankairboatgunSpawnFlags(Int) to Int {
	var ACTIVE = 1;
	var ONLY_DIRECT = 16;
	var CONTROLLABLE = 32;
	var DAMAGE_KICK = 64;
	var NPC_CONTROLLABLE = 1024;
	var NPC_SET_CONTROLLER = 2048;
	var ALLOW_FRIENDLIES_TO_HIT_PLAYER = 4096;
	var NONSOLID = 32768;
	var PERFECT_ACCURACY_EVERY_3RD_SHOT_AT_PLAYER = 131072;
}

#end
