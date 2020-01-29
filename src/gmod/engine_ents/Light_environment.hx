package gmod.engine_ents;
#if server
/**
	Sets the color and angle of the light from the sun and sky.
**/
@:forward
abstract Light_environment(Entity) to Entity {
    //Inputs
    
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
		Pitch

		The downward pitch of the light from the sun. 0 is horizontal, -90 is straight down.
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
		Brightness
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
		Ambient
	**/
    public var _ambient(get,set):String;

    @:noCompletion
    public extern inline function get__ambient():String {
        return untyped this.GetKeyValues()._ambient;
    }
    
    @:noCompletion
    public extern inline function set__ambient(value:String):String {
        return untyped this.SetKeyValue("_ambient",untyped value);
    }
    
    /**
		BrightnessHDR
	**/
    public var _lightHDR(get,set):String;

    @:noCompletion
    public extern inline function get__lightHDR():String {
        return untyped this.GetKeyValues()._lightHDR;
    }
    
    @:noCompletion
    public extern inline function set__lightHDR(value:String):String {
        return untyped this.SetKeyValue("_lightHDR",untyped value);
    }
    
    /**
		BrightnessScaleHDR

		Amount to scale the light by when compiling for HDR.
	**/
    public var _lightscaleHDR(get,set):Float;

    @:noCompletion
    public extern inline function get__lightscaleHDR():Float {
        return untyped this.GetKeyValues()._lightscaleHDR;
    }
    
    @:noCompletion
    public extern inline function set__lightscaleHDR(value:Float):Float {
        return untyped this.SetKeyValue("_lightscaleHDR",untyped value);
    }
    
    /**
		AmbientHDR
	**/
    public var _ambientHDR(get,set):String;

    @:noCompletion
    public extern inline function get__ambientHDR():String {
        return untyped this.GetKeyValues()._ambientHDR;
    }
    
    @:noCompletion
    public extern inline function set__ambientHDR(value:String):String {
        return untyped this.SetKeyValue("_ambientHDR",untyped value);
    }
    
    /**
		AmbientScaleHDR

		Amount to scale the ambient light by when compiling for hdr.
	**/
    public var _AmbientScaleHDR(get,set):Float;

    @:noCompletion
    public extern inline function get__AmbientScaleHDR():Float {
        return untyped this.GetKeyValues()._AmbientScaleHDR;
    }
    
    @:noCompletion
    public extern inline function set__AmbientScaleHDR(value:Float):Float {
        return untyped this.SetKeyValue("_AmbientScaleHDR",untyped value);
    }
    
    /**
		Pitch

		The downward pitch of the light from the sun. 0 is horizontal, -90 is straight down.
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
		SunSpreadAngle

		The angular extent of the sun for casting soft shadows. Higher numbers are more diffuse. 5 is a good starting value.
	**/
    public var SunSpreadAngle(get,set):Float;

    @:noCompletion
    public extern inline function get_SunSpreadAngle():Float {
        return untyped this.GetKeyValues().SunSpreadAngle;
    }
    
    @:noCompletion
    public extern inline function set_SunSpreadAngle(value:Float):Float {
        return untyped this.SetKeyValue("SunSpreadAngle",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("light_environment");
    }
}





#end
