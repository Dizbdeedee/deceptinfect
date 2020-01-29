package gmod.engine_ents;
#if server
/**
	A brush entity that's designed to be used for rotating wheels, where the player can rotate them to arbitrary positions before stopping.
**/
@:forward
abstract Momentary_rot_button(Entity) to Entity {
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
		Lock the button, preventing it from functioning.
	**/
    public extern inline function FireLock(delay:Float) {
        untyped this.Fire("Lock",untyped null,delay);
    }
    
    /**
		Unlock the button, allowing it to function.
	**/
    public extern inline function FireUnlock(delay:Float) {
        untyped this.Fire("Unlock",untyped null,delay);
    }
    
    /**
		Move to a position. The parameter must be a value between 0 and 1, where 0 is the unrotated position and 1 is the rotated position + 'Distance'.
	**/
    public extern inline function FireSetPosition(param:String,delay:Float) {
        untyped this.Fire("SetPosition",untyped param,delay);
    }
    
    /**
		Immediately teleport to a position. The parameter must be a value between 0 and 1, where 0 is the unrotated position and 1 is the rotated position + 'Distance'.
	**/
    public extern inline function FireSetPositionImmediately(param:String,delay:Float) {
        untyped this.Fire("SetPositionImmediately",untyped param,delay);
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
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Momentary_rot_buttongmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Momentary_rot_buttongmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Momentary_rot_buttongmod_allowphysgunChoices):Momentary_rot_buttongmod_allowphysgunChoices {
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
    public var rendermode(get,set):Momentary_rot_buttonrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Momentary_rot_buttonrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Momentary_rot_buttonrendermodeChoices):Momentary_rot_buttonrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Momentary_rot_buttondisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Momentary_rot_buttondisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Momentary_rot_buttondisablereceiveshadowsChoices):Momentary_rot_buttondisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Momentary_rot_buttonrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Momentary_rot_buttonrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Momentary_rot_buttonrenderfxChoices):Momentary_rot_buttonrenderfxChoices {
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
		Speed (deg/sec)

		The amount, in degrees, that the wheel turns per second.
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
		Master (Obsolete)

		Legacy support: The name of a master entity. If the master hasn't been activated, this button cannot be used.
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
		Sounds
	**/
    public var sounds(get,set):Momentary_rot_buttonsoundsChoices;

    @:noCompletion
    public extern inline function get_sounds():Momentary_rot_buttonsoundsChoices {
        return untyped this.GetKeyValues().sounds;
    }
    
    @:noCompletion
    public extern inline function set_sounds(value:Momentary_rot_buttonsoundsChoices):Momentary_rot_buttonsoundsChoices {
        return untyped this.SetKeyValue("sounds",untyped value);
    }
    
    /**
		Distance

		The maximum amount, in degrees, that the wheel is allowed to rotate.
	**/
    public var distance(get,set):Int;

    @:noCompletion
    public extern inline function get_distance():Int {
        return untyped this.GetKeyValues().distance;
    }
    
    @:noCompletion
    public extern inline function set_distance(value:Int):Int {
        return untyped this.SetKeyValue("distance",untyped value);
    }
    
    /**
		Auto-return speed

		If the 'Toggle' spawnflag is not set, the speed at which the wheel auto-returns when left alone, in degrees per second.
	**/
    public var returnspeed(get,set):Int;

    @:noCompletion
    public extern inline function get_returnspeed():Int {
        return untyped this.GetKeyValues().returnspeed;
    }
    
    @:noCompletion
    public extern inline function set_returnspeed(value:Int):Int {
        return untyped this.SetKeyValue("returnspeed",untyped value);
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
		Start Position

		Postion when spawned. The value is a range between 0.0 and 1.0, where 0 is the unrotated position and 1 is the rotated position + 'Distance'.
	**/
    public var startposition(get,set):Float;

    @:noCompletion
    public extern inline function get_startposition():Float {
        return untyped this.GetKeyValues().startposition;
    }
    
    @:noCompletion
    public extern inline function set_startposition(value:Float):Float {
        return untyped this.SetKeyValue("startposition",untyped value);
    }
    
    /**
		Start Direction
	**/
    public var startdirection(get,set):Momentary_rot_buttonstartdirectionChoices;

    @:noCompletion
    public extern inline function get_startdirection():Momentary_rot_buttonstartdirectionChoices {
        return untyped this.GetKeyValues().startdirection;
    }
    
    @:noCompletion
    public extern inline function set_startdirection(value:Momentary_rot_buttonstartdirectionChoices):Momentary_rot_buttonstartdirectionChoices {
        return untyped this.SetKeyValue("startdirection",untyped value);
    }
    
    /**
		Solid BSP
	**/
    public var solidbsp(get,set):Momentary_rot_buttonsolidbspChoices;

    @:noCompletion
    public extern inline function get_solidbsp():Momentary_rot_buttonsolidbspChoices {
        return untyped this.GetKeyValues().solidbsp;
    }
    
    @:noCompletion
    public extern inline function set_solidbsp(value:Momentary_rot_buttonsolidbspChoices):Momentary_rot_buttonsolidbspChoices {
        return untyped this.SetKeyValue("solidbsp",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired whenever the button moves. The output is the position of button from 0 to 1, where 0 is the unrotated position and 1 is the rotated position + 'Distance'.
	**/
    public extern inline function OutputPosition(callback:Callback<{activator:Momentary_rot_button,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"Position",callback);
    }
    
    /**
		Fired when the button is first pressed.
	**/
    public extern inline function OutputOnPressed(callback:Callback<{activator:Momentary_rot_button,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPressed",callback);
    }
    
    /**
		Fired when the button is first released from being pressed.
	**/
    public extern inline function OutputOnUnpressed(callback:Callback<{activator:Momentary_rot_button,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUnpressed",callback);
    }
    
    /**
		Fired when the button has reached position 1, the rotated position + 'Distance'.
	**/
    public extern inline function OutputOnFullyClosed(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyClosed",callback);
    }
    
    /**
		Fired when the button has reached position 0, the unrotated starting position.
	**/
    public extern inline function OutputOnFullyOpen(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyOpen",callback);
    }
    
    /**
		Fired whenever the button reaches a goal position: i.e. when it becomes open, becomes closed, or reaches the point specified by a 'SetPosition' input.
	**/
    public extern inline function OutputOnReachedPosition(callback:Callback<{activator:Momentary_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnReachedPosition",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Momentary_rot_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Momentary_rot_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Momentary_rot_buttonSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("momentary_rot_button");
    }
}

enum abstract Momentary_rot_buttonstartdirectionChoices(Int) to Int {
	var FORWARD = -1;
	var BACKWARD = 1;
}
enum abstract Momentary_rot_buttonsoundsChoices(Int) to Int {
	var NONE = 0;
	var BIG_ZAP__WARMUP = 1;
	var ACCESS_DENIED = 2;
	var ACCESS_GRANTED = 3;
	var QUICK_COMBOLOCK = 4;
	var POWER_DEADBOLT_1 = 5;
	var POWER_DEADBOLT_2 = 6;
	var PLUNGER = 7;
	var SMALL_ZAP = 8;
	var KEYCARD_SOUND = 9;
	var SQUEAKY = 21;
	var SQUEAKY_PNEUMATIC = 22;
	var RATCHET_GROAN = 23;
	var CLEAN_RATCHET = 24;
	var GAS_CLUNK = 25;
}
enum abstract Momentary_rot_buttonsolidbspChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Momentary_rot_buttonrendermodeChoices(Int) to Int {
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
enum abstract Momentary_rot_buttonrenderfxChoices(Int) to Int {
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
enum abstract Momentary_rot_buttongmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Momentary_rot_buttondisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Momentary_rot_buttonSpawnFlags(Int) to Int {
	var NOT_SOLID = 1;
	var TOGGLE_DISABLE_AUTO_RETURN = 32;
	var X_AXIS = 64;
	var Y_AXIS = 128;
	var USE_ACTIVATES = 1024;
	var STARTS_LOCKED = 2048;
	var JIGGLE_WHEN_USED_WHILE_LOCKED = 8192;
	var NON_SOLID = 16384;
}

#end
