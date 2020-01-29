package gmod.engine_ents;
#if server
/**
	An entity that can display and control a set of screen overlays, to be displayed over the player's view. Useful for view effects like drunkenness, or teleporter afterimages, etc.
**/
@:forward
abstract Env_screenoverlay(Entity) to Entity {
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
		Start displaying the first overlay.
	**/
    public extern inline function FireStartOverlays(delay:Float) {
        untyped this.Fire("StartOverlays",untyped null,delay);
    }
    
    /**
		Stop displaying any overlays.
	**/
    public extern inline function FireStopOverlays(delay:Float) {
        untyped this.Fire("StopOverlays",untyped null,delay);
    }
    
    /**
		Switch to displaying a specific overlay. Pass in the desired overlay number in the parameter.
	**/
    public extern inline function FireSwitchOverlay(param:Float,delay:Float) {
        untyped this.Fire("SwitchOverlay",untyped param,delay);
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
		Overlay Name 1

		Name of the first overlay material to display.
	**/
    public var OverlayName1(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName1():String {
        return untyped this.GetKeyValues().OverlayName1;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName1(value:String):String {
        return untyped this.SetKeyValue("OverlayName1",untyped value);
    }
    
    /**
		Overlay Duration 1

		Amount of time that the first overlay should be displayed for, after which it will begin showing the second overlay.
	**/
    public var OverlayTime1(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime1():Float {
        return untyped this.GetKeyValues().OverlayTime1;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime1(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime1",untyped value);
    }
    
    /**
		Overlay Name 2

		Name of the second overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName2(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName2():String {
        return untyped this.GetKeyValues().OverlayName2;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName2(value:String):String {
        return untyped this.SetKeyValue("OverlayName2",untyped value);
    }
    
    /**
		Overlay Duration 2

		Amount of time that the second overlay should be displayed for, after which it will begin showing the third overlay.
	**/
    public var OverlayTime2(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime2():Float {
        return untyped this.GetKeyValues().OverlayTime2;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime2(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime2",untyped value);
    }
    
    /**
		Overlay Name 3

		Name of the third overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName3(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName3():String {
        return untyped this.GetKeyValues().OverlayName3;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName3(value:String):String {
        return untyped this.SetKeyValue("OverlayName3",untyped value);
    }
    
    /**
		Overlay Duration 3

		Amount of time that the third overlay should be displayed for, after which it will begin showing the fourth overlay.
	**/
    public var OverlayTime3(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime3():Float {
        return untyped this.GetKeyValues().OverlayTime3;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime3(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime3",untyped value);
    }
    
    /**
		Overlay Name 4

		Name of the fourth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName4(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName4():String {
        return untyped this.GetKeyValues().OverlayName4;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName4(value:String):String {
        return untyped this.SetKeyValue("OverlayName4",untyped value);
    }
    
    /**
		Overlay Duration 4

		Amount of time that the fourth overlay should be displayed for, after which it will begin showing the fifth overlay.
	**/
    public var OverlayTime4(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime4():Float {
        return untyped this.GetKeyValues().OverlayTime4;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime4(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime4",untyped value);
    }
    
    /**
		Overlay Name 5

		Name of the fifth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName5(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName5():String {
        return untyped this.GetKeyValues().OverlayName5;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName5(value:String):String {
        return untyped this.SetKeyValue("OverlayName5",untyped value);
    }
    
    /**
		Overlay Duration 5

		Amount of time that the fifth overlay should be displayed for, after which it will begin showing the sixth overlay.
	**/
    public var OverlayTime5(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime5():Float {
        return untyped this.GetKeyValues().OverlayTime5;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime5(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime5",untyped value);
    }
    
    /**
		Overlay Name 6

		Name of the sixth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName6(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName6():String {
        return untyped this.GetKeyValues().OverlayName6;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName6(value:String):String {
        return untyped this.SetKeyValue("OverlayName6",untyped value);
    }
    
    /**
		Overlay Duration 6

		Amount of time that the sixth overlay should be displayed for, after which it will begin showing the seventh overlay.
	**/
    public var OverlayTime6(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime6():Float {
        return untyped this.GetKeyValues().OverlayTime6;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime6(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime6",untyped value);
    }
    
    /**
		Overlay Name 7

		Name of the seventh overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName7(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName7():String {
        return untyped this.GetKeyValues().OverlayName7;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName7(value:String):String {
        return untyped this.SetKeyValue("OverlayName7",untyped value);
    }
    
    /**
		Overlay Duration 7

		Amount of time that the seventh overlay should be displayed for, after which it will begin showing the eighth overlay.
	**/
    public var OverlayTime7(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime7():Float {
        return untyped this.GetKeyValues().OverlayTime7;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime7(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime7",untyped value);
    }
    
    /**
		Overlay Name 8

		Name of the eighth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName8(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName8():String {
        return untyped this.GetKeyValues().OverlayName8;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName8(value:String):String {
        return untyped this.SetKeyValue("OverlayName8",untyped value);
    }
    
    /**
		Overlay Duration 8

		Amount of time that the eighth overlay should be displayed for, after which it will begin showing the ninth overlay.
	**/
    public var OverlayTime8(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime8():Float {
        return untyped this.GetKeyValues().OverlayTime8;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime8(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime8",untyped value);
    }
    
    /**
		Overlay Name 9

		Name of the ninth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName9(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName9():String {
        return untyped this.GetKeyValues().OverlayName9;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName9(value:String):String {
        return untyped this.SetKeyValue("OverlayName9",untyped value);
    }
    
    /**
		Overlay Duration 9

		Amount of time that the ninth overlay should be displayed for, after which it will begin showing the tenth overlay.
	**/
    public var OverlayTime9(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime9():Float {
        return untyped this.GetKeyValues().OverlayTime9;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime9(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime9",untyped value);
    }
    
    /**
		Overlay Name 10

		Name of the tenth overlay material to display. If left blank, overlay displaying will finish, and this entity will consider itself done.
	**/
    public var OverlayName10(get,set):String;

    @:noCompletion
    public extern inline function get_OverlayName10():String {
        return untyped this.GetKeyValues().OverlayName10;
    }
    
    @:noCompletion
    public extern inline function set_OverlayName10(value:String):String {
        return untyped this.SetKeyValue("OverlayName10",untyped value);
    }
    
    /**
		Overlay Duration 10

		Amount of time that the tenth overlay should be displayed for, after which this entity will stop displaying overlays.
	**/
    public var OverlayTime10(get,set):Float;

    @:noCompletion
    public extern inline function get_OverlayTime10():Float {
        return untyped this.GetKeyValues().OverlayTime10;
    }
    
    @:noCompletion
    public extern inline function set_OverlayTime10(value:Float):Float {
        return untyped this.SetKeyValue("OverlayTime10",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_screenoverlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_screenoverlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_screenoverlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_screenoverlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_screenoverlay");
    }
}





#end
