package gmod.engine_ents;
#if server
/**
	A dynamic item. When the player enters the PVS of this entity, it will determine the item most needed by the player, spawn one of those items, and remove itself. To determine which item the player most needs, it calculates which of the Desired Health/Armor/Ammo ratios the player is farthest from.

If the player is above all the desired levels, then no item will be spawned, unless this item_dynamic_resupply was created by an item_item_crate. In that case, a random piece of ammo used by a weapon, that the player has, will be spawned. If the 'Fallback to Health Vial' spawnflag is set, a health vial will be spawned instead of the ammo.

By default, the item_dynamic_resupply uses the values inside the Master resupply, instead of using it's own values. This makes it easy to tweak the desired loadout of many resupplies. The BecomeMaster input allows you to switch Masters dynamically as the level progresses.
**/
@:forward
abstract Item_dynamic_resupply(Entity) to Entity {
    //Inputs
    
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
		Force the dynamic resupply to calculate which item it should spawn.
	**/
    public extern inline function FireCalculateType(delay:Float) {
        untyped this.Fire("CalculateType",untyped null,delay);
    }
    
    /**
		Make this resupply the master resupply. All other resupplies set to Use Master's Values will now use this resupply's values.
	**/
    public extern inline function FireBecomeMaster(delay:Float) {
        untyped this.Fire("BecomeMaster",untyped null,delay);
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
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Item_dynamic_resupplygmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Item_dynamic_resupplygmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Item_dynamic_resupplygmod_allowphysgunChoices):Item_dynamic_resupplygmod_allowphysgunChoices {
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
		Start Fade Dist/Pixels

		Distance at which the prop starts to fade (<0 = use fademaxdist). If 'Screen Space Fade' is selected, this represents the number of pixels wide covered by the prop when it starts to fade.
	**/
    public var fademindist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademindist():Float {
        return untyped this.GetKeyValues().fademindist;
    }
    
    @:noCompletion
    public extern inline function set_fademindist(value:Float):Float {
        return untyped this.SetKeyValue("fademindist",untyped value);
    }
    
    /**
		End Fade Dist/Pixels

		Maximum distance at which the prop is visible (0 = don't fade out). If 'Screen Space Fade' is selected, this represents the *minimum* number of pixels wide covered by the prop when it fades.
	**/
    public var fademaxdist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademaxdist():Float {
        return untyped this.GetKeyValues().fademaxdist;
    }
    
    @:noCompletion
    public extern inline function set_fademaxdist(value:Float):Float {
        return untyped this.SetKeyValue("fademaxdist",untyped value);
    }
    
    /**
		Fade Scale

		If you specify a fade in the worldspawn, or if the engine is running under dx7, then the engine will forcibly fade out props even if fademindist/fademaxdist isn't specified. This scale factor gives you some control over the fade. Using 0 here turns off the forcible fades.
	**/
    public var fadescale(get,set):Float;

    @:noCompletion
    public extern inline function get_fadescale():Float {
        return untyped this.GetKeyValues().fadescale;
    }
    
    @:noCompletion
    public extern inline function set_fadescale(value:Float):Float {
        return untyped this.SetKeyValue("fadescale",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Item_dynamic_resupplydisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Item_dynamic_resupplydisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Item_dynamic_resupplydisableshadowsChoices):Item_dynamic_resupplydisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
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
		Desired Health Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max health.
	**/
    public var DesiredHealth(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredHealth():Float {
        return untyped this.GetKeyValues().DesiredHealth;
    }
    
    @:noCompletion
    public extern inline function set_DesiredHealth(value:Float):Float {
        return untyped this.SetKeyValue("DesiredHealth",untyped value);
    }
    
    /**
		Desired Armor Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max armor.
	**/
    public var DesiredArmor(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredArmor():Float {
        return untyped this.GetKeyValues().DesiredArmor;
    }
    
    @:noCompletion
    public extern inline function set_DesiredArmor(value:Float):Float {
        return untyped this.SetKeyValue("DesiredArmor",untyped value);
    }
    
    /**
		Desired Pistol Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoPistol(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoPistol():Float {
        return untyped this.GetKeyValues().DesiredAmmoPistol;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoPistol(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoPistol",untyped value);
    }
    
    /**
		Desired SMG1 Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoSMG1(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoSMG1():Float {
        return untyped this.GetKeyValues().DesiredAmmoSMG1;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoSMG1(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoSMG1",untyped value);
    }
    
    /**
		Desired SMG1 Grenade Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoSMG1_Grenade(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoSMG1_Grenade():Float {
        return untyped this.GetKeyValues().DesiredAmmoSMG1_Grenade;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoSMG1_Grenade(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoSMG1_Grenade",untyped value);
    }
    
    /**
		Desired AR2 Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoAR2(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoAR2():Float {
        return untyped this.GetKeyValues().DesiredAmmoAR2;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoAR2(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoAR2",untyped value);
    }
    
    /**
		Desired Shotgun Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoBuckshot(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoBuckshot():Float {
        return untyped this.GetKeyValues().DesiredAmmoBuckshot;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoBuckshot(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoBuckshot",untyped value);
    }
    
    /**
		Desired RPG Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoRPG_Round(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoRPG_Round():Float {
        return untyped this.GetKeyValues().DesiredAmmoRPG_Round;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoRPG_Round(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoRPG_Round",untyped value);
    }
    
    /**
		Desired Grenade Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoGrenade(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoGrenade():Float {
        return untyped this.GetKeyValues().DesiredAmmoGrenade;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoGrenade(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoGrenade",untyped value);
    }
    
    /**
		Desired 357 Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmo357(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmo357():Float {
        return untyped this.GetKeyValues().DesiredAmmo357;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmo357(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmo357",untyped value);
    }
    
    /**
		Desired Crossbow Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoCrossbow(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoCrossbow():Float {
        return untyped this.GetKeyValues().DesiredAmmoCrossbow;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoCrossbow(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoCrossbow",untyped value);
    }
    
    /**
		Desired AR2 Alt-fire Ammo Ratio

		A ratio from 0 to 1. Attempt to fill the player up to this percentage of his max ammo carrying capacity.
	**/
    public var DesiredAmmoAR2_AltFire(get,set):Float;

    @:noCompletion
    public extern inline function get_DesiredAmmoAR2_AltFire():Float {
        return untyped this.GetKeyValues().DesiredAmmoAR2_AltFire;
    }
    
    @:noCompletion
    public extern inline function set_DesiredAmmoAR2_AltFire(value:Float):Float {
        return untyped this.SetKeyValue("DesiredAmmoAR2_AltFire",untyped value);
    }
    
    //Outputs
    
    /**
		Fires when the player touches this object
	**/
    public extern inline function OutputOnPlayerTouch(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPlayerTouch",callback);
    }
    
    /**
		This output fires when the player proves they have 'found' this item. Fires on: Player Touch (whether or not player actually acquires the item), Picked up by +USE, Picked up by Physcannon, Punted by Physcannon.
	**/
    public extern inline function OutputOnCacheInteraction(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnCacheInteraction",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Item_dynamic_resupply}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Item_dynamic_resupplySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Item_dynamic_resupplySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Item_dynamic_resupplySpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("item_dynamic_resupply");
    }
}

enum abstract Item_dynamic_resupplygmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Item_dynamic_resupplydisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Item_dynamic_resupplySpawnFlags(Int) to Int {
	var START_CONSTRAINED = 1;
	var USE_MASTERS_VALUES = 1;
	var IS_MASTER = 2;
	var FALLBACK_TO_HEALTH_VIAL = 8;
	var ALTERNATE_MASTER = 16;
}

#end
