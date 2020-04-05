package deceptinfect;

import gmod.sent.SentBuild;
import deceptinfect.game.NestComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import gmod.structs.TestCollisionData;

//@:build(gmod.macros.SentMacro.build())
class Di_nest extends gmod.sent.ENT_ANIM implements SentBuild {
    final properties:EntFields = {
        Base : "base_entity"
    }
    #if server
    var id:DI_ID;
    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");
        var ent = new GEntCompat(self);
        id = ent.id;
        id.add_component(new NestComponent());
        
    }
    override function Think():Bool {

        var c_nest = id.get_sure(NestComponent);
        for (ent in entities) {
            switch [ent.get(PlayerComponent),ent.get(InfectedComponent),c_nest.nestState] {
            case [Comp(ply),_,VISIBLE]:
                self.SetPreventTransmit(ply.player,false);
            case [Comp(ply),Comp(_),_]:
                self.SetPreventTransmit(ply.player,false);
            case [Comp(ply),NONE,_]:
                self.SetPreventTransmit(ply.player,true);

            default:
            }

        }
        return null;
    }
    
    #end
    override function TestCollision(startpos:Vector, delta:Vector, isbox:Bool, extents:Vector, mask:Float):TestCollisionData {
        return {
            HitPos: startpos,
            Fraction: 0
        }
    }

    

    

    
}