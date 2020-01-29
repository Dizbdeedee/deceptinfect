package gmod.engine_ents;
#if server
/**
	An entity used to limit the number of a particular weapon type in the world. Useful in places where NPCs are spawning rapidly, dying, and dropping weapons.
**/
@:forward
abstract Game_weapon_manager(Entity) to Entity {
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
		Adjust the ammo modifier.
	**/
    public extern inline function FireSetAmmoModifier(param:Float,delay:Float) {
        untyped this.Fire("SetAmmoModifier",untyped param,delay);
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
		Weapon Classname

		Classname of the weapon type to limit.
	**/
    public var weaponname(get,set):String;

    @:noCompletion
    public extern inline function get_weaponname():String {
        return untyped this.GetKeyValues().weaponname;
    }
    
    @:noCompletion
    public extern inline function set_weaponname(value:String):String {
        return untyped this.SetKeyValue("weaponname",untyped value);
    }
    
    /**
		Max Allowed in Level

		The maximum amount of the specified weapon type allowed in the world.
	**/
    public var maxpieces(get,set):Int;

    @:noCompletion
    public extern inline function get_maxpieces():Int {
        return untyped this.GetKeyValues().maxpieces;
    }
    
    @:noCompletion
    public extern inline function set_maxpieces(value:Int):Int {
        return untyped this.SetKeyValue("maxpieces",untyped value);
    }
    
    /**
		Ammo modifier

		Modifier for ammount of ammo dropped by a weapon.
	**/
    public var ammomod(get,set):Float;

    @:noCompletion
    public extern inline function get_ammomod():Float {
        return untyped this.GetKeyValues().ammomod;
    }
    
    @:noCompletion
    public extern inline function set_ammomod(value:Float):Float {
        return untyped this.SetKeyValue("ammomod",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Game_weapon_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Game_weapon_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Game_weapon_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Game_weapon_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("game_weapon_manager");
    }
}





#end
