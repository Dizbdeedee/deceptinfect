package deceptinfect;

import gmod.sent.SentBuild;
import gmod.sent.SentBuild.EntFields;
import deceptinfect.game.BatterySource;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.game.BatterySystem;
import deceptinfect.ecswip.SystemManager.getSystem;

class Di_battery extends gmod.sent.ENT_ANIM implements SentBuild {
    public final properties:EntFields = {
        Base: "base_entity",
        
    }
    #if client
    override function Draw(flags:Float) {
        self.DrawModel();
    }
    #end
    
    #if server
    
    
    var lastplayer:Player = null;
    var id:DI_ID = null;
    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");
        self.PhysicsInit(SOLID_VPHYSICS);
        var physob = self.GetPhysicsObject();
        if (IsValid(physob)) {
            physob.Wake();
        }
        self.SetUseType(SIMPLE_USE);
        var ent = new GEntCompat(self);
        id = ent.id;
        id.add_component(new BatterySource());
        
    }
    override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
        if (self.IsPlayerHolding() || !activator.IsPlayer()) {return;}
        var _activator:Player = cast activator;
        _activator.PickupObject(self);
        lastplayer = _activator;
    }

    override function Touch(entity:GEntCompat) {
        //trace(id);
        switch (entity.has_id()) {
        case Some(otherID):
            var result = getSystem(BatterySystem).addBattery(id,otherID);
            if (result) {
                self.Remove();
            }
        default:
        }
    }

    // @:entExpose
    public function funkyTown() {
        trace("HAAAR");
    }

    static function freeManyouFool() {

    }
    #end
}