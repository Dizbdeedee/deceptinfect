package gmod.engine_ents;
#if server
/**
	A brush entity that's designed to be used for a rotating player-useable button. When used by the player, it rotates to a pressed position.
**/
@:forward
abstract Func_rot_button(Entity) to Entity {
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
		Start Disabled
	**/
    public var StartDisabled(get,set):Func_rot_buttonStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Func_rot_buttonStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Func_rot_buttonStartDisabledChoices):Func_rot_buttonStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_rot_buttongmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_rot_buttongmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_rot_buttongmod_allowphysgunChoices):Func_rot_buttongmod_allowphysgunChoices {
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
		Speed

		The speed that the button rotates, in degrees per second.
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
		Sounds
	**/
    public var sounds(get,set):Func_rot_buttonsoundsChoices;

    @:noCompletion
    public extern inline function get_sounds():Func_rot_buttonsoundsChoices {
        return untyped this.GetKeyValues().sounds;
    }
    
    @:noCompletion
    public extern inline function set_sounds(value:Func_rot_buttonsoundsChoices):Func_rot_buttonsoundsChoices {
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
		Distance (deg)

		The amount, in degrees, that the button should rotate when it's pressed.
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
    public extern inline function OutputOnDamaged(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDamaged",callback);
    }
    
    /**
		Fired when the button is pressed.
	**/
    public extern inline function OutputOnPressed(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPressed",callback);
    }
    
    /**
		Fired when the button is used while locked.
	**/
    public extern inline function OutputOnUseLocked(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUseLocked",callback);
    }
    
    /**
		Fired when the button reaches the in/pressed position.
	**/
    public extern inline function OutputOnIn(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIn",callback);
    }
    
    /**
		Fired when the button reaches the out/released position.
	**/
    public extern inline function OutputOnOut(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnOut",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_rot_button}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_rot_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_rot_buttonSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_rot_buttonSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_rot_button");
    }
}

enum abstract Func_rot_buttonsoundsChoices(Int) to Int {
	var NONE_SILENT = 0;
	var SQUEAKY = 21;
	var SQUEAKY_PNEUMATIC = 22;
	var RATCHET_GROAN = 23;
	var CLEAN_RATCHET = 24;
	var GAS_CLUNK = 25;
}
enum abstract Func_rot_buttongmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_rot_buttonStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_rot_buttonSpawnFlags(Int) to Int {
	var NOT_SOLID = 1;
	var REVERSE_DIR = 2;
	var TOGGLE = 32;
	var X_AXIS = 64;
	var Y_AXIS = 128;
	var TOUCH_ACTIVATES = 256;
	var DAMAGE_ACTIVATES = 512;
	var USE_ACTIVATES = 1024;
	var STARTS_LOCKED = 2048;
	var NON_SOLID = 16384;
}

#end
