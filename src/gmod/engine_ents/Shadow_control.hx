package gmod.engine_ents;
#if server
/**
	An entity to control the shadows in the map.
**/
@:forward
abstract Shadow_control(Entity) to Entity {
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
		Set the shadow color.
	**/
    public extern inline function Firecolor(param:String,delay:Float) {
        untyped this.Fire("color",untyped param,delay);
    }
    
    /**
		Set the shadow direction.
	**/
    public extern inline function Firedirection(param:Vector,delay:Float) {
        untyped this.Fire("direction",untyped param,delay);
    }
    
    /**
		Set the maximum shadow cast distance.
	**/
    public extern inline function FireSetDistance(param:Float,delay:Float) {
        untyped this.Fire("SetDistance",untyped param,delay);
    }
    
    /**
		Set the shadow direction.
	**/
    public extern inline function FireSetAngles(param:String,delay:Float) {
        untyped this.Fire("SetAngles",untyped param,delay);
    }
    
    /**
		Set shadows disabled state.
	**/
    public extern inline function FireSetShadowsDisabled(param:Int,delay:Float) {
        untyped this.Fire("SetShadowsDisabled",untyped param,delay);
    }
    
    /**
		Set local light shadows enabled state.
	**/
    public extern inline function FireSetShadowsFromLocalLightsEnabled(param:Int,delay:Float) {
        untyped this.Fire("SetShadowsFromLocalLightsEnabled",untyped param,delay);
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
		Pitch Yaw Roll (Y Z X)

		This is the shadow direction. Pitch is rotation around the Y axis, yaw is the rotation around the Z axis, and roll is the rotation around the X axis.
	**/
    public var angles(get,set):String;

    @:noCompletion
    public extern inline function get_angles():String {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:String):String {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    /**
		Shadow Color

		This is the color of the shadows.
	**/
    public var color(get,set):String;

    @:noCompletion
    public extern inline function get_color():String {
        return untyped this.GetKeyValues().color;
    }
    
    @:noCompletion
    public extern inline function set_color(value:String):String {
        return untyped this.SetKeyValue("color",untyped value);
    }
    
    /**
		Maximum Distance

		This is the maximum distance the shadow is allowed to cast, in inches.
	**/
    public var distance(get,set):Float;

    @:noCompletion
    public extern inline function get_distance():Float {
        return untyped this.GetKeyValues().distance;
    }
    
    @:noCompletion
    public extern inline function set_distance(value:Float):Float {
        return untyped this.SetKeyValue("distance",untyped value);
    }
    
    /**
		All Shadows Disabled
	**/
    public var disableallshadows(get,set):Choices;

    @:noCompletion
    public extern inline function get_disableallshadows():Choices {
        return untyped this.GetKeyValues().disableallshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableallshadows(value:Choices):Choices {
        return untyped this.SetKeyValue("disableallshadows",untyped value);
    }
    
    /**
		Enable Local Light Shadows
	**/
    public var enableshadowsfromlocallights(get,set):Choices;

    @:noCompletion
    public extern inline function get_enableshadowsfromlocallights():Choices {
        return untyped this.GetKeyValues().enableshadowsfromlocallights;
    }
    
    @:noCompletion
    public extern inline function set_enableshadowsfromlocallights(value:Choices):Choices {
        return untyped this.SetKeyValue("enableshadowsfromlocallights",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Shadow_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Shadow_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Shadow_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Shadow_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("shadow_control");
    }
}





#end
