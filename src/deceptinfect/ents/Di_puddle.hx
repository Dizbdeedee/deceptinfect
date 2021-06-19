package deceptinfect.ents;

import deceptinfect.ecswip.PlayerComponent;
import gmod.structs.MeshVertex;
import gmod.sent.SentBuild.EntFields;
import gmod.gclass.IMesh;
import deceptinfect.infection.InfectionComponent;

@:keep
class Di_puddle extends gmod.sent.SentBuild<gmod.sent.ENT_ANIM> {

    static final material = Gmod.Material("editor/wireframe");

    final cooldown:Map<InfectionComponent,Float> = [];

    final properties:EntFields = {
	Base : "base_entity",
    }

    var totalCooldown = 5.0; 

    var totalInfection = 25.0;
    
    #if client
    static var mesh:Null<IMesh> = null;
    #end

    override function Initialize() {
	#if client
	
        // mesh = Gmod.Mesh(material.a);
	    
	#end
       
    }
    #if client
    override function Draw(flags:Float) {
	CamLib.Start3D();
	final mins = self.GetPos() + new Vector(100,10,100);
	final maxs = self.GetPos() - new Vector(100,10,100);
	RenderLib.DrawBox(self.GetPos(),self.GetAngles(),mins,maxs,{
		    r: 128 
		    g: 0,
		    b: 128,
		    a: 255,
		    });
	CamLib.End3D();
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
