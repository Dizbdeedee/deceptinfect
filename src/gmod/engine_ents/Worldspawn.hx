package gmod.engine_ents;
#if server
/**
	This is the world entity. Each map can only contain one, and it's automatically created for you.
**/
@:forward
abstract Worldspawn(Entity) to Entity {
    //Inputs
    
    /**
		Adds a context to this entity's list of response contexts. The format should be 'key:value'.
	**/
    public extern inline function FireAddContext(param:String,delay:Float) {
        untyped this.Fire("AddContext",untyped param,delay);
    }
    
    /**
		Remove a context from this entity's list of response contexts. The name should match the 'key' of a previously added context.
	**/
    public extern inline function FireRemoveContext(param:String,delay:Float) {
        untyped this.Fire("RemoveContext",untyped param,delay);
    }
    
    /**
		Removes all contexts in this entity's list of response contexts.
	**/
    public extern inline function FireClearContext(delay:Float) {
        untyped this.Fire("ClearContext",untyped null,delay);
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
		Response Contexts

		Response system context(s) for this entity. Format should be: 'key:value,key2:value2,etc'. When this entity speaks, the list of keys & values will be passed to the response rules system.
	**/
    public var ResponseContext(get,set):String;

    @:noCompletion
    public extern inline function get_ResponseContext():String {
        return untyped this.GetKeyValues().ResponseContext;
    }
    
    @:noCompletion
    public extern inline function set_ResponseContext(value:String):String {
        return untyped this.SetKeyValue("ResponseContext",untyped value);
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
		Map Description / Title
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
		SkyBox Texture Name
	**/
    public var skyname(get,set):String;

    @:noCompletion
    public extern inline function get_skyname():String {
        return untyped this.GetKeyValues().skyname;
    }
    
    @:noCompletion
    public extern inline function set_skyname(value:String):String {
        return untyped this.SetKeyValue("skyname",untyped value);
    }
    
    /**
		Chapter Title Message

		Chapter Title that appears onscreen when this level starts.
	**/
    public var chaptertitle(get,set):String;

    @:noCompletion
    public extern inline function get_chaptertitle():String {
        return untyped this.GetKeyValues().chaptertitle;
    }
    
    @:noCompletion
    public extern inline function set_chaptertitle(value:String):String {
        return untyped this.SetKeyValue("chaptertitle",untyped value);
    }
    
    /**
		Level Fade In
	**/
    public var startdark(get,set):WorldspawnstartdarkChoices;

    @:noCompletion
    public extern inline function get_startdark():WorldspawnstartdarkChoices {
        return untyped this.GetKeyValues().startdark;
    }
    
    @:noCompletion
    public extern inline function set_startdark(value:WorldspawnstartdarkChoices):WorldspawnstartdarkChoices {
        return untyped this.SetKeyValue("startdark",untyped value);
    }
    
    /**
		Display Game Title

		Game Title that appears onscreen when this level starts.
	**/
    public var gametitle(get,set):WorldspawngametitleChoices;

    @:noCompletion
    public extern inline function get_gametitle():WorldspawngametitleChoices {
        return untyped this.GetKeyValues().gametitle;
    }
    
    @:noCompletion
    public extern inline function set_gametitle(value:WorldspawngametitleChoices):WorldspawngametitleChoices {
        return untyped this.SetKeyValue("gametitle",untyped value);
    }
    
    /**
		New Level Unit

		Used to clear out savegame data of previous levels to keep the savegame size as small as possible. Only set it to Yes if the player cannot return to any previous levels.
	**/
    public var newunit(get,set):WorldspawnnewunitChoices;

    @:noCompletion
    public extern inline function get_newunit():WorldspawnnewunitChoices {
        return untyped this.GetKeyValues().newunit;
    }
    
    @:noCompletion
    public extern inline function set_newunit(value:WorldspawnnewunitChoices):WorldspawnnewunitChoices {
        return untyped this.SetKeyValue("newunit",untyped value);
    }
    
    /**
		Max occludee area

		[Used on PC] Prevents occlusion testing for entities that take up more than X% of the screen.
	**/
    public var maxoccludeearea(get,set):Float;

    @:noCompletion
    public extern inline function get_maxoccludeearea():Float {
        return untyped this.GetKeyValues().maxoccludeearea;
    }
    
    @:noCompletion
    public extern inline function set_maxoccludeearea(value:Float):Float {
        return untyped this.SetKeyValue("maxoccludeearea",untyped value);
    }
    
    /**
		Min occluder area

		[Used on PC] Prevents occluders from being used if they take up less than X% of the screen.
	**/
    public var minoccluderarea(get,set):Float;

    @:noCompletion
    public extern inline function get_minoccluderarea():Float {
        return untyped this.GetKeyValues().minoccluderarea;
    }
    
    @:noCompletion
    public extern inline function set_minoccluderarea(value:Float):Float {
        return untyped this.SetKeyValue("minoccluderarea",untyped value);
    }
    
    /**
		Max occludee area (Xbox)

		[Used on 360] Prevents occlusion testing for entities that take up more than X% of the screen.
	**/
    public var maxoccludeearea_x360(get,set):Float;

    @:noCompletion
    public extern inline function get_maxoccludeearea_x360():Float {
        return untyped this.GetKeyValues().maxoccludeearea_x360;
    }
    
    @:noCompletion
    public extern inline function set_maxoccludeearea_x360(value:Float):Float {
        return untyped this.SetKeyValue("maxoccludeearea_x360",untyped value);
    }
    
    /**
		Min occluder area (Xbox)

		[Used on 360] Prevents occluders from being used if they take up less than X% of the screen.
	**/
    public var minoccluderarea_x360(get,set):Float;

    @:noCompletion
    public extern inline function get_minoccluderarea_x360():Float {
        return untyped this.GetKeyValues().minoccluderarea_x360;
    }
    
    @:noCompletion
    public extern inline function set_minoccluderarea_x360(value:Float):Float {
        return untyped this.SetKeyValue("minoccluderarea_x360",untyped value);
    }
    
    /**
		Start Fade Pixels

		Number of pixels wide at which all props in the level start to fade (<0 = use fademaxdist). This number is ignored if the prop has a specific fade distance specified.
	**/
    public var maxpropscreenwidth(get,set):Float;

    @:noCompletion
    public extern inline function get_maxpropscreenwidth():Float {
        return untyped this.GetKeyValues().maxpropscreenwidth;
    }
    
    @:noCompletion
    public extern inline function set_maxpropscreenwidth(value:Float):Float {
        return untyped this.SetKeyValue("maxpropscreenwidth",untyped value);
    }
    
    /**
		End Fade Pixels

		Minimum number of pixels wide at which the prop is visible (0 = don't fade out). This number is ignored if the prop has a specific fade distance specified.
	**/
    public var minpropscreenwidth(get,set):Float;

    @:noCompletion
    public extern inline function get_minpropscreenwidth():Float {
        return untyped this.GetKeyValues().minpropscreenwidth;
    }
    
    @:noCompletion
    public extern inline function set_minpropscreenwidth(value:Float):Float {
        return untyped this.SetKeyValue("minpropscreenwidth",untyped value);
    }
    
    /**
		Detail.vbsp file

		Detail.vbsp file to use for emitting detail props (found in directory <root>/modname)
	**/
    public var detailvbsp(get,set):String;

    @:noCompletion
    public extern inline function get_detailvbsp():String {
        return untyped this.GetKeyValues().detailvbsp;
    }
    
    @:noCompletion
    public extern inline function set_detailvbsp(value:String):String {
        return untyped this.SetKeyValue("detailvbsp",untyped value);
    }
    
    /**
		Detail material file

		Material for detail sprites to use for drawing detail props
	**/
    public var detailmaterial(get,set):String;

    @:noCompletion
    public extern inline function get_detailmaterial():String {
        return untyped this.GetKeyValues().detailmaterial;
    }
    
    @:noCompletion
    public extern inline function set_detailmaterial(value:String):String {
        return untyped this.SetKeyValue("detailmaterial",untyped value);
    }
    
    /**
		World is cold
	**/
    public var coldworld(get,set):WorldspawncoldworldChoices;

    @:noCompletion
    public extern inline function get_coldworld():WorldspawncoldworldChoices {
        return untyped this.GetKeyValues().coldworld;
    }
    
    @:noCompletion
    public extern inline function set_coldworld(value:WorldspawncoldworldChoices):WorldspawncoldworldChoices {
        return untyped this.SetKeyValue("coldworld",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Worldspawn}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Worldspawn}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Worldspawn}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Worldspawn}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("worldspawn");
    }
}

enum abstract WorldspawnstartdarkChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract WorldspawnnewunitChoices(Int) to Int {
	var NO_KEEP_CURRENT = 0;
	var YES_CLEAR_PREVIOUS_LEVELS = 1;
}
enum abstract WorldspawngametitleChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract WorldspawncoldworldChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
