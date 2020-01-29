package gmod.engine_ents;
#if server
/**
	An invisible omnidirectional lightsource.
**/
@:forward
abstract Light(Entity) to Entity {
    //Inputs
    
    /**
		Turn the light on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		The the light off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggle the light's current state.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Set a custom pattern of light brightness for this light. Pattern format is a string of characters, where 'a' is total darkness, 'z' fully bright. i.e. 'aaggnnttzz' would be a steppy fade in from dark to light.
	**/
    public extern inline function FireSetPattern(param:String,delay:Float) {
        untyped this.Fire("SetPattern",untyped param,delay);
    }
    
    /**
		Fades from first value in old pattern, to first value in the new given pattern. Pattern format is a string of characters, where 'a' is total darkness, 'z' fully bright. i.e. 'aaggnnttzz' would be a steppy fade in from dark to light.
	**/
    public extern inline function FireFadeToPattern(param:String,delay:Float) {
        untyped this.Fire("FadeToPattern",untyped param,delay);
    }
    
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
		Brightness
	**/
    public var _light(get,set):String;

    @:noCompletion
    public extern inline function get__light():String {
        return untyped this.GetKeyValues()._light;
    }
    
    @:noCompletion
    public extern inline function set__light(value:String):String {
        return untyped this.SetKeyValue("_light",untyped value);
    }
    
    /**
		BrightnessHDR
	**/
    public var _lightHDR(get,set):String;

    @:noCompletion
    public extern inline function get__lightHDR():String {
        return untyped this.GetKeyValues()._lightHDR;
    }
    
    @:noCompletion
    public extern inline function set__lightHDR(value:String):String {
        return untyped this.SetKeyValue("_lightHDR",untyped value);
    }
    
    /**
		BrightnessScaleHDR

		Amount to scale the light by when compiling for HDR.
	**/
    public var _lightscaleHDR(get,set):Float;

    @:noCompletion
    public extern inline function get__lightscaleHDR():Float {
        return untyped this.GetKeyValues()._lightscaleHDR;
    }
    
    @:noCompletion
    public extern inline function set__lightscaleHDR(value:Float):Float {
        return untyped this.SetKeyValue("_lightscaleHDR",untyped value);
    }
    
    /**
		Appearance
	**/
    public var style(get,set):Choices;

    @:noCompletion
    public extern inline function get_style():Choices {
        return untyped this.GetKeyValues().style;
    }
    
    @:noCompletion
    public extern inline function set_style(value:Choices):Choices {
        return untyped this.SetKeyValue("style",untyped value);
    }
    
    /**
		Custom Appearance

		Set a custom pattern of light brightness for this light. Pattern format is a string of characters, where 'a' is total darkness, 'z' fully bright. i.e. 'aaggnnttzz' would be a steppy fade in from dark to light.
	**/
    public var pattern(get,set):String;

    @:noCompletion
    public extern inline function get_pattern():String {
        return untyped this.GetKeyValues().pattern;
    }
    
    @:noCompletion
    public extern inline function set_pattern(value:String):String {
        return untyped this.SetKeyValue("pattern",untyped value);
    }
    
    /**
		Constant
	**/
    public var _constant_attn(get,set):String;

    @:noCompletion
    public extern inline function get__constant_attn():String {
        return untyped this.GetKeyValues()._constant_attn;
    }
    
    @:noCompletion
    public extern inline function set__constant_attn(value:String):String {
        return untyped this.SetKeyValue("_constant_attn",untyped value);
    }
    
    /**
		Linear
	**/
    public var _linear_attn(get,set):String;

    @:noCompletion
    public extern inline function get__linear_attn():String {
        return untyped this.GetKeyValues()._linear_attn;
    }
    
    @:noCompletion
    public extern inline function set__linear_attn(value:String):String {
        return untyped this.SetKeyValue("_linear_attn",untyped value);
    }
    
    /**
		Quadratic
	**/
    public var _quadratic_attn(get,set):String;

    @:noCompletion
    public extern inline function get__quadratic_attn():String {
        return untyped this.GetKeyValues()._quadratic_attn;
    }
    
    @:noCompletion
    public extern inline function set__quadratic_attn(value:String):String {
        return untyped this.SetKeyValue("_quadratic_attn",untyped value);
    }
    
    /**
		50 percent falloff distance

		Distance at which brightness should fall off to 50%. If set, overrides linear constant and quadratic paramaters.
	**/
    public var _fifty_percent_distance(get,set):String;

    @:noCompletion
    public extern inline function get__fifty_percent_distance():String {
        return untyped this.GetKeyValues()._fifty_percent_distance;
    }
    
    @:noCompletion
    public extern inline function set__fifty_percent_distance(value:String):String {
        return untyped this.SetKeyValue("_fifty_percent_distance",untyped value);
    }
    
    /**
		0 percent falloff distance

		Distance at which brightness should fall off to negligible (1/256)%. Must set _fifty_percent_distance to use.
	**/
    public var _zero_percent_distance(get,set):String;

    @:noCompletion
    public extern inline function get__zero_percent_distance():String {
        return untyped this.GetKeyValues()._zero_percent_distance;
    }
    
    @:noCompletion
    public extern inline function set__zero_percent_distance(value:String):String {
        return untyped this.SetKeyValue("_zero_percent_distance",untyped value);
    }
    
    /**
		hard falloff

		If set, causes lights to fall to exactly zero beyond the zero percent distance. May cause unrealistic lightijng if not used carefully.
	**/
    public var _hardfalloff(get,set):Int;

    @:noCompletion
    public extern inline function get__hardfalloff():Int {
        return untyped this.GetKeyValues()._hardfalloff;
    }
    
    @:noCompletion
    public extern inline function set__hardfalloff(value:Int):Int {
        return untyped this.SetKeyValue("_hardfalloff",untyped value);
    }
    
    /**
		Cast entity shadows

		Objects illuminated by this light will cast a directional shadow.
	**/
    public var _castentityshadow(get,set):Choices;

    @:noCompletion
    public extern inline function get__castentityshadow():Choices {
        return untyped this.GetKeyValues()._castentityshadow;
    }
    
    @:noCompletion
    public extern inline function set__castentityshadow(value:Choices):Choices {
        return untyped this.SetKeyValue("_castentityshadow",untyped value);
    }
    
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
		Entity To Point At

		The name of an entity in the map that the spotlight will point at. This will override the spotlight's angles.
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
		Maximum Distance

		This is the distance that light is allowed to cast, in inches.
	**/
    public var _distance(get,set):Int;

    @:noCompletion
    public extern inline function get__distance():Int {
        return untyped this.GetKeyValues()._distance;
    }
    
    @:noCompletion
    public extern inline function set__distance(value:Int):Int {
        return untyped this.SetKeyValue("_distance",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Light}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Light}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Light}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Light}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:LightSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:LightSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<LightSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("light");
    }
}



enum abstract LightSpawnFlags(Int) to Int {
	var INITIALLY_DARK = 1;
}

#end
