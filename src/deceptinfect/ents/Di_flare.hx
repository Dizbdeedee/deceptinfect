package deceptinfect.ents;

import gmod.sent.SentBuild;
import deceptinfect.game.FlareComponent;

class Di_flare extends gmod.sent.ENT_ANIM implements SentBuild {
    final properties:EntFields = {
        Base: "base_entity"
    }    

    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");
        self.PhysicsInit(SOLID_VPHYSICS);
        var physob = self.GetPhysicsObject();
        if (GlobalLib.IsValid(physob)) {
            physob.Wake();
        }
        var id = new GEntCompat(self).id;
        id.add_component(new FlareComponent());
    }

}