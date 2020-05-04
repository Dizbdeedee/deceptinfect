package deceptinfect;

import deceptinfect.ecswip.ComponentManager;
import deceptinfect.GEntCompat.GPlayerCompat;

class PlayerManager {

    static var indexLookup:Map<Int,DI_ID> = [];

    public static function getIDByIndex(index:Int):DI_ID {
        if (!indexLookup.exists(index)) {throw 'Entity lookup failed for $index';}
        return indexLookup.get(index);
    }

    public static function addID(ent:Entity,id:DI_ID) {
        indexLookup.set(ent.EntIndex(),id);
    }

    public static inline function getPlayers():Table<Int,GPlayerCompat> {
        return PlayerLib.GetAll();
    }

    public static inline function getActivePlayers():Table<Int,GPlayerCompat> {
        //TODO define validility/activity
        return null;
    }

    
    
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
