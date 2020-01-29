package gmod.engine_ents;
#if server
/**
	An entity that monitors the material of the surface the player is standing on, and fires outputs whenever it changes to/from a specific material.
**/
@:forward
abstract Env_player_surface_trigger(Entity) to Entity {
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
		Start watching the player's surface.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Stop watching the player's surface.
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
		Game Material to Watch

		The material to watch. When the player stands on/off this material, this entity's outputs will be fired.
	**/
    public var gamematerial(get,set):Env_player_surface_triggergamematerialChoices;

    @:noCompletion
    public extern inline function get_gamematerial():Env_player_surface_triggergamematerialChoices {
        return untyped this.GetKeyValues().gamematerial;
    }
    
    @:noCompletion
    public extern inline function set_gamematerial(value:Env_player_surface_triggergamematerialChoices):Env_player_surface_triggergamematerialChoices {
        return untyped this.SetKeyValue("gamematerial",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the player moves onto the specified game material.
	**/
    public extern inline function OutputOnSurfaceChangedToTarget(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSurfaceChangedToTarget",callback);
    }
    
    /**
		Fired when the player moves off the specified game material.
	**/
    public extern inline function OutputOnSurfaceChangedFromTarget(callback:Callback<{activator:Env_player_surface_trigger}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnSurfaceChangedFromTarget",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_player_surface_trigger");
    }
}

enum abstract Env_player_surface_triggergamematerialChoices(Int) to Int {
	var NONE_PLAYERS_IN_THE_AIR = 0;
	var CONCRETE = 67;
	var METAL = 77;
	var DIRT = 68;
	var VENT = 86;
	var GRATE = 71;
	var TILE = 84;
	var SLOSH = 83;
	var WOOD = 87;
	var COMPUTER = 80;
	var GLASS = 89;
	var FLESH = 70;
	var CLIP = 73;
	var FOLIAGE = 79;
	var SAND = 78;
}




#end
