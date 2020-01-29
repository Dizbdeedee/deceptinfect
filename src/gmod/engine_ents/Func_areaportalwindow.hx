package gmod.engine_ents;
#if server
/**
	An entity that can be used to optimize the visibility in a map. If you seal off an area with them, when the viewer moves the specified distance away from them, they will go opaque and the parts inside the area will not be drawn. The 'target' brush model should enclose the func_areaportal window so no parts of it are culled by the window. If you use the optional foreground brush model, then it should enclose the 'target' brush model.
**/
@:forward
abstract Func_areaportalwindow(Entity) to Entity {
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
		Set fade start distance.
	**/
    public extern inline function FireSetFadeStartDistance(param:Int,delay:Float) {
        untyped this.Fire("SetFadeStartDistance",untyped param,delay);
    }
    
    /**
		Set fade end distance.
	**/
    public extern inline function FireSetFadeEndDistance(param:Int,delay:Float) {
        untyped this.Fire("SetFadeEndDistance",untyped param,delay);
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
		Rendered Window

		The name of a brush model to render as the window.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    /**
		Fade Start Distance

		When the viewer is closer than this distance, the alpha is set to 'TranslucencyLimit'.
	**/
    public var FadeStartDist(get,set):Int;

    @:noCompletion
    public extern inline function get_FadeStartDist():Int {
        return untyped this.GetKeyValues().FadeStartDist;
    }
    
    @:noCompletion
    public extern inline function set_FadeStartDist(value:Int):Int {
        return untyped this.SetKeyValue("FadeStartDist",untyped value);
    }
    
    /**
		Fade End Distance

		When the viewer is at this distance, the portal becomes solid and closes off.
	**/
    public var FadeDist(get,set):Int;

    @:noCompletion
    public extern inline function get_FadeDist():Int {
        return untyped this.GetKeyValues().FadeDist;
    }
    
    @:noCompletion
    public extern inline function set_FadeDist(value:Int):Int {
        return untyped this.SetKeyValue("FadeDist",untyped value);
    }
    
    /**
		Translucency limit

		This value limits the translucency of the bmodel and prevents it from becoming invisible when the viewer is right on top of it.
	**/
    public var TranslucencyLimit(get,set):String;

    @:noCompletion
    public extern inline function get_TranslucencyLimit():String {
        return untyped this.GetKeyValues().TranslucencyLimit;
    }
    
    @:noCompletion
    public extern inline function set_TranslucencyLimit(value:String):String {
        return untyped this.SetKeyValue("TranslucencyLimit",untyped value);
    }
    
    /**
		Foreground bmodel

		(Optional) brush model that is drawn after the fading brush model. This model should have alpha in its textures so you can see through it.
	**/
    public var BackgroundBModel(get,set):String;

    @:noCompletion
    public extern inline function get_BackgroundBModel():String {
        return untyped this.GetKeyValues().BackgroundBModel;
    }
    
    @:noCompletion
    public extern inline function set_BackgroundBModel(value:String):String {
        return untyped this.SetKeyValue("BackgroundBModel",untyped value);
    }
    
    /**
		Portal Version

		(Don't change). Differentiates between shipping HL2 maps and maps using new engine features.
	**/
    public var PortalVersion(get,never):Int;

    @:noCompletion
    public extern inline function get_PortalVersion():Int {
        return untyped this.GetKeyValues().PortalVersion;
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_areaportalwindow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_areaportalwindow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_areaportalwindow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_areaportalwindow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_areaportalwindow");
    }
}





#end
