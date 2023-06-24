import deceptinfect.ecswip.SystemManager.SystemManagerDef;
import deceptinfect.ecswip.ComponentManager.ComponentManagerDef;
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

    public static var forceInfected = false;

    public static var forceUninfected = false;

    static var systemManager:SystemManager;

    static var componentManager:ComponentManager;

    static var deceptinfect:DeceptInfect;

    #if server
    @:expose("startGame")
    static function startGame(skipSetup:Bool) {
        final gameSystem = systemManager.get(GameSystem);
        forceInfected = false;
        forceUninfected = false;
        gameSystem.setState(PLAYING);
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
        UtilLib.PrecacheModel(Misc.infModel);
        for (model in Misc.roundModels) {
            UtilLib.PrecacheModel(model);
        }
    }

    public static function main() {
        componentManager = new ComponentManagerDef();
        systemManager = new SystemManagerDef(InitSystems.initSystemsArr(),InitSystems.runSystemsArr(),InitSystems.makeSystems.bind(componentManager));
        new DeceptInfect(systemManager,componentManager);
        #if client
        new ClientOverrides(componentManager,systemManager);
        #end
        HookLib.Add("di_setupgplayercompat","setup",() -> {componentManager: componentManager, systemManager: systemManager});
        HookLib.Add("di_setupgentcompat","setup",() -> {componentManager: componentManager, systemManager: systemManager});
        systemManager.initAllSystems();
        FileLib.CreateDir("deceptinfect");
        #if server
        GameLib.ConsoleCommand("mp_falldamage 1\n");
        #end
        MathLib.randomseed(Gmod.RealTime()); // FIXME
        trace('Deceptinfect ${#if server "server" #else "client" #end} reinit!');
    }

}
