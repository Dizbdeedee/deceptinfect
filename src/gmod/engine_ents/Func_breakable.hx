package gmod.engine_ents;
#if server
/**
	A brush entity that can be broken from damage, or an input.
**/
@:forward
abstract Func_breakable(Entity) to Entity {
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
		Sets the entity to use as damage filter. Pass in an empty string to clear the damage filter.
	**/
    public extern inline function FireSetDamageFilter(param:String,delay:Float) {
        untyped this.Fire("SetDamageFilter",untyped param,delay);
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
    public var PerformanceMode(get,set):Func_breakablePerformanceModeChoices;

    @:noCompletion
    public extern inline function get_PerformanceMode():Func_breakablePerformanceModeChoices {
        return untyped this.GetKeyValues().PerformanceMode;
    }
    
    @:noCompletion
    public extern inline function set_PerformanceMode(value:Func_breakablePerformanceModeChoices):Func_breakablePerformanceModeChoices {
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
		Prop Data

		Set to the best approximation of the size and material of this entity's brushes. If set, it will override this entity's health and damage taken from various weapons. See the propdata.txt file in the scripts directory of your MOD to get a detailed list of what each entry specifies.
	**/
    public var propdata(get,set):Func_breakablepropdataChoices;

    @:noCompletion
    public extern inline function get_propdata():Func_breakablepropdataChoices {
        return untyped this.GetKeyValues().propdata;
    }
    
    @:noCompletion
    public extern inline function set_propdata(value:Func_breakablepropdataChoices):Func_breakablepropdataChoices {
        return untyped this.SetKeyValue("propdata",untyped value);
    }
    
    /**
		Strength

		Number of points of damage to take before breaking. 0 means don't break.
	**/
    public var health(get,set):Int;

    @:noCompletion
    public extern inline function get_health():Int {
        return untyped this.GetKeyValues().health;
    }
    
    @:noCompletion
    public extern inline function set_health(value:Int):Int {
        return untyped this.SetKeyValue("health",untyped value);
    }
    
    /**
		Material Type

		Set to the material type of the brush. Used to decide what sounds to make when damaged, and what gibs to produce when broken.
	**/
    public var material(get,set):Func_breakablematerialChoices;

    @:noCompletion
    public extern inline function get_material():Func_breakablematerialChoices {
        return untyped this.GetKeyValues().material;
    }
    
    @:noCompletion
    public extern inline function set_material(value:Func_breakablematerialChoices):Func_breakablematerialChoices {
        return untyped this.SetKeyValue("material",untyped value);
    }
    
    /**
		Gibs Direction

		Used to decide which direction to throw gibs when broken.
	**/
    public var explosion(get,set):Func_breakableexplosionChoices;

    @:noCompletion
    public extern inline function get_explosion():Func_breakableexplosionChoices {
        return untyped this.GetKeyValues().explosion;
    }
    
    @:noCompletion
    public extern inline function set_explosion(value:Func_breakableexplosionChoices):Func_breakableexplosionChoices {
        return untyped this.SetKeyValue("explosion",untyped value);
    }
    
    /**
		Precise Gib Direction

		Specifies the direction to throw gibs when this breakable breaks. Be sure to select Use Precise Gib Dir in the Gibs Direction field!
	**/
    public var gibdir(get,set):Angle;

    @:noCompletion
    public extern inline function get_gibdir():Angle {
        return untyped this.GetKeyValues().gibdir;
    }
    
    @:noCompletion
    public extern inline function set_gibdir(value:Angle):Angle {
        return untyped this.SetKeyValue("gibdir",untyped value);
    }
    
    /**
		Damaging it Doesn't Push It

		Used to determine whether or not damage should cause the brush to move.
	**/
    public var nodamageforces(get,set):Func_breakablenodamageforcesChoices;

    @:noCompletion
    public extern inline function get_nodamageforces():Func_breakablenodamageforcesChoices {
        return untyped this.GetKeyValues().nodamageforces;
    }
    
    @:noCompletion
    public extern inline function set_nodamageforces(value:Func_breakablenodamageforcesChoices):Func_breakablenodamageforcesChoices {
        return untyped this.SetKeyValue("nodamageforces",untyped value);
    }
    
    /**
		Gib Model

		Used by HL1Port to specify a custom gib model to break into, overriding the 'Material Type'.
	**/
    public var gibmodel(get,set):String;

    @:noCompletion
    public extern inline function get_gibmodel():String {
        return untyped this.GetKeyValues().gibmodel;
    }
    
    @:noCompletion
    public extern inline function set_gibmodel(value:String):String {
        return untyped this.SetKeyValue("gibmodel",untyped value);
    }
    
    /**
		Spawn On Break

		When broken, an entity of the selected type will be created.
	**/
    public var spawnobject(get,set):Func_breakablespawnobjectChoices;

    @:noCompletion
    public extern inline function get_spawnobject():Func_breakablespawnobjectChoices {
        return untyped this.GetKeyValues().spawnobject;
    }
    
    @:noCompletion
    public extern inline function set_spawnobject(value:Func_breakablespawnobjectChoices):Func_breakablespawnobjectChoices {
        return untyped this.SetKeyValue("spawnobject",untyped value);
    }
    
    /**
		Explode Magnitude

		If non-zero, when this entity breaks it will create an explosion that causes the specified amount of damage.
	**/
    public var explodemagnitude(get,set):Int;

    @:noCompletion
    public extern inline function get_explodemagnitude():Int {
        return untyped this.GetKeyValues().explodemagnitude;
    }
    
    @:noCompletion
    public extern inline function set_explodemagnitude(value:Int):Int {
        return untyped this.SetKeyValue("explodemagnitude",untyped value);
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
    public var gmod_allowphysgun(get,set):Func_breakablegmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_breakablegmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_breakablegmod_allowphysgunChoices):Func_breakablegmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_breakablerendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_breakablerendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_breakablerendermodeChoices):Func_breakablerendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_breakabledisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_breakabledisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_breakabledisablereceiveshadowsChoices):Func_breakabledisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_breakablerenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_breakablerenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_breakablerenderfxChoices):Func_breakablerenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_breakabledisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_breakabledisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_breakabledisableshadowsChoices):Func_breakabledisableshadowsChoices {
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
		Minimum Light Level

		The minimum level of ambient light that hits this brush.
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
    
    //Outputs
    
    /**
		Fired when this breakable breaks.
	**/
    public extern inline function OutputOnBreak(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBreak",callback);
    }
    
    /**
		Fired each time this breakable takes any damage.
	**/
    public extern inline function OutputOnTakeDamage(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTakeDamage",callback);
    }
    
    /**
		Fired when the health of this breakable changes, passing the new value of health as a percentage of max health, from [0..1].
	**/
    public extern inline function OutputOnHealthChanged(callback:Callback<{activator:Func_breakable,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHealthChanged",callback);
    }
    
    /**
		Fired when the physcannon has ripped this breakable off of the wall. Only fired if ACT_PHYSCANNON_DETACH is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonDetach(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonDetach",callback);
    }
    
    /**
		Fired when this prop starts playing the Pre physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE_PRE activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePreStarted(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePreStarted",callback);
    }
    
    /**
		Fired when this prop starts playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre pull anim, this will be fired after the Pre anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonAnimatePullStarted(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePullStarted",callback);
    }
    
    /**
		Fired when this prop has finished playing the physcannon-pull activity, caused by the player trying to grab this prop with the physcannon. Only fired if the ACT_PHYSCANNON_ANIMATE activity is defined in the model this breakable is using. If the prop has Pre & Post pull anims, this will be fired after the Post anim has finished playing.
	**/
    public extern inline function OutputOnPhysCannonPullAnimFinished(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonPullAnimFinished",callback);
    }
    
    /**
		Fired when this prop starts playing the Post physcannon-pull activity. Only fired if the ACT_PHYSCANNON_ANIMATE_POST activity is defined in the model this breakable is using.
	**/
    public extern inline function OutputOnPhysCannonAnimatePostStarted(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysCannonAnimatePostStarted",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_breakable}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_breakableSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_breakableSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_breakableSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_breakable");
    }
}

