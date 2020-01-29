package gmod.engine_ents;
#if server
/**
	A brush entity that's designed to be used for a player-useable button. When used by the player, it moves to a pressed position.
**/
@:forward
abstract Func_button(Entity) to Entity {
    //Inputs
    
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
		Activate the button as if it was pressed.
	**/
    public extern inline function FirePress(delay:Float) {
        untyped this.Fire("Press",untyped null,delay);
    }
    
    /**
		Activate the button as if it was pressed, sending it to the bottom position.
	**/
    public extern inline function FirePressIn(delay:Float) {
        untyped this.Fire("PressIn",untyped null,delay);
    }
    
    /**
		Unpress the button, sending it to the top position.
	**/
    public extern inline function FirePressOut(delay:Float) {
        untyped this.Fire("PressOut",untyped null,delay);
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
    public var gmod_allowphysgun(get,set):Func_buttongmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_buttongmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_buttongmod_allowphysgunChoices):Func_buttongmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_buttonrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_buttonrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_buttonrendermodeChoices):Func_buttonrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_buttondisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_buttondisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_buttondisablereceiveshadowsChoices):Func_buttondisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_buttonrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_buttonrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_buttonrenderfxChoices):Func_buttonrenderfxChoices {
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
		Move Direction (Pitch Yaw Roll)

		Specifies the direction of motion to move when the button is used.
	**/
    public var movedir(get,set):Angle;

    @:noCompletion
    public extern inline function get_movedir():Angle {
        return untyped this.GetKeyValues().movedir;
    }
    
    @:noCompletion
    public extern inline function set_movedir(value:Angle):Angle {
        return untyped this.SetKeyValue("movedir",untyped value);
    }
    
    /**
		Speed

		The speed that the button moves, in inches per second.
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
		Health (Obsolete)

		Legacy method of specifying whether or not the button can be shot to activate it. Use the 'Damage Activates' spawnflag instead.
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
		Lip

		The amount, in inches, of the button to leave sticking out of the wall it recedes into when pressed. Negative values make the button recede even further into the wall.
	**/
    public var lip(get,set):Int;

    @:noCompletion
    public extern inline function get_lip():Int {
        return untyped this.GetKeyValues().lip;
    }
    
    @:noCompletion
    public extern inline function set_lip(value:Int):Int {
        return untyped this.SetKeyValue("lip",untyped value);
    }
    
    /**
		Master (Obsolete)

		Legacy support: The name of a master entity. If the master hasn't been activated, this button cannot be pressed.
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
    public var sounds(get,set):Func_buttonsoundsChoices;

    @:noCompletion
    public extern inline function get_sounds():Func_buttonsoundsChoices {
        return untyped this.GetKeyValues().sounds;
    }
    
    @:noCompletion
    public extern inline function set_sounds(value:Func_buttonsoundsChoices):Func_buttonsoundsChoices {
        return untyped this.SetKeyValue("sounds",untyped value);
    }
    
    /**
		Delay Before Reset (-1 stay)

		Amount of time, in seconds, after the button has been pressed before it returns to the starting position. Once it has returned, it can be used again. If the value is set to -1, the button never returns.
	**/
    public var wait(get,set):Int;

    @:noCompletion
    public extern inline function get_wait():Int {
        return untyped this.GetKeyValues().wait;
    }
    
    @:noCompletion
    public extern inline function set_wait(value:Int):Int {
        return untyped this.SetKeyValue("wait",untyped value);
    }
    
    /**
		Locked Sound

		Sound played when the player tries to use the button, and fails because it's locked.
	**/
    public var locked_sound(get,set):Func_buttonlocked_soundChoices;

    @:noCompletion
    public extern inline function get_locked_sound():Func_buttonlocked_soundChoices {
        return untyped this.GetKeyValues().locked_sound;
    }
    
    @:noCompletion
    public extern inline function set_locked_sound(value:Func_buttonlocked_soundChoices):Func_buttonlocked_soundChoices {
        return untyped this.SetKeyValue("locked_sound",untyped value);
    }
    
    /**
		Unlocked Sound

		Sound played when the button is unlocked.
	**/
    public var unlocked_sound(get,set):Func_buttonunlocked_soundChoices;

    @:noCompletion
    public extern inline function get_unlocked_sound():Func_buttonunlocked_soundChoices {
        return untyped this.GetKeyValues().unlocked_sound;
    }
    
    @:noCompletion
    public extern inline function set_unlocked_sound(value:Func_buttonunlocked_soundChoices):Func_buttonunlocked_soundChoices {
        return untyped this.SetKeyValue("unlocked_sound",untyped value);
    }
    
    /**
		Locked Sentence

		A sentence played when the player tries to use the button, and fails because it's locked.
	**/
    public var locked_sentence(get,set):Func_buttonlocked_sentenceChoices;

    @:noCompletion
    public extern inline function get_locked_sentence():Func_buttonlocked_sentenceChoices {
        return untyped this.GetKeyValues().locked_sentence;
    }
    
    @:noCompletion
    public extern inline function set_locked_sentence(value:Func_buttonlocked_sentenceChoices):Func_buttonlocked_sentenceChoices {
        return untyped this.SetKeyValue("locked_sentence",untyped value);
    }
    
    /**
		Unlocked Sentence

		A sentence played when the button is unlocked.
	**/
    public var unlocked_sentence(get,set):Func_buttonunlocked_sentenceChoices;

    @:noCompletion
    public extern inline function get_unlocked_sentence():Func_buttonunlocked_sentenceChoices {
        return untyped this.GetKeyValues().unlocked_sentence;
    }
    
    @:noCompletion
    public extern inline function set_unlocked_sentence(value:Func_buttonunlocked_sentenceChoices):Func_buttonunlocked_sentenceChoices {
        return untyped this.SetKeyValue("unlocked_sentence",untyped value);
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
		Fired when the button is damaged.
	**/
    public extern inline function OutputOnDamaged(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDamaged",callback);
    }
    
    /**
		Fired when the button is pressed.
	**/
    public extern inline function OutputOnPressed(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPressed",callback);
    }
    
    /**
		Fired when the button is used while locked.
	**/
    public extern inline function OutputOnUseLocked(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUseLocked",callback);
    }
    
    /**
		Fired when the button reaches the in/pressed position.
	**/
    public extern inline function OutputOnIn(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIn",callback);
    }
    
    /**
		Fired when the button reaches the out/released position.
	**/
    public extern inline function OutputOnOut(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOut",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_buttonSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_button");
    }
}

