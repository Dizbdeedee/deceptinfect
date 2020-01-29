package gmod.engine_ents;
#if server
/**
	A prop that doesn't move and doesn't animate.
**/
@:forward
abstract Prop_static(Entity) to Entity {
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
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Prop_staticmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Prop_staticmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Prop_staticmindxlevelChoices):Prop_staticmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Prop_staticmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Prop_staticmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Prop_staticmaxdxlevelChoices):Prop_staticmaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		World Model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Skin

		Some models have multiple versions of their textures, called skins. Set this to a number other than 0 to use that skin instead of the default.
	**/
    public var skin(get,set):Int;

    @:noCompletion
    public extern inline function get_skin():Int {
        return untyped this.GetKeyValues().skin;
    }
    
    @:noCompletion
    public extern inline function set_skin(value:Int):Int {
        return untyped this.SetKeyValue("skin",untyped value);
    }
    
    /**
		Collisions
	**/
    public var solid(get,set):Prop_staticsolidChoices;

    @:noCompletion
    public extern inline function get_solid():Prop_staticsolidChoices {
        return untyped this.GetKeyValues().solid;
    }
    
    @:noCompletion
    public extern inline function set_solid(value:Prop_staticsolidChoices):Prop_staticsolidChoices {
        return untyped this.SetKeyValue("solid",untyped value);
    }
    
    /**
		Disable Shadows
	**/
    public var disableshadows(get,set):Prop_staticdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Prop_staticdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Prop_staticdisableshadowsChoices):Prop_staticdisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
    }
    
    /**
		Screen Space Fade

		The method by which the fading distance should be determined. If 'No', the fade distances is the distance from the player's view to the object, in inches. If 'Yes', the fade distance is the size of the object onscreen, in pixels.
	**/
    public var screenspacefade(get,set):Prop_staticscreenspacefadeChoices;

    @:noCompletion
    public extern inline function get_screenspacefade():Prop_staticscreenspacefadeChoices {
        return untyped this.GetKeyValues().screenspacefade;
    }
    
    @:noCompletion
    public extern inline function set_screenspacefade(value:Prop_staticscreenspacefadeChoices):Prop_staticscreenspacefadeChoices {
        return untyped this.SetKeyValue("screenspacefade",untyped value);
    }
    
    /**
		Start Fade Dist/Pixels

		Distance at which the prop starts to fade (<0 = use fademaxdist). If 'Screen Space Fade' is selected, this represents the number of pixels wide covered by the prop when it starts to fade.
	**/
    public var fademindist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademindist():Float {
        return untyped this.GetKeyValues().fademindist;
    }
    
    @:noCompletion
    public extern inline function set_fademindist(value:Float):Float {
        return untyped this.SetKeyValue("fademindist",untyped value);
    }
    
    /**
		End Fade Dist/Pixels

		Maximum distance at which the prop is visible (0 = don't fade out). If 'Screen Space Fade' is selected, this represents the *minimum* number of pixels wide covered by the prop when it fades.
	**/
    public var fademaxdist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademaxdist():Float {
        return untyped this.GetKeyValues().fademaxdist;
    }
    
    @:noCompletion
    public extern inline function set_fademaxdist(value:Float):Float {
        return untyped this.SetKeyValue("fademaxdist",untyped value);
    }
    
    /**
		Fade Scale

		If you specify a fade in the worldspawn, or if the engine is running under dx7 [hl2/ep1/portal] or dx8 [ep2/tf], then the engine will forcibly fade out props even if fademindist/fademaxdist isn't specified. This scale factor gives you some control over the fade. Using 0 here turns off the forcible fades. Numbers smaller than 1 cause the prop to fade out at further distances, and greater than 1 cause it to fade out at closer distances.
	**/
    public var fadescale(get,set):Float;

    @:noCompletion
    public extern inline function get_fadescale():Float {
        return untyped this.GetKeyValues().fadescale;
    }
    
    @:noCompletion
    public extern inline function set_fadescale(value:Float):Float {
        return untyped this.SetKeyValue("fadescale",untyped value);
    }
    
    /**
		Lighting Origin

		Select an info_lighting to specify a location to sample lighting from, instead of using this entity's origin.
	**/
    public var lightingorigin(get,set):String;

    @:noCompletion
    public extern inline function get_lightingorigin():String {
        return untyped this.GetKeyValues().lightingorigin;
    }
    
    @:noCompletion
    public extern inline function set_lightingorigin(value:String):String {
        return untyped this.SetKeyValue("lightingorigin",untyped value);
    }
    
    /**
		Disable Vertex lighting
	**/
    public var disablevertexlighting(get,set):Prop_staticdisablevertexlightingChoices;

    @:noCompletion
    public extern inline function get_disablevertexlighting():Prop_staticdisablevertexlightingChoices {
        return untyped this.GetKeyValues().disablevertexlighting;
    }
    
    @:noCompletion
    public extern inline function set_disablevertexlighting(value:Prop_staticdisablevertexlightingChoices):Prop_staticdisablevertexlightingChoices {
        return untyped this.SetKeyValue("disablevertexlighting",untyped value);
    }
    
    /**
		Disable Self-Shadowing with vertex lighting
	**/
    public var disableselfshadowing(get,set):Prop_staticdisableselfshadowingChoices;

    @:noCompletion
    public extern inline function get_disableselfshadowing():Prop_staticdisableselfshadowingChoices {
        return untyped this.GetKeyValues().disableselfshadowing;
    }
    
    @:noCompletion
    public extern inline function set_disableselfshadowing(value:Prop_staticdisableselfshadowingChoices):Prop_staticdisableselfshadowingChoices {
        return untyped this.SetKeyValue("disableselfshadowing",untyped value);
    }
    
    /**
		Ignore surface normal for computing vertex lighting
	**/
    public var ignorenormals(get,set):Prop_staticignorenormalsChoices;

    @:noCompletion
    public extern inline function get_ignorenormals():Prop_staticignorenormalsChoices {
        return untyped this.GetKeyValues().ignorenormals;
    }
    
    @:noCompletion
    public extern inline function set_ignorenormals(value:Prop_staticignorenormalsChoices):Prop_staticignorenormalsChoices {
        return untyped this.SetKeyValue("ignorenormals",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("prop_static");
    }
}

enum abstract Prop_staticsolidChoices(Int) to Int {
	var NOT_SOLID = 0;
	var USE_BOUNDING_BOX = 2;
	var USE_VPHYSICS = 6;
}
enum abstract Prop_staticscreenspacefadeChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_staticmindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_staticmaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Prop_staticignorenormalsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_staticdisablevertexlightingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_staticdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Prop_staticdisableselfshadowingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
