
import deceptinfect.GEntCompat.GPlayerCompat;
import deceptinfect.client.ClientOverrides;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.ComponentManager;
import lua.Lua;
#if server
import gmod.engine_ents.Prop_thumper.Prop_thumperdustscaleChoices;
#end
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
import deceptinfect.*;
using gmod.PairTools;
import deceptinfect.ecswip.SystemManager;
// import deceptinfect.CustomEnt;

class Main {
    public static function main() {
        DeceptInfect.initaliseGamemode();
        deceptinfect.Networking.initMessages();
        for (ply in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(ply));
        }
        SystemManager;
        #if client
        // var b:PanelHelper_DTree;
        SignalStorage.initEvents();
        // HiddenHealthSystem.init();
        // InfectionSystem.init();
        ClientOverrides.initaliseGamemode();
        var ent = new GPlayerCompat(new PlayerComponent(GlobalLib.LocalPlayer()));
        ent.id.add_component(new InfectionComponent());
        GameManager.init();
        
        #end
      
    }

}

