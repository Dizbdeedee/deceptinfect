package deceptinfect.ents;

import deceptinfect.game.EvacZone;
import deceptinfect.game.EvacSystem;
import gmod.sent.SentBuild;

class Di_evac_zone extends gmod.sent.SentBuild<gmod.sent.ENT_BRUSH> {
    final properties:EntFields = {
        Base : "base_brush"
    }

    #if server
    var id:DI_ID;

    override function Initialize() {
        self.SetCollisionBounds(new Vector(-250,-250,-250),
            new Vector(250,250,250)
        );
        self.SetTrigger(true);
        self.SetCollisionGroup(COLLISION_GROUP_PLAYER);
        self.UseTriggerBounds(true,0);
        id = new GEntCompat(self).id;
        id.add_component(new EvacZone());
        
    }

    public function setPoints(minmax:MinMax) {
        self.SetCollisionBoundsWS(minmax.mins,minmax.maxs);
    }
    override function StartTouch(ent:GEntCompat) {
        switch (ent.has_id()){
        case Some(ent_id):
            getSystem(EvacSystem).touched(ent_id,id.get_sure(EvacZone));
        default:
        }
    }

    override function EndTouch(ent:GEntCompat) {
        switch (ent.has_id()){
        case Some(ent_id):
            getSystem(EvacSystem).leave(ent_id,id.get_sure(EvacZone));
        default:
        }
    }

    #end
}
