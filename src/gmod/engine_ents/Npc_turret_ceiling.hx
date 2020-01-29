package gmod.engine_ents;
#if server
/**
	Combine Ceiling Turret
**/
@:forward
abstract Npc_turret_ceiling(Entity) to Entity {
    //Inputs
    
    /**
		Changes the model skin to the specified number.
	**/
    public extern inline function FireSkin(param:Int,delay:Float) {
        untyped this.Fire("Skin",untyped param,delay);
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
		Used to attempt to fix sorting problems when rendering. True activates, false deactivates
	**/
    public extern inline function FireAlternativeSorting(param:bool,delay:Float) {
        untyped this.Fire("AlternativeSorting",untyped param,delay);
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
		If closed, open.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		If open, close.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Toggle - If open, close. If closed, open.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
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
    public var gmod_allowphysgun(get,set):Npc_turret_ceilinggmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Npc_turret_ceilinggmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Npc_turret_ceilinggmod_allowphysgunChoices):Npc_turret_ceilinggmod_allowphysgunChoices {
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
		World Model
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Skin

		Some models have multiple versions of their textures, called skins. Set this to a number other than 0 to use that skin instead of the default.
	**/
    public var skin(get,set):Int;

    @:noCompletion
    public extern inline function get_skin():Int {
        return untyped this.GetKeyValues().skin;
    }
    
    @:noCompletion
    public extern inline function set_skin(value:Int):Int {
        return untyped this.SetKeyValue("skin",untyped value);
    }
    
    /**
		Disable Shadows

		Used to disable dynamic shadows on this entity.
	**/
    public var disableshadows(get,set):Npc_turret_ceilingdisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Npc_turret_ceilingdisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Npc_turret_ceilingdisableshadowsChoices):Npc_turret_ceilingdisableshadowsChoices {
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
		Min req'd damage for hurting turret
	**/
    public var minhealthdmg(get,set):Int;

    @:noCompletion
    public extern inline function get_minhealthdmg():Int {
        return untyped this.GetKeyValues().minhealthdmg;
    }
    
    @:noCompletion
    public extern inline function set_minhealthdmg(value:Int):Int {
        return untyped this.SetKeyValue("minhealthdmg",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when this object catches fire.
	**/
    public extern inline function OutputOnIgnite(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnIgnite",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Turret is becoming active and dangerous.
	**/
    public extern inline function OutputOnDeploy(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDeploy",callback);
    }
    
    /**
		Turret is becoming inactive and harmless.
	**/
    public extern inline function OutputOnRetire(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnRetire",callback);
    }
    
    /**
		Turret has been tipped over and is inactive.
	**/
    public extern inline function OutputOnTipped(callback:Callback<{activator:Npc_turret_ceiling}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTipped",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Npc_turret_ceilingSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Npc_turret_ceilingSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Npc_turret_ceilingSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("npc_turret_ceiling");
    }
}

enum abstract Npc_turret_ceilinggmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Npc_turret_ceilingdisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Npc_turret_ceilingSpawnFlags(Int) to Int {
	var AUTOSTART = 32;
	var START_INACTIVE = 64;
	var NEVER_RETIRE = 128;
	var OUT_OF_AMMO = 256;
}

#end
