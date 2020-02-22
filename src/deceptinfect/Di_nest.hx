package deceptinfect;

import gmod.structs.TestCollisionData;

@:build(gmod.macros.SentMacro.build())
class Di_nest extends gmod.sent.ENT_ANIM {
    
    
    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");

    }
    override function Think():Bool {
        for (player in PlayerManager.getPlayers()) {
            if (player.isInfected()) {
                self.SetPreventTransmit(player,false);
            } else {
                self.SetPreventTransmit(player,true);
            }
        }
        return null;
    }

    override function TestCollision(startpos:Vector, delta:Vector, isbox:Bool, extents:Vector, mask:Float):TestCollisionData {
        return {
            HitPos: startpos,
            Fraction: 0
        }
    }

    

    

    
}