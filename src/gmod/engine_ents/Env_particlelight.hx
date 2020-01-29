package gmod.engine_ents;
#if server
/**
	An entity that can be used to light the smoke particles emitted by env_smokestack entities. Does not light any other particle types.
**/
@:forward
abstract Env_particlelight(Entity) to Entity {
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
		Color

		Color emitted by this light.
	**/
    public var Color(get,set):String;

    @:noCompletion
    public extern inline function get_Color():String {
        return untyped this.GetKeyValues().Color;
    }
    
    @:noCompletion
    public extern inline function set_Color(value:String):String {
        return untyped this.SetKeyValue("Color",untyped value);
    }
    
    /**
		Intensity
	**/
    public var Intensity(get,set):Int;

    @:noCompletion
    public extern inline function get_Intensity():Int {
        return untyped this.GetKeyValues().Intensity;
    }
    
    @:noCompletion
    public extern inline function set_Intensity(value:Int):Int {
        return untyped this.SetKeyValue("Intensity",untyped value);
    }
    
    /**
		Directional

		If this is specified, then this light will use the bump map on the particles. Each particle system can have one ambient and one directional light.
	**/
    public var directional(get,set):Env_particlelightdirectionalChoices;

    @:noCompletion
    public extern inline function get_directional():Env_particlelightdirectionalChoices {
        return untyped this.GetKeyValues().directional;
    }
    
    @:noCompletion
    public extern inline function set_directional(value:Env_particlelightdirectionalChoices):Env_particlelightdirectionalChoices {
        return untyped this.SetKeyValue("directional",untyped value);
    }
    
    /**
		Particle System Entity

		Set this to the name of the env_smokestack that you want this light to affect.
	**/
    public var PSName(get,set):String;

    @:noCompletion
    public extern inline function get_PSName():String {
        return untyped this.GetKeyValues().PSName;
    }
    
    @:noCompletion
    public extern inline function set_PSName(value:String):String {
        return untyped this.SetKeyValue("PSName",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_particlelight");
    }
}

enum abstract Env_particlelightdirectionalChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
