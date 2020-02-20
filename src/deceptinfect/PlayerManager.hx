package deceptinfect;

import deceptinfect.ecswip.ComponentManager;
import deceptinfect.GEntCompat.GPlayerCompat;

class PlayerManager {

    #if client
    public static inline function getLocalPlayer():GPlayerCompat {
        return GlobalLib.LocalPlayer();
    }

    

    public static function getLocalPlayerID():DI_ID {
        switch (getLocalPlayer().has_id()) {
            case Some(v):
                return v;
            case None:
                throw "Local player has no id...";
        }
    }

    
    
    #end
}
