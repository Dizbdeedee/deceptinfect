package gmod.engine_ents;
#if server
/**
	An entity that shoots models, or sprites, out of its origin.
**/
@:forward
abstract Env_shooter(Entity) to Entity {
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
		Force the gibshooter to create and shoot a gib.
	**/
    public extern inline function FireShoot(delay:Float) {
        untyped this.Fire("Shoot",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Env_shootergmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Env_shootergmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Env_shootergmod_allowphysgunChoices):Env_shootergmod_allowphysgunChoices {
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
    public var rendermode(get,set):Env_shooterrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Env_shooterrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Env_shooterrendermodeChoices):Env_shooterrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Env_shooterdisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Env_shooterdisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Env_shooterdisablereceiveshadowsChoices):Env_shooterdisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Env_shooterrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Env_shooterrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Env_shooterrenderfxChoices):Env_shooterrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
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
		Gib Direction (Pitch Yaw Roll)

		The direction the gibs will fly.
	**/
    public var angles(get,set):String;

    @:noCompletion
    public extern inline function get_angles():String {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:String):String {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    /**
		Number of Gibs

		Total number of gibs to shoot each time it's activated.
	**/
    public var m_iGibs(get,set):Int;

    @:noCompletion
    public extern inline function get_m_iGibs():Int {
        return untyped this.GetKeyValues().m_iGibs;
    }
    
    @:noCompletion
    public extern inline function set_m_iGibs(value:Int):Int {
        return untyped this.SetKeyValue("m_iGibs",untyped value);
    }
    
    /**
		Delay between shots

		Delay (in seconds) between shooting each gib. If 0, all gibs shoot at once.
	**/
    public var delay(get,set):String;

    @:noCompletion
    public extern inline function get_delay():String {
        return untyped this.GetKeyValues().delay;
    }
    
    @:noCompletion
    public extern inline function set_delay(value:String):String {
        return untyped this.SetKeyValue("delay",untyped value);
    }
    
    /**
		Gib Angles (Pitch Yaw Roll)

		The orientation of the spawned gibs.
	**/
    public var gibangles(get,set):String;

    @:noCompletion
    public extern inline function get_gibangles():String {
        return untyped this.GetKeyValues().gibangles;
    }
    
    @:noCompletion
    public extern inline function set_gibangles(value:String):String {
        return untyped this.SetKeyValue("gibangles",untyped value);
    }
    
    /**
		Max angular velocity

		How fast (degrees/sec) the gib pieces should spin. They will spin on x and y axis at between 10% and 100% of this speed.
	**/
    public var gibanglevelocity(get,set):String;

    @:noCompletion
    public extern inline function get_gibanglevelocity():String {
        return untyped this.GetKeyValues().gibanglevelocity;
    }
    
    @:noCompletion
    public extern inline function set_gibanglevelocity(value:String):String {
        return untyped this.SetKeyValue("gibanglevelocity",untyped value);
    }
    
    /**
		Gib Velocity

		Speed of the fired gibs
	**/
    public var m_flVelocity(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flVelocity():Int {
        return untyped this.GetKeyValues().m_flVelocity;
    }
    
    @:noCompletion
    public extern inline function set_m_flVelocity(value:Int):Int {
        return untyped this.SetKeyValue("m_flVelocity",untyped value);
    }
    
    /**
		Course Variance

		How much variance in the direction gibs are fired.
	**/
    public var m_flVariance(get,set):String;

    @:noCompletion
    public extern inline function get_m_flVariance():String {
        return untyped this.GetKeyValues().m_flVariance;
    }
    
    @:noCompletion
    public extern inline function set_m_flVariance(value:String):String {
        return untyped this.SetKeyValue("m_flVariance",untyped value);
    }
    
    /**
		Gib Life

		Time in seconds for gibs to live +/- 5%
	**/
    public var m_flGibLife(get,set):String;

    @:noCompletion
    public extern inline function get_m_flGibLife():String {
        return untyped this.GetKeyValues().m_flGibLife;
    }
    
    @:noCompletion
    public extern inline function set_m_flGibLife(value:String):String {
        return untyped this.SetKeyValue("m_flGibLife",untyped value);
    }
    
    /**
		Lighting Origin

		Select an info_lighting to specify a location to sample lighting from for all gibs spawned by this shooter, instead of their own origins.
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
		Model

		Thing to shoot out. Can be a .mdl or a .vmt.
	**/
    public var shootmodel(get,set):String;

    @:noCompletion
    public extern inline function get_shootmodel():String {
        return untyped this.GetKeyValues().shootmodel;
    }
    
    @:noCompletion
    public extern inline function set_shootmodel(value:String):String {
        return untyped this.SetKeyValue("shootmodel",untyped value);
    }
    
    /**
		Material Sound
	**/
    public var shootsounds(get,set):Env_shootershootsoundsChoices;

    @:noCompletion
    public extern inline function get_shootsounds():Env_shootershootsoundsChoices {
        return untyped this.GetKeyValues().shootsounds;
    }
    
    @:noCompletion
    public extern inline function set_shootsounds(value:Env_shootershootsoundsChoices):Env_shootershootsoundsChoices {
        return untyped this.SetKeyValue("shootsounds",untyped value);
    }
    
    /**
		Simulate
	**/
    public var simulation(get,set):Env_shootersimulationChoices;

    @:noCompletion
    public extern inline function get_simulation():Env_shootersimulationChoices {
        return untyped this.GetKeyValues().simulation;
    }
    
    @:noCompletion
    public extern inline function set_simulation(value:Env_shootersimulationChoices):Env_shootersimulationChoices {
        return untyped this.SetKeyValue("simulation",untyped value);
    }
    
    /**
		Gib Skin

		Some models have multiple versions of their textures, called skins. Set this to a number other than 0 to use that skin on all gibs produced by this shooter.
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
		Disable Shadows on Gibs
	**/
    public var nogibshadows(get,set):Env_shooternogibshadowsChoices;

    @:noCompletion
    public extern inline function get_nogibshadows():Env_shooternogibshadowsChoices {
        return untyped this.GetKeyValues().nogibshadows;
    }
    
    @:noCompletion
    public extern inline function set_nogibshadows(value:Env_shooternogibshadowsChoices):Env_shooternogibshadowsChoices {
        return untyped this.SetKeyValue("nogibshadows",untyped value);
    }
    
    /**
		Gib gravity scale

		ONLY WORKS FOR POINT GIBS. This field allows you to scale gravity so that gibs fall faster, slower, or not at all.
	**/
    public var gibgravityscale(get,set):Float;

    @:noCompletion
    public extern inline function get_gibgravityscale():Float {
        return untyped this.GetKeyValues().gibgravityscale;
    }
    
    @:noCompletion
    public extern inline function set_gibgravityscale(value:Float):Float {
        return untyped this.SetKeyValue("gibgravityscale",untyped value);
    }
    
    /**
		Mass override

		EPISODIC ONLY. Specify an arbitrary mass for the gibs emitted by me.
	**/
    public var massoverride(get,set):Float;

    @:noCompletion
    public extern inline function get_massoverride():Float {
        return untyped this.GetKeyValues().massoverride;
    }
    
    @:noCompletion
    public extern inline function set_massoverride(value:Float):Float {
        return untyped this.SetKeyValue("massoverride",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_shooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_shooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_shooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_shooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_shooterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_shooterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_shooterSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_shooter");
    }
}

enum abstract Env_shootersimulationChoices(Int) to Int {
	var POINT = 0;
	var PHYSICS = 1;
	var RAGDOLL = 2;
}
enum abstract Env_shootershootsoundsChoices(Int) to Int {
	var NONE = -1;
	var GLASS = 0;
	var WOOD = 1;
	var METAL = 2;
	var FLESH = 3;
	var CONCRETE = 4;
}
enum abstract Env_shooterrendermodeChoices(Int) to Int {
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
enum abstract Env_shooterrenderfxChoices(Int) to Int {
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
enum abstract Env_shooternogibshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_shootergmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_shooterdisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_shooterSpawnFlags(Int) to Int {
	var REPEATABLE = 1;
	var ON_FIRE = 2;
	var STRICT_REMOVE_AFTER_LIFETIME = 4;
}

#end
