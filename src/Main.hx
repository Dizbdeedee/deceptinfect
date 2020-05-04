import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.game.SpawnSystem;
import gmod.types.Vector;
import gmod.libs.*;
import deceptinfect.ecswip.*;
#if client
import deceptinfect.client.SabotagePanel;
#end
import deceptinfect.*;
import deceptinfect.client.ClientOverrides;
import gmod.libs.PlayerLib;
using gmod.PairTools;
// import deceptinfect.CustomEnt;
#if client
#end
class Main {
    public static function main() {
        new DeceptInfect();
        #if client
        for (ply in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(ply));
        }
        #end
        FileLib.CreateDir("deceptinfect");
        GameLib.CleanUpMap();
        SignalStorage.initEvents();
        GameManager.init();
        for (model in Misc.roundModels) {
            UtilLib.PrecacheModel(model);
        }
        SpawnSystem.generateSpawns();
        UtilLib.PrecacheModel(Misc.infModel);
        #if client
        new ClientOverrides();
        SabotagePanel.register();
        SystemManager.initAllSystems();
        #end
        #if server
        GameLib.ConsoleCommand("mp_falldamage 1\n");
        GameManager.cleanup();  
        #end
        MathLib.randomseed(GlobalLib.RealTime()); //FIXME
    }
}

