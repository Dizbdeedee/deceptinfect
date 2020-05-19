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
import gmod.Patch;
// import deceptinfect.CustomEnt;
import deceptinfect.items.Weapon_Di_Scan;
import deceptinfect.items.Di_cure;
#if client
#end
class Main {
    public static function main() {
        gmod.Trace.overridetrace();
        new DeceptInfect();
        #if client
        for (ply in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(ply));
        }
        #end
        trace("hm");
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
        trace("Deceptinfect server reinit!");
    }
}