enum abstract Func_buttonunlocked_soundChoices(Int) to Int {
	var NONE = 0;
	var BIG_ZAP__WARMUP = 1;
	var ACCESS_GRANTED = 3;
	var QUICK_COMBOLOCK = 4;
	var POWER_DEADBOLT_1 = 5;
	var POWER_DEADBOLT_2 = 6;
	var PLUNGER = 7;
	var SMALL_ZAP = 8;
	var KEYCARD_SOUND = 9;
	var BUZZ = 10;
	var LATCH_UNLOCKED = 13;
	var LIGHTSWITCH = 14;
}
enum abstract Func_buttonunlocked_sentenceChoices(Int) to Int {
	var NONE = 0;
	var GEN_ACCESS_GRANTED = 1;
	var SECURITY_DISENGAGED = 2;
	var BLAST_DOOR = 3;
	var FIRE_DOOR = 4;
	var CHEMICAL_DOOR = 5;
	var RADIATION_DOOR = 6;
	var GEN_CONTAINMENT = 7;
	var MAINTENANCE_AREA = 8;
}
enum abstract Func_buttonsoundsChoices(Int) to Int {
	var NONE_SILENT = 0;
	var BIG_ZAP__WARMUP = 1;
	var ACCESS_DENIED = 2;
	var ACCESS_GRANTED = 3;
	var QUICK_COMBOLOCK = 4;
	var POWER_DEADBOLT_1 = 5;
	var POWER_DEADBOLT_2 = 6;
	var PLUNGER = 7;
	var SMALL_ZAP = 8;
	var KEYCARD_SOUND = 9;
	var BUZZ = 10;
	var BUZZ_OFF = 11;
	var LATCH_LOCKED = 12;
	var LATCH_UNLOCKED = 13;
	var LIGHTSWITCH = 14;
	var SMALL_BLEEK = 15;
	var SMALL_DENY = 16;
	var SMALL_DOOP = 17;
	var SMALL_TECH_DENY = 18;
	var CLICK_AND_COMBINE_SCREEN_FUZZ = 19;
	var ROOMY_BEEP = 20;
	var LEVER_OR_WHEEL_TURN__MOVE_SQEEK = 21;
	var LEVER_OR_WHEEL_LATCH__RELEASE_GAS = 22;
	var LEVER_OR_WHEEL_RATCHET__SQEEK = 23;
	var LEVER_OR_WHEEL_LARGE_RATCHET = 24;
	var LEVER_OR_WHEEL_CLANKY__GAS_RELEASE = 25;
	var LEVER_OR_WHEEL_LATCH__LARGE_METAL_THUD = 26;
	var LEVER_OR_WHEEL_SMALLER_RATCHET = 27;
	var LEVER_OR_WHEEL_SMALLER_LEVER_MOVE = 28;
	var SHOCK_BUZZ = 31;
	var CLICKBEEP = 32;
	var TECH_BLIP = 33;
	var CLICKBEEPBEEP_OPEN = 34;
	var SMALL_HIGH_BLIP = 35;
	var SMALL_TECH_FUZZ_BLIP = 36;
	var SMALL_CLICK_BLEEP_CHANGE_TO_LIGHTSWITCH = 37;
	var COMBINE_DOOR_LOCK__LOCKED = 40;
	var COMBINE_BLIP_GROWL = 41;
	var COMBINE_SQUICK_GROWL = 42;
	var COMBINE_WHINE_PURR = 43;
	var COMBINE_CLICK_TALK = 44;
	var COMBINE_CLICK_GROWL_FIZZ = 45;
	var COMBINE_CLICK_FIZZ_DENY = 46;
	var COMBINE_CLICK_TALKER = 47;
}
enum abstract Func_buttonrendermodeChoices(Int) to Int {
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
enum abstract Func_buttonrenderfxChoices(Int) to Int {
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
enum abstract Func_buttonlocked_soundChoices(Int) to Int {
	var NONE = 0;
	var ACCESS_DENIED = 2;
	var SMALL_ZAP = 8;
	var BUZZ = 10;
	var BUZZ_OFF = 11;
	var LATCH_LOCKED = 12;
}
enum abstract Func_buttonlocked_sentenceChoices(Int) to Int {
	var NONE = 0;
	var GEN_ACCESS_DENIED = 1;
	var SECURITY_LOCKOUT = 2;
	var BLAST_DOOR = 3;
	var FIRE_DOOR = 4;
	var CHEMICAL_DOOR = 5;
	var RADIATION_DOOR = 6;
	var GEN_CONTAINMENT = 7;
	var MAINTENANCE_DOOR = 8;
	var BROKEN_SHUT_DOOR = 9;
}
enum abstract Func_buttongmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_buttondisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_buttonSpawnFlags(Int) to Int {
	var DONT_MOVE = 1;
	var TOGGLE = 32;
	var TOUCH_ACTIVATES = 256;
	var DAMAGE_ACTIVATES = 512;
	var USE_ACTIVATES = 1024;
	var STARTS_LOCKED = 2048;
	var SPARKS = 4096;
	var NON_SOLID = 16384;
}

#end
