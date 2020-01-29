package gmod.engine_ents;
#if server
/**
	An entity that creates an explosion at its origin. If the no-damage spawnflag is set, the explosion won't be visible, but will apply force to any physics objects within its radius.
**/
@:forward
abstract Env_physexplosion(Entity) to Entity {
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
		Trigger the explosion.
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

		Amount of physics force applied by the explosion.
	**/
    public var magnitude(get,set):String;

    @:noCompletion
    public extern inline function get_magnitude():String {
        return untyped this.GetKeyValues().magnitude;
    }
    
    @:noCompletion
    public extern inline function set_magnitude(value:String):String {
        return untyped this.SetKeyValue("magnitude",untyped value);
    }
    
    /**
		Clamp Radius (0 = auto)

		If specified, the radius in which the explosion damages entities. If unspecified, the radius will be based on the magnitude.
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
		Limit to Entity

		If specified, the explosion will only affect the matching entity.
	**/
    public var targetentityname(get,set):String;

    @:noCompletion
    public extern inline function get_targetentityname():String {
        return untyped this.GetKeyValues().targetentityname;
    }
    
    @:noCompletion
    public extern inline function set_targetentityname(value:String):String {
        return untyped this.SetKeyValue("targetentityname",untyped value);
    }
    
    /**
		Inner radius

		If not zero, the LOS is calculated from a point intersecting this sphere.
	**/
    public var inner_radius(get,set):Float;

    @:noCompletion
    public extern inline function get_inner_radius():Float {
        return untyped this.GetKeyValues().inner_radius;
    }
    
    @:noCompletion
    public extern inline function set_inner_radius(value:Float):Float {
        return untyped this.SetKeyValue("inner_radius",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_physexplosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_physexplosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_physexplosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_physexplosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when the player is pushed by the explosion.
	**/
    public extern inline function OutputOnPushedPlayer(callback:Callback<{activator:Env_physexplosion}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPushedPlayer",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_physexplosionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_physexplosionSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_physexplosionSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_physexplosion");
    }
}



enum abstract Env_physexplosionSpawnFlags(Int) to Int {
	var NO_DAMAGE__ONLY_FORCE = 1;
	var PUSH_PLAYERS = 2;
	var PUSH_RADIALLY__NOT_AS_A_SPHERE = 4;
	var TEST_LOS_BEFORE_PUSHING = 8;
	var DISORIENT_PLAYER_IF_PUSHED = 16;
}

#end
