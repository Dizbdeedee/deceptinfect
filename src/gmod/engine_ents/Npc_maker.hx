package gmod.engine_ents;
#if server
/**
	NPC Maker
**/
@:forward
abstract Npc_maker(Entity) to Entity {
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
    public var StartDisabled(get,set):Npc_makerStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Npc_makerStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Npc_makerStartDisabledChoices):Npc_makerStartDisabledChoices {
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
    public var StartDisabled(get,set):Npc_makerStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Npc_makerStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Npc_makerStartDisabledChoices):Npc_makerStartDisabledChoices {
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
		Class name of spawned NPC
	**/
    public var NPCType(get,set):String;

    @:noCompletion
    public extern inline function get_NPCType():String {
        return untyped this.GetKeyValues().NPCType;
    }
    
    @:noCompletion
    public extern inline function set_NPCType(value:String):String {
        return untyped this.SetKeyValue("NPCType",untyped value);
    }
    
    /**
		Childrens' Name
	**/
    public var NPCTargetname(get,set):String;

    @:noCompletion
    public extern inline function get_NPCTargetname():String {
        return untyped this.GetKeyValues().NPCTargetname;
    }
    
    @:noCompletion
    public extern inline function set_NPCTargetname(value:String):String {
        return untyped this.SetKeyValue("NPCTargetname",untyped value);
    }
    
    /**
		Childrens' Squad Name
	**/
    public var NPCSquadname(get,set):String;

    @:noCompletion
    public extern inline function get_NPCSquadname():String {
        return untyped this.GetKeyValues().NPCSquadname;
    }
    
    @:noCompletion
    public extern inline function set_NPCSquadname(value:String):String {
        return untyped this.SetKeyValue("NPCSquadname",untyped value);
    }
    
    /**
		Childrens' Hint Group
	**/
    public var NPCHintGroup(get,set):String;

    @:noCompletion
    public extern inline function get_NPCHintGroup():String {
        return untyped this.GetKeyValues().NPCHintGroup;
    }
    
    @:noCompletion
    public extern inline function set_NPCHintGroup(value:String):String {
        return untyped this.SetKeyValue("NPCHintGroup",untyped value);
    }
    
    /**
		Weapons
	**/
    public var additionalequipment(get,set):Npc_makeradditionalequipmentChoices;

    @:noCompletion
    public extern inline function get_additionalequipment():Npc_makeradditionalequipmentChoices {
        return untyped this.GetKeyValues().additionalequipment;
    }
    
    @:noCompletion
    public extern inline function set_additionalequipment(value:Npc_makeradditionalequipmentChoices):Npc_makeradditionalequipmentChoices {
        return untyped this.SetKeyValue("additionalequipment",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when an NPC is spawned. The activator is the NPC, and the string is the name of the NPC.
	**/
    public extern inline function OutputOnSpawnNPC(callback:Callback<{activator:Npc_maker,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSpawnNPC",callback);
    }
    
    /**
		Fired when the spawned is exhausted (all children have been spawned).
	**/
    public extern inline function OutputOnAllSpawned(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllSpawned",callback);
    }
    
    /**
		Fired when the spawner is exhausted (all children have been spawned) and all spawned children have died.
	**/
    public extern inline function OutputOnAllSpawnedDead(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllSpawnedDead",callback);
    }
    
    /**
		Fired when all spawned children have died. This does not mean the spawned is exhausted, so a new child may be spawned any time after this (unless the maker is disabled).
	**/
    public extern inline function OutputOnAllLiveChildrenDead(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnAllLiveChildrenDead",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Npc_maker}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Npc_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Npc_makerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Npc_makerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("npc_maker");
    }
}

enum abstract Npc_makeradditionalequipmentChoices(String) to String {
	var PISTOL = "weapon_pistol";
	var AR2 = "weapon_ar2";
	var SHOTGUN = "weapon_shotgun";
	var SMG1 = "weapon_smg1";
	var STUN_STICK = "weapon_stunstick";
	var GRIGORIS_SHOTGUN = "weapon_annabelle";
	var NOTHING = "0";
}
enum abstract Npc_makerStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Npc_makerSpawnFlags(Int) to Int {
	var FADE_CORPSE = 16;
	var INFINITE_CHILDREN = 32;
	var DO_NOT_DROP = 64;
	var DONT_SPAWN_WHILE_VISIBLE = 128;
	var FADE_CORPSE = 16;
}

#end
