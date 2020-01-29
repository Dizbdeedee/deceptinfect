package gmod.engine_ents;
#if server
/**
	An entity used to place a door in the world.
**/
@:forward
abstract Prop_door_rotating(Entity) to Entity {
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
		Changes the model skin to the specified number.
	**/
    public extern inline function FireSkin(param:Int,delay:Float) {
        untyped this.Fire("Skin",untyped param,delay);
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
		Used to attempt to fix sorting problems when rendering. True activates, false deactivates
	**/
    public extern inline function FireAlternativeSorting(param:bool,delay:Float) {
        untyped this.Fire("AlternativeSorting",untyped param,delay);
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
		Open the door, if it is not fully open.
	**/
    public extern inline function FireOpen(delay:Float) {
        untyped this.Fire("Open",untyped null,delay);
    }
    
    /**
		Open the door away from the specified entity.
	**/
    public extern inline function FireOpenAwayFrom(param:String,delay:Float) {
        untyped this.Fire("OpenAwayFrom",untyped param,delay);
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
		Set the distance (in degrees) between Open and Closed.
	**/
    public extern inline function FireSetRotationDistance(param:Float,delay:Float) {
        untyped this.Fire("SetRotationDistance",untyped param,delay);
    }
    
    /**
		Sets the open distance (in degrees) and moves there.
	**/
    public extern inline function FireMoveToRotationDistance(param:Float,delay:Float) {
        untyped this.Fire("MoveToRotationDistance",untyped param,delay);
    }
    
    /**
		Set the speed at which the door rotates. 100 is default.
	**/
    public extern inline function FireSetSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetSpeed",untyped param,delay);
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
    public var gmod_allowphysgun(get,set):Prop_door_rotatinggmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Prop_door_rotatinggmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Prop_door_rotatinggmod_allowphysgunChoices):Prop_door_rotatinggmod_allowphysgunChoices {
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
		World Model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Skin

		Some models have multiple versions of their textures, called skins. Set this to a number other than 0 to use that skin instead of the default.
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
		Disable Shadows

		Used to disable dynamic shadows on this entity.
	**/
    public var disableshadows(get,set):Prop_door_rotatingdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_door_rotatingdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_door_rotatingdisableshadowsChoices):Prop_door_rotatingdisableshadowsChoices {
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
		Slave Name

		The name of any doors that should be slaved to this door (i.e. should open when this one opens, and close when this one closes).
	**/
    public var slavename(get,set):String;

    @:noCompletion
    public extern inline function get_slavename():String {
        return untyped this.GetKeyValues().slavename;
    }
    
    @:noCompletion
    public extern inline function set_slavename(value:String):String {
        return untyped this.SetKeyValue("slavename",untyped value);
    }
    
    /**
		Hardware Type
	**/
    public var hardware(get,set):Prop_door_rotatinghardwareChoices;

    @:noCompletion
    public extern inline function get_hardware():Prop_door_rotatinghardwareChoices {
        return untyped this.GetKeyValues().hardware;
    }
    
    @:noCompletion
    public extern inline function set_hardware(value:Prop_door_rotatinghardwareChoices):Prop_door_rotatinghardwareChoices {
        return untyped this.SetKeyValue("hardware",untyped value);
    }
    
    /**
		Ajar Angles (Pitch Yaw Roll)

		If the door 'Spawn Position' is set to Ajar, these are the angles to spawn at, instead of being open or closed.
	**/
    public var ajarangles(get,set):Angle;

    @:noCompletion
    public extern inline function get_ajarangles():Angle {
        return untyped this.GetKeyValues().ajarangles;
    }
    
    @:noCompletion
    public extern inline function set_ajarangles(value:Angle):Angle {
        return untyped this.SetKeyValue("ajarangles",untyped value);
    }
    
    /**
		Spawn Position
	**/
    public var spawnpos(get,set):Prop_door_rotatingspawnposChoices;

    @:noCompletion
    public extern inline function get_spawnpos():Prop_door_rotatingspawnposChoices {
        return untyped this.GetKeyValues().spawnpos;
    }
    
    @:noCompletion
    public extern inline function set_spawnpos(value:Prop_door_rotatingspawnposChoices):Prop_door_rotatingspawnposChoices {
        return untyped this.SetKeyValue("spawnpos",untyped value);
    }
    
    /**
		Hinge Axis
	**/
    public var axis(get,set):Vector;

    @:noCompletion
    public extern inline function get_axis():Vector {
        return untyped this.GetKeyValues().axis;
    }
    
    @:noCompletion
    public extern inline function set_axis(value:Vector):Vector {
        return untyped this.SetKeyValue("axis",untyped value);
    }
    
    /**
		Rotation Distance (deg)

		The amount, in degrees, that the door should rotate when opened.
	**/
    public var distance(get,set):Float;

    @:noCompletion
    public extern inline function get_distance():Float {
        return untyped this.GetKeyValues().distance;
    }
    
    @:noCompletion
    public extern inline function set_distance(value:Float):Float {
        return untyped this.SetKeyValue("distance",untyped value);
    }
    
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
		Fully Open Sound

		Sound played when the door has finished opening.
	**/
    public var soundopenoverride(get,set):String;

    @:noCompletion
    public extern inline function get_soundopenoverride():String {
        return untyped this.GetKeyValues().soundopenoverride;
    }
    
    @:noCompletion
    public extern inline function set_soundopenoverride(value:String):String {
        return untyped this.SetKeyValue("soundopenoverride",untyped value);
    }
    
    /**
		Fully Closed Sound

		Sound played when the door has finished closing.
	**/
    public var soundcloseoverride(get,set):String;

    @:noCompletion
    public extern inline function get_soundcloseoverride():String {
        return untyped this.GetKeyValues().soundcloseoverride;
    }
    
    @:noCompletion
    public extern inline function set_soundcloseoverride(value:String):String {
        return untyped this.SetKeyValue("soundcloseoverride",untyped value);
    }
    
    /**
		Moving Sound

		Sound played when the door starts to move.
	**/
    public var soundmoveoverride(get,set):String;

    @:noCompletion
    public extern inline function get_soundmoveoverride():String {
        return untyped this.GetKeyValues().soundmoveoverride;
    }
    
    @:noCompletion
    public extern inline function set_soundmoveoverride(value:String):String {
        return untyped this.SetKeyValue("soundmoveoverride",untyped value);
    }
    
    /**
		Delay Before close (-1 stay open)

		Amount of time, in seconds, after the door has opened before it closes. If the value is set to -1, the door never closes itself.
	**/
    public var returndelay(get,set):Int;

    @:noCompletion
    public extern inline function get_returndelay():Int {
        return untyped this.GetKeyValues().returndelay;
    }
    
    @:noCompletion
    public extern inline function set_returndelay(value:Int):Int {
        return untyped this.SetKeyValue("returndelay",untyped value);
    }
    
    /**
		Damage Inflicted When Blocked

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
		Health (0 = Unbreakable)
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

		Sound played when the player tries to open the door, and fails because it's locked.
	**/
    public var soundlockedoverride(get,set):String;

    @:noCompletion
    public extern inline function get_soundlockedoverride():String {
        return untyped this.GetKeyValues().soundlockedoverride;
    }
    
    @:noCompletion
    public extern inline function set_soundlockedoverride(value:String):String {
        return untyped this.SetKeyValue("soundlockedoverride",untyped value);
    }
    
    /**
		Unlocked Sound

		Sound played when the door is unlocked.
	**/
    public var soundunlockedoverride(get,set):String;

    @:noCompletion
    public extern inline function get_soundunlockedoverride():String {
        return untyped this.GetKeyValues().soundunlockedoverride;
    }
    
    @:noCompletion
    public extern inline function set_soundunlockedoverride(value:String):String {
        return untyped this.SetKeyValue("soundunlockedoverride",untyped value);
    }
    
    /**
		Force Closed

		If set, this door will close no matter what. Useful for doors that have to close even if the player tries to block them with objects.
	**/
    public var forceclosed(get,set):Prop_door_rotatingforceclosedChoices;

    @:noCompletion
    public extern inline function get_forceclosed():Prop_door_rotatingforceclosedChoices {
        return untyped this.GetKeyValues().forceclosed;
    }
    
    @:noCompletion
    public extern inline function set_forceclosed(value:Prop_door_rotatingforceclosedChoices):Prop_door_rotatingforceclosedChoices {
        return untyped this.SetKeyValue("forceclosed",untyped value);
    }
    
    /**
		Open Direction

		Force the door to open only forwards or only backwards. Both directions is the standard door behavior.
	**/
    public var opendir(get,set):Prop_door_rotatingopendirChoices;

    @:noCompletion
    public extern inline function get_opendir():Prop_door_rotatingopendirChoices {
        return untyped this.GetKeyValues().opendir;
    }
    
    @:noCompletion
    public extern inline function set_opendir(value:Prop_door_rotatingopendirChoices):Prop_door_rotatingopendirChoices {
        return untyped this.SetKeyValue("opendir",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when this object catches fire.
	**/
    public extern inline function OutputOnIgnite(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnite",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the door is told to close.
	**/
    public extern inline function OutputOnClose(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnClose",callback);
    }
    
    /**
		Fired when the door is told to open.
	**/
    public extern inline function OutputOnOpen(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOpen",callback);
    }
    
    /**
		Fired when the door reaches the fully open position.
	**/
    public extern inline function OutputOnFullyOpen(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyOpen",callback);
    }
    
    /**
		Fired when the door reaches the fully closed position.
	**/
    public extern inline function OutputOnFullyClosed(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyClosed",callback);
    }
    
    /**
		Fired when the door is blocked while closing.
	**/
    public extern inline function OutputOnBlockedClosing(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBlockedClosing",callback);
    }
    
    /**
		Fired when the door is blocked while opening.
	**/
    public extern inline function OutputOnBlockedOpening(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBlockedOpening",callback);
    }
    
    /**
		Fired when the door is unblocked while closing.
	**/
    public extern inline function OutputOnUnblockedClosing(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUnblockedClosing",callback);
    }
    
    /**
		Fired when the door is unblocked while opening.
	**/
    public extern inline function OutputOnUnblockedOpening(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUnblockedOpening",callback);
    }
    
    /**
		Fired when the player uses the door, but it is locked.
	**/
    public extern inline function OutputOnLockedUse(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLockedUse",callback);
    }
    
    /**
		Fired when the door arrives at it's goal angle.
	**/
    public extern inline function OutputOnRotationDone(callback:Callback<{activator:Prop_door_rotating}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnRotationDone",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Prop_door_rotatingSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Prop_door_rotatingSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Prop_door_rotatingSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("prop_door_rotating");
    }
}

enum abstract Prop_door_rotatingspawnposChoices(Int) to Int {
	var CLOSED = 0;
	var OPEN_FORWARD = 1;
	var OPEN_BACK = 2;
	var AJAR_USE_AJAR_ANGLES = 3;
}
enum abstract Prop_door_rotatingopendirChoices(Int) to Int {
	var OPEN_BOTH_DIRECTIONS = 0;
	var OPEN_FORWARD_ONLY = 1;
	var OPEN_BACKWARD_ONLY = 2;
}
enum abstract Prop_door_rotatinghardwareChoices(Int) to Int {
	var NONE = 0;
	var LEVER = 1;
	var PUSH_BAR = 2;
	var KEYPAD = 3;
}
enum abstract Prop_door_rotatinggmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_door_rotatingforceclosedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_door_rotatingdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Prop_door_rotatingSpawnFlags(Int) to Int {
	var STARTS_OPEN = 1;
	var STARTS_LOCKED = 2048;
	var DOOR_SILENT_NO_SOUND_AND_DOES_NOT_ALERT_NPCS = 4096;
	var USE_CLOSES = 8192;
	var DOOR_SILENT_TO_NPCS_DOES_NOT_ALERT_NPCS = 16384;
	var IGNORE_PLAYER_USE = 32768;
	var START_BREAKABLE = 524288;
}

#end
