package gmod.engine_ents;
#if server
/**
	Legacy support. Use func_brush instead.
**/
@:forward
abstract Func_illusionary(Entity) to Entity {
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
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_illusionarygmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_illusionarygmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_illusionarygmod_allowphysgunChoices):Func_illusionarygmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_illusionaryrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_illusionaryrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_illusionaryrendermodeChoices):Func_illusionaryrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_illusionarydisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_illusionarydisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_illusionarydisablereceiveshadowsChoices):Func_illusionarydisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_illusionaryrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_illusionaryrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_illusionaryrenderfxChoices):Func_illusionaryrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_illusionarydisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_illusionarydisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_illusionarydisableshadowsChoices):Func_illusionarydisableshadowsChoices {
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_illusionary}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_illusionary}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_illusionary}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_illusionary}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_illusionary");
    }
}

enum abstract Func_illusionaryrendermodeChoices(Int) to Int {
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
enum abstract Func_illusionaryrenderfxChoices(Int) to Int {
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
enum abstract Func_illusionarygmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_illusionarydisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_illusionarydisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
