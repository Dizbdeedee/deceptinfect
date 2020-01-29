package gmod.engine_ents;
#if server
/**
	An entity that creates a laser beam between itself and a given target.
**/
@:forward
abstract Env_laser(Entity) to Entity {
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
		Turns the laser on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turns the laser off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggles the laser between on and off.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Env_lasergmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Env_lasergmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Env_lasergmod_allowphysgunChoices):Env_lasergmod_allowphysgunChoices {
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
    public var renderfx(get,set):Env_laserrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Env_laserrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Env_laserrenderfxChoices):Env_laserrenderfxChoices {
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
		Target of Laser

		Name of entity, or entities, to strike at. The target is randomly chosen if there are multiple entities matching the given name.
	**/
    public var LaserTarget(get,set):String;

    @:noCompletion
    public extern inline function get_LaserTarget():String {
        return untyped this.GetKeyValues().LaserTarget;
    }
    
    @:noCompletion
    public extern inline function set_LaserTarget(value:String):String {
        return untyped this.SetKeyValue("LaserTarget",untyped value);
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
		Width of Beam

		The width of the laser beam, in pixels.
	**/
    public var width(get,set):Float;

    @:noCompletion
    public extern inline function get_width():Float {
        return untyped this.GetKeyValues().width;
    }
    
    @:noCompletion
    public extern inline function set_width(value:Float):Float {
        return untyped this.SetKeyValue("width",untyped value);
    }
    
    /**
		Amount of noise (0-255)

		The amount of noise in the beam. 0 is a perfectly straight beam.
	**/
    public var NoiseAmplitude(get,set):Int;

    @:noCompletion
    public extern inline function get_NoiseAmplitude():Int {
        return untyped this.GetKeyValues().NoiseAmplitude;
    }
    
    @:noCompletion
    public extern inline function set_NoiseAmplitude(value:Int):Int {
        return untyped this.SetKeyValue("NoiseAmplitude",untyped value);
    }
    
    /**
		Sprite Name

		The material used to draw the laser beam.
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
		End Sprite

		If specified, this sprite will be drawn at the end of the laser beam.
	**/
    public var EndSprite(get,set):String;

    @:noCompletion
    public extern inline function get_EndSprite():String {
        return untyped this.GetKeyValues().EndSprite;
    }
    
    @:noCompletion
    public extern inline function set_EndSprite(value:String):String {
        return untyped this.SetKeyValue("EndSprite",untyped value);
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
		Damage / second

		How much damage this laser does. per second. to things it hits.
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
		Dissolve Type
	**/
    public var dissolvetype(get,set):Env_laserdissolvetypeChoices;

    @:noCompletion
    public extern inline function get_dissolvetype():Env_laserdissolvetypeChoices {
        return untyped this.GetKeyValues().dissolvetype;
    }
    
    @:noCompletion
    public extern inline function set_dissolvetype(value:Env_laserdissolvetypeChoices):Env_laserdissolvetypeChoices {
        return untyped this.SetKeyValue("dissolvetype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_laser}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_laser}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_laser}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_laser}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_laserSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_laserSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_laserSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_laser");
    }
}

enum abstract Env_laserrenderfxChoices(Int) to Int {
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
enum abstract Env_lasergmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_laserdissolvetypeChoices(Int) to Int {
	var NONE = -1;
	var ENERGY = 0;
	var HEAVY_ELECTRICAL = 1;
	var LIGHT_ELECTRICAL = 2;
}


enum abstract Env_laserSpawnFlags(Int) to Int {
	var START_ON = 1;
	var STARTSPARKS = 16;
	var ENDSPARKS = 32;
	var DECAL_END = 64;
}

#end
