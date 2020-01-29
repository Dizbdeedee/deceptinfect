package gmod.engine_ents;
#if server
/**
	An entity that is used to relay inputs/ouputs to the player and back to the world.
**/
@:forward
abstract Logic_playerproxy(Entity) to Entity {
    //Inputs
    
    /**
		Sets the entity to use as damage filter. Pass in an empty string to clear the damage filter.
	**/
    public extern inline function FireSetDamageFilter(param:String,delay:Float) {
        untyped this.Fire("SetDamageFilter",untyped param,delay);
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
		Requests the current player's health from the proxy. This will fire the PlayerHealth output with the value.
	**/
    public extern inline function FireRequestPlayerHealth(delay:Float) {
        untyped this.Fire("RequestPlayerHealth",untyped null,delay);
    }
    
    /**
		Puts the player's flashlight in slow-power-drain mode (for Episodic darkness)
	**/
    public extern inline function FireSetFlashlightSlowDrain(delay:Float) {
        untyped this.Fire("SetFlashlightSlowDrain",untyped null,delay);
    }
    
    /**
		Puts the player's flashlight to default power drain
	**/
    public extern inline function FireSetFlashlightNormalDrain(delay:Float) {
        untyped this.Fire("SetFlashlightNormalDrain",untyped null,delay);
    }
    
    /**
		Sets the player's health to this value.
	**/
    public extern inline function FireSetPlayerHealth(param:Int,delay:Float) {
        untyped this.Fire("SetPlayerHealth",untyped param,delay);
    }
    
    /**
		Request the ammo state of the player. It will fire PlayerHasAmmo or PlayerHasNoAmmo outputs.
	**/
    public extern inline function FireRequestAmmoState(delay:Float) {
        untyped this.Fire("RequestAmmoState",untyped null,delay);
    }
    
    /**
		Lowers the players weapon.
	**/
    public extern inline function FireLowerWeapon(delay:Float) {
        untyped this.Fire("LowerWeapon",untyped null,delay);
    }
    
    /**
		Cause player to take less damage from physics objects, and never more than 30 points from any individual strike.
	**/
    public extern inline function FireEnableCappedPhysicsDamage(delay:Float) {
        untyped this.Fire("EnableCappedPhysicsDamage",untyped null,delay);
    }
    
    /**
		Undo effects of EnableCappedPhysicsDamage
	**/
    public extern inline function FireDisableCappedPhysicsDamage(delay:Float) {
        untyped this.Fire("DisableCappedPhysicsDamage",untyped null,delay);
    }
    
    /**
		Set the entity that the HUD locator should track. (Usually a vehicle)
	**/
    public extern inline function FireSetLocatorTargetEntity(param:String,delay:Float) {
        untyped this.Fire("SetLocatorTargetEntity",untyped param,delay);
    }
    
    //Keyvalues
    
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the player turns on his flashlight. This output has the value of how much energy the player had when this happened [0..1].
	**/
    public extern inline function OutputOnFlashlightOn(callback:Callback<{activator:Logic_playerproxy,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFlashlightOn",callback);
    }
    
    /**
		Fired when the player turns off his flashlight. This output has the value of how much energy the player had when this happened [0..1].
	**/
    public extern inline function OutputOnFlashlightOff(callback:Callback<{activator:Logic_playerproxy,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFlashlightOff",callback);
    }
    
    /**
		The player's current health value.
	**/
    public extern inline function OutputPlayerHealth(callback:Callback<{activator:Logic_playerproxy,data:Int}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerHealth",callback);
    }
    
    /**
		Player fired an AR2 combine ball that didn't kill any enemies.
	**/
    public extern inline function OutputPlayerMissedAR2AltFire(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerMissedAR2AltFire",callback);
    }
    
    /**
		Fired by request if the player has any ammo.
	**/
    public extern inline function OutputPlayerHasAmmo(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerHasAmmo",callback);
    }
    
    /**
		Fired by request if the player doesn't have any ammo.
	**/
    public extern inline function OutputPlayerHasNoAmmo(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerHasNoAmmo",callback);
    }
    
    /**
		Fires when the player dies.
	**/
    public extern inline function OutputPlayerDied(callback:Callback<{activator:Logic_playerproxy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerDied",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_playerproxy");
    }
}





#end
