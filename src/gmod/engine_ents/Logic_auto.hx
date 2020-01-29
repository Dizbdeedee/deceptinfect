package gmod.engine_ents;
#if server
/**
	Fires outputs when a map spawns. If 'Remove on fire' flag is set the logic_auto is deleted after firing. It can be set to check a global state before firing. This allows you to only fire events based on what took place in a previous map.
**/
@:forward
abstract Logic_auto(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Global State to Read

		If set, this specifies a global state to check before firing. The OnMapSpawn output will only fire if the global state is set.
	**/
    public var globalstate(get,set):Logic_autoglobalstateChoices;

    @:noCompletion
    public extern inline function get_globalstate():Logic_autoglobalstateChoices {
        return untyped this.GetKeyValues().globalstate;
    }
    
    @:noCompletion
    public extern inline function set_globalstate(value:Logic_autoglobalstateChoices):Logic_autoglobalstateChoices {
        return untyped this.SetKeyValue("globalstate",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when the map is loaded for any reason.
	**/
    public extern inline function OutputOnMapSpawn(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMapSpawn",callback);
    }
    
    /**
		Fired when the map is loaded to start a new game.
	**/
    public extern inline function OutputOnNewGame(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNewGame",callback);
    }
    
    /**
		Fired when the map is loaded from a saved game.
	**/
    public extern inline function OutputOnLoadGame(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLoadGame",callback);
    }
    
    /**
		Fired when the map is loaded due to a level transition.
	**/
    public extern inline function OutputOnMapTransition(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMapTransition",callback);
    }
    
    /**
		Fired when the map is loaded as a background to the main menu.
	**/
    public extern inline function OutputOnBackgroundMap(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBackgroundMap",callback);
    }
    
    /**
		Fired only in multiplayer, when a new map is loaded.
	**/
    public extern inline function OutputOnMultiNewMap(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMultiNewMap",callback);
    }
    
    /**
		Fired only in multiplayer, when a new round is started. Only fired in multiplayer games that use round-based gameplay.
	**/
    public extern inline function OutputOnMultiNewRound(callback:Callback<{activator:Logic_auto}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMultiNewRound",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Logic_autoSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Logic_autoSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Logic_autoSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_auto");
    }
}

enum abstract Logic_autoglobalstateChoices(String) to String {
	var _NONE_ = "";
	var GORDON_PRECRIMINAL = "gordon_precriminal";
	var ANTLIONS_ARE_PLAYER_ALLIES = "antlion_allied";
	var SUIT_SPRINT_FUNCTION_NOT_YET_ENABLED = "suit_no_sprint";
	var SUPER_PHYS_GUN_IS_ENABLED = "super_phys_gun";
	var FRIENDLY_ENCOUNTER_SEQUENCE_LOWER_WEAPONS_ETC = "friendly_encounter";
	var GORDON_IS_INVULNERABLE = "gordon_invulnerable";
	var DONT_SPAWN_SEAGULLS_ON_THE_JEEP = "no_seagulls_on_jeep";
	var GAME_IS_RUNNING_ON_A_CONSOLE = "is_console";
	var GAME_IS_RUNNING_ON_A_PC = "is_pc";
}


enum abstract Logic_autoSpawnFlags(Int) to Int {
	var REMOVE_ON_FIRE = 1;
}

#end
