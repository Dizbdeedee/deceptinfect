package gmod.engine_ents;
#if server
/**
	A prop that can be placed in hierarchy and can play animations. It can also be configured to break when it takes enough damage. Note that the health of the object will be overridden by the health inside the model, to ensure consistent health game-wide. If the model used by the prop is configured to be used as a prop_physics (i.e. it should be physically simulated) then it CANNOT be used as a prop_dynamic. Upon level load it will display a warning in the console and remove itself. Use a prop_physics instead.
**/
@:forward
abstract Prop_dynamic(Entity) to Entity {
    //Inputs
    
    /**
		Breaks the breakable.
	**/
    public extern inline function FireBreak(delay:Float) {
        untyped this.Fire("Break",untyped null,delay);
    }
    
    /**
		Sets a new value for the breakable's health. If the breakable's health reaches zero it will break.
	**/
    public extern inline function FireSetHealth(param:Int,delay:Float) {
        untyped this.Fire("SetHealth",untyped param,delay);
    }
    
    /**
		Adds health to the breakable. If the breakable's health reaches zero it will break.
	**/
    public extern inline function FireAddHealth(param:Int,delay:Float) {
        untyped this.Fire("AddHealth",untyped param,delay);
    }
    
    /**
		Removes health from the breakable. If the breakable's health reaches zero it will break.
	**/
    public extern inline function FireRemoveHealth(param:Int,delay:Float) {
        untyped this.Fire("RemoveHealth",untyped param,delay);
    }
    
    /**
		Makes the breakable able to picked up by the physcannon.
	**/
    public extern inline function FireEnablePhyscannonPickup(delay:Float) {
        untyped this.Fire("EnablePhyscannonPickup",untyped null,delay);
    }
    
    /**
		Makes the breakable not able to picked up by the physcannon.
	**/
    public extern inline function FireDisablePhyscannonPickup(delay:Float) {
        untyped this.Fire("DisablePhyscannonPickup",untyped null,delay);
    }
    
    /**
		Set mass of this object.
	**/
    public extern inline function FireSetMass(param:Float,delay:Float) {
        untyped this.Fire("SetMass",untyped param,delay);
    }
    
    /**
		Sets the entity to use as damage filter. Pass in an empty string to clear the damage filter.
	**/
    public extern inline function FireSetDamageFilter(param:String,delay:Float) {
        untyped this.Fire("SetDamageFilter",untyped param,delay);
    }
    
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
		Changes the model skin to the specified number.
	**/
    public extern inline function FireSkin(param:Int,delay:Float) {
        untyped this.Fire("Skin",untyped param,delay);
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
		Used to attempt to fix sorting problems when rendering. True activates, false deactivates
	**/
    public extern inline function FireAlternativeSorting(param:bool,delay:Float) {
        untyped this.Fire("AlternativeSorting",untyped param,delay);
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
		Force the prop to play an animation. The parameter should be the name of the animation.
	**/
    public extern inline function FireSetAnimation(param:String,delay:Float) {
        untyped this.Fire("SetAnimation",untyped param,delay);
    }
    
    /**
		Force the prop to play an animation unless the prop is already playing the animation. The parameter should be the name of the animation.
	**/
    public extern inline function FireSetAnimationNoReset(param:String,delay:Float) {
        untyped this.Fire("SetAnimationNoReset",untyped param,delay);
    }
    
    /**
		Set the Default Animation to the one specified in the parameter.
	**/
    public extern inline function FireSetDefaultAnimation(param:String,delay:Float) {
        untyped this.Fire("SetDefaultAnimation",untyped param,delay);
    }
    
    /**
		Set the playback rate for the animation.
	**/
    public extern inline function FireSetPlaybackRate(param:Float,delay:Float) {
        untyped this.Fire("SetPlaybackRate",untyped param,delay);
    }
    
    /**
		Set the visible bodygroup, by index.
	**/
    public extern inline function FireSetBodyGroup(param:Int,delay:Float) {
        untyped this.Fire("SetBodyGroup",untyped param,delay);
    }
    
    /**
		Make the prop visible.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Make the prop invisible.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Enable collision on the prop.
	**/
    public extern inline function FireEnableCollision(delay:Float) {
        untyped this.Fire("EnableCollision",untyped null,delay);
    }
    
    /**
		Disable collision on the prop.
	**/
    public extern inline function FireDisableCollision(delay:Float) {
        untyped this.Fire("DisableCollision",untyped null,delay);
    }
    
    /**
		Change into a ragdoll immediately.
	**/
    public extern inline function FireBecomeRagdoll(delay:Float) {
        untyped this.Fire("BecomeRagdoll",untyped null,delay);
    }
    
    /**
		Fade out then remove this prop.
	**/
    public extern inline function FireFadeAndKill(delay:Float) {
        untyped this.Fire("FadeAndKill",untyped null,delay);
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
		Start Fade Dist

		Distance at which the prop starts to fade (<0 = use fademaxdist).
	**/
    public var fademindist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademindist():Float {
        return untyped this.GetKeyValues().fademindist;
    }
    
    @:noCompletion
    public extern inline function set_fademindist(value:Float):Float {
        return untyped this.SetKeyValue("fademindist",untyped value);
    }
    
    /**
		End Fade Dist

		Max fade distance at which the prop is visible (0 = don't fade out)
	**/
    public var fademaxdist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademaxdist():Float {
        return untyped this.GetKeyValues().fademaxdist;
    }
    
    @:noCompletion
    public extern inline function set_fademaxdist(value:Float):Float {
        return untyped this.SetKeyValue("fademaxdist",untyped value);
    }
    
    /**
		Fade Scale

		If you specify a fade in the worldspawn, or if the engine is running under dx7, then the engine will forcibly fade out props even if fademindist/fademaxdist isn't specified. This scale factor gives you some control over the fade. Using 0 here turns off the forcible fades. Numbers smaller than 1 cause the prop to fade out at further distances, and greater than 1 cause it to fade out at closer distances.
	**/
    public var fadescale(get,set):Float;

    @:noCompletion
    public extern inline function get_fadescale():Float {
        return untyped this.GetKeyValues().fadescale;
    }
    
    @:noCompletion
    public extern inline function set_fadescale(value:Float):Float {
        return untyped this.SetKeyValue("fadescale",untyped value);
    }
    
    /**
		Explosion Damage

		If non-zero, when this entity breaks it will create an explosion that causes the specified amount of damage. See also 'Explosion Radius'.
	**/
    public var ExplodeDamage(get,set):Float;

    @:noCompletion
    public extern inline function get_ExplodeDamage():Float {
        return untyped this.GetKeyValues().ExplodeDamage;
    }
    
    @:noCompletion
    public extern inline function set_ExplodeDamage(value:Float):Float {
        return untyped this.SetKeyValue("ExplodeDamage",untyped value);
    }
    
    /**
		Explosion Radius

		If non-zero, when this entity breaks it will create an explosion with a radius of the specified amount. See also 'Explosion Damage'.
	**/
    public var ExplodeRadius(get,set):Float;

    @:noCompletion
    public extern inline function get_ExplodeRadius():Float {
        return untyped this.GetKeyValues().ExplodeRadius;
    }
    
    @:noCompletion
    public extern inline function set_ExplodeRadius(value:Float):Float {
        return untyped this.SetKeyValue("ExplodeRadius",untyped value);
    }
    
    /**
		Performance Mode

		Used to limit the amount of gibs produced when this entity breaks, for performance reasons.
	**/
    public var PerformanceMode(get,set):Prop_dynamicPerformanceModeChoices;

    @:noCompletion
    public extern inline function get_PerformanceMode():Prop_dynamicPerformanceModeChoices {
        return untyped this.GetKeyValues().PerformanceMode;
    }
    
    @:noCompletion
    public extern inline function set_PerformanceMode(value:Prop_dynamicPerformanceModeChoices):Prop_dynamicPerformanceModeChoices {
        return untyped this.SetKeyValue("PerformanceMode",untyped value);
    }
    
    /**
		Break Model Message

		If set, will use this break model message instead of the normal break behavior.
	**/
    public var BreakModelMessage(get,set):String;

    @:noCompletion
    public extern inline function get_BreakModelMessage():String {
        return untyped this.GetKeyValues().BreakModelMessage;
    }
    
    @:noCompletion
    public extern inline function set_BreakModelMessage(value:String):String {
        return untyped this.SetKeyValue("BreakModelMessage",untyped value);
    }
    
    /**
		Pressure Delay

		Delay, in seconds, after 'broken' by pressure before breaking apart (allows for sound to play before breaking apart).
	**/
    public var pressuredelay(get,set):Float;

    @:noCompletion
    public extern inline function get_pressuredelay():Float {
        return untyped this.GetKeyValues().pressuredelay;
    }
    
    @:noCompletion
    public extern inline function set_pressuredelay(value:Float):Float {
        return untyped this.SetKeyValue("pressuredelay",untyped value);
    }
    
    /**
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Prop_dynamicmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Prop_dynamicmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Prop_dynamicmindxlevelChoices):Prop_dynamicmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Prop_dynamicmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Prop_dynamicmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Prop_dynamicmaxdxlevelChoices):Prop_dynamicmaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		Damage Filter

		Name of the filter entity that controls which entities can damage us.
	**/
    public var damagefilter(get,set):String;

    @:noCompletion
    public extern inline function get_damagefilter():String {
        return untyped this.GetKeyValues().damagefilter;
    }
    
    @:noCompletion
    public extern inline function set_damagefilter(value:String):String {
        return untyped this.SetKeyValue("damagefilter",untyped value);
    }
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Prop_dynamicStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Prop_dynamicStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Prop_dynamicStartDisabledChoices):Prop_dynamicStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Prop_dynamicgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Prop_dynamicgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Prop_dynamicgmod_allowphysgunChoices):Prop_dynamicgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Prop_dynamicrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Prop_dynamicrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Prop_dynamicrendermodeChoices):Prop_dynamicrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Prop_dynamicdisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Prop_dynamicdisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Prop_dynamicdisablereceiveshadowsChoices):Prop_dynamicdisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Prop_dynamicrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Prop_dynamicrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Prop_dynamicrenderfxChoices):Prop_dynamicrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Prop_dynamicdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_dynamicdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_dynamicdisableshadowsChoices):Prop_dynamicdisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
    }
    
    /**
		World Model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Skin

		Some models have multiple versions of their textures, called skins. Set this to a number other than 0 to use that skin instead of the default.
	**/
    public var skin(get,set):Int;

    @:noCompletion
    public extern inline function get_skin():Int {
        return untyped this.GetKeyValues().skin;
    }
    
    @:noCompletion
    public extern inline function set_skin(value:Int):Int {
        return untyped this.SetKeyValue("skin",untyped value);
    }
    
    /**
		Disable Shadows

		Used to disable dynamic shadows on this entity.
	**/
    public var disableshadows(get,set):Prop_dynamicdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_dynamicdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_dynamicdisableshadowsChoices):Prop_dynamicdisableshadowsChoices {
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
		Collisions
	**/
    public var solid(get,set):Prop_dynamicsolidChoices;

    @:noCompletion
    public extern inline function get_solid():Prop_dynamicsolidChoices {
        return untyped this.GetKeyValues().solid;
    }
    
    @:noCompletion
    public extern inline function set_solid(value:Prop_dynamicsolidChoices):Prop_dynamicsolidChoices {
        return untyped this.SetKeyValue("solid",untyped value);
    }
    
    /**
		Default Animation

		The name of the idle animation that this prop will revert to whenever it finishes a random or forced animation.
	**/
    public var DefaultAnim(get,set):String;

    @:noCompletion
    public extern inline function get_DefaultAnim():String {
        return untyped this.GetKeyValues().DefaultAnim;
    }
    
    @:noCompletion
    public extern inline function set_DefaultAnim(value:String):String {
        return untyped this.SetKeyValue("DefaultAnim",untyped value);
    }
    
    /**
		Randomly Animate

		If set, this prop will randomly choose and play animations, based upon the times specified in 'Min/Max Random Anim Time'. Inbetween the random animations, it will revert to playing the 'Default Animation'.
	**/
    public var RandomAnimation(get,set):Prop_dynamicRandomAnimationChoices;

    @:noCompletion
    public extern inline function get_RandomAnimation():Prop_dynamicRandomAnimationChoices {
        return untyped this.GetKeyValues().RandomAnimation;
    }
    
    @:noCompletion
    public extern inline function set_RandomAnimation(value:Prop_dynamicRandomAnimationChoices):Prop_dynamicRandomAnimationChoices {
        return untyped this.SetKeyValue("RandomAnimation",untyped value);
    }
    
    /**
		Min Random Anim Time

		Minimum time between random animations.
	**/
    public var MinAnimTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MinAnimTime():Float {
        return untyped this.GetKeyValues().MinAnimTime;
    }
    
    @:noCompletion
    public extern inline function set_MinAnimTime(value:Float):Float {
        return untyped this.SetKeyValue("MinAnimTime",untyped value);
    }
    
    /**
		Max Random Anim Time

		Maximum time between random animations.
	**/
    public var MaxAnimTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MaxAnimTime():Float {
        return untyped this.GetKeyValues().MaxAnimTime;
    }
    
    @:noCompletion
    public extern inline function set_MaxAnimTime(value:Float):Float {
        return untyped this.SetKeyValue("MaxAnimTime",untyped value);
    }
    
    /**
		Body Group
	**/
    public var SetBodyGroup(get,set):Int;

    @:noCompletion
    public extern inline function get_SetBodyGroup():Int {
        return untyped this.GetKeyValues().SetBodyGroup;
    }
    
    @:noCompletion
    public extern inline function set_SetBodyGroup(value:Int):Int {
        return untyped this.SetKeyValue("SetBodyGroup",untyped value);
    }
    
    /**
		Disable Bone Followers

		If set, this prop won't generate bone followers, even if they're listed in the model's .qc
	**/
    public var DisableBoneFollowers(get,set):Prop_dynamicDisableBoneFollowersChoices;

    @:noCompletion
    public extern inline function get_DisableBoneFollowers():Prop_dynamicDisableBoneFollowersChoices {
        return untyped this.GetKeyValues().DisableBoneFollowers;
    }
    
    @:noCompletion
    public extern inline function set_DisableBoneFollowers(value:Prop_dynamicDisableBoneFollowersChoices):Prop_dynamicDisableBoneFollowersChoices {
        return untyped this.SetKeyValue("DisableBoneFollowers",untyped value);
    }
    
    /**
		Hold Animation

		If set, the prop will not loop its animation, but hold the last frame.
	**/
    public var HoldAnimation(get,set):Prop_dynamicHoldAnimationChoices;

    @:noCompletion
    public extern inline function get_HoldAnimation():Prop_dynamicHoldAnimationChoices {
        return untyped this.GetKeyValues().HoldAnimation;
    }
    
    @:noCompletion
    public extern inline function set_HoldAnimation(value:Prop_dynamicHoldAnimationChoices):Prop_dynamicHoldAnimationChoices {
        return untyped this.SetKeyValue("HoldAnimation",untyped value);
    }
    
    /**
		Lighting Origin

		Select a path_corner entity to specify a location to sample lighting from, instead of using this entity's origin.
	**/
    public var lightingorigin(get,set):String;

    @:noCompletion
    public extern inline function get_lightingorigin():String {
        return untyped this.GetKeyValues().lightingorigin;
    }
    
    @:noCompletion
    public extern inline function set_lightingorigin(value:String):String {
        return untyped this.SetKeyValue("lightingorigin",untyped value);
    }
    
    /**
		Color (R G B)
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
    
    //Outputs
    
    /**
		Fired when this breakable breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    
    /**
		Fired each time this breakable takes any damage.
	**/
    public extern inline function OutputOnTakeDamage(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTakeDamage",callback);
    }
    
    /**
		Fired when the health of this breakable changes, passing the new value of health as a percentage of max health, from [0..1].
	**/
    public extern inline function OutputOnHealthChanged(callback:Callback<{activator:Prop_dynamic,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHealthChanged",callback);
    }
    
    /**
		Fired when the physcannon has ripped this breakable off of the wall. Only fired if ACT_PHYSCANNON_DETACH is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonDetach(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonDetach",callback);
    }
    
    /**
		Fired when this prop starts playing the Pre physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE_PRE activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePreStarted(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePreStarted",callback);
    }
    
    /**
		Fired when this prop starts playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre pull anim, this will be fired after the Pre anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonAnimatePullStarted(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePullStarted",callback);
    }
    
    /**
		Fired when this prop has finished playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre & Post pull anims, this will be fired after the Post anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonPullAnimFinished(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonPullAnimFinished",callback);
    }
    
    /**
		Fired when this prop starts playing the Post physcannon-pull activity. Only fired if the ACT_PHYSCANNON_ANIMATE_POST activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePostStarted(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePostStarted",callback);
    }
    
    /**
		Fired when this object catches fire.
	**/
    public extern inline function OutputOnIgnite(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnite",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired whenever a new animation has begun playing.
	**/
    public extern inline function OutputOnAnimationBegun(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAnimationBegun",callback);
    }
    
    /**
		Fired whenever an animation is complete.
	**/
    public extern inline function OutputOnAnimationDone(callback:Callback<{activator:Prop_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAnimationDone",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Prop_dynamicSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Prop_dynamicSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Prop_dynamicSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("prop_dynamic");
    }
}

enum abstract Prop_dynamicsolidChoices(Int) to Int {
	var NOT_SOLID = 0;
	var USE_BOUNDING_BOX = 2;
	var USE_VPHYSICS = 6;
}
enum abstract Prop_dynamicrendermodeChoices(Int) to Int {
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
enum abstract Prop_dynamicrenderfxChoices(Int) to Int {
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
enum abstract Prop_dynamicmindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_dynamicmaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_dynamicgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicdisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicRandomAnimationChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicPerformanceModeChoices(Int) to Int {
	var NORMAL = 0;
	var NO_GIBS = 1;
	var FULL_GIBS_ON_ALL_PLATFORMS = 2;
	var REDUCED_GIBS = 3;
}
enum abstract Prop_dynamicHoldAnimationChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_dynamicDisableBoneFollowersChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Prop_dynamicSpawnFlags(Int) to Int {
	var BREAK_ON_TOUCH = 16;
	var BREAK_ON_PRESSURE = 32;
	var USE_HITBOXES_FOR_RENDERBOX = 64;
	var START_WITH_COLLISION_DISABLED = 256;
}

#end
