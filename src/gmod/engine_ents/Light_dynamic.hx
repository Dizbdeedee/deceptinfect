package gmod.engine_ents;
#if server
/**
	An invisible lightsource that changes in some way over time.
**/
@:forward
abstract Light_dynamic(Entity) to Entity {
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
		Set the light's render color (R G B).
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
    }
    
    /**
		Set the light brightness.
	**/
    public extern inline function Firebrightness(param:Int,delay:Float) {
        untyped this.Fire("brightness",untyped param,delay);
    }
    
    /**
		Set the maximum light distance.
	**/
    public extern inline function Firedistance(param:Float,delay:Float) {
        untyped this.Fire("distance",untyped param,delay);
    }
    
    /**
		Set the inner (bright) angle.
	**/
    public extern inline function Fire_inner_cone(param:Int,delay:Float) {
        untyped this.Fire("_inner_cone",untyped param,delay);
    }
    
    /**
		Set the outer (fading) angle.
	**/
    public extern inline function Fire_cone(param:Int,delay:Float) {
        untyped this.Fire("_cone",untyped param,delay);
    }
    
    /**
		Set the radius of the spotlight at the end point.
	**/
    public extern inline function Firespotlight_radius(param:Float,delay:Float) {
        untyped this.Fire("spotlight_radius",untyped param,delay);
    }
    
    /**
		Change the lightstyle (see Appearance field for possible values).
	**/
    public extern inline function Firestyle(param:Int,delay:Float) {
        untyped this.Fire("style",untyped param,delay);
    }
    
    /**
		Turn the light off.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn the light on.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggle the light on/off.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
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
		Entity to point at

		The name of an entity in the map that the dynamic light will point at.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    /**
		Light color
	**/
    public var _light(get,set):String;

    @:noCompletion
    public extern inline function get__light():String {
        return untyped this.GetKeyValues()._light;
    }
    
    @:noCompletion
    public extern inline function set__light(value:String):String {
        return untyped this.SetKeyValue("_light",untyped value);
    }
    
    /**
		Light brightness
	**/
    public var brightness(get,set):Int;

    @:noCompletion
    public extern inline function get_brightness():Int {
        return untyped this.GetKeyValues().brightness;
    }
    
    @:noCompletion
    public extern inline function set_brightness(value:Int):Int {
        return untyped this.SetKeyValue("brightness",untyped value);
    }
    
    /**
		Inner (bright) angle
	**/
    public var _inner_cone(get,set):Int;

    @:noCompletion
    public extern inline function get__inner_cone():Int {
        return untyped this.GetKeyValues()._inner_cone;
    }
    
    @:noCompletion
    public extern inline function set__inner_cone(value:Int):Int {
        return untyped this.SetKeyValue("_inner_cone",untyped value);
    }
    
    /**
		Outer (fading) angle
	**/
    public var _cone(get,set):Int;

    @:noCompletion
    public extern inline function get__cone():Int {
        return untyped this.GetKeyValues()._cone;
    }
    
    @:noCompletion
    public extern inline function set__cone(value:Int):Int {
        return untyped this.SetKeyValue("_cone",untyped value);
    }
    
    /**
		Pitch
	**/
    public var pitch(get,set):Int;

    @:noCompletion
    public extern inline function get_pitch():Int {
        return untyped this.GetKeyValues().pitch;
    }
    
    @:noCompletion
    public extern inline function set_pitch(value:Int):Int {
        return untyped this.SetKeyValue("pitch",untyped value);
    }
    
    /**
		Maximum distance

		This is the distance that light is allowed to cast, in inches.
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
		Spotlight end radius

		This is the radius of the light, in inches, at the object that it is hitting.
	**/
    public var spotlight_radius(get,set):Float;

    @:noCompletion
    public extern inline function get_spotlight_radius():Float {
        return untyped this.GetKeyValues().spotlight_radius;
    }
    
    @:noCompletion
    public extern inline function set_spotlight_radius(value:Float):Float {
        return untyped this.SetKeyValue("spotlight_radius",untyped value);
    }
    
    /**
		Appearance
	**/
    public var style(get,set):Choices;

    @:noCompletion
    public extern inline function get_style():Choices {
        return untyped this.GetKeyValues().style;
    }
    
    @:noCompletion
    public extern inline function set_style(value:Choices):Choices {
        return untyped this.SetKeyValue("style",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Light_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Light_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Light_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Light_dynamic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Light_dynamicSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Light_dynamicSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Light_dynamicSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("light_dynamic");
    }
}



enum abstract Light_dynamicSpawnFlags(Int) to Int {
	var DO_NOT_LIGHT_WORLD_BETTER_PERF = 1;
	var DO_NOT_LIGHT_MODELS = 2;
	var ADD_DISPLACEMENT_ALPHA = 4;
	var SUBTRACT_DISPLACEMENT_ALPHA = 8;
}

#end
