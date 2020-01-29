package gmod.engine_ents;
#if server
/**
	An entity that acts as a microphone. It works in one of two modes. If it has a 'Speaker' set, it picks up all sounds within the specified sound range, and rebroadcasts them through the Speaker entity. In this Speaker mode, it ignores the Hears X spawnflags and does not fire the SoundLevel output. If it has no Speaker set, it measures the sound level at a point, and outputs the sound level as a value between 0 and 1. In Measuring mode, it only hears sounds that match the Hear X spawnflags.
**/
@:forward
abstract Env_microphone(Entity) to Entity {
    //Inputs
    
    /**
		Enable this entity.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Changes the entity's parent in the movement hierarchy.
	**/
    public extern inline function FireSetParent(param:String,delay:Float) {
        untyped this.Fire("SetParent",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on its parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment.
	**/
    public extern inline function FireSetParentAttachment(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachment",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on it's parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment. The entity will maintain it's position relative to the parent at the time it is attached.
	**/
    public extern inline function FireSetParentAttachmentMaintainOffset(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachmentMaintainOffset",untyped param,delay);
    }
    
    /**
		Removes this entity from the the movement hierarchy, leaving it free to move independently.
	**/
    public extern inline function FireClearParent(delay:Float) {
        untyped this.Fire("ClearParent",untyped null,delay);
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
    
    /**
		Set the microphone to output through a different speaker entity.
	**/
    public extern inline function FireSetSpeakerName(param:String,delay:Float) {
        untyped this.Fire("SetSpeakerName",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Env_microphoneStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Env_microphoneStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Env_microphoneStartDisabledChoices):Env_microphoneStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Parent

		The name of this entity's parent in the movement hierarchy. Entities with parents move with their parent.
	**/
    public var parentname(get,set):String;

    @:noCompletion
    public extern inline function get_parentname():String {
        return untyped this.GetKeyValues().parentname;
    }
    
    @:noCompletion
    public extern inline function set_parentname(value:String):String {
        return untyped this.SetKeyValue("parentname",untyped value);
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
		Measure target

		If the speaker is in Measuring mode, this is the name of the entity where the sound level is to be measured.
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
		Speaker target

		The name of an info_target entity through which to play any sounds heard by this microphone. If specified, the microphone will consider itself in Speaker mode.
	**/
    public var SpeakerName(get,set):String;

    @:noCompletion
    public extern inline function get_SpeakerName():String {
        return untyped this.GetKeyValues().SpeakerName;
    }
    
    @:noCompletion
    public extern inline function set_SpeakerName(value:String):String {
        return untyped this.SetKeyValue("SpeakerName",untyped value);
    }
    
    /**
		Listen Filter

		The name of an filter entity which specifies the only entities the microphone can hear. Sounds emitted by other entities will not be heard.
	**/
    public var ListenFilter(get,set):String;

    @:noCompletion
    public extern inline function get_ListenFilter():String {
        return untyped this.GetKeyValues().ListenFilter;
    }
    
    @:noCompletion
    public extern inline function set_ListenFilter(value:String):String {
        return untyped this.SetKeyValue("ListenFilter",untyped value);
    }
    
    /**
		Speaker DSP Preset

		Only useful in Speaker mode. If specified, when the microphone is enabled, it'll set the global dsp_speaker preset to this value. Sounds played back through speakers will then be affected by the selected DSP.
	**/
    public var speaker_dsp_preset(get,set):Env_microphonespeaker_dsp_presetChoices;

    @:noCompletion
    public extern inline function get_speaker_dsp_preset():Env_microphonespeaker_dsp_presetChoices {
        return untyped this.GetKeyValues().speaker_dsp_preset;
    }
    
    @:noCompletion
    public extern inline function set_speaker_dsp_preset(value:Env_microphonespeaker_dsp_presetChoices):Env_microphonespeaker_dsp_presetChoices {
        return untyped this.SetKeyValue("speaker_dsp_preset",untyped value);
    }
    
    /**
		Sensitivity (0 - 10)

		Microphone sensitivity, 0=deaf, 1=default, 10=extremely sensitive). Only applicable in Measuring mode.
	**/
    public var Sensitivity(get,set):Float;

    @:noCompletion
    public extern inline function get_Sensitivity():Float {
        return untyped this.GetKeyValues().Sensitivity;
    }
    
    @:noCompletion
    public extern inline function set_Sensitivity(value:Float):Float {
        return untyped this.SetKeyValue("Sensitivity",untyped value);
    }
    
    /**
		Smoothing (0 - 1)

		Smoothing factor, 0=no smoothing, 1=maximum smoothing). Only applicable in Measuring mode.
	**/
    public var SmoothFactor(get,set):Float;

    @:noCompletion
    public extern inline function get_SmoothFactor():Float {
        return untyped this.GetKeyValues().SmoothFactor;
    }
    
    @:noCompletion
    public extern inline function set_SmoothFactor(value:Float):Float {
        return untyped this.SetKeyValue("SmoothFactor",untyped value);
    }
    
    /**
		Maximum hearing range (0=infinite)

		Sounds beyond this range won't be heard, irrelevant of attenuation. WARNING: setting this to zero (or a value > 1024) when the microphone is in Speaker mode can be very bad for performance!!
	**/
    public var MaxRange(get,set):Float;

    @:noCompletion
    public extern inline function get_MaxRange():Float {
        return untyped this.GetKeyValues().MaxRange;
    }
    
    @:noCompletion
    public extern inline function set_MaxRange(value:Float):Float {
        return untyped this.SetKeyValue("MaxRange",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired in Measuring mode whenever the sound level changes.
	**/
    public extern inline function OutputSoundLevel(callback:Callback<{activator:Env_microphone,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SoundLevel",callback);
    }
    
    /**
		Fired whenever a sound is routed out through the specified speaker (if any).
	**/
    public extern inline function OutputOnRoutedSound(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnRoutedSound",callback);
    }
    
    /**
		Fired whenever this microphone hears any sound it cares about.
	**/
    public extern inline function OutputOnHeardSound(callback:Callback<{activator:Env_microphone}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHeardSound",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_microphoneSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_microphoneSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_microphoneSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_microphone");
    }
}

enum abstract Env_microphonespeaker_dsp_presetChoices(Int) to Int {
	var USE_DEFAULT = 0;
	var _1_NO_EFFECT = 50;
	var _2_DUPLICATE_OF_1 = 51;
	var _3_DUPLICATE_OF_1 = 52;
	var _4_DUPLICATE_OF_1 = 53;
	var _5_DUPLICATE_OF_1 = 54;
	var _6_SPEAKER_LOUDER = 55;
	var _7_SPEAKER_VERY_SMALL = 56;
	var _8_LOUDSPEAKER_ECHO = 57;
	var _9_SPEAKER_SMALL = 58;
	var _10_SPEAKER_TINY = 59;
}
enum abstract Env_microphoneStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_microphoneSpawnFlags(Int) to Int {
	var HEARS_COMBAT_SOUNDS = 1;
	var HEARS_WORLD_SOUNDS = 2;
	var HEARS_PLAYER_SOUNDS = 4;
	var HEARS_BULLET_IMPACTS = 8;
	var SWALLOWS_SOUNDS_ROUTED_THROUGH_SPEAKERS = 16;
	var HEARS_EXPLOSIONS = 32;
	var IGNORES_NONATTENUATED_SOUNDS = 64;
}

#end
