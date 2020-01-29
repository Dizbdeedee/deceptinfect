package gmod.engine_ents;
#if server
/**
	A prop that physically simulates as a single rigid body. It can be constrained to other physics objects using hinges or other constraints. It can also be configured to break when it takes enough damage. Note that the health of the object will be overridden by the health inside the model, to ensure consistent health game-wide. If the model used by the prop is configured to be used as a prop_dynamic (i.e. it should not be physically simulated) then it CANNOT be used as a prop_physics. Upon level load it will display a warning in the console and remove itself. Use a prop_dynamic instead.
**/
@:forward
abstract Prop_physics(Entity) to Entity {
    //Inputs
    
    /**
		Wake up this physics object, if it is sleeping.
	**/
    public extern inline function FireWake(delay:Float) {
        untyped this.Fire("Wake",untyped null,delay);
    }
    
    /**
		Put this physics object to sleep. It will wake if given the Wake input, or if force is applied to it. Note that physics objects go to sleep automatically after coming to rest for a while, so you don't really need to use this.
	**/
    public extern inline function FireSleep(delay:Float) {
        untyped this.Fire("Sleep",untyped null,delay);
    }
    
    /**
		Enable physics motion/collision response.
	**/
    public extern inline function FireEnableMotion(delay:Float) {
        untyped this.Fire("EnableMotion",untyped null,delay);
    }
    
    /**
		Disable physics motion/collision response.
	**/
    public extern inline function FireDisableMotion(delay:Float) {
        untyped this.Fire("DisableMotion",untyped null,delay);
    }
    
    /**
		Disable fluid/floating simulation to reduce cost.
	**/
    public extern inline function FireDisableFloating(delay:Float) {
        untyped this.Fire("DisableFloating",untyped null,delay);
    }
    
    /**
		Set this prop's body group (from 0 - n).
	**/
    public extern inline function FireSetBodyGroup(param:Int,delay:Float) {
        untyped this.Fire("SetBodyGroup",untyped param,delay);
    }
    
    /**
		Set the Physics Impact Damage Scale for this character. NOTE: 0 means this feature is disabled for backwards compatibility.
	**/
    public extern inline function Firephysdamagescale(param:Float,delay:Float) {
        untyped this.Fire("physdamagescale",untyped param,delay);
    }
    
    /**
		Damaging the entity applies physics forces to it.
	**/
    public extern inline function FireEnableDamageForces(delay:Float) {
        untyped this.Fire("EnableDamageForces",untyped null,delay);
    }
    
    /**
		Damaging the entity does *not* apply physics forces to it.
	**/
    public extern inline function FireDisableDamageForces(delay:Float) {
        untyped this.Fire("DisableDamageForces",untyped null,delay);
    }
    
    /**
		Allow this prop to play its own sound when punted
	**/
    public extern inline function FireEnablePuntSound(delay:Float) {
        untyped this.Fire("EnablePuntSound",untyped null,delay);
    }
    
    /**
		Prevent this prop from playing its own sound when punted
	**/
    public extern inline function FireDisablePuntSound(delay:Float) {
        untyped this.Fire("DisablePuntSound",untyped null,delay);
    }
    
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
		Ignite, burst into flames.
	**/
    public extern inline function FireIgnite(delay:Float) {
        untyped this.Fire("Ignite",untyped null,delay);
    }
    
    /**
		Ignite, with a parameter lifetime.
	**/
    public extern inline function FireIgniteLifetime(param:Float,delay:Float) {
        untyped this.Fire("IgniteLifetime",untyped param,delay);
    }
    
    /**
		Ignite, with a parameternumber of hitbox fires.
	**/
    public extern inline function FireIgniteNumHitboxFires(param:Int,delay:Float) {
        untyped this.Fire("IgniteNumHitboxFires",untyped param,delay);
    }
    
    /**
		Ignite, with a parameter hitbox fire scale.
	**/
    public extern inline function FireIgniteHitboxFireScale(param:Float,delay:Float) {
        untyped this.Fire("IgniteHitboxFireScale",untyped param,delay);
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
		Min Damage to Hurt

		The prop will ignore any damage events if the damage is less than this amount.
	**/
    public var minhealthdmg(get,set):Int;

    @:noCompletion
    public extern inline function get_minhealthdmg():Int {
        return untyped this.GetKeyValues().minhealthdmg;
    }
    
    @:noCompletion
    public extern inline function set_minhealthdmg(value:Int):Int {
        return untyped this.SetKeyValue("minhealthdmg",untyped value);
    }
    
    /**
		Shadow Cast Distance

		Use this to override how far this object casts shadows. 0 = default distance.
	**/
    public var shadowcastdist(get,set):Int;

    @:noCompletion
    public extern inline function get_shadowcastdist():Int {
        return untyped this.GetKeyValues().shadowcastdist;
    }
    
    @:noCompletion
    public extern inline function set_shadowcastdist(value:Int):Int {
        return untyped this.SetKeyValue("shadowcastdist",untyped value);
    }
    
    /**
		Physics Impact Damage Scale

		Scales damage energy when this object is hit by a physics object. NOTE: 0 means this feature is disabled for backwards compatibility.
Set to 1.0 for materials as strong as flesh, smaller numbers indicate stronger materials.
	**/
    public var physdamagescale(get,set):Float;

    @:noCompletion
    public extern inline function get_physdamagescale():Float {
        return untyped this.GetKeyValues().physdamagescale;
    }
    
    @:noCompletion
    public extern inline function set_physdamagescale(value:Float):Float {
        return untyped this.SetKeyValue("physdamagescale",untyped value);
    }
    
    /**
		Impact damage type
	**/
    public var Damagetype(get,set):Prop_physicsDamagetypeChoices;

    @:noCompletion
    public extern inline function get_Damagetype():Prop_physicsDamagetypeChoices {
        return untyped this.GetKeyValues().Damagetype;
    }
    
    @:noCompletion
    public extern inline function set_Damagetype(value:Prop_physicsDamagetypeChoices):Prop_physicsDamagetypeChoices {
        return untyped this.SetKeyValue("Damagetype",untyped value);
    }
    
    /**
		Damaging it Doesn't Push It

		Used to determine whether or not damage should cause the brush to move.
	**/
    public var nodamageforces(get,set):Prop_physicsnodamageforcesChoices;

    @:noCompletion
    public extern inline function get_nodamageforces():Prop_physicsnodamageforcesChoices {
        return untyped this.GetKeyValues().nodamageforces;
    }
    
    @:noCompletion
    public extern inline function set_nodamageforces(value:Prop_physicsnodamageforcesChoices):Prop_physicsnodamageforcesChoices {
        return untyped this.SetKeyValue("nodamageforces",untyped value);
    }
    
    /**
		Scale Factor For Inertia

		Scales the angular mass of an object. Used to hack angular damage and collision response.
	**/
    public var inertiaScale(get,set):Float;

    @:noCompletion
    public extern inline function get_inertiaScale():Float {
        return untyped this.GetKeyValues().inertiaScale;
    }
    
    @:noCompletion
    public extern inline function set_inertiaScale(value:Float):Float {
        return untyped this.SetKeyValue("inertiaScale",untyped value);
    }
    
    /**
		Mass Scale

		A scale multiplier for the object's mass.
	**/
    public var massScale(get,set):Float;

    @:noCompletion
    public extern inline function get_massScale():Float {
        return untyped this.GetKeyValues().massScale;
    }
    
    @:noCompletion
    public extern inline function set_massScale(value:Float):Float {
        return untyped this.SetKeyValue("massScale",untyped value);
    }
    
    /**
		Override Parameters

		A list of physics key/value pairs that are usually in a physics prop .qc file. Format is 'key,value,key,value,etc'.
	**/
    public var overridescript(get,set):String;

    @:noCompletion
    public extern inline function get_overridescript():String {
        return untyped this.GetKeyValues().overridescript;
    }
    
    @:noCompletion
    public extern inline function set_overridescript(value:String):String {
        return untyped this.SetKeyValue("overridescript",untyped value);
    }
    
    /**
		Health Level to Override Motion

		If specified, this object will start motion disabled. Once its health has dropped below this specified amount, it will enable motion.
	**/
    public var damagetoenablemotion(get,set):Int;

    @:noCompletion
    public extern inline function get_damagetoenablemotion():Int {
        return untyped this.GetKeyValues().damagetoenablemotion;
    }
    
    @:noCompletion
    public extern inline function set_damagetoenablemotion(value:Int):Int {
        return untyped this.SetKeyValue("damagetoenablemotion",untyped value);
    }
    
    /**
		Physics Impact Force to Override Motion

		If specified, this object will start motion disabled. Any impact that imparts a force greater than this value on the physbox will enable motion.
	**/
    public var forcetoenablemotion(get,set):Float;

    @:noCompletion
    public extern inline function get_forcetoenablemotion():Float {
        return untyped this.GetKeyValues().forcetoenablemotion;
    }
    
    @:noCompletion
    public extern inline function set_forcetoenablemotion(value:Float):Float {
        return untyped this.SetKeyValue("forcetoenablemotion",untyped value);
    }
    
    /**
		Sound to make when punted
	**/
    public var puntsound(get,set):String;

    @:noCompletion
    public extern inline function get_puntsound():String {
        return untyped this.GetKeyValues().puntsound;
    }
    
    @:noCompletion
    public extern inline function set_puntsound(value:String):String {
        return untyped this.SetKeyValue("puntsound",untyped value);
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
    public var PerformanceMode(get,set):Prop_physicsPerformanceModeChoices;

    @:noCompletion
    public extern inline function get_PerformanceMode():Prop_physicsPerformanceModeChoices {
        return untyped this.GetKeyValues().PerformanceMode;
    }
    
    @:noCompletion
    public extern inline function set_PerformanceMode(value:Prop_physicsPerformanceModeChoices):Prop_physicsPerformanceModeChoices {
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
    public var mindxlevel(get,set):Prop_physicsmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Prop_physicsmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Prop_physicsmindxlevelChoices):Prop_physicsmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Prop_physicsmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Prop_physicsmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Prop_physicsmaxdxlevelChoices):Prop_physicsmaxdxlevelChoices {
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
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Prop_physicsgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Prop_physicsgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Prop_physicsgmod_allowphysgunChoices):Prop_physicsgmod_allowphysgunChoices {
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
		Render Mode

		Used to set a non-standard rendering mode on this entity. See also 'FX Amount' and 'FX Color'.
	**/
    public var rendermode(get,set):Prop_physicsrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Prop_physicsrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Prop_physicsrendermodeChoices):Prop_physicsrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Prop_physicsdisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Prop_physicsdisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Prop_physicsdisablereceiveshadowsChoices):Prop_physicsdisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Prop_physicsrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Prop_physicsrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Prop_physicsrenderfxChoices):Prop_physicsrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Prop_physicsdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_physicsdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_physicsdisableshadowsChoices):Prop_physicsdisableshadowsChoices {
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
    public var disableshadows(get,set):Prop_physicsdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_physicsdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_physicsdisableshadowsChoices):Prop_physicsdisableshadowsChoices {
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
    
    //Outputs
    
    /**
		Fired when motion is enabled on this prop, either via 'Health Level to Override Motion' or from the EnableMotion input.
	**/
    public extern inline function OutputOnMotionEnabled(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMotionEnabled",callback);
    }
    
    /**
		Fired when this entity becomes awake (collision/force is applied to it while it's asleep).
	**/
    public extern inline function OutputOnAwakened(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAwakened",callback);
    }
    
    /**
		Fired when the player picks up the prop with the physcannon or +USE.
	**/
    public extern inline function OutputOnPhysGunPickup(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunPickup",callback);
    }
    
    /**
		Fired when a player punts this object with the physgun.
	**/
    public extern inline function OutputOnPhysGunPunt(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunPunt",callback);
    }
    
    /**
		Fired when a player picks this object up WITH THE PHYSGUN. +USE pickups do not fire this output.
	**/
    public extern inline function OutputOnPhysGunOnlyPickup(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunOnlyPickup",callback);
    }
    
    /**
		Fired when the player drops the prop with the physcannon or USE.
	**/
    public extern inline function OutputOnPhysGunDrop(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunDrop",callback);
    }
    
    /**
		Fired when the player tries to +USE the prop. This output will fire only if the Generate output on +USE spawnflag is set.
	**/
    public extern inline function OutputOnPlayerUse(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerUse",callback);
    }
    
    /**
		Fired whenever the player picks up this prop (with the physcannon or with +USE).
	**/
    public extern inline function OutputOnPlayerPickup(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerPickup",callback);
    }
    
    /**
		Fired whenever the prop is out of the allowed world bounds.
	**/
    public extern inline function OutputOnOutOfWorld(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOutOfWorld",callback);
    }
    
    /**
		Fired when this breakable breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    
    /**
		Fired each time this breakable takes any damage.
	**/
    public extern inline function OutputOnTakeDamage(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTakeDamage",callback);
    }
    
    /**
		Fired when the health of this breakable changes, passing the new value of health as a percentage of max health, from [0..1].
	**/
    public extern inline function OutputOnHealthChanged(callback:Callback<{activator:Prop_physics,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHealthChanged",callback);
    }
    
    /**
		Fired when the physcannon has ripped this breakable off of the wall. Only fired if ACT_PHYSCANNON_DETACH is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonDetach(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonDetach",callback);
    }
    
    /**
		Fired when this prop starts playing the Pre physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE_PRE activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePreStarted(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePreStarted",callback);
    }
    
    /**
		Fired when this prop starts playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre pull anim, this will be fired after the Pre anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonAnimatePullStarted(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePullStarted",callback);
    }
    
    /**
		Fired when this prop has finished playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre & Post pull anims, this will be fired after the Post anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonPullAnimFinished(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonPullAnimFinished",callback);
    }
    
    /**
		Fired when this prop starts playing the Post physcannon-pull activity. Only fired if the ACT_PHYSCANNON_ANIMATE_POST activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePostStarted(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePostStarted",callback);
    }
    
    /**
		Fired when this object catches fire.
	**/
    public extern inline function OutputOnIgnite(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnite",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Prop_physics}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Prop_physicsSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Prop_physicsSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Prop_physicsSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("prop_physics");
    }
}

enum abstract Prop_physicsrendermodeChoices(Int) to Int {
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
enum abstract Prop_physicsrenderfxChoices(Int) to Int {
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
enum abstract Prop_physicsnodamageforcesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_physicsmindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_physicsmaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_physicsgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_physicsdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_physicsdisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_physicsPerformanceModeChoices(Int) to Int {
	var NORMAL = 0;
	var NO_GIBS = 1;
	var FULL_GIBS_ON_ALL_PLATFORMS = 2;
	var REDUCED_GIBS = 3;
}
enum abstract Prop_physicsDamagetypeChoices(Int) to Int {
	var BLUNT = 0;
	var SHARP = 1;
}


enum abstract Prop_physicsSpawnFlags(Int) to Int {
	var START_ASLEEP = 1;
	var DONT_TAKE_PHYSICS_DAMAGE = 2;
	var DEBRIS__DONT_COLLIDE_WITH_THE_PLAYER_OR_OTHER_DEBRIS = 4;
	var MOTION_DISABLED = 8;
	var ENABLE_MOTION_ON_PHYSCANNON_GRAB = 64;
	var NOT_AFFECTED_BY_ROTOR_WASH = 128;
	var GENERATE_OUTPUT_ON_USE_ = 256;
	var PREVENT_PICKUP = 512;
	var PREVENT_MOTION_ENABLE_ON_PLAYER_BUMP = 1024;
	var DEBRIS_WITH_TRIGGER_INTERACTION = 4096;
	var FORCE_SERVERSIDE_MULTIPLAYER_ONLY = 8192;
	var PHYSGUN_CAN_ALWAYS_PICK_UP_NO_MATTER_WHAT = 1048576;
	var BREAK_ON_TOUCH = 16;
	var BREAK_ON_PRESSURE = 32;
}

#end
