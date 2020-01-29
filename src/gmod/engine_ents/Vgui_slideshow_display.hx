package gmod.engine_ents;
#if server
/**
	Slideshow Display
**/
@:forward
abstract Vgui_slideshow_display(Entity) to Entity {
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
		Make slideshow visible.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Make slideshow invisible.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Sets the display text.
	**/
    public extern inline function FireSetDisplayText(param:String,delay:Float) {
        untyped this.Fire("SetDisplayText",untyped param,delay);
    }
    
    /**
		Removes all slides from slideshow.
	**/
    public extern inline function FireRemoveAllSlides(delay:Float) {
        untyped this.Fire("RemoveAllSlides",untyped null,delay);
    }
    
    /**
		Adds slides by keyword.
	**/
    public extern inline function FireAddSlides(param:String,delay:Float) {
        untyped this.Fire("AddSlides",untyped param,delay);
    }
    
    /**
		Sets min random time between slides.
	**/
    public extern inline function FireSetMinSlideTime(param:Float,delay:Float) {
        untyped this.Fire("SetMinSlideTime",untyped param,delay);
    }
    
    /**
		Sets max random time between slides.
	**/
    public extern inline function FireSetMaxSlideTime(param:Float,delay:Float) {
        untyped this.Fire("SetMaxSlideTime",untyped param,delay);
    }
    
    /**
		0 - random, 1 - forward, 2 - backward
	**/
    public extern inline function FireSetCycleType(param:Int,delay:Float) {
        untyped this.Fire("SetCycleType",untyped param,delay);
    }
    
    /**
		Sets if lists can be randomly picked twice in a row.
	**/
    public extern inline function FireSetNoListRepeat(param:bool,delay:Float) {
        untyped this.Fire("SetNoListRepeat",untyped param,delay);
    }
    
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
		Display Text
	**/
    public var displaytext(get,set):String;

    @:noCompletion
    public extern inline function get_displaytext():String {
        return untyped this.GetKeyValues().displaytext;
    }
    
    @:noCompletion
    public extern inline function set_displaytext(value:String):String {
        return untyped this.SetKeyValue("displaytext",untyped value);
    }
    
    /**
		Image Directory (materials/vgui/...)
	**/
    public var directory(get,set):String;

    @:noCompletion
    public extern inline function get_directory():String {
        return untyped this.GetKeyValues().directory;
    }
    
    @:noCompletion
    public extern inline function set_directory(value:String):String {
        return untyped this.SetKeyValue("directory",untyped value);
    }
    
    /**
		Min Slide Time

		Minimum amount of random time that a slide is displayed.
	**/
    public var minslidetime(get,set):Float;

    @:noCompletion
    public extern inline function get_minslidetime():Float {
        return untyped this.GetKeyValues().minslidetime;
    }
    
    @:noCompletion
    public extern inline function set_minslidetime(value:Float):Float {
        return untyped this.SetKeyValue("minslidetime",untyped value);
    }
    
    /**
		Max Slide Time

		Maximum amount of random time that a slide is displayed.
	**/
    public var maxslidetime(get,set):Float;

    @:noCompletion
    public extern inline function get_maxslidetime():Float {
        return untyped this.GetKeyValues().maxslidetime;
    }
    
    @:noCompletion
    public extern inline function set_maxslidetime(value:Float):Float {
        return untyped this.SetKeyValue("maxslidetime",untyped value);
    }
    
    /**
		Cycle Type
	**/
    public var cycletype(get,set):Vgui_slideshow_displaycycletypeChoices;

    @:noCompletion
    public extern inline function get_cycletype():Vgui_slideshow_displaycycletypeChoices {
        return untyped this.GetKeyValues().cycletype;
    }
    
    @:noCompletion
    public extern inline function set_cycletype(value:Vgui_slideshow_displaycycletypeChoices):Vgui_slideshow_displaycycletypeChoices {
        return untyped this.SetKeyValue("cycletype",untyped value);
    }
    
    /**
		No List Repeat
	**/
    public var nolistrepeat(get,set):Vgui_slideshow_displaynolistrepeatChoices;

    @:noCompletion
    public extern inline function get_nolistrepeat():Vgui_slideshow_displaynolistrepeatChoices {
        return untyped this.GetKeyValues().nolistrepeat;
    }
    
    @:noCompletion
    public extern inline function set_nolistrepeat(value:Vgui_slideshow_displaynolistrepeatChoices):Vgui_slideshow_displaynolistrepeatChoices {
        return untyped this.SetKeyValue("nolistrepeat",untyped value);
    }
    
    /**
		Panel width

		Width of the panel in units.
	**/
    public var width(get,set):Int;

    @:noCompletion
    public extern inline function get_width():Int {
        return untyped this.GetKeyValues().width;
    }
    
    @:noCompletion
    public extern inline function set_width(value:Int):Int {
        return untyped this.SetKeyValue("width",untyped value);
    }
    
    /**
		Panel height

		Height of the panel in units.
	**/
    public var height(get,set):Int;

    @:noCompletion
    public extern inline function get_height():Int {
        return untyped this.GetKeyValues().height;
    }
    
    @:noCompletion
    public extern inline function set_height(value:Int):Int {
        return untyped this.SetKeyValue("height",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Vgui_slideshow_display}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Vgui_slideshow_display}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Vgui_slideshow_display}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Vgui_slideshow_display}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("vgui_slideshow_display");
    }
}

enum abstract Vgui_slideshow_displaynolistrepeatChoices(Int) to Int {
	var ALLOW_LIST_REPEATS = 0;
	var NO_LIST_REPEATS = 1;
}
enum abstract Vgui_slideshow_displaycycletypeChoices(Int) to Int {
	var RANDOM = 0;
	var FORWARD = 1;
	var BACKWARD = 2;
}




#end
