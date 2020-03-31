
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
#if client
import gmod.PanelInterface.TestTwo;
#end
import deceptinfect.Di_battery;
import deceptinfect.*;
using gmod.PairTools;
import deceptinfect.ecswip.SystemManager;
// import deceptinfect.CustomEnt;
import deceptinfect.Di_charger;
import deceptinfect.Di_nest;
import deceptinfect.Weapon_di_scan;
#if client
import deceptinfect.Effect_di_test;
#end
class Main {
    public static function main() {
        deceptinfect.Networking.initMessages();
        DeceptInfect.initaliseGamemode();

        for (ply in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(ply));
        }
        
        SignalStorage.initEvents();
        #if client
        ClientOverrides.initaliseGamemode();
        GameManager.init();
       
        
        #end
        SystemManager.initAllSystems();
      
    }

}

