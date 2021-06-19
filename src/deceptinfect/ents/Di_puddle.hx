package deceptinfect.ents;

import deceptinfect.infection.components.GrabbableProp;
import deceptinfect.infection.components.GrabAccepter;
import deceptinfect.ecswip.PlayerComponent;
import gmod.structs.MeshVertex;
import gmod.helpers.sent.SentBuild.EntFields;
import gmod.gclass.IMesh;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.infection.InfectionComponent;

@:keep
class Di_puddle extends gmod.helpers.sent.SentBuild<gmod.sent.ENT_ANIM> {

    // static final material = Gmod.Material("nature/water_canals_cheap001_dx70").a;

    static final material = Gmod.Material("nature/water_coast01").a;
    final cooldown:Map<InfectionComponent,Float> = [];

    final properties:EntFields = {
	Base : "base_entity",
    }

    var totalCooldown = 5.0; 

    var size = 100;

    var initalInfection = 15.0;

    var finalInfection = 75.0;

    var rampUpTime = 120;
    
    var sizeVector:Vector;
    var collideHeightVector:Vector;
    var visualHeightVector:Vector;

    

    var puddleState:PuddleState = NOT_ACTIVE;
    
    var collideHeight = 40;

    var visualHeight = 1;

    var active = false;
    
    #if client
    static var mesh:Null<IMesh> = null;
    #end

    var id:DI_ID;
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
        var ent = new GEntCompat(self);
        id = ent.id;
        final grabaccepter = id.add_component(new GrabAccepter());
	grabaccepter.canGrabBack = false;
	grabaccepter.overwhelm = 1;
	id.add_component(new GrabbableProp());
	id.add_component(new InfectionComponent());
	// id.add_component(new VirtualPosition(ENT(self)));
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
    override function Touch(ent:Entity) {
	switch (ent.validID()) {
	    case Some(vicID): 
	    switch [vicID.get(InfectionComponent),vicID.get(PlayerComponent),puddleState] {
		case [Comp(c_inf = {infection : NOT_INFECTED(inf)}),Comp(_),ACTIVE(currentInf,_)]:
		final curCooldown = cooldown.get(c_inf);
		if (curCooldown == null || Gmod.CurTime() > curCooldown) {
		    inf.value += currentInf.value;
		    cooldown.set(c_inf,Gmod.CurTime() + totalCooldown);
		} 
		
	    default:
	}
	default:
	}
    }

    
    override function Think():Bool {
	switch (puddleState) {
	    case ACTIVE(currentInfection,initTime):
		final cur = Gmod.CurTime();
		currentInfection.value = MathLib.Remap(cur,initTime,initTime + rampUpTime,initalInfection,finalInfection); 
	    case NOT_ACTIVE:
		final inf = id.get_sure(InfectionComponent);
		switch (inf.infection) {
		    case INFECTED:
			puddleState = ACTIVE(initalInfection,Gmod.CurTime());
			trace("puddle infected");
		    default:
		}
	}
	return null;
    }
    #end
}

enum PuddleState {
    NOT_ACTIVE;
    ACTIVE(currentInfection:Ref<Float>,timeActivated:Float);
}
   