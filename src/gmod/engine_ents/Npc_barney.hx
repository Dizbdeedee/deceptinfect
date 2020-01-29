package gmod.engine_ents;
#if server
/**
	Barney
**/
@:forward
abstract Npc_barney(NPC) to Entity to NPC {
    //Inputs
    
    /**
		Changes this entity's relationship with another entity or class. Format: <entityname/classname> <D_HT/D_FR/D_LI/D_NU> <priority>
	**/
    public extern inline function FireSetRelationship(param:String,delay:Float) {
        untyped this.Fire("SetRelationship",untyped param,delay);
    }
    
    /**
		Changes this NPC's enemy filter to the named filter.
	**/
    public extern inline function FireSetEnemyFilter(param:String,delay:Float) {
        untyped this.Fire("SetEnemyFilter",untyped param,delay);
    }
    
    /**
		Set this NPC's health.
	**/
    public extern inline function FireSetHealth(param:Int,delay:Float) {
        untyped this.Fire("SetHealth",untyped param,delay);
    }
    
    /**
		HACK: Sets this NPC's body group (from 0 - n). You'd better know what you are doing!
	**/
    public extern inline function FireSetBodyGroup(param:Int,delay:Float) {
        untyped this.Fire("SetBodyGroup",untyped param,delay);
    }
    
    /**
		Sets the value that scales damage energy when this character is hit by a physics object. NOTE: 0 means this feature is disabled for backwards compatibility.
	**/
    public extern inline function Firephysdamagescale(param:Float,delay:Float) {
        untyped this.Fire("physdamagescale",untyped param,delay);
    }
    
    /**
		Ignite, burst into flames
	**/
    public extern inline function FireIgnite(delay:Float) {
        untyped this.Fire("Ignite",untyped null,delay);
    }
    
    /**
		Ignite, with a parameter lifetime.
	**/
    public extern inline function FireIgniteLifetime(param:Float,delay:Float) {
        untyped this.Fire("IgniteLifetime",untyped param,delay);
    }
    
    /**
		Ignite, with a parameter number of hitbox fires.
	**/
    public extern inline function FireIgniteNumHitboxFires(param:Int,delay:Float) {
        untyped this.Fire("IgniteNumHitboxFires",untyped param,delay);
    }
    
    /**
		Ignite, with a parameter hitbox fire scale.
	**/
    public extern inline function FireIgniteHitboxFireScale(param:Float,delay:Float) {
        untyped this.Fire("IgniteHitboxFireScale",untyped param,delay);
    }
    
    /**
		Break, smash into pieces
	**/
    public extern inline function FireBreak(delay:Float) {
        untyped this.Fire("Break",untyped null,delay);
    }
    
    /**
		Enter scripting state. In this state, NPCs ignore a variety of stimulus that would make them break out of their scripts: They ignore danger sounds, ignore +USE, don't idle speak or respond to other NPC's idle speech, and so on.
	**/
    public extern inline function FireStartScripting(delay:Float) {
        untyped this.Fire("StartScripting",untyped null,delay);
    }
    
    /**
		Exit scripting state.
	**/
    public extern inline function FireStopScripting(delay:Float) {
        untyped this.Fire("StopScripting",untyped null,delay);
    }
    
    /**
		Set the name of this NPC's squad. It will be removed from any existing squad automatically. Leaving the parameter blank will remove the NPC from any existing squad.
	**/
    public extern inline function FireSetSquad(param:String,delay:Float) {
        untyped this.Fire("SetSquad",untyped param,delay);
    }
    
    /**
		Wakes up the NPC if it is sleeping.
	**/
    public extern inline function FireWake(delay:Float) {
        untyped this.Fire("Wake",untyped null,delay);
    }
    
    /**
		Clears out the NPC's knowledge of a named entity.
	**/
    public extern inline function FireForgetEntity(param:String,delay:Float) {
        untyped this.Fire("ForgetEntity",untyped param,delay);
    }
    
    /**
		Turn on the NPC Gag flag. NPC won't speak outside of choreographed scenes.
	**/
    public extern inline function FireGagEnable(delay:Float) {
        untyped this.Fire("GagEnable",untyped null,delay);
    }
    
    /**
		Turn off the NPC Gag flag.
	**/
    public extern inline function FireGagDisable(delay:Float) {
        untyped this.Fire("GagDisable",untyped null,delay);
    }
    
    /**
		Ignore danger sounds for the specified number of seconds.
	**/
    public extern inline function FireIgnoreDangerSounds(param:Float,delay:Float) {
        untyped this.Fire("IgnoreDangerSounds",untyped param,delay);
    }
    
    /**
		Force the NPC to holster their weapon. Ignored if the NPC is scripting, if the NPC's weapon is already holstered, or if the NPC doesn't use weapons.
	**/
    public extern inline function FireHolsterWeapon(delay:Float) {
        untyped this.Fire("HolsterWeapon",untyped null,delay);
    }
    
    /**
		Identical to HolsterWeapon, except the weapon is destroyed once it has been holstered and concealed.
	**/
    public extern inline function FireHolsterAndDestroyWeapon(delay:Float) {
        untyped this.Fire("HolsterAndDestroyWeapon",untyped null,delay);
    }
    
    /**
		Force the NPC to draw their weapon. Ignored if the NPC is scripting, if the NPC's weapon is already drawn, or if the NPC doesn't use weapons.
	**/
    public extern inline function FireUnholsterWeapon(delay:Float) {
        untyped this.Fire("UnholsterWeapon",untyped null,delay);
    }
    
    /**
		Force the NPC to use a dynamic interaction with another NPC. Parameter format: <target NPC name> <dynamic interaction name>
	**/
    public extern inline function FireForceInteractionWithNPC(param:String,delay:Float) {
        untyped this.Fire("ForceInteractionWithNPC",untyped param,delay);
    }
    
    /**
		Update (or Create) this NPC's memory of an enemy and its location
	**/
    public extern inline function FireUpdateEnemyMemory(param:String,delay:Float) {
        untyped this.Fire("UpdateEnemyMemory",untyped param,delay);
    }
    
    /**
		This NPC will instantly become a ragdoll with ZERO force (just go limp). OnDeath, OnHalfHealth, etc. Outputs will **NOT** BE FIRED.
	**/
    public extern inline function FireBecomeRagdoll(delay:Float) {
        untyped this.Fire("BecomeRagdoll",untyped null,delay);
    }
    
    /**
		GMOD: Sets the maximum look distance for the NPC. Defaults are 2048 and 6000 for long range NPCs.
	**/
    public extern inline function FireSetMaxLookDistance(param:Float,delay:Float) {
        untyped this.Fire("SetMaxLookDistance",untyped param,delay);
    }
    
    /**
		Sets the entity to use as damage filter. Pass in an empty string to clear the damage filter.
	**/
    public extern inline function FireSetDamageFilter(param:String,delay:Float) {
        untyped this.Fire("SetDamageFilter",untyped param,delay);
    }
    
    /**
		Use this input to teleport the NPC to a hintnode with the Player Squad Transition Point hint type.
	**/
    public extern inline function FireOutsideTransition(delay:Float) {
        untyped this.Fire("OutsideTransition",untyped null,delay);
    }
    
    /**
		Enable the 'always transition' behavior
	**/
    public extern inline function FireEnableAlwaysTransition(delay:Float) {
        untyped this.Fire("EnableAlwaysTransition",untyped null,delay);
    }
    
    /**
		Disable the 'always transition' behavior
	**/
    public extern inline function FireDisableAlwaysTransition(delay:Float) {
        untyped this.Fire("DisableAlwaysTransition",untyped null,delay);
    }
    
    /**
		Allow this NPC to speak responses while in a scripted sequence or while StartScripting is active.
	**/
    public extern inline function FireEnableSpeakWhileScripting(delay:Float) {
        untyped this.Fire("EnableSpeakWhileScripting",untyped null,delay);
    }
    
    /**
		Cancels this NPC's ability to speak responses while in a scripted sequence or while StartScripting is active if it was previously enabled by EnableSpeakWhileScripting.
	**/
    public extern inline function FireDisableSpeakWhileScripting(delay:Float) {
        untyped this.Fire("DisableSpeakWhileScripting",untyped null,delay);
    }
    
    /**
		Make this NPC a game end ally.
	**/
    public extern inline function FireMakeGameEndAlly(delay:Float) {
        untyped this.Fire("MakeGameEndAlly",untyped null,delay);
    }
    
    /**
		Make this NPC a regular ally.
	**/
    public extern inline function FireMakeRegularAlly(delay:Float) {
        untyped this.Fire("MakeRegularAlly",untyped null,delay);
    }
    
    /**
		Enable Weapon Pickup
	**/
    public extern inline function FireEnableWeaponPickup(delay:Float) {
        untyped this.Fire("EnableWeaponPickup",untyped null,delay);
    }
    
    /**
		Disable Weapon Pickup
	**/
    public extern inline function FireDisableWeaponPickup(delay:Float) {
        untyped this.Fire("DisableWeaponPickup",untyped null,delay);
    }
    
    /**
		Gives the NPC a weapon of the specified entity name.
	**/
    public extern inline function FireGiveWeapon(param:String,delay:Float) {
        untyped this.Fire("GiveWeapon",untyped param,delay);
    }
    
    /**
		Set readiness to panic state (Special)
	**/
    public extern inline function FireSetReadinessPanic(delay:Float) {
        untyped this.Fire("SetReadinessPanic",untyped null,delay);
    }
    
    /**
		Set readiness to calmest state (Bored)
	**/
    public extern inline function FireSetReadinessLow(delay:Float) {
        untyped this.Fire("SetReadinessLow",untyped null,delay);
    }
    
    /**
		Set readiness to moderate (Alert)
	**/
    public extern inline function FireSetReadinessMedium(delay:Float) {
        untyped this.Fire("SetReadinessMedium",untyped null,delay);
    }
    
    /**
		Set readiness to highest. (Combat imminent)
	**/
    public extern inline function FireSetReadinessHigh(delay:Float) {
        untyped this.Fire("SetReadinessHigh",untyped null,delay);
    }
    
    /**
		Lock readiness at current setting for x seconds -1 = forever, 0 = unlock now
	**/
    public extern inline function FireLockReadiness(param:Float,delay:Float) {
        untyped this.Fire("LockReadiness",untyped param,delay);
    }
    
    /**
		Obliterate every output that this NPC has.
	**/
    public extern inline function FireClearAllOutputs(delay:Float) {
        untyped this.Fire("ClearAllOutputs",untyped null,delay);
    }
    
    /**
		Set the sprite's alpha (0 - 255).
	**/
    public extern inline function FireAlpha(param:Int,delay:Float) {
        untyped this.Fire("Alpha",untyped param,delay);
    }
    
    /**
		Set the sprite's color (R G B).
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
    }
    
    /**
		Adds a context to this entity's list of response contexts. The format should be 'key:value'.
	**/
    public extern inline function FireAddContext(param:String,delay:Float) {
        untyped this.Fire("AddContext",untyped param,delay);
    }
    
    /**
		Remove a context from this entity's list of response contexts. The name should match the 'key' of a previously added context.
	**/
    public extern inline function FireRemoveContext(param:String,delay:Float) {
        untyped this.Fire("RemoveContext",untyped param,delay);
    }
    
    /**
		Removes all contexts in this entity's list of response contexts.
	**/
    public extern inline function FireClearContext(delay:Float) {
        untyped this.Fire("ClearContext",untyped null,delay);
    }
    
    /**
		Turn shadow off.
	**/
    public extern inline function FireDisableShadow(delay:Float) {
        untyped this.Fire("DisableShadow",untyped null,delay);
    }
    
    /**
		Turn shadow on.
	**/
    public extern inline function FireEnableShadow(delay:Float) {
        untyped this.Fire("EnableShadow",untyped null,delay);
    }
    
    /**
		Speak the specified response concept.
	**/
    public extern inline function FireSpeakResponseConcept(param:String,delay:Float) {
        untyped this.Fire("SpeakResponseConcept",untyped param,delay);
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
		Set facial expression override
	**/
    public extern inline function FireSetExpressionOverride(param:String,delay:Float) {
        untyped this.Fire("SetExpressionOverride",untyped param,delay);
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
		Target Path Corner

		If set, the name of a path corner entity that this NPC will walk to, after spawning.
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
		Squad Name

		NPCs that are in the same squad (i.e. have matching squad names) will share information about enemies, and will take turns attacking and covering each other.
	**/
    public var squadname(get,set):String;

    @:noCompletion
    public extern inline function get_squadname():String {
        return untyped this.GetKeyValues().squadname;
    }
    
    @:noCompletion
    public extern inline function set_squadname(value:String):String {
        return untyped this.SetKeyValue("squadname",untyped value);
    }
    
    /**
		Hint Group

		Hint groups are used by NPCs to restrict their hint-node searching to a subset of the map's hint nodes. Only hint nodes with matching hint group names will be considered by this NPC.
	**/
    public var hintgroup(get,set):String;

    @:noCompletion
    public extern inline function get_hintgroup():String {
        return untyped this.GetKeyValues().hintgroup;
    }
    
    @:noCompletion
    public extern inline function set_hintgroup(value:String):String {
        return untyped this.SetKeyValue("hintgroup",untyped value);
    }
    
    /**
		Hint Limit Nav

		Limits NPC to using specified hint group for navigation requests, but does not limit local navigation.
	**/
    public var hintlimiting(get,set):Npc_barneyhintlimitingChoices;

    @:noCompletion
    public extern inline function get_hintlimiting():Npc_barneyhintlimitingChoices {
        return untyped this.GetKeyValues().hintlimiting;
    }
    
    @:noCompletion
    public extern inline function set_hintlimiting(value:Npc_barneyhintlimitingChoices):Npc_barneyhintlimitingChoices {
        return untyped this.SetKeyValue("hintlimiting",untyped value);
    }
    
    /**
		Sleep State

		Holds the NPC in stasis until specified condition. See also 'Wake Radius' and 'Wake Squad'.
	**/
    public var sleepstate(get,set):Npc_barneysleepstateChoices;

    @:noCompletion
    public extern inline function get_sleepstate():Npc_barneysleepstateChoices {
        return untyped this.GetKeyValues().sleepstate;
    }
    
    @:noCompletion
    public extern inline function set_sleepstate(value:Npc_barneysleepstateChoices):Npc_barneysleepstateChoices {
        return untyped this.SetKeyValue("sleepstate",untyped value);
    }
    
    /**
		Wake Radius

		Auto-wake if player within this distance
	**/
    public var wakeradius(get,set):Float;

    @:noCompletion
    public extern inline function get_wakeradius():Float {
        return untyped this.GetKeyValues().wakeradius;
    }
    
    @:noCompletion
    public extern inline function set_wakeradius(value:Float):Float {
        return untyped this.SetKeyValue("wakeradius",untyped value);
    }
    
    /**
		Wake Squad

		Wake all of the NPCs squadmates if the NPC is woken
	**/
    public var wakesquad(get,set):Npc_barneywakesquadChoices;

    @:noCompletion
    public extern inline function get_wakesquad():Npc_barneywakesquadChoices {
        return untyped this.GetKeyValues().wakesquad;
    }
    
    @:noCompletion
    public extern inline function set_wakesquad(value:Npc_barneywakesquadChoices):Npc_barneywakesquadChoices {
        return untyped this.SetKeyValue("wakesquad",untyped value);
    }
    
    /**
		Enemy Filter

		Filter by which to filter potential enemies
	**/
    public var enemyfilter(get,set):String;

    @:noCompletion
    public extern inline function get_enemyfilter():String {
        return untyped this.GetKeyValues().enemyfilter;
    }
    
    @:noCompletion
    public extern inline function set_enemyfilter(value:String):String {
        return untyped this.SetKeyValue("enemyfilter",untyped value);
    }
    
    /**
		Ignore unseen enemies

		Prefer visible enemies, regardless of distance or relationship priority
	**/
    public var ignoreunseenenemies(get,set):Npc_barneyignoreunseenenemiesChoices;

    @:noCompletion
    public extern inline function get_ignoreunseenenemies():Npc_barneyignoreunseenenemiesChoices {
        return untyped this.GetKeyValues().ignoreunseenenemies;
    }
    
    @:noCompletion
    public extern inline function set_ignoreunseenenemies(value:Npc_barneyignoreunseenenemiesChoices):Npc_barneyignoreunseenenemiesChoices {
        return untyped this.SetKeyValue("ignoreunseenenemies",untyped value);
    }
    
    /**
		Physics Impact Damage Scale

		Scales damage energy when this character is hit by a physics object. With a value of 0 the NPC will take no damage from physics.
	**/
    public var physdamagescale(get,set):Float;

    @:noCompletion
    public extern inline function get_physdamagescale():Float {
        return untyped this.GetKeyValues().physdamagescale;
    }
    
    @:noCompletion
    public extern inline function set_physdamagescale(value:Float):Float {
        return untyped this.SetKeyValue("physdamagescale",untyped value);
    }
    
    /**
		Damage Filter

		Name of the filter entity that controls which entities can damage us.
	**/
    public var damagefilter(get,set):String;

    @:noCompletion
    public extern inline function get_damagefilter():String {
        return untyped this.GetKeyValues().damagefilter;
    }
    
    @:noCompletion
    public extern inline function set_damagefilter(value:String):String {
        return untyped this.SetKeyValue("damagefilter",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Npc_barneygmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Npc_barneygmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Npc_barneygmod_allowphysgunChoices):Npc_barneygmod_allowphysgunChoices {
        return untyped this.SetKeyValue("gmod_allowphysgun",untyped value);
    }
    
    /**
		Sandbox Tool Whitelist

		If set, only given tools can be used on this entity.
You need to supply the tool class names, the names of the .lua files of those tools.
This also includes the context menu properties!
	**/
    public var gmod_allowtools(get,set):String;

    @:noCompletion
    public extern inline function get_gmod_allowtools():String {
        return untyped this.GetKeyValues().gmod_allowtools;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowtools(value:String):String {
        return untyped this.SetKeyValue("gmod_allowtools",untyped value);
    }
    
    /**
		Always transition

		If yes, this NPC will always teleport to a Player Squad Transition Point if they're not within the trigger_transition volume.
	**/
    public var AlwaysTransition(get,set):Npc_barneyAlwaysTransitionChoices;

    @:noCompletion
    public extern inline function get_AlwaysTransition():Npc_barneyAlwaysTransitionChoices {
        return untyped this.GetKeyValues().AlwaysTransition;
    }
    
    @:noCompletion
    public extern inline function set_AlwaysTransition(value:Npc_barneyAlwaysTransitionChoices):Npc_barneyAlwaysTransitionChoices {
        return untyped this.SetKeyValue("AlwaysTransition",untyped value);
    }
    
    /**
		Prevent picking up weapons?

		If yes, this NPC will NOT be allowed to pick up weapons they find on the ground.
	**/
    public var DontPickupWeapons(get,set):Npc_barneyDontPickupWeaponsChoices;

    @:noCompletion
    public extern inline function get_DontPickupWeapons():Npc_barneyDontPickupWeaponsChoices {
        return untyped this.GetKeyValues().DontPickupWeapons;
    }
    
    @:noCompletion
    public extern inline function set_DontPickupWeapons(value:Npc_barneyDontPickupWeaponsChoices):Npc_barneyDontPickupWeaponsChoices {
        return untyped this.SetKeyValue("DontPickupWeapons",untyped value);
    }
    
    /**
		Is this a vital ally?

		If yes, this NPC will cause the game to end if killed.
	**/
    public var GameEndAlly(get,set):Npc_barneyGameEndAllyChoices;

    @:noCompletion
    public extern inline function get_GameEndAlly():Npc_barneyGameEndAllyChoices {
        return untyped this.GetKeyValues().GameEndAlly;
    }
    
    @:noCompletion
    public extern inline function set_GameEndAlly(value:Npc_barneyGameEndAllyChoices):Npc_barneyGameEndAllyChoices {
        return untyped this.SetKeyValue("GameEndAlly",untyped value);
    }
    
    /**
		Render Mode

		Used to set a non-standard rendering mode on this entity. See also 'FX Amount' and 'FX Color'.
	**/
    public var rendermode(get,set):Npc_barneyrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Npc_barneyrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Npc_barneyrendermodeChoices):Npc_barneyrendermodeChoices {
        return untyped this.SetKeyValue("rendermode",untyped value);
    }
    
    /**
		FX Amount (0 - 255)

		The FX amount is used by the selected Render Mode.
	**/
    public var renderamt(get,set):Int;

    @:noCompletion
    public extern inline function get_renderamt():Int {
        return untyped this.GetKeyValues().renderamt;
    }
    
    @:noCompletion
    public extern inline function set_renderamt(value:Int):Int {
        return untyped this.SetKeyValue("renderamt",untyped value);
    }
    
    /**
		FX Color (R G B)

		The FX color is used by the selected Render Mode.
	**/
    public var rendercolor(get,set):String;

    @:noCompletion
    public extern inline function get_rendercolor():String {
        return untyped this.GetKeyValues().rendercolor;
    }
    
    @:noCompletion
    public extern inline function set_rendercolor(value:String):String {
        return untyped this.SetKeyValue("rendercolor",untyped value);
    }
    
    /**
		Disable Receiving Shadows
	**/
    public var disablereceiveshadows(get,set):Npc_barneydisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Npc_barneydisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Npc_barneydisablereceiveshadowsChoices):Npc_barneydisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Npc_barneyrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Npc_barneyrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Npc_barneyrenderfxChoices):Npc_barneyrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Response Contexts

		Response system context(s) for this entity. Format should be: 'key:value,key2:value2,etc'. When this entity speaks, the list of keys & values will be passed to the response rules system.
	**/
    public var ResponseContext(get,set):String;

    @:noCompletion
    public extern inline function get_ResponseContext():String {
        return untyped this.GetKeyValues().ResponseContext;
    }
    
    @:noCompletion
    public extern inline function set_ResponseContext(value:String):String {
        return untyped this.SetKeyValue("ResponseContext",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Npc_barneydisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Npc_barneydisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Npc_barneydisableshadowsChoices):Npc_barneydisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
    }
    
    /**
		Use Sentence
	**/
    public var UseSentence(get,set):String;

    @:noCompletion
    public extern inline function get_UseSentence():String {
        return untyped this.GetKeyValues().UseSentence;
    }
    
    @:noCompletion
    public extern inline function set_UseSentence(value:String):String {
        return untyped this.SetKeyValue("UseSentence",untyped value);
    }
    
    /**
		Un-Use Sentence
	**/
    public var UnUseSentence(get,set):String;

    @:noCompletion
    public extern inline function get_UnUseSentence():String {
        return untyped this.GetKeyValues().UnUseSentence;
    }
    
    @:noCompletion
    public extern inline function set_UnUseSentence(value:String):String {
        return untyped this.SetKeyValue("UnUseSentence",untyped value);
    }
    
    /**
		Don't Use Speech Semaphore

		Friendly NPCs are not allowed to speak if another friendly NPC is speaking. In some cases we don't want speaking NPCs to prevent other NPCs from speaking (for instance, if there is a friendly NPC speaking for a long time on a monitor). To make this NPC not prevent other NPCs from talking, make it not grab the semaphore when it speaks.
	**/
    public var DontUseSpeechSemaphore(get,set):Npc_barneyDontUseSpeechSemaphoreChoices;

    @:noCompletion
    public extern inline function get_DontUseSpeechSemaphore():Npc_barneyDontUseSpeechSemaphoreChoices {
        return untyped this.GetKeyValues().DontUseSpeechSemaphore;
    }
    
    @:noCompletion
    public extern inline function set_DontUseSpeechSemaphore(value:Npc_barneyDontUseSpeechSemaphoreChoices):Npc_barneyDontUseSpeechSemaphoreChoices {
        return untyped this.SetKeyValue("DontUseSpeechSemaphore",untyped value);
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
		Weapons
	**/
    public var additionalequipment(get,set):Npc_barneyadditionalequipmentChoices;

    @:noCompletion
    public extern inline function get_additionalequipment():Npc_barneyadditionalequipmentChoices {
        return untyped this.GetKeyValues().additionalequipment;
    }
    
    @:noCompletion
    public extern inline function set_additionalequipment(value:Npc_barneyadditionalequipmentChoices):Npc_barneyadditionalequipmentChoices {
        return untyped this.SetKeyValue("additionalequipment",untyped value);
    }
    
    /**
		Facial expression override
	**/
    public var ExpressionOverride(get,set):String;

    @:noCompletion
    public extern inline function get_ExpressionOverride():String {
        return untyped this.GetKeyValues().ExpressionOverride;
    }
    
    @:noCompletion
    public extern inline function set_ExpressionOverride(value:String):String {
        return untyped this.SetKeyValue("ExpressionOverride",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when this NPC takes damage.
	**/
    public extern inline function OutputOnDamaged(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDamaged",callback);
    }
    
    /**
		Fired when this NPC is killed.
	**/
    public extern inline function OutputOnDeath(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDeath",callback);
    }
    
    /**
		Fired when this NPC reaches half of its maximum health.
	**/
    public extern inline function OutputOnHalfHealth(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHalfHealth",callback);
    }
    
    /**
		Fired when this NPC hears a sound (other than combat or the player).
	**/
    public extern inline function OutputOnHearWorld(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHearWorld",callback);
    }
    
    /**
		Fired when this NPC hears the player.
	**/
    public extern inline function OutputOnHearPlayer(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHearPlayer",callback);
    }
    
    /**
		Fired when this NPC hears combat sounds.
	**/
    public extern inline function OutputOnHearCombat(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnHearCombat",callback);
    }
    
    /**
		Fired when this NPC establishes line of sight to its enemy (outputs entity).
	**/
    public extern inline function OutputOnFoundEnemy(callback:Callback<{activator:Npc_barney,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFoundEnemy",callback);
    }
    
    /**
		Fired when this NPC loses line of sight to its enemy.
	**/
    public extern inline function OutputOnLostEnemyLOS(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostEnemyLOS",callback);
    }
    
    /**
		Fired when this NPC loses its enemy. Usually due to the enemy being killed/removed, or because this NPC has selected a newer, more dangerous enemy.
	**/
    public extern inline function OutputOnLostEnemy(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostEnemy",callback);
    }
    
    /**
		Fired when this NPC establishes line of sight to its enemy, and that enemy is a player (outputs player entity).
	**/
    public extern inline function OutputOnFoundPlayer(callback:Callback<{activator:Npc_barney,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFoundPlayer",callback);
    }
    
    /**
		Fired when this NPC loses line of sight to its enemy, and that enemy is a player.
	**/
    public extern inline function OutputOnLostPlayerLOS(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostPlayerLOS",callback);
    }
    
    /**
		Fired when this NPC loses its enemy, and that enemy was a player. Usually due to the enemy being killed/removed, or because this NPC has selected a newer, more dangerous enemy.
	**/
    public extern inline function OutputOnLostPlayer(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLostPlayer",callback);
    }
    
    /**
		Fired when this NPC is hurt by a player.
	**/
    public extern inline function OutputOnDamagedByPlayer(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDamagedByPlayer",callback);
    }
    
    /**
		Fired when this NPC is hurt by a player OR by one of the player's squadmates.
	**/
    public extern inline function OutputOnDamagedByPlayerSquad(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDamagedByPlayerSquad",callback);
    }
    
    /**
		Fired when this NPC has refused to join the player's squad.
	**/
    public extern inline function OutputOnDenyCommanderUse(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDenyCommanderUse",callback);
    }
    
    /**
		Fired when this NPC enters a sleep state.
	**/
    public extern inline function OutputOnSleep(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSleep",callback);
    }
    
    /**
		Fired when this NPC comes out of a sleep state.
	**/
    public extern inline function OutputOnWake(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnWake",callback);
    }
    
    /**
		Fired when the NPC starts a forced interaction.
	**/
    public extern inline function OutputOnForcedInteractionStarted(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnForcedInteractionStarted",callback);
    }
    
    /**
		Fired when the NPC aborts a forced interaction for some reason (target NPC died, couldn't be pathed to, etc)
	**/
    public extern inline function OutputOnForcedInteractionAborted(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnForcedInteractionAborted",callback);
    }
    
    /**
		NPCs in actbusies can no longer perform dynamic interactions.
	**/
    public extern inline function OutputOnForcedInteractionFinished(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnForcedInteractionFinished",callback);
    }
    
    /**
		Fires when this NPC picks a weapon off the ground or a gun rack.
	**/
    public extern inline function OutputOnWeaponPickup(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnWeaponPickup",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when a player +USEs Barney
	**/
    public extern inline function OutputOnPlayerUse(callback:Callback<{activator:Npc_barney}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerUse",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Npc_barneySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Npc_barneySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Npc_barneySpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("npc_barney");
    }
}

enum abstract Npc_barneywakesquadChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneysleepstateChoices(Int) to Int {
	var NONE = 0;
	var WAITING_FOR_THREAT = 1;
	var WAITING_FOR_PVS = 2;
	var WAITING_FOR_INPUT_IGNORE_PVS = 3;
	var AUTO_PVS = 4;
	var AUTO_PVS_AFTER_PVS = 5;
}
enum abstract Npc_barneyrendermodeChoices(Int) to Int {
	var NORMAL = 0;
	var COLOR = 1;
	var TEXTURE = 2;
	var GLOW = 3;
	var SOLID = 4;
	var ADDITIVE = 5;
	var ADDITIVE_FRACTIONAL_FRAME = 7;
	var WORLD_SPACE_GLOW = 9;
	var DONT_RENDER = 10;
}
enum abstract Npc_barneyrenderfxChoices(Int) to Int {
	var NORMAL = 0;
	var SLOW_PULSE = 1;
	var FAST_PULSE = 2;
	var SLOW_WIDE_PULSE = 3;
	var FAST_WIDE_PULSE = 4;
	var SLOW_STROBE = 9;
	var FAST_STROBE = 10;
	var FASTER_STROBE = 11;
	var SLOW_FLICKER = 12;
	var FAST_FLICKER = 13;
	var SLOW_FADE_AWAY = 5;
	var FAST_FADE_AWAY = 6;
	var SLOW_BECOME_SOLID = 7;
	var FAST_BECOME_SOLID = 8;
	var CONSTANT_GLOW = 14;
	var DISTORT = 15;
	var HOLOGRAM_DISTORT__FADE = 16;
	var CULL_BY_DISTANCE_TEST = 23;
	var SPOTLIGHT_FX = 24;
	var FADE_NEAR = 26;
}
enum abstract Npc_barneyignoreunseenenemiesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneyhintlimitingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneygmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneydisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneydisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneyadditionalequipmentChoices(String) to String {
	var PISTOL = "weapon_pistol";
	var SMG1 = "weapon_smg1";
	var STUN_STICK = "weapon_stunstick";
	var SHOTGUN = "weapon_shotgun";
	var AR2 = "weapon_ar2";
	var NOTHING = "0";
}
enum abstract Npc_barneyGameEndAllyChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneyDontUseSpeechSemaphoreChoices(Int) to Int {
	var NO_USE_SPEECH_SEMAPHORE = 0;
	var YES_DONT_USE_SPEECH_SEMAPHORE = 1;
}
enum abstract Npc_barneyDontPickupWeaponsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_barneyAlwaysTransitionChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Npc_barneySpawnFlags(Int) to Int {
	var WAIT_TILL_SEEN = 1;
	var GAG_NO_IDLE_SOUNDS_UNTIL_ANGRY = 2;
	var FALL_TO_GROUND_UNCHECKED_MEANS_TELEPORT_TO_GROUND = 4;
	var DROP_HEALTHKIT = 8;
	var EFFICIENT__DONT_ACQUIRE_ENEMIES_OR_AVOID_OBSTACLES = 16;
	var WAIT_FOR_SCRIPT = 128;
	var LONG_VISIBILITYSHOOT = 256;
	var FADE_CORPSE = 512;
	var THINK_OUTSIDE_PVS = 1024;
	var TEMPLATE_NPC_USED_BY_NPCMAKER_WILL_NOT_SPAWN = 2048;
	var DO_ALTERNATE_COLLISION_FOR_THIS_NPC_PLAYER_AVOIDANCE = 4096;
	var DONT_DROP_WEAPONS = 8192;
	var IGNORE_PLAYER_PUSH_DONT_GIVE_WAY_TO_PLAYER = 16384;
}

#end
