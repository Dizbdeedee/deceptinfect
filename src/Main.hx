
//import gmod.gamemode.GamemodeTXT;
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.client.ClientOverrides;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.ComponentManager;
import lua.Lua;
import gmod.types.Vector;
import gmod.libs.MathLib.MathLibFrexpReturn;
import gmod.gclass.*;
import gmod.hooks.*;
import gmod.libs.*;
import gmod.panels.*;
import gmod.sent.*;
import gmod.engine_ents.*;
import gmod.HaxeMultiReturn;
import deceptinfect.ecswip.*;
// import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceHaxeReturn;
import gmod.EntityClass;
import gmod.Networking;
import deceptinfect.ents.*;
import deceptinfect.items.*;
#if client
#end
import deceptinfect.*;
using gmod.PairTools;
import deceptinfect.ecswip.SystemManager;
// import deceptinfect.CustomEnt;
import gmod.Patch;
import deceptinfect.Weapon_di_scan;
import deceptinfect.TXT;
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
        UtilLib.PrecacheModel(Misc.infModel);
        #if client
        new ClientOverrides();
       
        
        #end
        trace("looool!!");
        #if client
        SystemManager.initAllSystems();
        #end
        #if server
        GameLib.ConsoleCommand("mp_falldamage 1\n");
        GameManager.cleanup();  
        #end
        
        MathLib.randomseed(GlobalLib.RealTime());
    }


}

