// actual imports
import gmod.libs.StringLib;
import deceptinfect.ecswip.SystemManager;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.DeceptInfect;
import deceptinfect.Misc;
import deceptinfect.game.GameSystem;
#if client
import deceptinfect.client.ClientOverrides;
#end
import gmod.libs.UtilLib;
import gmod.libs.HookLib;
import gmod.libs.FileLib;
import gmod.libs.GameLib;
import gmod.libs.MathLib;
import gmod.Gmod;
import deceptinfect.macros.IterateEnt;
import deceptinfect.infection.InfectionComponent;

class Main {
	public static var forceInfected = false;

	public static var forceUninfected = false;

	static var systemManager:SystemManager;

	static var componentManager:ComponentManager;

	static var deceptinfect:DeceptInfect;

	#if (server && debug)
	@:expose("startGame")
	static function startGame(skipSetup:Bool) {
		final gameSystem = systemManager.get(GameSystem);
		forceInfected = false;
		forceUninfected = false;
		gameSystem.setState(PLAYING);
	}

	@:expose("setInfection")
	static function setInfection(infectionGiven:Float) {
		IterateEnt.iterGet([InfectionComponent], [c_inf], function(ent) {
			switch (c_inf.infection) {
				case NOT_INFECTED(val):
					val.value = infectionGiven;
				case INFECTED:
			}
		});
	}

	@:expose("startGameInf")
	static function startGameInf() {
		final gameSystem = systemManager.get(GameSystem);
		forceUninfected = false;
		forceInfected = true;
		gameSystem.setState(PLAYING);
	}

	@:expose("startGameUninf")
	static function startGameUnInf() {
		final gameSystem = systemManager.get(GameSystem);
		forceInfected = false;
		forceUninfected = true;
		gameSystem.setState(PLAYING);
	}
	#end

	static function precache() {
		#if debug
		Misc.roundModels = "bW9kZWxzL2VyYWRpdW0vcHJvdG9nZW5fcGxheWVyLm1kbA==:bW9kZWxzL3B1cm8ubWRs:bW9kZWxzL2VyYWRpdW0vY2hhbmdlZC90aWdlcnNoYXJrYm9pLm1kbA==".split
			(":")
			.map(UtilLib.Base64Decode);
		#end
		UtilLib.PrecacheModel(Misc.infModel);
		for (model in Misc.roundModels) {
			UtilLib.PrecacheModel(model);
		}
	}

	public static function main() {
		precache();
		componentManager = new ComponentManagerDef();
		systemManager = new SystemManagerDef(InitSystems.initSystemsArr(), InitSystems.runSystemsArr()
			, InitSystems.makeSystems.bind(componentManager));
		new DeceptInfect(systemManager, componentManager);
		#if client
		new ClientOverrides(componentManager, systemManager);
		#end
		HookLib.Add("di_setupgplayercompat",
			"setup",
			() -> {componentManager: componentManager, systemManager: systemManager});
		HookLib.Add("di_setupgentcompat",
			"setup",
			() -> {componentManager: componentManager, systemManager: systemManager});
		HookLib.Add("di_setupent",
			"setup",
			() -> {componentManager: componentManager, systemManager: systemManager}); // TODO replace
		systemManager.initAllSystems();
		FileLib.CreateDir("deceptinfect");
		#if server
		GameLib.ConsoleCommand("mp_falldamage 1\n");
		#end
		MathLib.randomseed(Gmod.RealTime()); // FIXME
		trace('Deceptinfect ${#if server "server" #else "client" #end} reinit!');
	}

	#if debug
	@:expose("fini")
	static function endAssert() {
		AssertCommitArea.endOfRun();
	}
	#end
}
