package gmod.engine_ents;
#if server
/**
	Overlay Transition
**/
@:forward
abstract Info_overlay_transition(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Material
	**/
    public var material(get,set):String;

    @:noCompletion
    public extern inline function get_material():String {
        return untyped this.GetKeyValues().material;
    }
    
    @:noCompletion
    public extern inline function set_material(value:String):String {
        return untyped this.SetKeyValue("material",untyped value);
    }
    
    /**
		Brush faces
	**/
    public var sides(get,set):String;

    @:noCompletion
    public extern inline function get_sides():String {
        return untyped this.GetKeyValues().sides;
    }
    
    @:noCompletion
    public extern inline function set_sides(value:String):String {
        return untyped this.SetKeyValue("sides",untyped value);
    }
    
    /**
		Water faces
	**/
    public var sides2(get,set):String;

    @:noCompletion
    public extern inline function get_sides2():String {
        return untyped this.GetKeyValues().sides2;
    }
    
    @:noCompletion
    public extern inline function set_sides2(value:String):String {
        return untyped this.SetKeyValue("sides2",untyped value);
    }
    
    /**
		Texcoord Length Start
	**/
    public var LengthTexcoordStart(get,set):Float;

    @:noCompletion
    public extern inline function get_LengthTexcoordStart():Float {
        return untyped this.GetKeyValues().LengthTexcoordStart;
    }
    
    @:noCompletion
    public extern inline function set_LengthTexcoordStart(value:Float):Float {
        return untyped this.SetKeyValue("LengthTexcoordStart",untyped value);
    }
    
    /**
		Texcoord Length End
	**/
    public var LengthTexcoordEnd(get,set):Float;

    @:noCompletion
    public extern inline function get_LengthTexcoordEnd():Float {
        return untyped this.GetKeyValues().LengthTexcoordEnd;
    }
    
    @:noCompletion
    public extern inline function set_LengthTexcoordEnd(value:Float):Float {
        return untyped this.SetKeyValue("LengthTexcoordEnd",untyped value);
    }
    
    /**
		Texcoord Width Start
	**/
    public var WidthTexcoordStart(get,set):Float;

    @:noCompletion
    public extern inline function get_WidthTexcoordStart():Float {
        return untyped this.GetKeyValues().WidthTexcoordStart;
    }
    
    @:noCompletion
    public extern inline function set_WidthTexcoordStart(value:Float):Float {
        return untyped this.SetKeyValue("WidthTexcoordStart",untyped value);
    }
    
    /**
		Texcoord Width End
	**/
    public var WidthTexcoordEnd(get,set):Float;

    @:noCompletion
    public extern inline function get_WidthTexcoordEnd():Float {
        return untyped this.GetKeyValues().WidthTexcoordEnd;
    }
    
    @:noCompletion
    public extern inline function set_WidthTexcoordEnd(value:Float):Float {
        return untyped this.SetKeyValue("WidthTexcoordEnd",untyped value);
    }
    
    /**
		Width Land
	**/
    public var Width1(get,set):Float;

    @:noCompletion
    public extern inline function get_Width1():Float {
        return untyped this.GetKeyValues().Width1;
    }
    
    @:noCompletion
    public extern inline function set_Width1(value:Float):Float {
        return untyped this.SetKeyValue("Width1",untyped value);
    }
    
    /**
		Width Water
	**/
    public var Width2(get,set):Float;

    @:noCompletion
    public extern inline function get_Width2():Float {
        return untyped this.GetKeyValues().Width2;
    }
    
    @:noCompletion
    public extern inline function set_Width2(value:Float):Float {
        return untyped this.SetKeyValue("Width2",untyped value);
    }
    
    /**
		Show Debug

		Boolean value (0 or 1).
	**/
    public var DebugDraw(get,set):Int;

    @:noCompletion
    public extern inline function get_DebugDraw():Int {
        return untyped this.GetKeyValues().DebugDraw;
    }
    
    @:noCompletion
    public extern inline function set_DebugDraw(value:Int):Int {
        return untyped this.SetKeyValue("DebugDraw",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_overlay_transition");
    }
}





#end
