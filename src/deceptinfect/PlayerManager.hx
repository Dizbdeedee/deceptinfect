package deceptinfect;

import deceptinfect.GEntCompat.GPlayerCompat;

class PlayerManager {

    #if client
    public static inline function getLocalPlayer():GPlayerCompat {
        return GlobalLib.LocalPlayer();
    }

    
    
    #end
}
