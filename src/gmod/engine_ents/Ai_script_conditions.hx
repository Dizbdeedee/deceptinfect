package gmod.engine_ents;
#if server
/**
	AI Script Conditions
**/
@:forward
abstract Ai_script_conditions(Entity) to Entity {
    //Inputs
    
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
		Enable this entity
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    //Keyvalues
    
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
		Actor

		NPC Target
	**/
    public var Actor(get,set):String;

    @:noCompletion
    public extern inline function get_Actor():String {
        return untyped this.GetKeyValues().Actor;
    }
    
    @:noCompletion
    public extern inline function set_Actor(value:String):String {
        return untyped this.SetKeyValue("Actor",untyped value);
    }
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Ai_script_conditionsStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Ai_script_conditionsStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Ai_script_conditionsStartDisabledChoices):Ai_script_conditionsStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Minimum state
	**/
    public var MinimumState(get,set):Ai_script_conditionsMinimumStateChoices;

    @:noCompletion
    public extern inline function get_MinimumState():Ai_script_conditionsMinimumStateChoices {
        return untyped this.GetKeyValues().MinimumState;
    }
    
    @:noCompletion
    public extern inline function set_MinimumState(value:Ai_script_conditionsMinimumStateChoices):Ai_script_conditionsMinimumStateChoices {
        return untyped this.SetKeyValue("MinimumState",untyped value);
    }
    
    /**
		Maximum state
	**/
    public var MaximumState(get,set):Ai_script_conditionsMaximumStateChoices;

    @:noCompletion
    public extern inline function get_MaximumState():Ai_script_conditionsMaximumStateChoices {
        return untyped this.GetKeyValues().MaximumState;
    }
    
    @:noCompletion
    public extern inline function set_MaximumState(value:Ai_script_conditionsMaximumStateChoices):Ai_script_conditionsMaximumStateChoices {
        return untyped this.SetKeyValue("MaximumState",untyped value);
    }
    
    /**
		Actor is running a script?
	**/
    public var ScriptStatus(get,set):Ai_script_conditionsScriptStatusChoices;

    @:noCompletion
    public extern inline function get_ScriptStatus():Ai_script_conditionsScriptStatusChoices {
        return untyped this.GetKeyValues().ScriptStatus;
    }
    
    @:noCompletion
    public extern inline function set_ScriptStatus(value:Ai_script_conditionsScriptStatusChoices):Ai_script_conditionsScriptStatusChoices {
        return untyped this.SetKeyValue("ScriptStatus",untyped value);
    }
    
    /**
		Required Time

		Duration of time that all the conditions must be true
	**/
    public var RequiredTime(get,set):Float;

    @:noCompletion
    public extern inline function get_RequiredTime():Float {
        return untyped this.GetKeyValues().RequiredTime;
    }
    
    @:noCompletion
    public extern inline function set_RequiredTime(value:Float):Float {
        return untyped this.SetKeyValue("RequiredTime",untyped value);
    }
    
    /**
		Minimum time out

		Minimum time before OnConditionsTimeout is fired. 0 = never expire.
	**/
    public var MinTimeout(get,set):Float;

    @:noCompletion
    public extern inline function get_MinTimeout():Float {
        return untyped this.GetKeyValues().MinTimeout;
    }
    
    @:noCompletion
    public extern inline function set_MinTimeout(value:Float):Float {
        return untyped this.SetKeyValue("MinTimeout",untyped value);
    }
    
    /**
		Maximum time out

		Maximum time before OnConditionsTimeout is fired. 0 = ignore (If you don't specify a Maximum timeout, conditions will time out at exactly Minimum Time Out. If you DO specify a Maximum time out, timeout will occur randomly between Minimum and Maximum time out values.)
	**/
    public var MaxTimeout(get,set):Float;

    @:noCompletion
    public extern inline function get_MaxTimeout():Float {
        return untyped this.GetKeyValues().MaxTimeout;
    }
    
    @:noCompletion
    public extern inline function set_MaxTimeout(value:Float):Float {
        return untyped this.SetKeyValue("MaxTimeout",untyped value);
    }
    
    /**
		Actor Sees Player
	**/
    public var ActorSeePlayer(get,set):Ai_script_conditionsActorSeePlayerChoices;

    @:noCompletion
    public extern inline function get_ActorSeePlayer():Ai_script_conditionsActorSeePlayerChoices {
        return untyped this.GetKeyValues().ActorSeePlayer;
    }
    
    @:noCompletion
    public extern inline function set_ActorSeePlayer(value:Ai_script_conditionsActorSeePlayerChoices):Ai_script_conditionsActorSeePlayerChoices {
        return untyped this.SetKeyValue("ActorSeePlayer",untyped value);
    }
    
    /**
		Player distance

		The distance the player must/must not be to the actor. Negative values for NOT, 0 for ignore.
	**/
    public var PlayerActorProximity(get,set):Float;

    @:noCompletion
    public extern inline function get_PlayerActorProximity():Float {
        return untyped this.GetKeyValues().PlayerActorProximity;
    }
    
    @:noCompletion
    public extern inline function set_PlayerActorProximity(value:Float):Float {
        return untyped this.SetKeyValue("PlayerActorProximity",untyped value);
    }
    
    /**
		Player FOV for Actor 

		Specify angle of view cone in degrees. Negative value = NOT
	**/
    public var PlayerActorFOV(get,set):Float;

    @:noCompletion
    public extern inline function get_PlayerActorFOV():Float {
        return untyped this.GetKeyValues().PlayerActorFOV;
    }
    
    @:noCompletion
    public extern inline function set_PlayerActorFOV(value:Float):Float {
        return untyped this.SetKeyValue("PlayerActorFOV",untyped value);
    }
    
    /**
		Play FOV to Actor is a true view cone

		Player's view cone is evaluated as a true cone, not pie slice 
	**/
    public var PlayerActorFOVTrueCone(get,set):Ai_script_conditionsPlayerActorFOVTrueConeChoices;

    @:noCompletion
    public extern inline function get_PlayerActorFOVTrueCone():Ai_script_conditionsPlayerActorFOVTrueConeChoices {
        return untyped this.GetKeyValues().PlayerActorFOVTrueCone;
    }
    
    @:noCompletion
    public extern inline function set_PlayerActorFOVTrueCone(value:Ai_script_conditionsPlayerActorFOVTrueConeChoices):Ai_script_conditionsPlayerActorFOVTrueConeChoices {
        return untyped this.SetKeyValue("PlayerActorFOVTrueCone",untyped value);
    }
    
    /**
		Player has LOS to Actor

		Checks that the player has clear Line of Sight to the Actor
	**/
    public var PlayerActorLOS(get,set):Ai_script_conditionsPlayerActorLOSChoices;

    @:noCompletion
    public extern inline function get_PlayerActorLOS():Ai_script_conditionsPlayerActorLOSChoices {
        return untyped this.GetKeyValues().PlayerActorLOS;
    }
    
    @:noCompletion
    public extern inline function set_PlayerActorLOS(value:Ai_script_conditionsPlayerActorLOSChoices):Ai_script_conditionsPlayerActorLOSChoices {
        return untyped this.SetKeyValue("PlayerActorLOS",untyped value);
    }
    
    /**
		Target (Optional)

		Optional entity to include in conditions
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
		Actor Sees Target
	**/
    public var ActorSeeTarget(get,set):Ai_script_conditionsActorSeeTargetChoices;

    @:noCompletion
    public extern inline function get_ActorSeeTarget():Ai_script_conditionsActorSeeTargetChoices {
        return untyped this.GetKeyValues().ActorSeeTarget;
    }
    
    @:noCompletion
    public extern inline function set_ActorSeeTarget(value:Ai_script_conditionsActorSeeTargetChoices):Ai_script_conditionsActorSeeTargetChoices {
        return untyped this.SetKeyValue("ActorSeeTarget",untyped value);
    }
    
    /**
		Target distance

		The distance the actor must/must not be to the Target. Negative values for NOT, 0 for ignore.
	**/
    public var ActorTargetProximity(get,set):Float;

    @:noCompletion
    public extern inline function get_ActorTargetProximity():Float {
        return untyped this.GetKeyValues().ActorTargetProximity;
    }
    
    @:noCompletion
    public extern inline function set_ActorTargetProximity(value:Float):Float {
        return untyped this.SetKeyValue("ActorTargetProximity",untyped value);
    }
    
    /**
		Player distance from Target

		The distance the player must/must not be to the Target. Negative values for NOT, 0 for ignore.
	**/
    public var PlayerTargetProximity(get,set):Float;

    @:noCompletion
    public extern inline function get_PlayerTargetProximity():Float {
        return untyped this.GetKeyValues().PlayerTargetProximity;
    }
    
    @:noCompletion
    public extern inline function set_PlayerTargetProximity(value:Float):Float {
        return untyped this.SetKeyValue("PlayerTargetProximity",untyped value);
    }
    
    /**
		Player FOV for Target

		Specify angle of view cone in degrees. Negative value = NOT
	**/
    public var PlayerTargetFOV(get,set):Float;

    @:noCompletion
    public extern inline function get_PlayerTargetFOV():Float {
        return untyped this.GetKeyValues().PlayerTargetFOV;
    }
    
    @:noCompletion
    public extern inline function set_PlayerTargetFOV(value:Float):Float {
        return untyped this.SetKeyValue("PlayerTargetFOV",untyped value);
    }
    
    /**
		Play FOV to Target is a true view cone

		Player's view cone is evaluated as a true cone, not pie slice 
	**/
    public var PlayerTargetFOVTrueCone(get,set):Ai_script_conditionsPlayerTargetFOVTrueConeChoices;

    @:noCompletion
    public extern inline function get_PlayerTargetFOVTrueCone():Ai_script_conditionsPlayerTargetFOVTrueConeChoices {
        return untyped this.GetKeyValues().PlayerTargetFOVTrueCone;
    }
    
    @:noCompletion
    public extern inline function set_PlayerTargetFOVTrueCone(value:Ai_script_conditionsPlayerTargetFOVTrueConeChoices):Ai_script_conditionsPlayerTargetFOVTrueConeChoices {
        return untyped this.SetKeyValue("PlayerTargetFOVTrueCone",untyped value);
    }
    
    /**
		Player has LOS to Target

		Checks that the player has clear Line of Sight to the Target
	**/
    public var PlayerTargetLOS(get,set):Ai_script_conditionsPlayerTargetLOSChoices;

    @:noCompletion
    public extern inline function get_PlayerTargetLOS():Ai_script_conditionsPlayerTargetLOSChoices {
        return untyped this.GetKeyValues().PlayerTargetLOS;
    }
    
    @:noCompletion
    public extern inline function set_PlayerTargetLOS(value:Ai_script_conditionsPlayerTargetLOSChoices):Ai_script_conditionsPlayerTargetLOSChoices {
        return untyped this.SetKeyValue("PlayerTargetLOS",untyped value);
    }
    
    /**
		Player blocking Actor

		Checks that the player is blocking the Actor's path
	**/
    public var PlayerBlockingActor(get,set):Ai_script_conditionsPlayerBlockingActorChoices;

    @:noCompletion
    public extern inline function get_PlayerBlockingActor():Ai_script_conditionsPlayerBlockingActorChoices {
        return untyped this.GetKeyValues().PlayerBlockingActor;
    }
    
    @:noCompletion
    public extern inline function set_PlayerBlockingActor(value:Ai_script_conditionsPlayerBlockingActorChoices):Ai_script_conditionsPlayerBlockingActorChoices {
        return untyped this.SetKeyValue("PlayerBlockingActor",untyped value);
    }
    
    /**
		Actor in Player's PVS

		Checks that the actor is in the player's PVS
	**/
    public var ActorInPVS(get,set):Ai_script_conditionsActorInPVSChoices;

    @:noCompletion
    public extern inline function get_ActorInPVS():Ai_script_conditionsActorInPVSChoices {
        return untyped this.GetKeyValues().ActorInPVS;
    }
    
    @:noCompletion
    public extern inline function set_ActorInPVS(value:Ai_script_conditionsActorInPVSChoices):Ai_script_conditionsActorInPVSChoices {
        return untyped this.SetKeyValue("ActorInPVS",untyped value);
    }
    
    /**
		Actor in a vehicle

		Checks the actor's state in a vehicle
	**/
    public var ActorInVehicle(get,set):Ai_script_conditionsActorInVehicleChoices;

    @:noCompletion
    public extern inline function get_ActorInVehicle():Ai_script_conditionsActorInVehicleChoices {
        return untyped this.GetKeyValues().ActorInVehicle;
    }
    
    @:noCompletion
    public extern inline function set_ActorInVehicle(value:Ai_script_conditionsActorInVehicleChoices):Ai_script_conditionsActorInVehicleChoices {
        return untyped this.SetKeyValue("ActorInVehicle",untyped value);
    }
    
    /**
		Player in a vehicle

		Checks the player's state in a vehicle
	**/
    public var PlayerInVehicle(get,set):Ai_script_conditionsPlayerInVehicleChoices;

    @:noCompletion
    public extern inline function get_PlayerInVehicle():Ai_script_conditionsPlayerInVehicleChoices {
        return untyped this.GetKeyValues().PlayerInVehicle;
    }
    
    @:noCompletion
    public extern inline function set_PlayerInVehicle(value:Ai_script_conditionsPlayerInVehicleChoices):Ai_script_conditionsPlayerInVehicleChoices {
        return untyped this.SetKeyValue("PlayerInVehicle",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when AI conditions satisfied
	**/
    public extern inline function OutputOnConditionsSatisfied(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnConditionsSatisfied",callback);
    }
    
    /**
		Fires when AI conditions timed out
	**/
    public extern inline function OutputOnConditionsTimeout(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnConditionsTimeout",callback);
    }
    
    /**
		Fires if/when there are no matching actors in the map.
	**/
    public extern inline function OutputNoValidActor(callback:Callback<{activator:Ai_script_conditions}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"NoValidActor",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Ai_script_conditionsSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Ai_script_conditionsSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Ai_script_conditionsSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_script_conditions");
    }
}

enum abstract Ai_script_conditionsStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_script_conditionsScriptStatusChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsPlayerTargetLOSChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsPlayerTargetFOVTrueConeChoices(Int) to Int {
	var NO__TALL_PIE_SLICE = 0;
	var YES__TRUE_VIEW_CONE = 1;
}
enum abstract Ai_script_conditionsPlayerInVehicleChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsPlayerBlockingActorChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsPlayerActorLOSChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsPlayerActorFOVTrueConeChoices(Int) to Int {
	var NO__TALL_PIE_SLICE = 0;
	var YES__TRUE_VIEW_CONE = 1;
}
enum abstract Ai_script_conditionsMinimumStateChoices(Int) to Int {
	var IDLE = 1;
	var ALERT = 2;
	var COMBAT = 3;
}
enum abstract Ai_script_conditionsMaximumStateChoices(Int) to Int {
	var IDLE = 1;
	var ALERT = 2;
	var COMBAT = 3;
}
enum abstract Ai_script_conditionsActorSeeTargetChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsActorSeePlayerChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsActorInVehicleChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}
enum abstract Ai_script_conditionsActorInPVSChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
	var DONT_CARE = 2;
}


enum abstract Ai_script_conditionsSpawnFlags(Int) to Int {
	var FIRE_OUTPUTS_WITH_THE_ACTOR_AS_ACTIVATOR = 1;
}

#end
