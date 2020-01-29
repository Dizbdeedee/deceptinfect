package gmod.engine_ents;
#if server
/**
	An entity that creates a sample point for the Cubic Environment Map.
**/
@:forward
abstract Env_cubemap(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Cubemap Size
	**/
    public var cubemapsize(get,set):Env_cubemapcubemapsizeChoices;

    @:noCompletion
    public extern inline function get_cubemapsize():Env_cubemapcubemapsizeChoices {
        return untyped this.GetKeyValues().cubemapsize;
    }
    
    @:noCompletion
    public extern inline function set_cubemapsize(value:Env_cubemapcubemapsizeChoices):Env_cubemapcubemapsizeChoices {
        return untyped this.SetKeyValue("cubemapsize",untyped value);
    }
    
    /**
		Brush faces

		(Optional) Brushes faces to directly attach to the env_cubemap. Press Pick then click on faces in the 3D View to select them. Use CTRL while clicking to add or remove from the selection.
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
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_cubemap");
    }
}

enum abstract Env_cubemapcubemapsizeChoices(Int) to Int {
	var DEFAULT = 0;
	var _1X1 = 1;
	var _2X2 = 2;
	var _4X4 = 3;
	var _8X8 = 4;
	var _16X16 = 5;
	var _32X32 = 6;
	var _64X64 = 7;
	var _128X128 = 8;
	var _256X256 = 9;
}




#end
