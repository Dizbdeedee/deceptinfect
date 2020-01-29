package gmod.engine_ents;
#if server
/**
	Control the sky colours
**/
@:forward
abstract Env_skypaint(Entity) to Entity {
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
		Sky Top Color

		The colour of the top of the sky
	**/
    public var topcolor(get,set):String;

    @:noCompletion
    public extern inline function get_topcolor():String {
        return untyped this.GetKeyValues().topcolor;
    }
    
    @:noCompletion
    public extern inline function set_topcolor(value:String):String {
        return untyped this.SetKeyValue("topcolor",untyped value);
    }
    
    /**
		Sky Bottom Color

		The colour of the bottom of the sky
	**/
    public var bottomcolor(get,set):String;

    @:noCompletion
    public extern inline function get_bottomcolor():String {
        return untyped this.GetKeyValues().bottomcolor;
    }
    
    @:noCompletion
    public extern inline function set_bottomcolor(value:String):String {
        return untyped this.SetKeyValue("bottomcolor",untyped value);
    }
    
    /**
		Sky Fade Bias

		Controls the bias of the fade between top/bottom (1.0 is even)
	**/
    public var fadebias(get,set):Float;

    @:noCompletion
    public extern inline function get_fadebias():Float {
        return untyped this.GetKeyValues().fadebias;
    }
    
    @:noCompletion
    public extern inline function set_fadebias(value:Float):Float {
        return untyped this.SetKeyValue("fadebias",untyped value);
    }
    
    /**
		Sun Size

		Controls the size of the sun glow
	**/
    public var sunsize(get,set):Float;

    @:noCompletion
    public extern inline function get_sunsize():Float {
        return untyped this.GetKeyValues().sunsize;
    }
    
    @:noCompletion
    public extern inline function set_sunsize(value:Float):Float {
        return untyped this.SetKeyValue("sunsize",untyped value);
    }
    
    /**
		Sun Normal

		The position of the sun, expressed as a normal from the center of the world
	**/
    public var sunnormal(get,set):Vector;

    @:noCompletion
    public extern inline function get_sunnormal():Vector {
        return untyped this.GetKeyValues().sunnormal;
    }
    
    @:noCompletion
    public extern inline function set_sunnormal(value:Vector):Vector {
        return untyped this.SetKeyValue("sunnormal",untyped value);
    }
    
    /**
		Sun Position Method

		How should we determine the position of the sun?
	**/
    public var sunposmethod(get,set):Env_skypaintsunposmethodChoices;

    @:noCompletion
    public extern inline function get_sunposmethod():Env_skypaintsunposmethodChoices {
        return untyped this.GetKeyValues().sunposmethod;
    }
    
    @:noCompletion
    public extern inline function set_sunposmethod(value:Env_skypaintsunposmethodChoices):Env_skypaintsunposmethodChoices {
        return untyped this.SetKeyValue("sunposmethod",untyped value);
    }
    
    /**
		Sun Color

		The color of the sun glow (this is additive)
	**/
    public var suncolor(get,set):String;

    @:noCompletion
    public extern inline function get_suncolor():String {
        return untyped this.GetKeyValues().suncolor;
    }
    
    @:noCompletion
    public extern inline function set_suncolor(value:String):String {
        return untyped this.SetKeyValue("suncolor",untyped value);
    }
    
    /**
		Dusk Scale

		The size of the dusk effect (colouring of the horizon)
	**/
    public var duskscale(get,set):Float;

    @:noCompletion
    public extern inline function get_duskscale():Float {
        return untyped this.GetKeyValues().duskscale;
    }
    
    @:noCompletion
    public extern inline function set_duskscale(value:Float):Float {
        return untyped this.SetKeyValue("duskscale",untyped value);
    }
    
    /**
		Dusk Intensity

		How powerful the dusk effect is
	**/
    public var duskintensity(get,set):Float;

    @:noCompletion
    public extern inline function get_duskintensity():Float {
        return untyped this.GetKeyValues().duskintensity;
    }
    
    @:noCompletion
    public extern inline function set_duskintensity(value:Float):Float {
        return untyped this.SetKeyValue("duskintensity",untyped value);
    }
    
    /**
		Dusk Color

		The color of the dusk effect
	**/
    public var duskcolor(get,set):String;

    @:noCompletion
    public extern inline function get_duskcolor():String {
        return untyped this.GetKeyValues().duskcolor;
    }
    
    @:noCompletion
    public extern inline function set_duskcolor(value:String):String {
        return untyped this.SetKeyValue("duskcolor",untyped value);
    }
    
    /**
		Draw Stars

		
	**/
    public var drawstars(get,set):Env_skypaintdrawstarsChoices;

    @:noCompletion
    public extern inline function get_drawstars():Env_skypaintdrawstarsChoices {
        return untyped this.GetKeyValues().drawstars;
    }
    
    @:noCompletion
    public extern inline function set_drawstars(value:Env_skypaintdrawstarsChoices):Env_skypaintdrawstarsChoices {
        return untyped this.SetKeyValue("drawstars",untyped value);
    }
    
    /**
		Star Texture

		The star texture
	**/
    public var startexture(get,set):String;

    @:noCompletion
    public extern inline function get_startexture():String {
        return untyped this.GetKeyValues().startexture;
    }
    
    @:noCompletion
    public extern inline function set_startexture(value:String):String {
        return untyped this.SetKeyValue("startexture",untyped value);
    }
    
    /**
		Star Scale

		How big the star texture should be
	**/
    public var starscale(get,set):Float;

    @:noCompletion
    public extern inline function get_starscale():Float {
        return untyped this.GetKeyValues().starscale;
    }
    
    @:noCompletion
    public extern inline function set_starscale(value:Float):Float {
        return untyped this.SetKeyValue("starscale",untyped value);
    }
    
    /**
		Star Fade

		Fade the star texture towards the horizon
	**/
    public var starfade(get,set):Float;

    @:noCompletion
    public extern inline function get_starfade():Float {
        return untyped this.GetKeyValues().starfade;
    }
    
    @:noCompletion
    public extern inline function set_starfade(value:Float):Float {
        return untyped this.SetKeyValue("starfade",untyped value);
    }
    
    /**
		Star Speed

		How fast the star texture should scroll across the sky
	**/
    public var starspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_starspeed():Float {
        return untyped this.GetKeyValues().starspeed;
    }
    
    @:noCompletion
    public extern inline function set_starspeed(value:Float):Float {
        return untyped this.SetKeyValue("starspeed",untyped value);
    }
    
    /**
		HDR Scale

		When rendering your skybox in HDR mode, output will be scaled by this amount.
	**/
    public var hdrscale(get,set):Float;

    @:noCompletion
    public extern inline function get_hdrscale():Float {
        return untyped this.GetKeyValues().hdrscale;
    }
    
    @:noCompletion
    public extern inline function set_hdrscale(value:Float):Float {
        return untyped this.SetKeyValue("hdrscale",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_skypaint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_skypaint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_skypaint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_skypaint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_skypaint");
    }
}

enum abstract Env_skypaintsunposmethodChoices(Int) to Int {
	var CUSTOM__USE_THE_SUN_NORMAL_TO_POSITION_THE_SUN = 0;
	var AUTOMATIC__FIND_A_ENVSUN_ENTITY_AND_USE_THAT = 1;
}
enum abstract Env_skypaintdrawstarsChoices(Int) to Int {
	var NO__DONT_DRAW_STARS = 0;
	var YES__DRAW_THE_STARS_PLEASE = 1;
}




#end
