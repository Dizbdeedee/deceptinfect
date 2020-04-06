package deceptinfect.ents;

import deceptinfect.game.InfoStorage;
import deceptinfect.GEntCompat.GPlayerCompat;
import gmod.sent.ENT_ANIM;

class Di_note extends gmod.sent.ENT_ANIM implements gmod.sent.SentBuild {

    final properties = {
        Base : "base_anim"
    }

    override function Initialize() {
        
    }
    
    override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
        if (!activator.IsPlayer()) {return;}
        var ply:GPlayerCompat = cast activator;
        switch (ply.get(InfoStorage)) {
        case Comp(c_info):
            //blah
            self.Remove();
        default:
        }
    }
    
}