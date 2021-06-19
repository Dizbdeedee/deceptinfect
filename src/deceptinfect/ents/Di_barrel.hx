package deceptinfect.ents;

import gmod.sent.SentBuild;
using Safety;

class Di_barrel extends gmod.sent.SentBuild<gmod.sent.ENT_ANIM> {

    
    public final properties:EntFields = {
        Base: "base_anim",
    }

    var actualBarrel:Entity;

    var health:Float = 100.0;
    var blasted:Bool = false;
    
    override function Initialize() {
	#if server
	self.SetModel("models/props_c17/oildrum001_explosive.mdl");
	self.PhysicsInit(SOLID_VPHYSICS);
	if (Gmod.IsValid(self.GetPhysicsObject())) {
	    self.GetPhysicsObject().Wake();
	}
        self.SetUseType(SIMPLE_USE);
	#end
    }
    #if server
    override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
        if (self.IsPlayerHolding() || !activator.IsPlayer()) {return;}
        var _activator:Player = cast activator;
        _activator.PickupObject(self);
    }

    function blast() {

	blasted = true;
	UtilLib.BlastDamage(self,self,self.GetPos(),300,25);
	final puddle:Entity = EntsLib.Create("di_puddle");
	puddle.SetPos(self.GetPos());
	puddle.Spawn();
	self.Remove();
    }

    override function OnTakeDamage(damage:CTakeDamageInfo) {
	health -= damage.GetDamage();
	if (health <= 0) {
	    if (!blasted) {
		blast();
	    }
	}
    }
    
    #end

}