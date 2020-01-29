package gmod.engine_ents;
#if server
/**
	Place one copy of this entity inside of an instance.  Whenever you add a $parameter for the instance, get the properties of this entity.  It will auto-populate it with the variables and allow you to indicate the variable type.
**/
@:forward
abstract Func_instance_parms(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm1(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm1():instance_parm {
        return untyped this.GetKeyValues().parm1;
    }
    
    @:noCompletion
    public extern inline function set_parm1(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm1",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm2(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm2():instance_parm {
        return untyped this.GetKeyValues().parm2;
    }
    
    @:noCompletion
    public extern inline function set_parm2(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm2",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm3(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm3():instance_parm {
        return untyped this.GetKeyValues().parm3;
    }
    
    @:noCompletion
    public extern inline function set_parm3(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm3",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm4(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm4():instance_parm {
        return untyped this.GetKeyValues().parm4;
    }
    
    @:noCompletion
    public extern inline function set_parm4(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm4",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm5(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm5():instance_parm {
        return untyped this.GetKeyValues().parm5;
    }
    
    @:noCompletion
    public extern inline function set_parm5(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm5",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm6(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm6():instance_parm {
        return untyped this.GetKeyValues().parm6;
    }
    
    @:noCompletion
    public extern inline function set_parm6(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm6",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm7(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm7():instance_parm {
        return untyped this.GetKeyValues().parm7;
    }
    
    @:noCompletion
    public extern inline function set_parm7(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm7",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm8(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm8():instance_parm {
        return untyped this.GetKeyValues().parm8;
    }
    
    @:noCompletion
    public extern inline function set_parm8(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm8",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm9(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm9():instance_parm {
        return untyped this.GetKeyValues().parm9;
    }
    
    @:noCompletion
    public extern inline function set_parm9(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm9",untyped value);
    }
    
    /**
		Parm

		This is a parameter.  It goes in the form of $variable type.
	**/
    public var parm10(get,set):instance_parm;

    @:noCompletion
    public extern inline function get_parm10():instance_parm {
        return untyped this.GetKeyValues().parm10;
    }
    
    @:noCompletion
    public extern inline function set_parm10(value:instance_parm):instance_parm {
        return untyped this.SetKeyValue("parm10",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_instance_parms");
    }
}





#end
