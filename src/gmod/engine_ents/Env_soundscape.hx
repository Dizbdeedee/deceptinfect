package gmod.engine_ents;
#if server
/**
	An entity to control sound in an area. The active soundscape at any time is the last one that had line-of-sight to the player, and was within the radius.
**/
@:forward
abstract Env_soundscape(Entity) to Entity {
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
		Enable the soundscape.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the soundscape.
	**/
    public extern inline function FireDisabled(delay:Float) {
        untyped this.Fire("Disabled",untyped null,delay);
    }
    
    /**
		Toggle the soundscape enabled state.
	**/
    public extern inline function FireToggleEnabled(delay:Float) {
        untyped this.Fire("ToggleEnabled",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Env_soundscapeStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Env_soundscapeStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Env_soundscapeStartDisabledChoices):Env_soundscapeStartDisabledChoices {
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
		Radius

		If set to -1, then the player can hear the soundscape as long as he can see it (regardless of distance to it).
	**/
    public var radius(get,set):Int;

    @:noCompletion
    public extern inline function get_radius():Int {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:Int):Int {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		Soundscape

		The name of the soundscape to use. Corresponds to an entry in the soundscapes*.txt file in the hl2\scripts directory.
	**/
    public var soundscape(get,set):Env_soundscapesoundscapeChoices;

    @:noCompletion
    public extern inline function get_soundscape():Env_soundscapesoundscapeChoices {
        return untyped this.GetKeyValues().soundscape;
    }
    
    @:noCompletion
    public extern inline function set_soundscape(value:Env_soundscapesoundscapeChoices):Env_soundscapesoundscapeChoices {
        return untyped this.SetKeyValue("soundscape",untyped value);
    }
    
    /**
		Sound Position 0

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position0(get,set):String;

    @:noCompletion
    public extern inline function get_position0():String {
        return untyped this.GetKeyValues().position0;
    }
    
    @:noCompletion
    public extern inline function set_position0(value:String):String {
        return untyped this.SetKeyValue("position0",untyped value);
    }
    
    /**
		Sound Position 1

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position1(get,set):String;

    @:noCompletion
    public extern inline function get_position1():String {
        return untyped this.GetKeyValues().position1;
    }
    
    @:noCompletion
    public extern inline function set_position1(value:String):String {
        return untyped this.SetKeyValue("position1",untyped value);
    }
    
    /**
		Sound Position 2

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position2(get,set):String;

    @:noCompletion
    public extern inline function get_position2():String {
        return untyped this.GetKeyValues().position2;
    }
    
    @:noCompletion
    public extern inline function set_position2(value:String):String {
        return untyped this.SetKeyValue("position2",untyped value);
    }
    
    /**
		Sound Position 3

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position3(get,set):String;

    @:noCompletion
    public extern inline function get_position3():String {
        return untyped this.GetKeyValues().position3;
    }
    
    @:noCompletion
    public extern inline function set_position3(value:String):String {
        return untyped this.SetKeyValue("position3",untyped value);
    }
    
    /**
		Sound Position 4

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position4(get,set):String;

    @:noCompletion
    public extern inline function get_position4():String {
        return untyped this.GetKeyValues().position4;
    }
    
    @:noCompletion
    public extern inline function set_position4(value:String):String {
        return untyped this.SetKeyValue("position4",untyped value);
    }
    
    /**
		Sound Position 5

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position5(get,set):String;

    @:noCompletion
    public extern inline function get_position5():String {
        return untyped this.GetKeyValues().position5;
    }
    
    @:noCompletion
    public extern inline function set_position5(value:String):String {
        return untyped this.SetKeyValue("position5",untyped value);
    }
    
    /**
		Sound Position 6

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position6(get,set):String;

    @:noCompletion
    public extern inline function get_position6():String {
        return untyped this.GetKeyValues().position6;
    }
    
    @:noCompletion
    public extern inline function set_position6(value:String):String {
        return untyped this.SetKeyValue("position6",untyped value);
    }
    
    /**
		Sound Position 7

		A sound position that will be referenced inside the soundscape text file. Usually used to position a set of sounds within the world.
	**/
    public var position7(get,set):String;

    @:noCompletion
    public extern inline function get_position7():String {
        return untyped this.GetKeyValues().position7;
    }
    
    @:noCompletion
    public extern inline function set_position7(value:String):String {
        return untyped this.SetKeyValue("position7",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_soundscape}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_soundscape}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_soundscape}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_soundscape}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when this soundscape becomes the active one.
	**/
    public extern inline function OutputOnPlay(callback:Callback<{activator:Env_soundscape}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlay",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_soundscape");
    }
}

enum abstract Env_soundscapesoundscapeChoices(String) to String {
	var NOTHING = "Nothing";
	var AUTOMATIC = "Automatic";
	var AUTOMATIC_DIALOG = "Automatic_Dialog";
	var INDOOR = "GenericIndoor";
	var OUTDOOR = "GenericOutdoor";
}
enum abstract Env_soundscapeStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
