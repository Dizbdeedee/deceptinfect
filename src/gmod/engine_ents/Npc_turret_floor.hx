package gmod.engine_ents;
#if server
/**
	Combine Floor Turret
**/
@:forward
abstract Npc_turret_floor(Entity) to Entity {
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
		Toggle - If open, close. If closed, open.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Enable the turret.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the turret.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Depletes all the ammo from a turret, causing it to dry-fire.
	**/
    public extern inline function FireDepleteAmmo(delay:Float) {
        untyped this.Fire("DepleteAmmo",untyped null,delay);
    }
    
    /**
		Restores ammo to a turret, allowing it to fire live rounds again.
	**/
    public extern inline function FireRestoreAmmo(delay:Float) {
        untyped this.Fire("RestoreAmmo",untyped null,delay);
    }
    
    /**
		Causes the turret to warn and then explode.
	**/
    public extern inline function FireSelfDestruct(delay:Float) {
        untyped this.Fire("SelfDestruct",untyped null,delay);
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
		Skin Number

		Which skin to use for this turret. Set to 0 to select randomly.
	**/
    public var SkinNumber(get,set):Int;

    @:noCompletion
    public extern inline function get_SkinNumber():Int {
        return untyped this.GetKeyValues().SkinNumber;
    }
    
    @:noCompletion
    public extern inline function set_SkinNumber(value:Int):Int {
        return untyped this.SetKeyValue("SkinNumber",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Turret is becoming active and dangerous.
	**/
    public extern inline function OutputOnDeploy(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnDeploy",callback);
    }
    
    /**
		Turret is becoming inactive and harmless.
	**/
    public extern inline function OutputOnRetire(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnRetire",callback);
    }
    
    /**
		Turret has been tipped over and is inactive.
	**/
    public extern inline function OutputOnTipped(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnTipped",callback);
    }
    
    /**
		Picked up with physgun
	**/
    public extern inline function OutputOnPhysGunPickup(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunPickup",callback);
    }
    
    /**
		Released by physgun
	**/
    public extern inline function OutputOnPhysGunDrop(callback:Callback<{activator:Npc_turret_floor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPhysGunDrop",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Npc_turret_floorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Npc_turret_floorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Npc_turret_floorSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("npc_turret_floor");
    }
}



enum abstract Npc_turret_floorSpawnFlags(Int) to Int {
	var AUTOSTART = 32;
	var START_INACTIVE = 64;
	var FAST_RETIRE = 128;
	var OUT_OF_AMMO = 256;
	var CITIZEN_MODIFIED_FRIENDLY = 512;
}

#end
