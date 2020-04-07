package deceptinfect.ents;

import deceptinfect.game.EvacSystem;
import gmod.sent.SentBuild;
import deceptinfect.game.FlareComponent;

class Di_flare extends gmod.sent.ENT_ANIM implements SentBuild {
    final properties:EntFields = {
        Base: "base_entity"
    }    

    #if client
    override function Draw(flags:Float) {
        self.DrawModel();
    }
    #end
    #if server
    var id:DI_ID;
    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");
        self.PhysicsInit(SOLID_VPHYSICS);
        var physob = self.GetPhysicsObject();
        if (GlobalLib.IsValid(physob)) {
            physob.Wake();
        }
        id = new GEntCompat(self).id;
        id.add_component(new FlareComponent());
    }

    override function Touch(entity:GEntCompat) {
        switch (entity.has_id()) {
        case Some(ent_id):
            getSystem(EvacSystem).addFlare(id,ent_id);
        default:
        }
    }

    override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
        if (self.IsPlayerHolding() || !activator.IsPlayer()) {return;}
        var _activator:Player = cast activator;
        _activator.PickupObject(self);
       // lastplayer = _activator;
    }

    #end

}