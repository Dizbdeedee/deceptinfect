package gmod.engine_ents;
#if server
/**
	An entity that acts like a magnet, attaching metallic physics objects to itself when they touch it.
**/
@:forward
abstract Phys_magnet(Entity) to Entity {
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
		Turn the magnet on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		The the magnet off. This will detach anything current stuck to the magnet.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
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
    public var gmod_allowphysgun(get,set):Phys_magnetgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Phys_magnetgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Phys_magnetgmod_allowphysgunChoices):Phys_magnetgmod_allowphysgunChoices {
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
    public var disableshadows(get,set):Phys_magnetdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Phys_magnetdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Phys_magnetdisableshadowsChoices):Phys_magnetdisableshadowsChoices {
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
		Force Limit to Break (lbs)

		The amount of force necessary to break a stuck object off the magnet. A way of calculating this is to set it to the mass of an object that would break this constraint if it were resting on the magnet.
	**/
    public var forcelimit(get,set):Float;

    @:noCompletion
    public extern inline function get_forcelimit():Float {
        return untyped this.GetKeyValues().forcelimit;
    }
    
    @:noCompletion
    public extern inline function set_forcelimit(value:Float):Float {
        return untyped this.SetKeyValue("forcelimit",untyped value);
    }
    
    /**
		Torque Limit to Break (lbs * distance)

		The amount of torque necessary to break a stuck object off the magnet. A way of calculating this is to multiply any reference mass by the resting distance (from the center of mass of the object) needed to break the constraint.
	**/
    public var torquelimit(get,set):Float;

    @:noCompletion
    public extern inline function get_torquelimit():Float {
        return untyped this.GetKeyValues().torquelimit;
    }
    
    @:noCompletion
    public extern inline function set_torquelimit(value:Float):Float {
        return untyped this.SetKeyValue("torquelimit",untyped value);
    }
    
    /**
		Mass Scale

		A scale multiplier for the object's mass.
	**/
    public var massScale(get,set):Float;

    @:noCompletion
    public extern inline function get_massScale():Float {
        return untyped this.GetKeyValues().massScale;
    }
    
    @:noCompletion
    public extern inline function set_massScale(value:Float):Float {
        return untyped this.SetKeyValue("massScale",untyped value);
    }
    
    /**
		Override parameters

		A list of physics key/value pairs that are usually in a physics prop .qc file. Format is 'key,value,key,value,etc'.
	**/
    public var overridescript(get,set):String;

    @:noCompletion
    public extern inline function get_overridescript():String {
        return untyped this.GetKeyValues().overridescript;
    }
    
    @:noCompletion
    public extern inline function set_overridescript(value:String):String {
        return untyped this.SetKeyValue("overridescript",untyped value);
    }
    
    /**
		Maximum Attached Objects

		The maximum number of physics objects that can be stuck to the magnet at once. 0 = no limit.
	**/
    public var maxobjects(get,set):Int;

    @:noCompletion
    public extern inline function get_maxobjects():Int {
        return untyped this.GetKeyValues().maxobjects;
    }
    
    @:noCompletion
    public extern inline function set_maxobjects(value:Int):Int {
        return untyped this.SetKeyValue("maxobjects",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when this object catches fire.
	**/
    public extern inline function OutputOnIgnite(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnite",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an entity is grabbed by the magnet.
	**/
    public extern inline function OutputOnAttach(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAttach",callback);
    }
    
    /**
		Fired when an entity is released by the magnet.
	**/
    public extern inline function OutputOnDetach(callback:Callback<{activator:Phys_magnet}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDetach",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_magnetSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_magnetSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_magnetSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_magnet");
    }
}

enum abstract Phys_magnetgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Phys_magnetdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Phys_magnetSpawnFlags(Int) to Int {
	var START_ASLEEP = 1;
	var MOTION_DISABLED = 2;
	var SUCK_ON_TOUCH = 4;
	var ALLOW_ATTACHED_ROTATION = 8;
	var COAST_JEEP_PICKUP_HACK = 16;
}

#end
