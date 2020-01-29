package gmod.engine_ents;
#if server
/**
	An entity used to control the 3D Skybox. Its origin is used to determine the 3D Skybox's position relative to the map. Place this entity, in the 3D Skybox, at the point where the origin of the map should be.
**/
@:forward
abstract Sky_camera(Entity) to Entity {
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
		3D Skybox scale

		Scale of the skybox.
	**/
    public var scale(get,set):Int;

    @:noCompletion
    public extern inline function get_scale():Int {
        return untyped this.GetKeyValues().scale;
    }
    
    @:noCompletion
    public extern inline function set_scale(value:Int):Int {
        return untyped this.SetKeyValue("scale",untyped value);
    }
    
    /**
		Fog Enable
	**/
    public var fogenable(get,set):Sky_camerafogenableChoices;

    @:noCompletion
    public extern inline function get_fogenable():Sky_camerafogenableChoices {
        return untyped this.GetKeyValues().fogenable;
    }
    
    @:noCompletion
    public extern inline function set_fogenable(value:Sky_camerafogenableChoices):Sky_camerafogenableChoices {
        return untyped this.SetKeyValue("fogenable",untyped value);
    }
    
    /**
		Fog Blend
	**/
    public var fogblend(get,set):Sky_camerafogblendChoices;

    @:noCompletion
    public extern inline function get_fogblend():Sky_camerafogblendChoices {
        return untyped this.GetKeyValues().fogblend;
    }
    
    @:noCompletion
    public extern inline function set_fogblend(value:Sky_camerafogblendChoices):Sky_camerafogblendChoices {
        return untyped this.SetKeyValue("fogblend",untyped value);
    }
    
    /**
		Use Angles for Fog Dir
	**/
    public var use_angles(get,set):Sky_camerause_anglesChoices;

    @:noCompletion
    public extern inline function get_use_angles():Sky_camerause_anglesChoices {
        return untyped this.GetKeyValues().use_angles;
    }
    
    @:noCompletion
    public extern inline function set_use_angles(value:Sky_camerause_anglesChoices):Sky_camerause_anglesChoices {
        return untyped this.SetKeyValue("use_angles",untyped value);
    }
    
    /**
		Primary Fog Color
	**/
    public var fogcolor(get,set):String;

    @:noCompletion
    public extern inline function get_fogcolor():String {
        return untyped this.GetKeyValues().fogcolor;
    }
    
    @:noCompletion
    public extern inline function set_fogcolor(value:String):String {
        return untyped this.SetKeyValue("fogcolor",untyped value);
    }
    
    /**
		Secondary Fog Color
	**/
    public var fogcolor2(get,set):String;

    @:noCompletion
    public extern inline function get_fogcolor2():String {
        return untyped this.GetKeyValues().fogcolor2;
    }
    
    @:noCompletion
    public extern inline function set_fogcolor2(value:String):String {
        return untyped this.SetKeyValue("fogcolor2",untyped value);
    }
    
    /**
		Primary Fog Dir
	**/
    public var fogdir(get,set):String;

    @:noCompletion
    public extern inline function get_fogdir():String {
        return untyped this.GetKeyValues().fogdir;
    }
    
    @:noCompletion
    public extern inline function set_fogdir(value:String):String {
        return untyped this.SetKeyValue("fogdir",untyped value);
    }
    
    /**
		Fog Start

		Distance at which the skybox fog should start.
	**/
    public var fogstart(get,set):String;

    @:noCompletion
    public extern inline function get_fogstart():String {
        return untyped this.GetKeyValues().fogstart;
    }
    
    @:noCompletion
    public extern inline function set_fogstart(value:String):String {
        return untyped this.SetKeyValue("fogstart",untyped value);
    }
    
    /**
		Fog End

		Distance at which the skybox fog should be fully opaque.
	**/
    public var fogend(get,set):String;

    @:noCompletion
    public extern inline function get_fogend():String {
        return untyped this.GetKeyValues().fogend;
    }
    
    @:noCompletion
    public extern inline function set_fogend(value:String):String {
        return untyped this.SetKeyValue("fogend",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("sky_camera");
    }
}

enum abstract Sky_camerause_anglesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Sky_camerafogenableChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Sky_camerafogblendChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
