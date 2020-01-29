package gmod.engine_ents;
#if server
/**
	Spawns the specified entity template at its origin. If set to auto-spawn, it will spawn the template whenever there's room and the player is looking elsewhere.
**/
@:forward
abstract Env_entity_maker(Entity) to Entity {
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
		Spawn an instance of the template at this origin and angle.
	**/
    public extern inline function FireForceSpawn(delay:Float) {
        untyped this.Fire("ForceSpawn",untyped null,delay);
    }
    
    /**
		Spawn an instance of the template that the same origin and angle as the specified entity (specify by targetname in parameters)
	**/
    public extern inline function FireForceSpawnAtEntityOrigin(param:String,delay:Float) {
        untyped this.Fire("ForceSpawnAtEntityOrigin",untyped param,delay);
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
		Point_template To Spawn

		Name of the point_template to spawn here.
	**/
    public var EntityTemplate(get,set):String;

    @:noCompletion
    public extern inline function get_EntityTemplate():String {
        return untyped this.GetKeyValues().EntityTemplate;
    }
    
    @:noCompletion
    public extern inline function set_EntityTemplate(value:String):String {
        return untyped this.SetKeyValue("EntityTemplate",untyped value);
    }
    
    /**
		PostSpawn Movement Speed

		If specified, all the entities created in the template will move this fast in the specified PostSpawn Movement Direction.
	**/
    public var PostSpawnSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_PostSpawnSpeed():Float {
        return untyped this.GetKeyValues().PostSpawnSpeed;
    }
    
    @:noCompletion
    public extern inline function set_PostSpawnSpeed(value:Float):Float {
        return untyped this.SetKeyValue("PostSpawnSpeed",untyped value);
    }
    
    /**
		PostSpawn Movement Direction

		If a PostSpawn Movement Speed is specified, all the entities created in the template will move in this direction.
	**/
    public var PostSpawnDirection(get,set):Angle;

    @:noCompletion
    public extern inline function get_PostSpawnDirection():Angle {
        return untyped this.GetKeyValues().PostSpawnDirection;
    }
    
    @:noCompletion
    public extern inline function set_PostSpawnDirection(value:Angle):Angle {
        return untyped this.SetKeyValue("PostSpawnDirection",untyped value);
    }
    
    /**
		PostSpawn Direction Variance

		This variance is applied to the PostSpawn Movement Direction for each spawned entity in the template. Use it to apply some randomness to the directions.
	**/
    public var PostSpawnDirectionVariance(get,set):Float;

    @:noCompletion
    public extern inline function get_PostSpawnDirectionVariance():Float {
        return untyped this.GetKeyValues().PostSpawnDirectionVariance;
    }
    
    @:noCompletion
    public extern inline function set_PostSpawnDirectionVariance(value:Float):Float {
        return untyped this.SetKeyValue("PostSpawnDirectionVariance",untyped value);
    }
    
    /**
		PostSpawn Inherit Angles

		If in hierarchy, is spawn direction in world space, or object local space of parent
	**/
    public var PostSpawnInheritAngles(get,set):Env_entity_makerPostSpawnInheritAnglesChoices;

    @:noCompletion
    public extern inline function get_PostSpawnInheritAngles():Env_entity_makerPostSpawnInheritAnglesChoices {
        return untyped this.GetKeyValues().PostSpawnInheritAngles;
    }
    
    @:noCompletion
    public extern inline function set_PostSpawnInheritAngles(value:Env_entity_makerPostSpawnInheritAnglesChoices):Env_entity_makerPostSpawnInheritAnglesChoices {
        return untyped this.SetKeyValue("PostSpawnInheritAngles",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an instance of the entity template has been spawned.
	**/
    public extern inline function OutputOnEntitySpawned(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEntitySpawned",callback);
    }
    
    /**
		Fired when a ForceSpawn input failed to spawn the template, either due to lack of space or being in player's view, depending on the spawnflags.
	**/
    public extern inline function OutputOnEntityFailedSpawn(callback:Callback<{activator:Env_entity_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEntityFailedSpawn",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_entity_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_entity_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_entity_makerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_entity_maker");
    }
}

enum abstract Env_entity_makerPostSpawnInheritAnglesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_entity_makerSpawnFlags(Int) to Int {
	var ENABLE_AUTOSPAWN_WILL_SPAWN_WHENEVER_THERES_ROOM = 1;
	var AUTOSPAWN_WAIT_FOR_ENTITY_DESTRUCTION = 2;
	var AUTOSPAWN_EVEN_IF_THE_PLAYER_IS_LOOKING = 4;
	var FORCESPAWN_ONLY_IF_THERES_ROOM = 8;
	var FORCESPAWN_ONLY_IF_THE_PLAYER_ISNT_LOOKING = 16;
}

#end
