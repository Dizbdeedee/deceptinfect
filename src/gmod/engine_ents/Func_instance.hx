package gmod.engine_ents;
#if server
/**
	An entity for placing an instance of a map file.  You may translate and rotate this entity. You can use the replace keys to do parameter changes on the instance contents.  In a $ at the beginning of a variable name.  Then just use the $variable name inside of the instance contents on any value portion of a key/value pair.
**/
@:forward
abstract Func_instance(Entity) to Entity {
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
		Fix Up Name

		The name that all entities will be fixed up with based upon the fix up style.
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
		VMF Filename

		This indicates a map file relative to the map's file name
	**/
    public var file(get,set):instance_file;

    @:noCompletion
    public extern inline function get_file():instance_file {
        return untyped this.GetKeyValues().file;
    }
    
    @:noCompletion
    public extern inline function set_file(value:instance_file):instance_file {
        return untyped this.SetKeyValue("file",untyped value);
    }
    
    /**
		Entity Name Fix Up

		Fixup style for instanced entity names.  Uses the 'Fix Up Name' field.
	**/
    public var fixup_style(get,set):Choices;

    @:noCompletion
    public extern inline function get_fixup_style():Choices {
        return untyped this.GetKeyValues().fixup_style;
    }
    
    @:noCompletion
    public extern inline function set_fixup_style(value:Choices):Choices {
        return untyped this.SetKeyValue("fixup_style",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace01(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace01():instance_variable {
        return untyped this.GetKeyValues().replace01;
    }
    
    @:noCompletion
    public extern inline function set_replace01(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace01",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace02(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace02():instance_variable {
        return untyped this.GetKeyValues().replace02;
    }
    
    @:noCompletion
    public extern inline function set_replace02(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace02",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace03(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace03():instance_variable {
        return untyped this.GetKeyValues().replace03;
    }
    
    @:noCompletion
    public extern inline function set_replace03(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace03",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace04(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace04():instance_variable {
        return untyped this.GetKeyValues().replace04;
    }
    
    @:noCompletion
    public extern inline function set_replace04(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace04",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace05(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace05():instance_variable {
        return untyped this.GetKeyValues().replace05;
    }
    
    @:noCompletion
    public extern inline function set_replace05(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace05",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace06(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace06():instance_variable {
        return untyped this.GetKeyValues().replace06;
    }
    
    @:noCompletion
    public extern inline function set_replace06(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace06",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace07(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace07():instance_variable {
        return untyped this.GetKeyValues().replace07;
    }
    
    @:noCompletion
    public extern inline function set_replace07(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace07",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace08(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace08():instance_variable {
        return untyped this.GetKeyValues().replace08;
    }
    
    @:noCompletion
    public extern inline function set_replace08(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace08",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace09(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace09():instance_variable {
        return untyped this.GetKeyValues().replace09;
    }
    
    @:noCompletion
    public extern inline function set_replace09(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace09",untyped value);
    }
    
    /**
		Replace

		This is a replacement parameter.  It goes in the form of $variable value.  All entities inside of that instance that have $variable somewhere will be replaced with the value contents.  Example: $color 255 0 0
	**/
    public var replace10(get,set):instance_variable;

    @:noCompletion
    public extern inline function get_replace10():instance_variable {
        return untyped this.GetKeyValues().replace10;
    }
    
    @:noCompletion
    public extern inline function set_replace10(value:instance_variable):instance_variable {
        return untyped this.SetKeyValue("replace10",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_instance");
    }
}





#end
