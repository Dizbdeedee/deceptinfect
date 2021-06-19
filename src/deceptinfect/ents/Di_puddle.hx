package deceptinfect.ents;

import deceptinfect.ecswip.PlayerComponent;
import gmod.structs.MeshVertex;
import gmod.sent.SentBuild.EntFields;
import gmod.gclass.IMesh;
import deceptinfect.infection.InfectionComponent;

@:keep
class Di_puddle extends gmod.sent.SentBuild<gmod.sent.ENT_ANIM> {

    // static final material = Gmod.Material("nature/water_canals_cheap001_dx70").a;

    static final material = Gmod.Material("nature/water_coast01").a;
    final cooldown:Map<InfectionComponent,Float> = [];

    final properties:EntFields = {
	Base : "base_entity",
    }

    var totalCooldown = 5.0; 

    var totalInfection = 25.0;

    var size = 100;

    
    var sizeVector:Vector;
    var collideHeightVector:Vector;
    var visualHeightVector:Vector;

    
    var collideHeight = 40;

    var visualHeight = 1;

    
    #if client
    static var mesh:Null<IMesh> = null;
    #end

    override function Initialize() {
	sizeVector = new Vector(size / 2,size / 2,0);
	collideHeightVector = new Vector(0,0,collideHeight);
	visualHeightVector = new Vector(0,0,visualHeight);
	#if server
	self.SetModel("models/props_c17/oildrum001_explosive.mdl");
	self.PhysicsInit(SOLID_BBOX);
	self.SetTrigger(true);
	if (Gmod.IsValid(self.GetPhysicsObject()) ) {
	    self.GetPhysicsObject().EnableMotion(false);
	    self.GetPhysicsObject().Wake();
	    self.SetCollisionGroup(COLLISION_GROUP_DEBRIS);
	}
	self.DropToFloor();
	#end
	self.SetCollisionBounds(-sizeVector,sizeVector + collideHeightVector);
	// self.SetNoDraw(true);
	#if client
	
        // mesh = Gmod.Mesh(material.a);
	    

	#end
       
    }
    #if client
    override function Draw(flags:Float) {

	self.SetRenderBounds(-sizeVector,sizeVector + visualHeightVector);
	// self.SetCollisionBounds(new Vector (0,0,0),new Vector(100,100,0));
	CamLib.Start3D2D(self.GetPos() - new Vector (size / 2,size / 2,0),new Angle(0,90,0),1.0);
	
	SurfaceLib.SetDrawColor(64,164,223,25);//64, 164, 223
	SurfaceLib.DrawRect(0,0,100,100); 
	CamLib.End3D2D();
    }

    #end

    #if server
    override function Touch(ent:GEntCompat) {
	switch [ent.get(InfectionComponent),ent.get(PlayerComponent)] {
	    case [Comp(c_inf = {infection : NOT_INFECTED(inf)}),Comp(_)]:
		final curCooldown = cooldown.get(c_inf);
		if (curCooldown == null || Gmod.CurTime() > curCooldown) {
		    inf.value += totalInfection;
		    cooldown.set(c_inf,Gmod.CurTime() + totalCooldown);
		} 
		
	    default:
	}
    }
    #end
}
