package gmod.engine_ents;
#if server
/**
	Projected texture entity.
**/
@:forward
abstract Env_projectedtexture(Entity) to Entity {
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
		Turn on the texture
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn off the texture
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Set FOV
	**/
    public extern inline function FireSetFOV(param:Float,delay:Float) {
        untyped this.Fire("SetFOV",untyped param,delay);
    }
    
    /**
		Set Spotlight Texture
	**/
    public extern inline function FireSpotlightTexture(param:String,delay:Float) {
        untyped this.Fire("SpotlightTexture",untyped param,delay);
    }
    
    /**
		Set Spotlight Ambient
	**/
    public extern inline function FireAmbient(param:Float,delay:Float) {
        untyped this.Fire("Ambient",untyped param,delay);
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
		target

		target
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
		FOV

		FOV
	**/
    public var lightfov(get,set):Float;

    @:noCompletion
    public extern inline function get_lightfov():Float {
        return untyped this.GetKeyValues().lightfov;
    }
    
    @:noCompletion
    public extern inline function set_lightfov(value:Float):Float {
        return untyped this.SetKeyValue("lightfov",untyped value);
    }
    
    /**
		NearZ

		Near Z for projected texture
	**/
    public var nearz(get,set):Float;

    @:noCompletion
    public extern inline function get_nearz():Float {
        return untyped this.GetKeyValues().nearz;
    }
    
    @:noCompletion
    public extern inline function set_nearz(value:Float):Float {
        return untyped this.SetKeyValue("nearz",untyped value);
    }
    
    /**
		FarZ

		Far Z for projected texture
	**/
    public var farz(get,set):Float;

    @:noCompletion
    public extern inline function get_farz():Float {
        return untyped this.GetKeyValues().farz;
    }
    
    @:noCompletion
    public extern inline function set_farz(value:Float):Float {
        return untyped this.SetKeyValue("farz",untyped value);
    }
    
    /**
		Enable Shadows

		Enables/disables shadows from this projected texture.
	**/
    public var enableshadows(get,set):Choices;

    @:noCompletion
    public extern inline function get_enableshadows():Choices {
        return untyped this.GetKeyValues().enableshadows;
    }
    
    @:noCompletion
    public extern inline function set_enableshadows(value:Choices):Choices {
        return untyped this.SetKeyValue("enableshadows",untyped value);
    }
    
    /**
		Light Only Target

		Limit flashlight effect to only effect target entity.
	**/
    public var lightonlytarget(get,set):Choices;

    @:noCompletion
    public extern inline function get_lightonlytarget():Choices {
        return untyped this.GetKeyValues().lightonlytarget;
    }
    
    @:noCompletion
    public extern inline function set_lightonlytarget(value:Choices):Choices {
        return untyped this.SetKeyValue("lightonlytarget",untyped value);
    }
    
    /**
		Light World

		Control whether flashlight effects static world geometry.
	**/
    public var lightworld(get,set):Choices;

    @:noCompletion
    public extern inline function get_lightworld():Choices {
        return untyped this.GetKeyValues().lightworld;
    }
    
    @:noCompletion
    public extern inline function set_lightworld(value:Choices):Choices {
        return untyped this.SetKeyValue("lightworld",untyped value);
    }
    
    /**
		Light Color

		Light Color RGB-Intensity
	**/
    public var lightcolor(get,set):String;

    @:noCompletion
    public extern inline function get_lightcolor():String {
        return untyped this.GetKeyValues().lightcolor;
    }
    
    @:noCompletion
    public extern inline function set_lightcolor(value:String):String {
        return untyped this.SetKeyValue("lightcolor",untyped value);
    }
    
    /**
		Light Strength

		How bright the light appears
	**/
    public var lightstrength(get,set):Float;

    @:noCompletion
    public extern inline function get_lightstrength():Float {
        return untyped this.GetKeyValues().lightstrength;
    }
    
    @:noCompletion
    public extern inline function set_lightstrength(value:Float):Float {
        return untyped this.SetKeyValue("lightstrength",untyped value);
    }
    
    /**
		Camera Space

		Angles are interpreted as being relative to camera.
	**/
    public var cameraspace(get,set):Int;

    @:noCompletion
    public extern inline function get_cameraspace():Int {
        return untyped this.GetKeyValues().cameraspace;
    }
    
    @:noCompletion
    public extern inline function set_cameraspace(value:Int):Int {
        return untyped this.SetKeyValue("cameraspace",untyped value);
    }
    
    /**
		Texture Name

		The name of the texture to use
	**/
    public var texturename(get,set):String;

    @:noCompletion
    public extern inline function get_texturename():String {
        return untyped this.GetKeyValues().texturename;
    }
    
    @:noCompletion
    public extern inline function set_texturename(value:String):String {
        return untyped this.SetKeyValue("texturename",untyped value);
    }
    
    /**
		Texture Frame

		The frame of the texture
	**/
    public var textureframe(get,set):Int;

    @:noCompletion
    public extern inline function get_textureframe():Int {
        return untyped this.GetKeyValues().textureframe;
    }
    
    @:noCompletion
    public extern inline function set_textureframe(value:Int):Int {
        return untyped this.SetKeyValue("textureframe",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_projectedtexture}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_projectedtexture}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_projectedtexture}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_projectedtexture}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_projectedtextureSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_projectedtextureSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_projectedtextureSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_projectedtexture");
    }
}



enum abstract Env_projectedtextureSpawnFlags(Int) to Int {
	var ENABLED = 1;
}

#end
