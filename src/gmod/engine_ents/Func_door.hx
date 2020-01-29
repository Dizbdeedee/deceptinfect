package gmod.engine_ents;
#if server
/**
	A brush entity for use as a player-useable door.
**/
@:forward
abstract Func_door(Entity) to Entity {
    //Inputs
    
    /**
		Open the door, if it is not fully open.
	**/
    public extern inline function FireOpen(delay:Float) {
        untyped this.Fire("Open",untyped null,delay);
    }
    
    /**
		Close the door, if it is not fully closed.
	**/
    public extern inline function FireClose(delay:Float) {
        untyped this.Fire("Close",untyped null,delay);
    }
    
    /**
		Toggle the door between open and closed.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Lock the door.
	**/
    public extern inline function FireLock(delay:Float) {
        untyped this.Fire("Lock",untyped null,delay);
    }
    
    /**
		Unlock the door.
	**/
    public extern inline function FireUnlock(delay:Float) {
        untyped this.Fire("Unlock",untyped null,delay);
    }
    
    /**
		Set the door speed.
	**/
    public extern inline function FireSetSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetSpeed",untyped param,delay);
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
		Speed

		The speed at which the door moves.
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
		Start Sound

		Sound to play when the door starts moving.
	**/
    public var noise1(get,set):String;

    @:noCompletion
    public extern inline function get_noise1():String {
        return untyped this.GetKeyValues().noise1;
    }
    
    @:noCompletion
    public extern inline function set_noise1(value:String):String {
        return untyped this.SetKeyValue("noise1",untyped value);
    }
    
    /**
		Stop Sound

		Sound to play when the door stops moving.
	**/
    public var noise2(get,set):String;

    @:noCompletion
    public extern inline function get_noise2():String {
        return untyped this.GetKeyValues().noise2;
    }
    
    @:noCompletion
    public extern inline function set_noise2(value:String):String {
        return untyped this.SetKeyValue("noise2",untyped value);
    }
    
    /**
		Start Close Sound

		(Optional) Sound to play when the door starts closing.
	**/
    public var startclosesound(get,set):String;

    @:noCompletion
    public extern inline function get_startclosesound():String {
        return untyped this.GetKeyValues().startclosesound;
    }
    
    @:noCompletion
    public extern inline function set_startclosesound(value:String):String {
        return untyped this.SetKeyValue("startclosesound",untyped value);
    }
    
    /**
		Stop Close Sound

		(Optional) Sound to play when the door stops closing.
	**/
    public var closesound(get,set):String;

    @:noCompletion
    public extern inline function get_closesound():String {
        return untyped this.GetKeyValues().closesound;
    }
    
    @:noCompletion
    public extern inline function set_closesound(value:String):String {
        return untyped this.SetKeyValue("closesound",untyped value);
    }
    
    /**
		Delay Before Reset (-1 stay)

		Amount of time, in seconds, after the door has opened before it closes. Once it has closed, it can be used again. If the value is set to -1, the door never closes itself.
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
		Blocking Damage

		Amount of damage done to entities that block the movement of this door, per frame.
	**/
    public var dmg(get,set):Int;

    @:noCompletion
    public extern inline function get_dmg():Int {
        return untyped this.GetKeyValues().dmg;
    }
    
    @:noCompletion
    public extern inline function set_dmg(value:Int):Int {
        return untyped this.SetKeyValue("dmg",untyped value);
    }
    
    /**
		Force Closed

		If set, this door will close no matter what. Useful for doors that have to close even if the player tries to block them with objects.
	**/
    public var forceclosed(get,set):Func_doorforceclosedChoices;

    @:noCompletion
    public extern inline function get_forceclosed():Func_doorforceclosedChoices {
        return untyped this.GetKeyValues().forceclosed;
    }
    
    @:noCompletion
    public extern inline function set_forceclosed(value:Func_doorforceclosedChoices):Func_doorforceclosedChoices {
        return untyped this.SetKeyValue("forceclosed",untyped value);
    }
    
    /**
		Ignore Debris

		If set this will change the door's collision group to one that ignore collisions with debris objects (note that this is not compatible with the non-solid-to-player spawnflag).
	**/
    public var ignoredebris(get,set):Func_doorignoredebrisChoices;

    @:noCompletion
    public extern inline function get_ignoredebris():Func_doorignoredebrisChoices {
        return untyped this.GetKeyValues().ignoredebris;
    }
    
    @:noCompletion
    public extern inline function set_ignoredebris(value:Func_doorignoredebrisChoices):Func_doorignoredebrisChoices {
        return untyped this.SetKeyValue("ignoredebris",untyped value);
    }
    
    /**
		Message If Triggered
	**/
    public var message(get,set):String;

    @:noCompletion
    public extern inline function get_message():String {
        return untyped this.GetKeyValues().message;
    }
    
    @:noCompletion
    public extern inline function set_message(value:String):String {
        return untyped this.SetKeyValue("message",untyped value);
    }
    
    /**
		Health (shoot open)
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
		Locked Sound

		Sound played when the player tries to use the door, and fails because it's locked.
	**/
    public var locked_sound(get,set):String;

    @:noCompletion
    public extern inline function get_locked_sound():String {
        return untyped this.GetKeyValues().locked_sound;
    }
    
    @:noCompletion
    public extern inline function set_locked_sound(value:String):String {
        return untyped this.SetKeyValue("locked_sound",untyped value);
    }
    
    /**
		Unlocked Sound

		Sound played when the button is door.
	**/
    public var unlocked_sound(get,set):String;

    @:noCompletion
    public extern inline function get_unlocked_sound():String {
        return untyped this.GetKeyValues().unlocked_sound;
    }
    
    @:noCompletion
    public extern inline function set_unlocked_sound(value:String):String {
        return untyped this.SetKeyValue("unlocked_sound",untyped value);
    }
    
    /**
		Spawn Position
	**/
    public var spawnpos(get,set):Func_doorspawnposChoices;

    @:noCompletion
    public extern inline function get_spawnpos():Func_doorspawnposChoices {
        return untyped this.GetKeyValues().spawnpos;
    }
    
    @:noCompletion
    public extern inline function set_spawnpos(value:Func_doorspawnposChoices):Func_doorspawnposChoices {
        return untyped this.SetKeyValue("spawnpos",untyped value);
    }
    
    /**
		Locked Sentence

		A sentence played when the player tries to use the door, and fails because it's locked.
	**/
    public var locked_sentence(get,set):Func_doorlocked_sentenceChoices;

    @:noCompletion
    public extern inline function get_locked_sentence():Func_doorlocked_sentenceChoices {
        return untyped this.GetKeyValues().locked_sentence;
    }
    
    @:noCompletion
    public extern inline function set_locked_sentence(value:Func_doorlocked_sentenceChoices):Func_doorlocked_sentenceChoices {
        return untyped this.SetKeyValue("locked_sentence",untyped value);
    }
    
    /**
		Unlocked Sentence

		A sentence played when the door is unlocked.
	**/
    public var unlocked_sentence(get,set):Func_doorunlocked_sentenceChoices;

    @:noCompletion
    public extern inline function get_unlocked_sentence():Func_doorunlocked_sentenceChoices {
        return untyped this.GetKeyValues().unlocked_sentence;
    }
    
    @:noCompletion
    public extern inline function set_unlocked_sentence(value:Func_doorunlocked_sentenceChoices):Func_doorunlocked_sentenceChoices {
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
    
    /**
		Loop Moving Sound?

		If set to true, the door's 'Start Sound' will be continually looped until the door finishes moving.
	**/
    public var loopmovesound(get,set):Func_doorloopmovesoundChoices;

    @:noCompletion
    public extern inline function get_loopmovesound():Func_doorloopmovesoundChoices {
        return untyped this.GetKeyValues().loopmovesound;
    }
    
    @:noCompletion
    public extern inline function set_loopmovesound(value:Func_doorloopmovesoundChoices):Func_doorloopmovesoundChoices {
        return untyped this.SetKeyValue("loopmovesound",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_doorgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_doorgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_doorgmod_allowphysgunChoices):Func_doorgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_doorrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_doorrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_doorrendermodeChoices):Func_doorrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_doordisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_doordisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_doordisablereceiveshadowsChoices):Func_doordisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_doorrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_doorrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_doorrenderfxChoices):Func_doorrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_doordisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_doordisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_doordisableshadowsChoices):Func_doordisableshadowsChoices {
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
		Move Direction (Pitch Yaw Roll)

		The direction the door will move, when it opens.
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
		Block Filter Name

		Filter to use to determine entities that block the door. ( Half-Life: Source port only )
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
		Fired when the door starts closing.
	**/
    public extern inline function OutputOnClose(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnClose",callback);
    }
    
    /**
		Fired when the door starts opening.
	**/
    public extern inline function OutputOnOpen(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOpen",callback);
    }
    
    /**
		Fired when the door reaches the fully open position. Reversed if 'Start Open' flag is set.
	**/
    public extern inline function OutputOnFullyOpen(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyOpen",callback);
    }
    
    /**
		Fired when the door reaches the fully closed position. Reversed if 'Start Open' flag is set.
	**/
    public extern inline function OutputOnFullyClosed(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyClosed",callback);
    }
    
    /**
		Fired when the door is blocked while closing.
	**/
    public extern inline function OutputOnBlockedClosing(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBlockedClosing",callback);
    }
    
    /**
		Fired when the door is blocked while opening.
	**/
    public extern inline function OutputOnBlockedOpening(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBlockedOpening",callback);
    }
    
    /**
		Fired when the door is unblocked while closing.
	**/
    public extern inline function OutputOnUnblockedClosing(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUnblockedClosing",callback);
    }
    
    /**
		Fired when the door is unblocked while opening.
	**/
    public extern inline function OutputOnUnblockedOpening(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUnblockedOpening",callback);
    }
    
    /**
		Fired when the player uses the door, but it is locked.
	**/
    public extern inline function OutputOnLockedUse(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLockedUse",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_door}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_doorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_doorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_doorSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_door");
    }
}

enum abstract Func_doorunlocked_sentenceChoices(Int) to Int {
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
enum abstract Func_doorspawnposChoices(Int) to Int {
	var CLOSED = 0;
	var OPEN = 1;
}
enum abstract Func_doorrendermodeChoices(Int) to Int {
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
enum abstract Func_doorrenderfxChoices(Int) to Int {
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
enum abstract Func_doorloopmovesoundChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_doorlocked_sentenceChoices(Int) to Int {
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
enum abstract Func_doorignoredebrisChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_doorgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_doorforceclosedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_doordisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_doordisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_doorSpawnFlags(Int) to Int {
	var STARTS_OPEN__OBSOLETE_USE_SPAWN_POSITION_KEY_INSTEAD = 1;
	var NONSOLID_TO_PLAYER = 4;
	var PASSABLE = 8;
	var TOGGLE = 32;
	var USE_OPENS = 256;
	var NPCS_CANT = 512;
	var TOUCH_OPENS = 1024;
	var STARTS_LOCKED = 2048;
	var DOOR_SILENT = 4096;
}

#end
