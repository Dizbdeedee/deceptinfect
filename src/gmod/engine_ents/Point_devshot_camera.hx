package gmod.engine_ents;
#if server
/**
	An entity used by the -makedevshots system, which automatically takes screenshots at the position of every devshot camera in the level.
**/
@:forward
abstract Point_devshot_camera(Entity) to Entity {
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
		Camera Name

		Used as the name of the directory to store screenshots from this camera. Must be unique within the level.
	**/
    public var cameraname(get,set):String;

    @:noCompletion
    public extern inline function get_cameraname():String {
        return untyped this.GetKeyValues().cameraname;
    }
    
    @:noCompletion
    public extern inline function set_cameraname(value:String):String {
        return untyped this.SetKeyValue("cameraname",untyped value);
    }
    
    /**
		Camera FOV

		FOV of this camera.
	**/
    public var FOV(get,set):Int;

    @:noCompletion
    public extern inline function get_FOV():Int {
        return untyped this.GetKeyValues().FOV;
    }
    
    @:noCompletion
    public extern inline function set_FOV(value:Int):Int {
        return untyped this.SetKeyValue("FOV",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_devshot_camera");
    }
}





#end
