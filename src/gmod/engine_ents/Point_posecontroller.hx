package gmod.engine_ents;
#if server
/**
	An entity that controls a pose parameter of a prop and cycles the pose clientside.
**/
@:forward
abstract Point_posecontroller(Entity) to Entity {
    //Inputs
    
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
		Sets the pose parameter to control.
	**/
    public extern inline function FireSetPoseParameterName(param:String,delay:Float) {
        untyped this.Fire("SetPoseParameterName",untyped param,delay);
    }
    
    /**
		Set the pose parameter to a normalized value between 0.0 and 1.0 (maps to min and max range).
	**/
    public extern inline function FireSetPoseValue(param:Float,delay:Float) {
        untyped this.Fire("SetPoseValue",untyped param,delay);
    }
    
    /**
		Set the interpolation time to a number of seconds between 0.0 and 10.0.
	**/
    public extern inline function FireSetInterpolationTime(param:Float,delay:Float) {
        untyped this.Fire("SetInterpolationTime",untyped param,delay);
    }
    
    /**
		Set the pose parameter's base cycles per second from -10.0f to 10.0.
	**/
    public extern inline function FireSetCycleFrequency(param:Float,delay:Float) {
        untyped this.Fire("SetCycleFrequency",untyped param,delay);
    }
    
    /**
		Set the type of frequency modulation.
	**/
    public extern inline function FireSetFModType(param:Int,delay:Float) {
        untyped this.Fire("SetFModType",untyped param,delay);
    }
    
    /**
		Set the modulation time offset from -1.0f to 1.0.
	**/
    public extern inline function FireSetFModTimeOffset(param:Float,delay:Float) {
        untyped this.Fire("SetFModTimeOffset",untyped param,delay);
    }
    
    /**
		Set the modulation cycles per second from -10.0f to 10.0.
	**/
    public extern inline function FireSetFModRate(param:Float,delay:Float) {
        untyped this.Fire("SetFModRate",untyped param,delay);
    }
    
    /**
		Set the modulation extents from 0.0f to 10.0.
	**/
    public extern inline function FireSetFModAmplitude(param:Float,delay:Float) {
        untyped this.Fire("SetFModAmplitude",untyped param,delay);
    }
    
    /**
		Randomize the frequency modulation by an extremeness of 0.0 to 1.0.
	**/
    public extern inline function FireRandomizeFMod(param:Float,delay:Float) {
        untyped this.Fire("RandomizeFMod",untyped param,delay);
    }
    
    //Keyvalues
    
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
		Prop Name

		Name of the prop to control.
	**/
    public var PropName(get,set):String;

    @:noCompletion
    public extern inline function get_PropName():String {
        return untyped this.GetKeyValues().PropName;
    }
    
    @:noCompletion
    public extern inline function set_PropName(value:String):String {
        return untyped this.SetKeyValue("PropName",untyped value);
    }
    
    /**
		Pose Parameter Name

		Name of the pose parameter to control.
	**/
    public var PoseParameterName(get,set):String;

    @:noCompletion
    public extern inline function get_PoseParameterName():String {
        return untyped this.GetKeyValues().PoseParameterName;
    }
    
    @:noCompletion
    public extern inline function set_PoseParameterName(value:String):String {
        return untyped this.SetKeyValue("PoseParameterName",untyped value);
    }
    
    /**
		Pose Parameter Value

		Normalized value for the pose parameter from 0.0 and 1.0 (maps to min and max range).
	**/
    public var PoseValue(get,set):Float;

    @:noCompletion
    public extern inline function get_PoseValue():Float {
        return untyped this.GetKeyValues().PoseValue;
    }
    
    @:noCompletion
    public extern inline function set_PoseValue(value:Float):Float {
        return untyped this.SetKeyValue("PoseValue",untyped value);
    }
    
    /**
		Interpolation Time

		Number of seconds (0.0 to 10.0) for client to match absolue pose values.
	**/
    public var InterpolationTime(get,set):Float;

    @:noCompletion
    public extern inline function get_InterpolationTime():Float {
        return untyped this.GetKeyValues().InterpolationTime;
    }
    
    @:noCompletion
    public extern inline function set_InterpolationTime(value:Float):Float {
        return untyped this.SetKeyValue("InterpolationTime",untyped value);
    }
    
    /**
		Should wrap from 0.0 to 1.0 when interpolating.
	**/
    public var InterpolationWrap(get,set):Point_posecontrollerInterpolationWrapChoices;

    @:noCompletion
    public extern inline function get_InterpolationWrap():Point_posecontrollerInterpolationWrapChoices {
        return untyped this.GetKeyValues().InterpolationWrap;
    }
    
    @:noCompletion
    public extern inline function set_InterpolationWrap(value:Point_posecontrollerInterpolationWrapChoices):Point_posecontrollerInterpolationWrapChoices {
        return untyped this.SetKeyValue("InterpolationWrap",untyped value);
    }
    
    /**
		Cycle Frequency

		Base cycles per second from -10.0 to 10.0.
	**/
    public var CycleFrequency(get,set):Float;

    @:noCompletion
    public extern inline function get_CycleFrequency():Float {
        return untyped this.GetKeyValues().CycleFrequency;
    }
    
    @:noCompletion
    public extern inline function set_CycleFrequency(value:Float):Float {
        return untyped this.SetKeyValue("CycleFrequency",untyped value);
    }
    
    /**
		Frequency Modulation Type
	**/
    public var FModulationType(get,set):Point_posecontrollerFModulationTypeChoices;

    @:noCompletion
    public extern inline function get_FModulationType():Point_posecontrollerFModulationTypeChoices {
        return untyped this.GetKeyValues().FModulationType;
    }
    
    @:noCompletion
    public extern inline function set_FModulationType(value:Point_posecontrollerFModulationTypeChoices):Point_posecontrollerFModulationTypeChoices {
        return untyped this.SetKeyValue("FModulationType",untyped value);
    }
    
    /**
		Frequency Modulation Time Offset

		Modulation time offset from -1.0f to 1.0.
	**/
    public var FModTimeOffset(get,set):Float;

    @:noCompletion
    public extern inline function get_FModTimeOffset():Float {
        return untyped this.GetKeyValues().FModTimeOffset;
    }
    
    @:noCompletion
    public extern inline function set_FModTimeOffset(value:Float):Float {
        return untyped this.SetKeyValue("FModTimeOffset",untyped value);
    }
    
    /**
		Frequency Modulation Rate

		Modulation cycles per second from -10.0f to 10.0.
	**/
    public var FModRate(get,set):Float;

    @:noCompletion
    public extern inline function get_FModRate():Float {
        return untyped this.GetKeyValues().FModRate;
    }
    
    @:noCompletion
    public extern inline function set_FModRate(value:Float):Float {
        return untyped this.SetKeyValue("FModRate",untyped value);
    }
    
    /**
		Frequency Modulation Amplitude

		Modulation extents from 0.0f to 10.0.
	**/
    public var FModAmplitude(get,set):Float;

    @:noCompletion
    public extern inline function get_FModAmplitude():Float {
        return untyped this.GetKeyValues().FModAmplitude;
    }
    
    @:noCompletion
    public extern inline function set_FModAmplitude(value:Float):Float {
        return untyped this.SetKeyValue("FModAmplitude",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_posecontroller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_posecontroller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_posecontroller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_posecontroller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_posecontroller");
    }
}

enum abstract Point_posecontrollerInterpolationWrapChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Point_posecontrollerFModulationTypeChoices(Int) to Int {
	var NONE = 0;
	var SINE = 1;
	var SQUARE = 2;
	var TRIANGLE = 3;
	var SAWTOOTH = 4;
	var NOISE = 5;
}




#end
