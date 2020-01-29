package gmod.engine_ents;
#if server
/**
	An entity that spits out a constant stream of smoke. See particlezoo.vmf for sample usage. You can place up to two env_particlelight entities near the smoke stack to add ambient light to its particles.
**/
@:forward
abstract Env_smokestack(Entity) to Entity {
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
		Turn on the smokestack.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn off the smokestack.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggles the smokestack between on and off state.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Set the length of the smoke trail.
	**/
    public extern inline function FireJetLength(param:Int,delay:Float) {
        untyped this.Fire("JetLength",untyped param,delay);
    }
    
    /**
		Set the rate at which to emit smoke particles (particles per second).
	**/
    public extern inline function FireRate(param:Int,delay:Float) {
        untyped this.Fire("Rate",untyped param,delay);
    }
    
    /**
		Set the speed at which the smoke particles move after they're spawned.
	**/
    public extern inline function FireSpeed(param:Int,delay:Float) {
        untyped this.Fire("Speed",untyped param,delay);
    }
    
    /**
		Set the amount of random spread in the velocity of the smoke particles after they're spawned.
	**/
    public extern inline function FireSpreadSpeed(param:Int,delay:Float) {
        untyped this.Fire("SpreadSpeed",untyped param,delay);
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
		Initial State
	**/
    public var InitialState(get,set):Env_smokestackInitialStateChoices;

    @:noCompletion
    public extern inline function get_InitialState():Env_smokestackInitialStateChoices {
        return untyped this.GetKeyValues().InitialState;
    }
    
    @:noCompletion
    public extern inline function set_InitialState(value:Env_smokestackInitialStateChoices):Env_smokestackInitialStateChoices {
        return untyped this.SetKeyValue("InitialState",untyped value);
    }
    
    /**
		Spread at the base

		Amount of random spread in the origins of the smoke particles when they're spawned.
	**/
    public var BaseSpread(get,set):Int;

    @:noCompletion
    public extern inline function get_BaseSpread():Int {
        return untyped this.GetKeyValues().BaseSpread;
    }
    
    @:noCompletion
    public extern inline function set_BaseSpread(value:Int):Int {
        return untyped this.SetKeyValue("BaseSpread",untyped value);
    }
    
    /**
		Spread Speed

		Amount of random spread in the velocity of the smoke particles after they're spawned.
	**/
    public var SpreadSpeed(get,set):Int;

    @:noCompletion
    public extern inline function get_SpreadSpeed():Int {
        return untyped this.GetKeyValues().SpreadSpeed;
    }
    
    @:noCompletion
    public extern inline function set_SpreadSpeed(value:Int):Int {
        return untyped this.SetKeyValue("SpreadSpeed",untyped value);
    }
    
    /**
		Speed

		The speed at which the smoke particles move after they're spawned.
	**/
    public var Speed(get,set):Int;

    @:noCompletion
    public extern inline function get_Speed():Int {
        return untyped this.GetKeyValues().Speed;
    }
    
    @:noCompletion
    public extern inline function set_Speed(value:Int):Int {
        return untyped this.SetKeyValue("Speed",untyped value);
    }
    
    /**
		Particle start size

		Size of the smoke particles when they're first emitted.
	**/
    public var StartSize(get,set):Int;

    @:noCompletion
    public extern inline function get_StartSize():Int {
        return untyped this.GetKeyValues().StartSize;
    }
    
    @:noCompletion
    public extern inline function set_StartSize(value:Int):Int {
        return untyped this.SetKeyValue("StartSize",untyped value);
    }
    
    /**
		Particle end size

		Size of the smoke particles at the point they fade out completely.
	**/
    public var EndSize(get,set):Int;

    @:noCompletion
    public extern inline function get_EndSize():Int {
        return untyped this.GetKeyValues().EndSize;
    }
    
    @:noCompletion
    public extern inline function set_EndSize(value:Int):Int {
        return untyped this.SetKeyValue("EndSize",untyped value);
    }
    
    /**
		Emission rate

		Rate at which to emit smoke particles (i.e. particles to emit per second).
	**/
    public var Rate(get,set):Int;

    @:noCompletion
    public extern inline function get_Rate():Int {
        return untyped this.GetKeyValues().Rate;
    }
    
    @:noCompletion
    public extern inline function set_Rate(value:Int):Int {
        return untyped this.SetKeyValue("Rate",untyped value);
    }
    
    /**
		Length of smoke trail

		Length of the smokestack. Lifetime of the smoke particles is derived from this & particle speed.
	**/
    public var JetLength(get,set):Int;

    @:noCompletion
    public extern inline function get_JetLength():Int {
        return untyped this.GetKeyValues().JetLength;
    }
    
    @:noCompletion
    public extern inline function set_JetLength(value:Int):Int {
        return untyped this.SetKeyValue("JetLength",untyped value);
    }
    
    /**
		Wind X/Y Angle

		This specifies the wind direction. It is an angle in the XY plane. WindSpeed specifies the strength of the wind.
	**/
    public var WindAngle(get,set):Int;

    @:noCompletion
    public extern inline function get_WindAngle():Int {
        return untyped this.GetKeyValues().WindAngle;
    }
    
    @:noCompletion
    public extern inline function set_WindAngle(value:Int):Int {
        return untyped this.SetKeyValue("WindAngle",untyped value);
    }
    
    /**
		Wind Speed

		The strength of the wind.
	**/
    public var WindSpeed(get,set):Int;

    @:noCompletion
    public extern inline function get_WindSpeed():Int {
        return untyped this.GetKeyValues().WindSpeed;
    }
    
    @:noCompletion
    public extern inline function set_WindSpeed(value:Int):Int {
        return untyped this.SetKeyValue("WindSpeed",untyped value);
    }
    
    /**
		Particle material

		Material of the smoke particles emitted by this stack.
	**/
    public var SmokeMaterial(get,set):String;

    @:noCompletion
    public extern inline function get_SmokeMaterial():String {
        return untyped this.GetKeyValues().SmokeMaterial;
    }
    
    @:noCompletion
    public extern inline function set_SmokeMaterial(value:String):String {
        return untyped this.SetKeyValue("SmokeMaterial",untyped value);
    }
    
    /**
		Twist

		The amount, in degrees per second, that the smoke particles twist around the origin.
	**/
    public var twist(get,set):Int;

    @:noCompletion
    public extern inline function get_twist():Int {
        return untyped this.GetKeyValues().twist;
    }
    
    @:noCompletion
    public extern inline function set_twist(value:Int):Int {
        return untyped this.SetKeyValue("twist",untyped value);
    }
    
    /**
		Roll Speed

		Amount of roll in degrees per second.
	**/
    public var roll(get,set):Float;

    @:noCompletion
    public extern inline function get_roll():Float {
        return untyped this.GetKeyValues().roll;
    }
    
    @:noCompletion
    public extern inline function set_roll(value:Float):Float {
        return untyped this.SetKeyValue("roll",untyped value);
    }
    
    /**
		Base Color (R G B)
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
		Translucency
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
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_smokestack");
    }
}

enum abstract Env_smokestackInitialStateChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
}




#end
