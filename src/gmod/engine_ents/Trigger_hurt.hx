package gmod.engine_ents;
#if server
/**
	A trigger volume that damages entities that touch it.
**/
@:forward
abstract Trigger_hurt(Entity) to Entity {
    //Inputs
    
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
		Toggles this trigger between enabled and disabled states.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Set a new amount of damage for this trigger.
	**/
    public extern inline function FireSetDamage(param:Float,delay:Float) {
        untyped this.Fire("SetDamage",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Trigger_hurtStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Trigger_hurtStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Trigger_hurtStartDisabledChoices):Trigger_hurtStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Global Entity Name

		Name by which this entity is linked to another entity in a different map. When the player transitions to a new map, entities in the new map with globalnames matching entities in the previous map will have the previous map's state copied over their state.
	**/
    public var globalname(get,set):String;

    @:noCompletion
    public extern inline function get_globalname():String {
        return untyped this.GetKeyValues().globalname;
    }
    
    @:noCompletion
    public extern inline function set_globalname(value:String):String {
        return untyped this.SetKeyValue("globalname",untyped value);
    }
    
    /**
		Origin (X Y Z)

		The position of this entity's center in the world. Rotating entities typically rotate around their origin.
	**/
    public var origin(get,set):String;

    @:noCompletion
    public extern inline function get_origin():String {
        return untyped this.GetKeyValues().origin;
    }
    
    @:noCompletion
    public extern inline function set_origin(value:String):String {
        return untyped this.SetKeyValue("origin",untyped value);
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
		Filter Name

		Filter to use to see if activator triggers me. See filter_activator_name for more explanation.
	**/
    public var filtername(get,set):String;

    @:noCompletion
    public extern inline function get_filtername():String {
        return untyped this.GetKeyValues().filtername;
    }
    
    @:noCompletion
    public extern inline function set_filtername(value:String):String {
        return untyped this.SetKeyValue("filtername",untyped value);
    }
    
    /**
		Master (Obsolete)

		Legacy support: The name of a master entity. If the master hasn't been activated, this entity will not activate.
	**/
    public var master(get,set):String;

    @:noCompletion
    public extern inline function get_master():String {
        return untyped this.GetKeyValues().master;
    }
    
    @:noCompletion
    public extern inline function set_master(value:String):String {
        return untyped this.SetKeyValue("master",untyped value);
    }
    
    /**
		Damage

		The amount of damage done to entities that touch this trigger. The damage is done every half-second. See also 'Damage Model' for extra details on how damage can be dealt.
	**/
    public var damage(get,set):Int;

    @:noCompletion
    public extern inline function get_damage():Int {
        return untyped this.GetKeyValues().damage;
    }
    
    @:noCompletion
    public extern inline function set_damage(value:Int):Int {
        return untyped this.SetKeyValue("damage",untyped value);
    }
    
    /**
		Damage Cap

		Maximum damage dealt per second. This field is only used if you select the Doubling w/Forgiveness damage model, via the spawnflag.
	**/
    public var damagecap(get,set):Int;

    @:noCompletion
    public extern inline function get_damagecap():Int {
        return untyped this.GetKeyValues().damagecap;
    }
    
    @:noCompletion
    public extern inline function set_damagecap(value:Int):Int {
        return untyped this.SetKeyValue("damagecap",untyped value);
    }
    
    /**
		Damage Type
	**/
    public var damagetype(get,set):Trigger_hurtdamagetypeChoices;

    @:noCompletion
    public extern inline function get_damagetype():Trigger_hurtdamagetypeChoices {
        return untyped this.GetKeyValues().damagetype;
    }
    
    @:noCompletion
    public extern inline function set_damagetype(value:Trigger_hurtdamagetypeChoices):Trigger_hurtdamagetypeChoices {
        return untyped this.SetKeyValue("damagetype",untyped value);
    }
    
    /**
		Damage Model

		How damage is dealt. Normal always does the specified amount of damage each half second. Doubling starts with the specified amount and doubles it each time it hurts the toucher. Forgiveness means that if the toucher gets out of the trigger the damage will reset to the specified value. Good for making triggers that are deadly over time without having to cause massive damage on each touch.
	**/
    public var damagemodel(get,set):Trigger_hurtdamagemodelChoices;

    @:noCompletion
    public extern inline function get_damagemodel():Trigger_hurtdamagemodelChoices {
        return untyped this.GetKeyValues().damagemodel;
    }
    
    @:noCompletion
    public extern inline function set_damagemodel(value:Trigger_hurtdamagemodelChoices):Trigger_hurtdamagemodelChoices {
        return untyped this.SetKeyValue("damagemodel",untyped value);
    }
    
    /**
		Zero Damage Force

		Should the damaged entity receive no physics force from this trigger.
	**/
    public var nodmgforce(get,set):Trigger_hurtnodmgforceChoices;

    @:noCompletion
    public extern inline function get_nodmgforce():Trigger_hurtnodmgforceChoices {
        return untyped this.GetKeyValues().nodmgforce;
    }
    
    @:noCompletion
    public extern inline function set_nodmgforce(value:Trigger_hurtnodmgforceChoices):Trigger_hurtnodmgforceChoices {
        return untyped this.SetKeyValue("nodmgforce",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnStartTouchAll(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouchAll",callback);
    }
    
    /**
		Fired when an entity stops touching this trigger. Only entities that passed this trigger's filters will cause this output to fire.
	**/
    public extern inline function OutputOnEndTouch(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouch",callback);
    }
    
    /**
		Fires when an entity stops touching this trigger, and no other entities are touching it. Only entities that passed this trigger's filters are considered.
	**/
    public extern inline function OutputOnEndTouchAll(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndTouchAll",callback);
    }
    
    /**
		Fired when an entity starts touching this trigger. The touching entity must pass this trigger's filters to cause this output to fire.
	**/
    public extern inline function OutputOnStartTouch(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStartTouch",callback);
    }
    
    /**
		Fired whenever this trigger hurts something other than a player.
	**/
    public extern inline function OutputOnHurt(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHurt",callback);
    }
    
    /**
		Fired whenever this trigger hurts a player.
	**/
    public extern inline function OutputOnHurtPlayer(callback:Callback<{activator:Trigger_hurt}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHurtPlayer",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Trigger_hurtSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Trigger_hurtSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Trigger_hurtSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_hurt");
    }
}

enum abstract Trigger_hurtnodmgforceChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Trigger_hurtdamagetypeChoices(Int) to Int {
	var GENERIC = 0;
	var CRUSH = 1;
	var BULLET = 2;
	var SLASH = 4;
	var BURN = 8;
	var FREEZE = 16;
	var FALL = 32;
	var BLAST = 64;
	var CLUB = 128;
	var SHOCK = 256;
	var SONIC = 512;
	var ENERGYBEAM = 1024;
	var DROWN = 16384;
	var PARALYSE = 32768;
	var NERVEGAS = 65536;
	var POISON = 131072;
	var RADIATION = 262144;
	var DROWNRECOVER = 524288;
	var CHEMICAL = 1048576;
	var SLOWBURN = 2097152;
	var SLOWFREEZE = 4194304;
}
enum abstract Trigger_hurtdamagemodelChoices(Int) to Int {
	var NORMAL = 0;
	var DOUBLING_WFORGIVENESS = 1;
}
enum abstract Trigger_hurtStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Trigger_hurtSpawnFlags(Int) to Int {
	var CLIENTS = 1;
	var NPCS = 2;
	var PUSHABLES = 4;
	var PHYSICS_OBJECTS = 8;
	var ONLY_PLAYER_ALLY_NPCS = 16;
	var ONLY_CLIENTS_IN_VEHICLES = 32;
	var EVERYTHING_NOT_INCLUDING_PHYSICS_DEBRIS = 64;
	var ONLY_CLIENTS_NOT_IN_VEHICLES = 512;
	var PHYSICS_DEBRIS = 1024;
	var ONLY_NPCS_IN_VEHICLES_RESPECTS_PLAYER_ALLY_FLAG = 2048;
	var DISALLOW_BOTS = 4096;
}

#end
