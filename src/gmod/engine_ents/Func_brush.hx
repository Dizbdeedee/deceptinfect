package gmod.engine_ents;
#if server
/**
	An brush built entity with various features.
**/
@:forward
abstract Func_brush(Entity) to Entity {
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
    
    /**
		Sets the brush's alpha value.
	**/
    public extern inline function FireAlpha(param:Int,delay:Float) {
        untyped this.Fire("Alpha",untyped param,delay);
    }
    
    /**
		Change the NPC class excluded from collisions
	**/
    public extern inline function FireSetExcluded(param:String,delay:Float) {
        untyped this.Fire("SetExcluded",untyped param,delay);
    }
    
    /**
		Set the state of invversion for NPC class exclusion (0 or 1)
	**/
    public extern inline function FireSetInvert(param:Int,delay:Float) {
        untyped this.Fire("SetInvert",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Func_brushStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Func_brushStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Func_brushStartDisabledChoices):Func_brushStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_brushgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_brushgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_brushgmod_allowphysgunChoices):Func_brushgmod_allowphysgunChoices {
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
		Input Filter

		Used to specify which inputs this entity will accept.
	**/
    public var InputFilter(get,set):Func_brushInputFilterChoices;

    @:noCompletion
    public extern inline function get_InputFilter():Func_brushInputFilterChoices {
        return untyped this.GetKeyValues().InputFilter;
    }
    
    @:noCompletion
    public extern inline function set_InputFilter(value:Func_brushInputFilterChoices):Func_brushInputFilterChoices {
        return untyped this.SetKeyValue("InputFilter",untyped value);
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
    public var rendermode(get,set):Func_brushrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_brushrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_brushrendermodeChoices):Func_brushrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_brushdisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_brushdisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_brushdisablereceiveshadowsChoices):Func_brushdisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_brushrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_brushrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_brushrenderfxChoices):Func_brushrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_brushdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_brushdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_brushdisableshadowsChoices):Func_brushdisableshadowsChoices {
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
		Solidity

		Used to control the solidity/collision of these brushes.
	**/
    public var Solidity(get,set):Func_brushSolidityChoices;

    @:noCompletion
    public extern inline function get_Solidity():Func_brushSolidityChoices {
        return untyped this.GetKeyValues().Solidity;
    }
    
    @:noCompletion
    public extern inline function set_Solidity(value:Func_brushSolidityChoices):Func_brushSolidityChoices {
        return untyped this.SetKeyValue("Solidity",untyped value);
    }
    
    /**
		NPC class excluded from collisions

		If an NPC classname is specified here, NPCs of that type won't collide with these brushes. In Episodic, you may also specify an individual entity's name.
	**/
    public var excludednpc(get,set):String;

    @:noCompletion
    public extern inline function get_excludednpc():String {
        return untyped this.GetKeyValues().excludednpc;
    }
    
    @:noCompletion
    public extern inline function set_excludednpc(value:String):String {
        return untyped this.SetKeyValue("excludednpc",untyped value);
    }
    
    /**
		Invert NPC class exclusion

		If set, then the excluded NPC class will consider this brush solid, and all other NPC classes will consider it non-solid.
	**/
    public var invert_exclusion(get,set):Func_brushinvert_exclusionChoices;

    @:noCompletion
    public extern inline function get_invert_exclusion():Func_brushinvert_exclusionChoices {
        return untyped this.GetKeyValues().invert_exclusion;
    }
    
    @:noCompletion
    public extern inline function set_invert_exclusion(value:Func_brushinvert_exclusionChoices):Func_brushinvert_exclusionChoices {
        return untyped this.SetKeyValue("invert_exclusion",untyped value);
    }
    
    /**
		Solid BSP

		Set this if this brush is in heirarchy with a moving object of some kind, and the player can stand on this brush.
	**/
    public var solidbsp(get,set):Func_brushsolidbspChoices;

    @:noCompletion
    public extern inline function get_solidbsp():Func_brushsolidbspChoices {
        return untyped this.GetKeyValues().solidbsp;
    }
    
    @:noCompletion
    public extern inline function set_solidbsp(value:Func_brushsolidbspChoices):Func_brushsolidbspChoices {
        return untyped this.SetKeyValue("solidbsp",untyped value);
    }
    
    /**
		Shadows

		Set this if this brush casts lightmap shadows.
	**/
    public var vrad_brush_cast_shadows(get,set):Func_brushvrad_brush_cast_shadowsChoices;

    @:noCompletion
    public extern inline function get_vrad_brush_cast_shadows():Func_brushvrad_brush_cast_shadowsChoices {
        return untyped this.GetKeyValues().vrad_brush_cast_shadows;
    }
    
    @:noCompletion
    public extern inline function set_vrad_brush_cast_shadows(value:Func_brushvrad_brush_cast_shadowsChoices):Func_brushvrad_brush_cast_shadowsChoices {
        return untyped this.SetKeyValue("vrad_brush_cast_shadows",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_brush}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_brush}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_brush}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_brush}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_brushSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_brushSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_brushSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_brush");
    }
}

enum abstract Func_brushvrad_brush_cast_shadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushsolidbspChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushrendermodeChoices(Int) to Int {
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
enum abstract Func_brushrenderfxChoices(Int) to Int {
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
enum abstract Func_brushinvert_exclusionChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushdisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_brushSolidityChoices(Int) to Int {
	var TOGGLE = 0;
	var NEVER_SOLID = 1;
	var ALWAYS_SOLID = 2;
}
enum abstract Func_brushInputFilterChoices(Int) to Int {
	var ALLOW_ALL_INPUTS = 0;
	var IGNORE_TOUCHUNTOUCH = 8;
	var IGNORE_USE = 16;
	var IGNORE_ALL = 32;
}


enum abstract Func_brushSpawnFlags(Int) to Int {
	var IGNORE_PLAYER_USE = 2;
}

#end
