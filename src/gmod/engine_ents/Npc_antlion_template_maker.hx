package gmod.engine_ents;
#if server
/**
	Antlion Template Maker
**/
@:forward
abstract Npc_antlion_template_maker(Entity) to Entity {
    //Inputs
    
    /**
		Spawns an NPC.
	**/
    public extern inline function FireSpawn(delay:Float) {
        untyped this.Fire("Spawn",untyped null,delay);
    }
    
    /**
		Toggles the spawner enabled/disabled state.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Enables the spawner.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disables the spawner.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Adds to the number of NPCs that can spawn before the spawner is exhausted. If an exhausted spawner is given some children to spawn, it still wont begin spawning until it is re-enabled with the Enable input.
	**/
    public extern inline function FireAddMaxChildren(param:Int,delay:Float) {
        untyped this.Fire("AddMaxChildren",untyped param,delay);
    }
    
    /**
		Sets the number of NPCs that can spawn before the spawner is exhausted. If an exhausted spawner is given some children to spawn, it still won't begin spawning until it is re-enabled with the Enable input.
	**/
    public extern inline function FireSetMaxChildren(param:Int,delay:Float) {
        untyped this.Fire("SetMaxChildren",untyped param,delay);
    }
    
    /**
		Sets the maximum number of NPCs that can be alive at any one time from this spawner.
	**/
    public extern inline function FireSetMaxLiveChildren(param:Int,delay:Float) {
        untyped this.Fire("SetMaxLiveChildren",untyped param,delay);
    }
    
    /**
		Sets how often (in seconds) a new NPC will be spawned.
	**/
    public extern inline function FireSetSpawnFrequency(param:Float,delay:Float) {
        untyped this.Fire("SetSpawnFrequency",untyped param,delay);
    }
    
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
		Sets the target entity for children to fight to.
	**/
    public extern inline function FireSetFightTarget(param:String,delay:Float) {
        untyped this.Fire("SetFightTarget",untyped param,delay);
    }
    
    /**
		Clears the fight target goal for this spawner.
	**/
    public extern inline function FireClearFightTarget(delay:Float) {
        untyped this.Fire("ClearFightTarget",untyped null,delay);
    }
    
    /**
		Sets the target entity for children to follow.
	**/
    public extern inline function FireSetFollowTarget(param:String,delay:Float) {
        untyped this.Fire("SetFollowTarget",untyped param,delay);
    }
    
    /**
		Clears the follow target goal for this spawner.
	**/
    public extern inline function FireClearFollowTarget(delay:Float) {
        untyped this.Fire("ClearFollowTarget",untyped null,delay);
    }
    
    /**
		Sets the Spawn Radius.
	**/
    public extern inline function FireSetSpawnRadius(param:Float,delay:Float) {
        untyped this.Fire("SetSpawnRadius",untyped param,delay);
    }
    
    /**
		Add the number of antlions specified in the parameter to the pool.
	**/
    public extern inline function FireAddToPool(param:Int,delay:Float) {
        untyped this.Fire("AddToPool",untyped param,delay);
    }
    
    /**
		Set the maximum number of antlions allowed in the pool at any time. Setting it to 0 turns off the pool behavior.
	**/
    public extern inline function FireSetMaxPool(param:Int,delay:Float) {
        untyped this.Fire("SetMaxPool",untyped param,delay);
    }
    
    /**
		Set the number of antlions added to the pool every time it regenerates.
	**/
    public extern inline function FireSetPoolRegenAmount(param:Int,delay:Float) {
        untyped this.Fire("SetPoolRegenAmount",untyped param,delay);
    }
    
    /**
		Set the time interval between pool regeneration ticks.
	**/
    public extern inline function FireSetPoolRegenTime(param:Float,delay:Float) {
        untyped this.Fire("SetPoolRegenTime",untyped param,delay);
    }
    
    /**
		Change the spawn group for this spawner.
	**/
    public extern inline function FireChangeDestinationGroup(param:String,delay:Float) {
        untyped this.Fire("ChangeDestinationGroup",untyped param,delay);
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
		Start Disabled
	**/
    public var StartDisabled(get,set):Npc_antlion_template_makerStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Npc_antlion_template_makerStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Npc_antlion_template_makerStartDisabledChoices):Npc_antlion_template_makerStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Num. of NPCs

		Number of NPCs that will spawn before this spawner is exhausted.
	**/
    public var MaxNPCCount(get,set):Int;

    @:noCompletion
    public extern inline function get_MaxNPCCount():Int {
        return untyped this.GetKeyValues().MaxNPCCount;
    }
    
    @:noCompletion
    public extern inline function set_MaxNPCCount(value:Int):Int {
        return untyped this.SetKeyValue("MaxNPCCount",untyped value);
    }
    
    /**
		Frequency

		How often (in seconds) a new NPC will be spawned. If set to -1, a new NPC will be made when the last NPC dies.
	**/
    public var SpawnFrequency(get,set):String;

    @:noCompletion
    public extern inline function get_SpawnFrequency():String {
        return untyped this.GetKeyValues().SpawnFrequency;
    }
    
    @:noCompletion
    public extern inline function set_SpawnFrequency(value:String):String {
        return untyped this.SetKeyValue("SpawnFrequency",untyped value);
    }
    
    /**
		Max Live NPCs

		Maximum number of live children allowed at any one time (new ones will not be made until one dies). If set to -1, no limit is applied.
	**/
    public var MaxLiveChildren(get,set):Int;

    @:noCompletion
    public extern inline function get_MaxLiveChildren():Int {
        return untyped this.GetKeyValues().MaxLiveChildren;
    }
    
    @:noCompletion
    public extern inline function set_MaxLiveChildren(value:Int):Int {
        return untyped this.SetKeyValue("MaxLiveChildren",untyped value);
    }
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Npc_antlion_template_makerStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Npc_antlion_template_makerStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Npc_antlion_template_makerStartDisabledChoices):Npc_antlion_template_makerStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
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
		Name of template NPC
	**/
    public var TemplateName(get,set):String;

    @:noCompletion
    public extern inline function get_TemplateName():String {
        return untyped this.GetKeyValues().TemplateName;
    }
    
    @:noCompletion
    public extern inline function set_TemplateName(value:String):String {
        return untyped this.SetKeyValue("TemplateName",untyped value);
    }
    
    /**
		Spawn on Hint Group

		If specified, children will spawn on a hint node from this group, nearest the target.
	**/
    public var spawngroup(get,set):String;

    @:noCompletion
    public extern inline function get_spawngroup():String {
        return untyped this.GetKeyValues().spawngroup;
    }
    
    @:noCompletion
    public extern inline function set_spawngroup(value:String):String {
        return untyped this.SetKeyValue("spawngroup",untyped value);
    }
    
    /**
		Spawn radius

		Target must be within this distance of any node in the hint group specified above. If the target is outside the radius, no NPC will spawn.
	**/
    public var spawnradius(get,set):Float;

    @:noCompletion
    public extern inline function get_spawnradius():Float {
        return untyped this.GetKeyValues().spawnradius;
    }
    
    @:noCompletion
    public extern inline function set_spawnradius(value:Float):Float {
        return untyped this.SetKeyValue("spawnradius",untyped value);
    }
    
    /**
		Spawn target

		Targetname of the entity to try and spawn near.
	**/
    public var spawntarget(get,set):String;

    @:noCompletion
    public extern inline function get_spawntarget():String {
        return untyped this.GetKeyValues().spawntarget;
    }
    
    @:noCompletion
    public extern inline function set_spawntarget(value:String):String {
        return untyped this.SetKeyValue("spawntarget",untyped value);
    }
    
    /**
		Fight target

		Targetname of an entity used as a goal for the children to fight to.
	**/
    public var fighttarget(get,set):String;

    @:noCompletion
    public extern inline function get_fighttarget():String {
        return untyped this.GetKeyValues().fighttarget;
    }
    
    @:noCompletion
    public extern inline function set_fighttarget(value:String):String {
        return untyped this.SetKeyValue("fighttarget",untyped value);
    }
    
    /**
		Follow target

		Targetname of an entity used as a goal for the children to follow.
	**/
    public var followtarget(get,set):String;

    @:noCompletion
    public extern inline function get_followtarget():String {
        return untyped this.GetKeyValues().followtarget;
    }
    
    @:noCompletion
    public extern inline function set_followtarget(value:String):String {
        return untyped this.SetKeyValue("followtarget",untyped value);
    }
    
    /**
		Vehicle Spawn Distance

		This is a modifier of the current spawn distance. Spawn distance on a vehicle is based on speed, so this is just a modifier for it.
	**/
    public var vehicledistance(get,set):Float;

    @:noCompletion
    public extern inline function get_vehicledistance():Float {
        return untyped this.GetKeyValues().vehicledistance;
    }
    
    @:noCompletion
    public extern inline function set_vehicledistance(value:Float):Float {
        return untyped this.SetKeyValue("vehicledistance",untyped value);
    }
    
    /**
		Random Worker Spawn Rate

		Percentage chance that a spawned antlion will be a worker. (0 = no chance, 1 = 100% chance)
	**/
    public var workerspawnrate(get,set):Float;

    @:noCompletion
    public extern inline function get_workerspawnrate():Float {
        return untyped this.GetKeyValues().workerspawnrate;
    }
    
    @:noCompletion
    public extern inline function set_workerspawnrate(value:Float):Float {
        return untyped this.SetKeyValue("workerspawnrate",untyped value);
    }
    
    /**
		Ignore Bugbait
	**/
    public var ignorebugbait(get,set):Npc_antlion_template_makerignorebugbaitChoices;

    @:noCompletion
    public extern inline function get_ignorebugbait():Npc_antlion_template_makerignorebugbaitChoices {
        return untyped this.GetKeyValues().ignorebugbait;
    }
    
    @:noCompletion
    public extern inline function set_ignorebugbait(value:Npc_antlion_template_makerignorebugbaitChoices):Npc_antlion_template_makerignorebugbaitChoices {
        return untyped this.SetKeyValue("ignorebugbait",untyped value);
    }
    
    /**
		Initial antlions in the pool.

		Number of antlions in the pool at map start.
	**/
    public var pool_start(get,set):Int;

    @:noCompletion
    public extern inline function get_pool_start():Int {
        return untyped this.GetKeyValues().pool_start;
    }
    
    @:noCompletion
    public extern inline function set_pool_start(value:Int):Int {
        return untyped this.SetKeyValue("pool_start",untyped value);
    }
    
    /**
		Max antlions in the pool.

		Maximum number of antlions allowed in the pool. If 0, pool behavior is turned off.
	**/
    public var pool_max(get,set):Int;

    @:noCompletion
    public extern inline function get_pool_max():Int {
        return untyped this.GetKeyValues().pool_max;
    }
    
    @:noCompletion
    public extern inline function set_pool_max(value:Int):Int {
        return untyped this.SetKeyValue("pool_max",untyped value);
    }
    
    /**
		Pool regen amount.

		This is the number of antlions added to the pool every time it regenerates.
	**/
    public var pool_regen_amount(get,set):Int;

    @:noCompletion
    public extern inline function get_pool_regen_amount():Int {
        return untyped this.GetKeyValues().pool_regen_amount;
    }
    
    @:noCompletion
    public extern inline function set_pool_regen_amount(value:Int):Int {
        return untyped this.SetKeyValue("pool_regen_amount",untyped value);
    }
    
    /**
		Pool regen time.

		Time interval between pool regeneration ticks.
	**/
    public var pool_regen_time(get,set):Float;

    @:noCompletion
    public extern inline function get_pool_regen_time():Float {
        return untyped this.GetKeyValues().pool_regen_time;
    }
    
    @:noCompletion
    public extern inline function set_pool_regen_time(value:Float):Float {
        return untyped this.SetKeyValue("pool_regen_time",untyped value);
    }
    
    /**
		Create Spore effect
	**/
    public var createspores(get,set):Npc_antlion_template_makercreatesporesChoices;

    @:noCompletion
    public extern inline function get_createspores():Npc_antlion_template_makercreatesporesChoices {
        return untyped this.GetKeyValues().createspores;
    }
    
    @:noCompletion
    public extern inline function set_createspores(value:Npc_antlion_template_makercreatesporesChoices):Npc_antlion_template_makercreatesporesChoices {
        return untyped this.SetKeyValue("createspores",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when an NPC is spawned. The activator is the NPC, and the string is the name of the NPC.
	**/
    public extern inline function OutputOnSpawnNPC(callback:Callback<{activator:Npc_antlion_template_maker,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSpawnNPC",callback);
    }
    
    /**
		Fired when the spawned is exhausted (all children have been spawned).
	**/
    public extern inline function OutputOnAllSpawned(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllSpawned",callback);
    }
    
    /**
		Fired when the spawner is exhausted (all children have been spawned) and all spawned children have died.
	**/
    public extern inline function OutputOnAllSpawnedDead(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllSpawnedDead",callback);
    }
    
    /**
		Fired when all spawned children have died. This does not mean the spawned is exhausted, so a new child may be spawned any time after this (unless the maker is disabled).
	**/
    public extern inline function OutputOnAllLiveChildrenDead(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllLiveChildrenDead",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when all the hint nodes are blocked.
	**/
    public extern inline function OutputOnAllBlocked(callback:Callback<{activator:Npc_antlion_template_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllBlocked",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Npc_antlion_template_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Npc_antlion_template_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Npc_antlion_template_makerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("npc_antlion_template_maker");
    }
}

enum abstract Npc_antlion_template_makerignorebugbaitChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_antlion_template_makercreatesporesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_antlion_template_makerStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Npc_antlion_template_makerSpawnFlags(Int) to Int {
	var FADE_CORPSE = 16;
	var INFINITE_CHILDREN = 32;
	var DO_NOT_DROP = 64;
	var DONT_SPAWN_WHILE_VISIBLE = 128;
	var RANDOM_SPAWN_NODE = 1024;
	var TRY_TO_SPAWN_CLOSE_TO_THE_CURRENT_TARGET = 2048;
	var PICK_A_RANDOM_FIGHT_TARGET = 4096;
	var TRY_TO_PLAY_BLOCKED_EFFECTS_NEAR_THE_PLAYER = 8192;
}

#end
