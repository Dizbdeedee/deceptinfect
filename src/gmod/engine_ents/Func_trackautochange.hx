package gmod.engine_ents;
#if server
/**
	An entity that works as a rotating/moving platform that will carry a train to a new track. It must be larger in X-Y planar area than the train, since it must contain the train within these dimensions in order to operate when the train is near it.
**/
@:forward
abstract Func_trackautochange(Entity) to Entity {
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
		Trigger the track change.
	**/
    public extern inline function FireTrigger(delay:Float) {
        untyped this.Fire("Trigger",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_trackautochangegmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_trackautochangegmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_trackautochangegmod_allowphysgunChoices):Func_trackautochangegmod_allowphysgunChoices {
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
		Move Sound

		The sound played whenever the platform starts moving.
	**/
    public var movesnd(get,set):Func_trackautochangemovesndChoices;

    @:noCompletion
    public extern inline function get_movesnd():Func_trackautochangemovesndChoices {
        return untyped this.GetKeyValues().movesnd;
    }
    
    @:noCompletion
    public extern inline function set_movesnd(value:Func_trackautochangemovesndChoices):Func_trackautochangemovesndChoices {
        return untyped this.SetKeyValue("movesnd",untyped value);
    }
    
    /**
		Stop Sound

		The sound played when the platform stops moving.
	**/
    public var stopsnd(get,set):Func_trackautochangestopsndChoices;

    @:noCompletion
    public extern inline function get_stopsnd():Func_trackautochangestopsndChoices {
        return untyped this.GetKeyValues().stopsnd;
    }
    
    @:noCompletion
    public extern inline function set_stopsnd(value:Func_trackautochangestopsndChoices):Func_trackautochangestopsndChoices {
        return untyped this.SetKeyValue("stopsnd",untyped value);
    }
    
    /**
		Sound Volume 0.0 - 1.0
	**/
    public var volume(get,set):String;

    @:noCompletion
    public extern inline function get_volume():String {
        return untyped this.GetKeyValues().volume;
    }
    
    @:noCompletion
    public extern inline function set_volume(value:String):String {
        return untyped this.SetKeyValue("volume",untyped value);
    }
    
    /**
		Render Mode

		Used to set a non-standard rendering mode on this entity. See also 'FX Amount' and 'FX Color'.
	**/
    public var rendermode(get,set):Func_trackautochangerendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_trackautochangerendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_trackautochangerendermodeChoices):Func_trackautochangerendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_trackautochangedisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_trackautochangedisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_trackautochangedisablereceiveshadowsChoices):Func_trackautochangedisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_trackautochangerenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_trackautochangerenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_trackautochangerenderfxChoices):Func_trackautochangerenderfxChoices {
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
		Travel Altitude

		The vertical height above the track that the train moves. Negative values moves the train below.
	**/
    public var height(get,set):Int;

    @:noCompletion
    public extern inline function get_height():Int {
        return untyped this.GetKeyValues().height;
    }
    
    @:noCompletion
    public extern inline function set_height(value:Int):Int {
        return untyped this.SetKeyValue("height",untyped value);
    }
    
    /**
		Spin amount

		The amount this platform should rotate as it moves, in degrees.
	**/
    public var rotation(get,set):Int;

    @:noCompletion
    public extern inline function get_rotation():Int {
        return untyped this.GetKeyValues().rotation;
    }
    
    @:noCompletion
    public extern inline function set_rotation(value:Int):Int {
        return untyped this.SetKeyValue("rotation",untyped value);
    }
    
    /**
		Train to Switch
	**/
    public var train(get,set):String;

    @:noCompletion
    public extern inline function get_train():String {
        return untyped this.GetKeyValues().train;
    }
    
    @:noCompletion
    public extern inline function set_train(value:String):String {
        return untyped this.SetKeyValue("train",untyped value);
    }
    
    /**
		Top Track
	**/
    public var toptrack(get,set):String;

    @:noCompletion
    public extern inline function get_toptrack():String {
        return untyped this.GetKeyValues().toptrack;
    }
    
    @:noCompletion
    public extern inline function set_toptrack(value:String):String {
        return untyped this.SetKeyValue("toptrack",untyped value);
    }
    
    /**
		Bottom Track
	**/
    public var bottomtrack(get,set):String;

    @:noCompletion
    public extern inline function get_bottomtrack():String {
        return untyped this.GetKeyValues().bottomtrack;
    }
    
    @:noCompletion
    public extern inline function set_bottomtrack(value:String):String {
        return untyped this.SetKeyValue("bottomtrack",untyped value);
    }
    
    /**
		Move/Rotate Speed
	**/
    public var speed(get,set):Int;

    @:noCompletion
    public extern inline function get_speed():Int {
        return untyped this.GetKeyValues().speed;
    }
    
    @:noCompletion
    public extern inline function set_speed(value:Int):Int {
        return untyped this.SetKeyValue("speed",untyped value);
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
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_trackautochange}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_trackautochange}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_trackautochange}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_trackautochange}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_trackautochangeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_trackautochangeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_trackautochangeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_trackautochange");
    }
}

enum abstract Func_trackautochangestopsndChoices(Int) to Int {
	var NO_SOUND = 0;
	var BIG_ELEV_STOP1 = 1;
	var BIG_ELEV_STOP2 = 2;
	var FREIGHT_ELEV_STOP = 3;
	var HEAVY_ELEV_STOP = 4;
	var RACK_STOP = 5;
	var RAIL_STOP = 6;
	var SQUEEK_STOP = 7;
	var QUICK_STOP = 8;
}
enum abstract Func_trackautochangerendermodeChoices(Int) to Int {
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
enum abstract Func_trackautochangerenderfxChoices(Int) to Int {
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
enum abstract Func_trackautochangemovesndChoices(Int) to Int {
	var NO_SOUND = 0;
	var BIG_ELEV_1 = 1;
	var BIG_ELEV_2 = 2;
	var TECH_ELEV_1 = 3;
	var TECH_ELEV_2 = 4;
	var TECH_ELEV_3 = 5;
	var FREIGHT_ELEV_1 = 6;
	var FREIGHT_ELEV_2 = 7;
	var HEAVY_ELEV = 8;
	var RACK_ELEV = 9;
	var RAIL_ELEV = 10;
	var SQUEEK_ELEV = 11;
	var ODD_ELEV_1 = 12;
	var ODD_ELEV_2 = 13;
}
enum abstract Func_trackautochangegmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_trackautochangedisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_trackautochangeSpawnFlags(Int) to Int {
	var AUTO_ACTIVATE_TRAIN = 1;
	var RELINK_TRACK = 2;
	var START_AT_BOTTOM = 8;
	var ROTATE_ONLY = 16;
	var X_AXIS = 64;
	var Y_AXIS = 128;
}

#end
