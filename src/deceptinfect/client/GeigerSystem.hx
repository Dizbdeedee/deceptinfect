package deceptinfect.client;

import deceptinfect.Networking.N_Geiger;
import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.System;

class GeigerSystem extends System {
    #if client
    override function run_client() {
        Networking.GeigerSignal.handle(
        function (data:N_Geiger) {
            Geiger.geiger = data.geiger;
            Geiger.geigerThink();
        });
    }

    
    #end

    #if server
    override function run_server() {
        for (plyr in PlayerManager.getPlayers()) {
            switch (plyr.get(InfectionComponent)) {
            case Comp(inf):
                var fract = Math.min(((inf.rate - 1) / 3),1);
                Networking.sendGeiger({geiger: fract},plyr);
            default:
            }
        }
    }
    #end
}