enum abstract Func_breakablespawnobjectChoices(Int) to Int {
	var ITEMBATTERY = 1;
	var ITEMHEALTHKIT = 2;
	var ITEMAMMOPISTOL = 3;
	var ITEMAMMOPISTOLLARGE = 4;
	var ITEMAMMOSMG1 = 5;
	var ITEMAMMOSMG1LARGE = 6;
	var ITEMAMMOAR2 = 7;
	var ITEMAMMOAR2LARGE = 8;
	var ITEMBOXBUCKSHOT = 9;
	var ITEMFLAREROUND = 10;
	var ITEMBOXFLAREROUNDS = 11;
	var ITEMMLGRENADE = 12;
	var ITEMSMG1GRENADE = 13;
	var ITEMBOXSNIPERROUNDS = 14;
	var UNUSED1 = 15;
	var WEAPONSTUNSTICK = 16;
	var WEAPONAR1 = 17;
	var WEAPONAR2 = 18;
	var UNUSED2 = 19;
	var WEAPONML = 20;
	var WEAPONSMG1 = 21;
	var WEAPONSMG2 = 22;
	var WEAPONSLAM = 23;
	var WEAPONSHOTGUN = 24;
	var WEAPONMOLOTOV = 25;
	var ITEMDYNAMICRESUPPLY = 26;
}
enum abstract Func_breakablerendermodeChoices(Int) to Int {
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
enum abstract Func_breakablerenderfxChoices(Int) to Int {
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
enum abstract Func_breakablepropdataChoices(Int) to Int {
	var NONE = 0;
	var WOODENTINY = 1;
	var WOODENSMALL = 2;
	var WOODENMEDIUM = 3;
	var WOODENLARGE = 4;
	var WOODENHUGE = 5;
	var METALSMALL = 6;
	var METALMEDIUM = 7;
	var METALLARGE = 8;
	var CARDBOARDSMALL = 9;
	var CARDBOARDMEDIUM = 10;
	var CARDBOARDLARGE = 11;
	var STONESMALL = 12;
	var STONEMEDIUM = 13;
	var STONELARGE = 14;
	var STONEHUGE = 15;
	var GLASSSMALL = 16;
	var PLASTICSMALL = 17;
	var PLASTICMEDIUM = 18;
	var PLASTICLARGE = 19;
	var POTTERYSMALL = 20;
	var POTTERYMEDIUM = 21;
	var POTTERYLARGE = 22;
	var POTTERYHUGE = 23;
	var GLASSWINDOW = 24;
}
enum abstract Func_breakablenodamageforcesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_breakablematerialChoices(Int) to Int {
	var GLASS = 0;
	var WOOD = 1;
	var METAL = 2;
	var FLESH = 3;
	var CINDERBLOCK = 4;
	var CEILING_TILE = 5;
	var COMPUTER = 6;
	var UNBREAKABLE_GLASS = 7;
	var ROCKS = 8;
	var NONE = 10;
}
enum abstract Func_breakablegmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_breakableexplosionChoices(Int) to Int {
	var RANDOM = 0;
	var RELATIVE_TO_ATTACK = 1;
	var USE_PRECISE_GIB_DIR = 2;
}
enum abstract Func_breakabledisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_breakabledisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_breakablePerformanceModeChoices(Int) to Int {
	var NORMAL = 0;
	var NO_GIBS = 1;
	var FULL_GIBS_ON_ALL_PLATFORMS = 2;
	var REDUCED_GIBS = 3;
}


enum abstract Func_breakableSpawnFlags(Int) to Int {
	var ONLY_BREAK_ON_TRIGGER = 1;
	var BREAK_ON_TOUCH = 2;
	var BREAK_ON_PRESSURE = 4;
	var BREAK_IMMEDIATELY_ON_PHYSICS = 512;
	var DONT_TAKE_PHYSICS_DAMAGE = 1024;
	var DONT_ALLOW_BULLET_PENETRATION = 2048;
}

#end
