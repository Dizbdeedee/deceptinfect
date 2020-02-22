package deceptinfect;

@:build(gmod.macros.SentMacro.build())
class Di_battery extends gmod.sent.ENT_ANIM {
    var lastplayer:Player = null;
    override function Initialize() {
        self.SetModel("models/props_c17/chair02a.mdl");
        self.PhysicsInit(SOLID_VPHYSICS);
        var physob = self.GetPhysicsObject();
        if (GlobalLib.IsValid(physob)) {
            physob.Wake();
        }
        self.SetUseType(SIMPLE_USE);
        
    }
    override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
        if (self.IsPlayerHolding() || !activator.IsPlayer()) {return;}
        var _activator:Player = cast activator;
        _activator.PickupObject(self);
        lastplayer = _activator;
    }
}