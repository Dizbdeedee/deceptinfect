package gmod.engine_ents;
#if server
/**
	An entity that creates an explosion at its origin.
**/
@:forward
abstract Env_explosion(Entity) to Entity {
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
		Triggers the explosion.
	**/
    public extern inline function FireExplode(delay:Float) {
        untyped this.Fire("Explode",untyped null,delay);
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
		Magnitude

		The amount of damage done by the explosion.
	**/
    public var iMagnitude(get,set):Integer;

    @:noCompletion
    public extern inline function get_iMagnitude():Integer {
        return untyped this.GetKeyValues().iMagnitude;
    }
    
    @:noCompletion
    public extern inline function set_iMagnitude(value:Integer):Integer {
        return untyped this.SetKeyValue("iMagnitude",untyped value);
    }
    
    /**
		Radius Override

		If specified, the radius in which the explosion damages entities. If unspecified, the radius will be based on the magnitude.
	**/
    public var iRadiusOverride(get,set):Integer;

    @:noCompletion
    public extern inline function get_iRadiusOverride():Integer {
        return untyped this.GetKeyValues().iRadiusOverride;
    }
    
    @:noCompletion
    public extern inline function set_iRadiusOverride(value:Integer):Integer {
        return untyped this.SetKeyValue("iRadiusOverride",untyped value);
    }
    
    /**
		Fireball Sprite
	**/
    public var fireballsprite(get,set):String;

    @:noCompletion
    public extern inline function get_fireballsprite():String {
        return untyped this.GetKeyValues().fireballsprite;
    }
    
    @:noCompletion
    public extern inline function set_fireballsprite(value:String):String {
        return untyped this.SetKeyValue("fireballsprite",untyped value);
    }
    
    /**
		Render Mode
	**/
    public var rendermode(get,set):Env_explosionrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Env_explosionrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Env_explosionrendermodeChoices):Env_explosionrendermodeChoices {
        return untyped this.SetKeyValue("rendermode",untyped value);
    }
    
    /**
		Ignored Entity

		Do not harm or affect the named entity.
	**/
    public var ignoredEntity(get,set):String;

    @:noCompletion
    public extern inline function get_ignoredEntity():String {
        return untyped this.GetKeyValues().ignoredEntity;
    }
    
    @:noCompletion
    public extern inline function set_ignoredEntity(value:String):String {
        return untyped this.SetKeyValue("ignoredEntity",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_explosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_explosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_explosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_explosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_explosionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_explosionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_explosionSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_explosion");
    }
}

enum abstract Env_explosionrendermodeChoices(Int) to Int {
	var NORMAL = 0;
	var SOLID = 4;
	var ADDITIVE = 5;
}


enum abstract Env_explosionSpawnFlags(Int) to Int {
	var NO_DAMAGE = 1;
	var REPEATABLE = 2;
	var NO_FIREBALL = 4;
	var NO_SMOKE = 8;
	var NO_DECAL = 16;
	var NO_SPARKS = 32;
	var NO_SOUND = 64;
	var RANDOM_ORIENTATION = 128;
	var NO_FIREBALL_SMOKE = 256;
	var NO_PARTICLES = 512;
	var NO_DLIGHTS = 1024;
	var DONT_CLAMP_MIN = 2048;
	var DONT_CLAMP_MAX = 4096;
	var DAMAGE_ABOVE_SURFACE_ONLY = 8192;
	var GENERIC_DAMAGE = 16384;
}

#end
