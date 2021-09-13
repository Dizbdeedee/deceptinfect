import deceptinfect.game.GameSystem;
import haxe.macro.Compiler;
import sys.FileSystem;
import haxe.Resource;
import sys.io.File;
import deceptinfect.lib.Mri;
import tink.CoreApi.Callback;
import gmod.gclass.Entity;
import lua.Lua;
import deceptinfect.lib.BSP;
import deceptinfect.util.GmodNetHost;
import deceptinfect.util.GmodNetHost;
// import hxbit.NetworkHost;
import gmod.stringtypes.EntityClass;
import gmod.Gmod;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.game.SpawnSystem;
import gmod.helpers.types.Vector;
import gmod.libs.*;
import deceptinfect.ecswip.*;
import deceptinfect.ents.*;
#if client
import deceptinfect.client.SabotagePanel;
#end
import deceptinfect.*;
import deceptinfect.client.ClientOverrides;
import gmod.libs.PlayerLib;
import deceptinfect.items.Weapon_Di_Scan;
import deceptinfect.items.Di_cure;
import deceptinfect.ents.Di_battery;
import deceptinfect.ents.Di_barrel;
import deceptinfect.ents.Di_puddle;
import deceptinfect.ents.Di_spitball;
import deceptinfect.weapons.Weapon_di_spit;
import deceptinfect.game.SpawnSystemNav;
import deceptinfect.Spread;

class Main {

	#if server
	@:expose("startGame")
	static function startGame(skipSetup:Bool) {
		forceInfected = false;
		forceUninfected = false;
		GameSystem.get().setState(PLAYING); 
	}

	@:expose("startGameInf") 
	static function startGameInf() {
		forceUninfected = false;
		forceInfected = true;
		GameSystem.get().setState(PLAYING); 
	}

	@:expose("startGameUninf")
	static function startGameUnInf() {
		forceInfected = false;
		forceUninfected = true;
		GameSystem.get().setState(PLAYING); 
	}

	public static var forceInfected = false;

	public static var forceUninfected = false;

	#end

	public static function main() {
		for (model in Misc.roundModels) {
			UtilLib.PrecacheModel(model);
		}
		new DeceptInfect();
		#if client
		new ClientOverrides();
		#end
		SignalStorage.initEvents(); //nocheckin GET RID OF THIS!!!
		SystemManager.initAllSystems();
		#if server
		// GameSystem.get().cleanup(); //TODO improve?
		#end
		FileLib.CreateDir("deceptinfect");		
		SpawnSystem.generateSpawns();
		UtilLib.PrecacheModel(Misc.infModel);
		#if server
		GameLib.ConsoleCommand("mp_falldamage 1\n");
		#end
		MathLib.randomseed(Gmod.RealTime()); // FIXME
		trace('Deceptinfect ${#if server "server" #else "client" #end} reinit!');
	}

}
