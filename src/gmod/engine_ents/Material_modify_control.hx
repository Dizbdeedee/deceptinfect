package gmod.engine_ents;
#if server
/**
	An entity that can be used to directly control material vars. To use it, you need to read the .vmt of the material you intend to change. Parent this entity to a brush model entity who's material you want to control.
**/
@:forward
abstract Material_modify_control(Entity) to Entity {
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
		Fire to modify a material variable. The argument is the value to set the variable to.
	**/
    public extern inline function FireSetMaterialVar(param:String,delay:Float) {
        untyped this.Fire("SetMaterialVar",untyped param,delay);
    }
    
    /**
		This sets the material variable to the current time on the server.
	**/
    public extern inline function FireSetMaterialVarToCurrentTime(delay:Float) {
        untyped this.Fire("SetMaterialVarToCurrentTime",untyped null,delay);
    }
    
    /**
		Force an animated material with the MaterialModifyAnimated proxy to play a set of animation frames. Format is: <Frame Start> <Frame End> <Frame Rate> <Loop>
Setting <Frame End> to -1 uses the last frame of the texture. <Loop> should be 1 or 0.
	**/
    public extern inline function FireStartAnimSequence(param:String,delay:Float) {
        untyped this.Fire("StartAnimSequence",untyped param,delay);
    }
    
    /**
		Force a material with the MaterialModifyAnimated proxy to lerp a material var between two floating point values. Format is: <Start Value> <End Value> <Transition Time> <Loop>
<Loop> should be 1 or 0.
	**/
    public extern inline function FireStartFloatLerp(param:String,delay:Float) {
        untyped this.Fire("StartFloatLerp",untyped param,delay);
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
		Material to modify.
	**/
    public var materialName(get,set):String;

    @:noCompletion
    public extern inline function get_materialName():String {
        return untyped this.GetKeyValues().materialName;
    }
    
    @:noCompletion
    public extern inline function set_materialName(value:String):String {
        return untyped this.SetKeyValue("materialName",untyped value);
    }
    
    /**
		Material variable to modify.
	**/
    public var materialVar(get,set):String;

    @:noCompletion
    public extern inline function get_materialVar():String {
        return untyped this.GetKeyValues().materialVar;
    }
    
    @:noCompletion
    public extern inline function set_materialVar(value:String):String {
        return untyped this.SetKeyValue("materialVar",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Material_modify_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Material_modify_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Material_modify_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Material_modify_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("material_modify_control");
    }
}





#end
