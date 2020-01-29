package gmod.engine_ents;
#if server
/**
	Driveable studiomodel crane.
**/
@:forward
abstract Prop_vehicle_crane(Entity) to Entity {
    //Inputs
    
    /**
		Turns the handbrake on
	**/
    public extern inline function FireHandBrakeOn(delay:Float) {
        untyped this.Fire("HandBrakeOn",untyped null,delay);
    }
    
    /**
		Releases the handbrake
	**/
    public extern inline function FireHandBrakeOff(delay:Float) {
        untyped this.Fire("HandBrakeOff",untyped null,delay);
    }
    
    /**
		Set the speed of the action animation
	**/
    public extern inline function FireAction(param:Float,delay:Float) {
        untyped this.Fire("Action",untyped param,delay);
    }
    
    /**
		Turn on: Start engine & enable throttle
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn off: Stop engine, disable throttle, engage brakes.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Prevent the player from entering or exiting the vehicle.
	**/
    public extern inline function FireLock(delay:Float) {
        untyped this.Fire("Lock",untyped null,delay);
    }
    
    /**
		Re-allow the player to enter or exit the vehicle.
	**/
    public extern inline function FireUnlock(delay:Float) {
        untyped this.Fire("Unlock",untyped null,delay);
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
		Force the player to get into the crane. Only works in singleplayer.
	**/
    public extern inline function FireForcePlayerIn(delay:Float) {
        untyped this.Fire("ForcePlayerIn",untyped null,delay);
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
		Start locked
	**/
    public var VehicleLocked(get,set):Prop_vehicle_craneVehicleLockedChoices;

    @:noCompletion
    public extern inline function get_VehicleLocked():Prop_vehicle_craneVehicleLockedChoices {
        return untyped this.GetKeyValues().VehicleLocked;
    }
    
    @:noCompletion
    public extern inline function set_VehicleLocked(value:Prop_vehicle_craneVehicleLockedChoices):Prop_vehicle_craneVehicleLockedChoices {
        return untyped this.SetKeyValue("VehicleLocked",untyped value);
    }
    
    /**
		Vehicle Script File
	**/
    public var vehiclescript(get,set):String;

    @:noCompletion
    public extern inline function get_vehiclescript():String {
        return untyped this.GetKeyValues().vehiclescript;
    }
    
    @:noCompletion
    public extern inline function set_vehiclescript(value:String):String {
        return untyped this.SetKeyValue("vehiclescript",untyped value);
    }
    
    /**
		Scale of action input / framerate
	**/
    public var actionScale(get,set):Float;

    @:noCompletion
    public extern inline function get_actionScale():Float {
        return untyped this.GetKeyValues().actionScale;
    }
    
    @:noCompletion
    public extern inline function set_actionScale(value:Float):Float {
        return untyped this.SetKeyValue("actionScale",untyped value);
    }
    
    /**
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Prop_vehicle_cranemindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Prop_vehicle_cranemindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Prop_vehicle_cranemindxlevelChoices):Prop_vehicle_cranemindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Prop_vehicle_cranemaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Prop_vehicle_cranemaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Prop_vehicle_cranemaxdxlevelChoices):Prop_vehicle_cranemaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Prop_vehicle_cranegmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Prop_vehicle_cranegmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Prop_vehicle_cranegmod_allowphysgunChoices):Prop_vehicle_cranegmod_allowphysgunChoices {
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
		Collisions
	**/
    public var solid(get,set):Prop_vehicle_cranesolidChoices;

    @:noCompletion
    public extern inline function get_solid():Prop_vehicle_cranesolidChoices {
        return untyped this.GetKeyValues().solid;
    }
    
    @:noCompletion
    public extern inline function set_solid(value:Prop_vehicle_cranesolidChoices):Prop_vehicle_cranesolidChoices {
        return untyped this.SetKeyValue("solid",untyped value);
    }
    
    /**
		Disable Shadows
	**/
    public var disableshadows(get,set):Prop_vehicle_cranedisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_vehicle_cranedisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_vehicle_cranedisableshadowsChoices):Prop_vehicle_cranedisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
    }
    
    /**
		Screen Space Fade

		The method by which the fading distance should be determined. If 'No', the fade distances is the distance from the player's view to the object, in inches. If 'Yes', the fade distance is the size of the object onscreen, in pixels.
	**/
    public var screenspacefade(get,set):Prop_vehicle_cranescreenspacefadeChoices;

    @:noCompletion
    public extern inline function get_screenspacefade():Prop_vehicle_cranescreenspacefadeChoices {
        return untyped this.GetKeyValues().screenspacefade;
    }
    
    @:noCompletion
    public extern inline function set_screenspacefade(value:Prop_vehicle_cranescreenspacefadeChoices):Prop_vehicle_cranescreenspacefadeChoices {
        return untyped this.SetKeyValue("screenspacefade",untyped value);
    }
    
    /**
		Start Fade Dist/Pixels

		Distance at which the prop starts to fade (<0 = use fademaxdist). If 'Screen Space Fade' is selected, this represents the number of pixels wide covered by the prop when it starts to fade.
	**/
    public var fademindist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademindist():Float {
        return untyped this.GetKeyValues().fademindist;
    }
    
    @:noCompletion
    public extern inline function set_fademindist(value:Float):Float {
        return untyped this.SetKeyValue("fademindist",untyped value);
    }
    
    /**
		End Fade Dist/Pixels

		Maximum distance at which the prop is visible (0 = don't fade out). If 'Screen Space Fade' is selected, this represents the *minimum* number of pixels wide covered by the prop when it fades.
	**/
    public var fademaxdist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademaxdist():Float {
        return untyped this.GetKeyValues().fademaxdist;
    }
    
    @:noCompletion
    public extern inline function set_fademaxdist(value:Float):Float {
        return untyped this.SetKeyValue("fademaxdist",untyped value);
    }
    
    /**
		Fade Scale

		If you specify a fade in the worldspawn, or if the engine is running under dx7 [hl2/ep1/portal] or dx8 [ep2/tf], then the engine will forcibly fade out props even if fademindist/fademaxdist isn't specified. This scale factor gives you some control over the fade. Using 0 here turns off the forcible fades. Numbers smaller than 1 cause the prop to fade out at further distances, and greater than 1 cause it to fade out at closer distances.
	**/
    public var fadescale(get,set):Float;

    @:noCompletion
    public extern inline function get_fadescale():Float {
        return untyped this.GetKeyValues().fadescale;
    }
    
    @:noCompletion
    public extern inline function set_fadescale(value:Float):Float {
        return untyped this.SetKeyValue("fadescale",untyped value);
    }
    
    /**
		Lighting Origin

		Select an info_lighting to specify a location to sample lighting from, instead of using this entity's origin.
	**/
    public var lightingorigin(get,set):String;

    @:noCompletion
    public extern inline function get_lightingorigin():String {
        return untyped this.GetKeyValues().lightingorigin;
    }
    
    @:noCompletion
    public extern inline function set_lightingorigin(value:String):String {
        return untyped this.SetKeyValue("lightingorigin",untyped value);
    }
    
    /**
		Disable Vertex lighting
	**/
    public var disablevertexlighting(get,set):Prop_vehicle_cranedisablevertexlightingChoices;

    @:noCompletion
    public extern inline function get_disablevertexlighting():Prop_vehicle_cranedisablevertexlightingChoices {
        return untyped this.GetKeyValues().disablevertexlighting;
    }
    
    @:noCompletion
    public extern inline function set_disablevertexlighting(value:Prop_vehicle_cranedisablevertexlightingChoices):Prop_vehicle_cranedisablevertexlightingChoices {
        return untyped this.SetKeyValue("disablevertexlighting",untyped value);
    }
    
    /**
		Disable Self-Shadowing with vertex lighting
	**/
    public var disableselfshadowing(get,set):Prop_vehicle_cranedisableselfshadowingChoices;

    @:noCompletion
    public extern inline function get_disableselfshadowing():Prop_vehicle_cranedisableselfshadowingChoices {
        return untyped this.GetKeyValues().disableselfshadowing;
    }
    
    @:noCompletion
    public extern inline function set_disableselfshadowing(value:Prop_vehicle_cranedisableselfshadowingChoices):Prop_vehicle_cranedisableselfshadowingChoices {
        return untyped this.SetKeyValue("disableselfshadowing",untyped value);
    }
    
    /**
		Ignore surface normal for computing vertex lighting
	**/
    public var ignorenormals(get,set):Prop_vehicle_craneignorenormalsChoices;

    @:noCompletion
    public extern inline function get_ignorenormals():Prop_vehicle_craneignorenormalsChoices {
        return untyped this.GetKeyValues().ignorenormals;
    }
    
    @:noCompletion
    public extern inline function set_ignorenormals(value:Prop_vehicle_craneignorenormalsChoices):Prop_vehicle_craneignorenormalsChoices {
        return untyped this.SetKeyValue("ignorenormals",untyped value);
    }
    
    /**
		Magnet entity
	**/
    public var magnetname(get,set):String;

    @:noCompletion
    public extern inline function get_magnetname():String {
        return untyped this.GetKeyValues().magnetname;
    }
    
    @:noCompletion
    public extern inline function set_magnetname(value:String):String {
        return untyped this.SetKeyValue("magnetname",untyped value);
    }
    
    //Outputs
    
    /**
		Player entered the vehicle
	**/
    public extern inline function OutputPlayerOn(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerOn",callback);
    }
    
    /**
		Player exited the vehicle
	**/
    public extern inline function OutputPlayerOff(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerOff",callback);
    }
    
    /**
		Player Pressed attack key
	**/
    public extern inline function OutputPressedAttack(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedAttack",callback);
    }
    
    /**
		Player Pressed attack2 key
	**/
    public extern inline function OutputPressedAttack2(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedAttack2",callback);
    }
    
    /**
		State of attack button [0,1]
	**/
    public extern inline function OutputAttackAxis(callback:Callback<{activator:Prop_vehicle_crane,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"AttackAxis",callback);
    }
    
    /**
		State of attack2 button [0,1]
	**/
    public extern inline function OutputAttack2Axis(callback:Callback<{activator:Prop_vehicle_crane,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"Attack2Axis",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Prop_vehicle_crane}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("prop_vehicle_crane");
    }
}

enum abstract Prop_vehicle_cranesolidChoices(Int) to Int {
	var NOT_SOLID = 0;
	var USE_BOUNDING_BOX = 2;
	var USE_VPHYSICS = 6;
}
enum abstract Prop_vehicle_cranescreenspacefadeChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_cranemindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_vehicle_cranemaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_vehicle_craneignorenormalsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_cranegmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_cranedisablevertexlightingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_cranedisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_cranedisableselfshadowingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_vehicle_craneVehicleLockedChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
