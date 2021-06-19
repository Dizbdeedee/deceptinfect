import gmod.EntityClass;
import gmod.hxbit.GmodNetHost;
import gmod.Gmod;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.game.SpawnSystem;
import gmod.types.Vector;
import gmod.libs.*;
import deceptinfect.ecswip.*;
import deceptinfect.ents.*;
#if client
import deceptinfect.client.SabotagePanel;
#end
import deceptinfect.*;
import deceptinfect.client.ClientOverrides;
import gmod.libs.PlayerLib;
using gmod.PairTools;
import deceptinfect.items.Weapon_Di_Scan;
import deceptinfect.items.Di_cure;
import deceptinfect.ents.Di_battery;
#if client
#end
class Main {

    @:expose("nethost") public static var nethost(default,null):GmodNetHost;

    public static function main() {
        deceptinfect.Trace.overridetrace();
        new DeceptInfect();
        #if client
        for (ply in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(ply));
        }
        #end
        nethost = new gmod.hxbit.GmodNetHost();
        FileLib.CreateDir("deceptinfect");
        GameLib.CleanUpMap();
        SignalStorage.initEvents();
        GameManager.init();
        for (model in Misc.roundModels) {
            UtilLib.PrecacheModel(model);
        }
        #if server
        // new deceptinfect.TestObject();
        #end
        #if client
        deceptinfect.TestObject;
        #end
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
        MathLib.randomseed(Gmod.RealTime()); //FIXME
        #if server
        #end
        // gmod.macros.GenEnts.genEnts();
        // gmod.macros.GenEnts.genAutos();
        trace("Deceptinfect server reinit!");
    }
}
