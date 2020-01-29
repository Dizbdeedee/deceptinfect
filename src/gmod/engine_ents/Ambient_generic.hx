package gmod.engine_ents;
#if server
/**
	Universal ambient sound. Use it to play and control a single sound.
**/
@:forward
abstract Ambient_generic(Entity) to Entity {
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
		Sets the sound pitch, expressed as a range from 1 to 255, where 100 is the sound's default pitch.
	**/
    public extern inline function FirePitch(param:Int,delay:Float) {
        untyped this.Fire("Pitch",untyped param,delay);
    }
    
    /**
		Starts the sound.
	**/
    public extern inline function FirePlaySound(delay:Float) {
        untyped this.Fire("PlaySound",untyped null,delay);
    }
    
    /**
		Stops the sound if it is playing.
	**/
    public extern inline function FireStopSound(delay:Float) {
        untyped this.Fire("StopSound",untyped null,delay);
    }
    
    /**
		Toggles the sound between playing and stopping.
	**/
    public extern inline function FireToggleSound(delay:Float) {
        untyped this.Fire("ToggleSound",untyped null,delay);
    }
    
    /**
		Sets the sound volume, expressed as a range from 0 to 10, where 10 is the loudest.
	**/
    public extern inline function FireVolume(param:Int,delay:Float) {
        untyped this.Fire("Volume",untyped param,delay);
    }
    
    /**
		Fades the sound up to full volume over a specified number of seconds, with a range from 0 to 100 seconds.
	**/
    public extern inline function FireFadeIn(param:Int,delay:Float) {
        untyped this.Fire("FadeIn",untyped param,delay);
    }
    
    /**
		Fades the sound to silence over a specified number of seconds, with a range from 0 to 100 seconds.
	**/
    public extern inline function FireFadeOut(param:Int,delay:Float) {
        untyped this.Fire("FadeOut",untyped param,delay);
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
		Sound Name

		Name of the GameSound entry for the sound to play. Also supports direct .wav filenames.
	**/
    public var message(get,set):String;

    @:noCompletion
    public extern inline function get_message():String {
        return untyped this.GetKeyValues().message;
    }
    
    @:noCompletion
    public extern inline function set_message(value:String):String {
        return untyped this.SetKeyValue("message",untyped value);
    }
    
    /**
		Volume

		Sound volume, expressed as a range from 0 to 10, where 10 is the loudest.
	**/
    public var health(get,set):Int;

    @:noCompletion
    public extern inline function get_health():Int {
        return untyped this.GetKeyValues().health;
    }
    
    @:noCompletion
    public extern inline function set_health(value:Int):Int {
        return untyped this.SetKeyValue("health",untyped value);
    }
    
    /**
		Dynamic Presets
	**/
    public var preset(get,set):Ambient_genericpresetChoices;

    @:noCompletion
    public extern inline function get_preset():Ambient_genericpresetChoices {
        return untyped this.GetKeyValues().preset;
    }
    
    @:noCompletion
    public extern inline function set_preset(value:Ambient_genericpresetChoices):Ambient_genericpresetChoices {
        return untyped this.SetKeyValue("preset",untyped value);
    }
    
    /**
		Start Volume
	**/
    public var volstart(get,set):Int;

    @:noCompletion
    public extern inline function get_volstart():Int {
        return untyped this.GetKeyValues().volstart;
    }
    
    @:noCompletion
    public extern inline function set_volstart(value:Int):Int {
        return untyped this.SetKeyValue("volstart",untyped value);
    }
    
    /**
		Fade in time in seconds (0-100)
	**/
    public var fadeinsecs(get,set):Int;

    @:noCompletion
    public extern inline function get_fadeinsecs():Int {
        return untyped this.GetKeyValues().fadeinsecs;
    }
    
    @:noCompletion
    public extern inline function set_fadeinsecs(value:Int):Int {
        return untyped this.SetKeyValue("fadeinsecs",untyped value);
    }
    
    /**
		Fade out time in seconds (0-100)
	**/
    public var fadeoutsecs(get,set):Int;

    @:noCompletion
    public extern inline function get_fadeoutsecs():Int {
        return untyped this.GetKeyValues().fadeoutsecs;
    }
    
    @:noCompletion
    public extern inline function set_fadeoutsecs(value:Int):Int {
        return untyped this.SetKeyValue("fadeoutsecs",untyped value);
    }
    
    /**
		Pitch

		Sound pitch, expressed as a range from 1 to 255, where 100 is the sound's default pitch.
	**/
    public var pitch(get,set):Int;

    @:noCompletion
    public extern inline function get_pitch():Int {
        return untyped this.GetKeyValues().pitch;
    }
    
    @:noCompletion
    public extern inline function set_pitch(value:Int):Int {
        return untyped this.SetKeyValue("pitch",untyped value);
    }
    
    /**
		Start Pitch
	**/
    public var pitchstart(get,set):Int;

    @:noCompletion
    public extern inline function get_pitchstart():Int {
        return untyped this.GetKeyValues().pitchstart;
    }
    
    @:noCompletion
    public extern inline function set_pitchstart(value:Int):Int {
        return untyped this.SetKeyValue("pitchstart",untyped value);
    }
    
    /**
		Spin up time (0-100)
	**/
    public var spinup(get,set):Int;

    @:noCompletion
    public extern inline function get_spinup():Int {
        return untyped this.GetKeyValues().spinup;
    }
    
    @:noCompletion
    public extern inline function set_spinup(value:Int):Int {
        return untyped this.SetKeyValue("spinup",untyped value);
    }
    
    /**
		Spin down time (0-100)
	**/
    public var spindown(get,set):Int;

    @:noCompletion
    public extern inline function get_spindown():Int {
        return untyped this.GetKeyValues().spindown;
    }
    
    @:noCompletion
    public extern inline function set_spindown(value:Int):Int {
        return untyped this.SetKeyValue("spindown",untyped value);
    }
    
    /**
		LFO type 0)off 1)sqr 2)tri 3)rnd
	**/
    public var lfotype(get,set):Int;

    @:noCompletion
    public extern inline function get_lfotype():Int {
        return untyped this.GetKeyValues().lfotype;
    }
    
    @:noCompletion
    public extern inline function set_lfotype(value:Int):Int {
        return untyped this.SetKeyValue("lfotype",untyped value);
    }
    
    /**
		LFO rate (0-1000)
	**/
    public var lforate(get,set):Int;

    @:noCompletion
    public extern inline function get_lforate():Int {
        return untyped this.GetKeyValues().lforate;
    }
    
    @:noCompletion
    public extern inline function set_lforate(value:Int):Int {
        return untyped this.SetKeyValue("lforate",untyped value);
    }
    
    /**
		LFO mod pitch (0-100)
	**/
    public var lfomodpitch(get,set):Int;

    @:noCompletion
    public extern inline function get_lfomodpitch():Int {
        return untyped this.GetKeyValues().lfomodpitch;
    }
    
    @:noCompletion
    public extern inline function set_lfomodpitch(value:Int):Int {
        return untyped this.SetKeyValue("lfomodpitch",untyped value);
    }
    
    /**
		LFO mod vol (0-100)
	**/
    public var lfomodvol(get,set):Int;

    @:noCompletion
    public extern inline function get_lfomodvol():Int {
        return untyped this.GetKeyValues().lfomodvol;
    }
    
    @:noCompletion
    public extern inline function set_lfomodvol(value:Int):Int {
        return untyped this.SetKeyValue("lfomodvol",untyped value);
    }
    
    /**
		Incremental Spinup Count
	**/
    public var cspinup(get,set):Int;

    @:noCompletion
    public extern inline function get_cspinup():Int {
        return untyped this.GetKeyValues().cspinup;
    }
    
    @:noCompletion
    public extern inline function set_cspinup(value:Int):Int {
        return untyped this.SetKeyValue("cspinup",untyped value);
    }
    
    /**
		Max Audible Distance

		Maximum distance at which this sound is audible.
	**/
    public var radius(get,set):String;

    @:noCompletion
    public extern inline function get_radius():String {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:String):String {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		SourceEntityName

		If an entity is specified, sound will come from this named entity instead of the location of ambient_generic.
	**/
    public var SourceEntityName(get,set):String;

    @:noCompletion
    public extern inline function get_SourceEntityName():String {
        return untyped this.GetKeyValues().SourceEntityName;
    }
    
    @:noCompletion
    public extern inline function set_SourceEntityName(value:String):String {
        return untyped this.SetKeyValue("SourceEntityName",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ambient_generic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ambient_generic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ambient_generic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ambient_generic}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Ambient_genericSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Ambient_genericSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Ambient_genericSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ambient_generic");
    }
}

enum abstract Ambient_genericpresetChoices(Int) to Int {
	var NONE = 0;
	var HUGE_MACHINE = 1;
	var BIG_MACHINE = 2;
	var MACHINE = 3;
	var SLOW_FADE_IN = 4;
	var FADE_IN = 5;
	var QUICK_FADE_IN = 6;
	var SLOW_PULSE = 7;
	var PULSE = 8;
	var QUICK_PULSE = 9;
	var SLOW_OSCILLATOR = 10;
	var OSCILLATOR = 11;
	var QUICK_OSCILLATOR = 12;
	var GRUNGE_PITCH = 13;
	var VERY_LOW_PITCH = 14;
	var LOW_PITCH = 15;
	var HIGH_PITCH = 16;
	var VERY_HIGH_PITCH = 17;
	var SCREAMING_PITCH = 18;
	var OSCILLATE_SPINUPDOWN = 19;
	var PULSE_SPINUPDOWN = 20;
	var RANDOM_PITCH = 21;
	var RANDOM_PITCH_FAST = 22;
	var INCREMENTAL_SPINUP = 23;
	var ALIEN = 24;
	var BIZZARE = 25;
	var PLANET_X = 26;
	var HAUNTED = 27;
}


enum abstract Ambient_genericSpawnFlags(Int) to Int {
	var PLAY_EVERYWHERE = 1;
	var START_SILENT = 16;
	var IS_NOT_LOOPED = 32;
}

#end
