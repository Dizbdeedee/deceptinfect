package gmod.engine_ents;
#if server
/**
	This entity makes sounds or smells that can be sensed by NPCs, butnot by the player. This can be used to cause reactions in nearby NPCs.

Sound Types
  Combat: Will cause most NPCs to become alert
  World: Will cause most NPCs to become alert
  Danger: Will cause most NPCs to move away from the position of the sound
  Bullet Impact: 
  Carcass: 
  Meat: 
  Garbage: 
  Thumper: causes antlions to run away briefly
  Readiness: (Low, Medium, High) Causes player companions that can hear this sound to change readiness

**/
@:forward
abstract Ai_sound(Entity) to Entity {
    //Inputs
    
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
		Make the sound.
	**/
    public extern inline function FireEmitAISound(delay:Float) {
        untyped this.Fire("EmitAISound",untyped null,delay);
    }
    
    //Keyvalues
    
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
		Volume

		How far away this sound can be heard. This is a radius.
	**/
    public var volume(get,set):Int;

    @:noCompletion
    public extern inline function get_volume():Int {
        return untyped this.GetKeyValues().volume;
    }
    
    @:noCompletion
    public extern inline function set_volume(value:Int):Int {
        return untyped this.SetKeyValue("volume",untyped value);
    }
    
    /**
		Duration

		How long the sound persists each time you insert it.
	**/
    public var duration(get,set):Float;

    @:noCompletion
    public extern inline function get_duration():Float {
        return untyped this.GetKeyValues().duration;
    }
    
    @:noCompletion
    public extern inline function set_duration(value:Float):Float {
        return untyped this.SetKeyValue("duration",untyped value);
    }
    
    /**
		Sound Type

		The type of sound or smell will determine the reaction of NPCs that sense it.
	**/
    public var soundtype(get,set):Ai_soundsoundtypeChoices;

    @:noCompletion
    public extern inline function get_soundtype():Ai_soundsoundtypeChoices {
        return untyped this.GetKeyValues().soundtype;
    }
    
    @:noCompletion
    public extern inline function set_soundtype(value:Ai_soundsoundtypeChoices):Ai_soundsoundtypeChoices {
        return untyped this.SetKeyValue("soundtype",untyped value);
    }
    
    /**
		Additional sound context (optional)

		Optional settings specifying such things as who can or cannot hear the sound.
	**/
    public var soundcontext(get,set):Ai_soundsoundcontextChoices;

    @:noCompletion
    public extern inline function get_soundcontext():Ai_soundsoundcontextChoices {
        return untyped this.GetKeyValues().soundcontext;
    }
    
    @:noCompletion
    public extern inline function set_soundcontext(value:Ai_soundsoundcontextChoices):Ai_soundsoundcontextChoices {
        return untyped this.SetKeyValue("soundcontext",untyped value);
    }
    
    /**
		Location Proxy

		The name of an entity to use as a proxy to determine the location at which to make the sound. If you specify an entity here, the sound will be made at that entity's location (!player included)
	**/
    public var locationproxy(get,set):String;

    @:noCompletion
    public extern inline function get_locationproxy():String {
        return untyped this.GetKeyValues().locationproxy;
    }
    
    @:noCompletion
    public extern inline function set_locationproxy(value:String):String {
        return untyped this.SetKeyValue("locationproxy",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_sound}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_sound}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_sound}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_sound}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_sound");
    }
}

enum abstract Ai_soundsoundtypeChoices(Int) to Int {
	var SELECT_ONE = 0;
	var COMBAT = 1;
	var WORLD = 2;
	var DANGER = 8;
	var BULLET_IMPACT = 16;
	var CARCASS = 32;
	var MEAT = 64;
	var GARBAGE = 128;
	var THUMPER = 256;
	var MOVE_AWAY__MOST_NPCS_WILL_CLEAR_THE_RADIUS_OF_THIS_SOUND_WHEN_HEARD = 4096;
	var READINESS__LOW = 16384;
	var READINESS__MEDIUM = 32768;
	var READINESS__HIGH = 65536;
}
enum abstract Ai_soundsoundcontextChoices(Int) to Int {
	var SELECT_ONE = 0;
	var ONLY_COMBINE_HEAR = 8388608;
	var COMBINE_CANNOT_HEAR = 67108864;
}




#end
