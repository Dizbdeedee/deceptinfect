
import gmod.libs.MathLib.MathLibFrexpReturn;
import gmod.gclass.*;
import gmod.hooks.*;
import gmod.libs.*;
import gmod.panels.*;
import gmod.sent.*;
import gmod.HaxeMultiReturn;
import gmod.hooks.Gm.GmPlayerCanHearPlayersVoiceHaxeReturn;
import gmod.Hooks;
import gmod.Networking;
import deceptinfect.*;
// import deceptinfect.CustomEnt;

class Main {
    public static function main() {
        deceptinfect.Networking.initMessages();
        #if client
            deceptinfect.Networking.infection2Signal.handle(recievedCapn);
        #end
        // Rex.create;
        // Sys.time();
        // Sys.time();
        // var as= ~/asdasd/;
        
        // deceptinfect.Networking.initMessages();
        
        // deceptinfect.Networking.sendinfection({infection : 50, rate : 1},PlayerLib.GetByID(1));
        // var myEnt = EntsLib.GetByIndex(0);
        // var ents = EntsLib.GetAll();
        // eck();
        
        // PlayerLib.GetByID(0).SetObserverMode(OBS_MODE_CHASE);
    }

    public static function recievedCapn(data:deceptinfect.Networking.InfectionMessage) {
        trace("Recieved, Capn!");
        trace(data.infection);
        trace(data.rate);
    }
    #if server
    @:expose("SendIT")
    public static function sendIt() {
        
        deceptinfect.Networking.sendinfection2({infection : 50,rate : 1},PlayerLib.GetByID(1));
    }
    #end

    public static function eck():HaxeMultiReturn<GmPlayerCanHearPlayersVoiceHaxeReturn> {
        return {
            a : false,
            b : false,
        } 
    }
}

