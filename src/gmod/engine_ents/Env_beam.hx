package gmod.engine_ents;
#if server
/**
	An entity that creates a visible beam between two points. The points can be attached to entities to make the beam move around.
**/
@:forward
abstract Env_beam(Entity) to Entity {
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
		Turns the beam on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turns the beam off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggles the beam between on and off.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Causes the beam to strike once. It will stay on for its set Life and then turn off (it will never turn off if Life is set to zero).
	**/
    public extern inline function FireStrikeOnce(delay:Float) {
        untyped this.Fire("StrikeOnce",untyped null,delay);
    }
    
    /**
		Sets the beam's alpha (0 - 255).
	**/
    public extern inline function FireAlpha(param:Int,delay:Float) {
        untyped this.Fire("Alpha",untyped param,delay);
    }
    
    /**
		Sets the beam's render color (R G B).
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
    }
    
    /**
		Sets the red color channel's value (0 - 255).
	**/
    public extern inline function FireColorRedValue(param:Float,delay:Float) {
        untyped this.Fire("ColorRedValue",untyped param,delay);
    }
    
    /**
		Sets the green color channel's value (0 - 255).
	**/
    public extern inline function FireColorGreenValue(param:Float,delay:Float) {
        untyped this.Fire("ColorGreenValue",untyped param,delay);
    }
    
    /**
		Sets the blue color channel's value (0 - 255).
	**/
    public extern inline function FireColorBlueValue(param:Float,delay:Float) {
        untyped this.Fire("ColorBlueValue",untyped param,delay);
    }
    
    /**
		Set the amplitude of beam noise (0 - 255).
	**/
    public extern inline function FireAmplitude(param:Float,delay:Float) {
        untyped this.Fire("Amplitude",untyped param,delay);
    }
    
    /**
		Set the scroll speed in units per second (0 - 100).
	**/
    public extern inline function FireScrollSpeed(param:Float,delay:Float) {
        untyped this.Fire("ScrollSpeed",untyped param,delay);
    }
    
    /**
		Set the width of the beam, in pixels.
	**/
    public extern inline function FireWidth(param:Float,delay:Float) {
        untyped this.Fire("Width",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Env_beamgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Env_beamgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Env_beamgmod_allowphysgunChoices):Env_beamgmod_allowphysgunChoices {
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
		Render FX
	**/
    public var renderfx(get,set):Env_beamrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Env_beamrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Env_beamrenderfxChoices):Env_beamrenderfxChoices {
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
		Brightness (1 - 255)
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
		Beam Color (R G B)
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
		Radius

		If the 'Random Strike' spawnflag is set, this radius determines the area within which the endpoints will randomly strike.
	**/
    public var Radius(get,set):Int;

    @:noCompletion
    public extern inline function get_Radius():Int {
        return untyped this.GetKeyValues().Radius;
    }
    
    @:noCompletion
    public extern inline function set_Radius(value:Int):Int {
        return untyped this.SetKeyValue("Radius",untyped value);
    }
    
    /**
		Life (seconds 0 = infinite)

		Amount of time before the beam dies. Setting to zero will make the beam stay forever.
	**/
    public var life(get,set):String;

    @:noCompletion
    public extern inline function get_life():String {
        return untyped this.GetKeyValues().life;
    }
    
    @:noCompletion
    public extern inline function set_life(value:String):String {
        return untyped this.SetKeyValue("life",untyped value);
    }
    
    /**
		Width of beam

		Pixel width of the beam.
	**/
    public var BoltWidth(get,set):Float;

    @:noCompletion
    public extern inline function get_BoltWidth():Float {
        return untyped this.GetKeyValues().BoltWidth;
    }
    
    @:noCompletion
    public extern inline function set_BoltWidth(value:Float):Float {
        return untyped this.SetKeyValue("BoltWidth",untyped value);
    }
    
    /**
		Amount of noise (0-255)

		The amount of noise in the beam. 0 is a perfectly straight beam.
	**/
    public var NoiseAmplitude(get,set):Float;

    @:noCompletion
    public extern inline function get_NoiseAmplitude():Float {
        return untyped this.GetKeyValues().NoiseAmplitude;
    }
    
    @:noCompletion
    public extern inline function set_NoiseAmplitude(value:Float):Float {
        return untyped this.SetKeyValue("NoiseAmplitude",untyped value);
    }
    
    /**
		Sprite Name

		The material used to draw the beam.
	**/
    public var texture(get,set):String;

    @:noCompletion
    public extern inline function get_texture():String {
        return untyped this.GetKeyValues().texture;
    }
    
    @:noCompletion
    public extern inline function set_texture(value:String):String {
        return untyped this.SetKeyValue("texture",untyped value);
    }
    
    /**
		Texture Scroll Rate (0-100)

		Rate at which the beam texture should scroll along the beam.
	**/
    public var TextureScroll(get,set):Int;

    @:noCompletion
    public extern inline function get_TextureScroll():Int {
        return untyped this.GetKeyValues().TextureScroll;
    }
    
    @:noCompletion
    public extern inline function set_TextureScroll(value:Int):Int {
        return untyped this.SetKeyValue("TextureScroll",untyped value);
    }
    
    /**
		Frames per 10 seconds

		Framerate at which the beam texture should animate, if it has multiple frames.
	**/
    public var framerate(get,set):Int;

    @:noCompletion
    public extern inline function get_framerate():Int {
        return untyped this.GetKeyValues().framerate;
    }
    
    @:noCompletion
    public extern inline function set_framerate(value:Int):Int {
        return untyped this.SetKeyValue("framerate",untyped value);
    }
    
    /**
		Starting Frame

		The frame to start the beam texture on.
	**/
    public var framestart(get,set):Int;

    @:noCompletion
    public extern inline function get_framestart():Int {
        return untyped this.GetKeyValues().framestart;
    }
    
    @:noCompletion
    public extern inline function set_framestart(value:Int):Int {
        return untyped this.SetKeyValue("framestart",untyped value);
    }
    
    /**
		Strike again time (secs)

		Refire time between random strikes of the beam. Only used if the 'Random Strike' spawnflag is set.
	**/
    public var StrikeTime(get,set):String;

    @:noCompletion
    public extern inline function get_StrikeTime():String {
        return untyped this.GetKeyValues().StrikeTime;
    }
    
    @:noCompletion
    public extern inline function set_StrikeTime(value:String):String {
        return untyped this.SetKeyValue("StrikeTime",untyped value);
    }
    
    /**
		Damage / second

		How much damage this beam does per second to things it hits when it is continually on, or instantaneously if it strikes. For continuous damage, the value should be greater than 10 or it may not work.
	**/
    public var damage(get,set):String;

    @:noCompletion
    public extern inline function get_damage():String {
        return untyped this.GetKeyValues().damage;
    }
    
    @:noCompletion
    public extern inline function set_damage(value:String):String {
        return untyped this.SetKeyValue("damage",untyped value);
    }
    
    /**
		Start Entity

		Entity that the beam starts at.
	**/
    public var LightningStart(get,set):String;

    @:noCompletion
    public extern inline function get_LightningStart():String {
        return untyped this.GetKeyValues().LightningStart;
    }
    
    @:noCompletion
    public extern inline function set_LightningStart(value:String):String {
        return untyped this.SetKeyValue("LightningStart",untyped value);
    }
    
    /**
		Ending Entity

		Entity that the beam ends at.
	**/
    public var LightningEnd(get,set):String;

    @:noCompletion
    public extern inline function get_LightningEnd():String {
        return untyped this.GetKeyValues().LightningEnd;
    }
    
    @:noCompletion
    public extern inline function set_LightningEnd(value:String):String {
        return untyped this.SetKeyValue("LightningEnd",untyped value);
    }
    
    /**
		Decal Name

		Decal to be applied at the end of the beam
	**/
    public var decalname(get,set):String;

    @:noCompletion
    public extern inline function get_decalname():String {
        return untyped this.GetKeyValues().decalname;
    }
    
    @:noCompletion
    public extern inline function set_decalname(value:String):String {
        return untyped this.SetKeyValue("decalname",untyped value);
    }
    
    /**
		HDR color scale.

		float value to multiply sprite color by when running in HDR mode.
	**/
    public var HDRColorScale(get,set):Float;

    @:noCompletion
    public extern inline function get_HDRColorScale():Float {
        return untyped this.GetKeyValues().HDRColorScale;
    }
    
    @:noCompletion
    public extern inline function set_HDRColorScale(value:Float):Float {
        return untyped this.SetKeyValue("HDRColorScale",untyped value);
    }
    
    /**
		Touch Type (tripwire)

		If you want the beam to fire an output when touched by entities, choose the entity type here.
	**/
    public var TouchType(get,set):Env_beamTouchTypeChoices;

    @:noCompletion
    public extern inline function get_TouchType():Env_beamTouchTypeChoices {
        return untyped this.GetKeyValues().TouchType;
    }
    
    @:noCompletion
    public extern inline function set_TouchType(value:Env_beamTouchTypeChoices):Env_beamTouchTypeChoices {
        return untyped this.SetKeyValue("TouchType",untyped value);
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
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_beam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_beam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_beam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_beam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an entity touches the beam. Only fired if the entity passes the 'Touch Type' choice.
	**/
    public extern inline function OutputOnTouchedByEntity(callback:Callback<{activator:Env_beam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTouchedByEntity",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_beamSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_beamSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_beamSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_beam");
    }
}

enum abstract Env_beamrenderfxChoices(Int) to Int {
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
enum abstract Env_beamgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_beamTouchTypeChoices(Int) to Int {
	var NOT_A_TRIPWIRE = 0;
	var PLAYER_ONLY = 1;
	var NPC_ONLY = 2;
	var PLAYER_OR_NPC = 3;
	var PLAYER_OR_NPC_OR_PHYSPROP = 4;
}


enum abstract Env_beamSpawnFlags(Int) to Int {
	var START_ON = 1;
	var TOGGLE = 2;
	var RANDOM_STRIKE = 4;
	var RING = 8;
	var STARTSPARKS = 16;
	var ENDSPARKS = 32;
	var DECAL_END = 64;
	var SHADE_START = 128;
	var SHADE_END = 256;
	var TAPER_OUT = 512;
}

#end
