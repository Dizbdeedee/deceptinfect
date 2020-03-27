package deceptinfect.ecswip;

import deceptinfect.client.PVS;

class GrabSystem extends System {

    
    #if client
    static var hycord = GlobalLib.Material("cable/new_cable_lit").a;
    override function run_client() {
        for (produce in ComponentManager.entities) {
            switch [produce.get(GrabProducer),produce.get(VirtualPosition)] {
            case [Comp(c_produce),Comp(c_virPos)]:
                if (c_produce.grab != null) {
                    var victim = c_produce.grab;
                    switch [victim.get(GrabAccepter),victim.get(GEntityComponent)] {
                    case [Comp(c_accept),Comp(gent)]:
                        var g_victim = gent.entity;
                        if (PVS.pvs.get(g_victim.EntIndex())) {
                            render(c_virPos.pos,g_victim.GetPos());
                        }
                    default:
                    }
                }
            default:
            }
        }
    }

    static function render(posProduce:Vector,posVic:Vector) {
        RenderLib.SetMaterial(hycord);
        RenderLib.DrawBeam(posProduce,posVic,24,0,1,{r : 128,g: 0,b: 255,a:255});

    }
    #end 
    
    #if server
    override function run_server() {
        for (produce in ComponentManager.entities) {
            switch [produce.get(GrabProducer),produce.get(GEntityComponent)] {
            case [Comp(c_grabProduce),Comp(c_gent)]:
                if (c_grabProduce.grab != null) {
                    var g_grabber = c_gent.entity;
                    var ent = switch (c_grabProduce.grab.get(GEntityComponent)) {
                    case Comp(gent):
                        gent;
                    default:
                        return;
                    }
                    var filter = GlobalLib.RecipientFilter();
                    filter.AddPVS(g_grabber.GetPos());
                    //filter.AddPVS(ent.GetPos());
                    //Networking.sendFilterGrabStart({},filter);
                }
            default:
            }

        }
    }
    #end

    static function target(victim:GrabAccepter,attacker:GrabProducer) {
        if (attacker.targeting == victim) {return;}
        victim.targeting.set(attacker,true);
        victim.numTargeting++;
        attacker.targeting = victim;
    }

    public static function checkOverwhelm(victim:GrabAccepter) {
        return victim.numTargeting >= victim.overwhelm;
    }

    public static function stopTargeting(attacker:GrabProducer) {
        if (attacker.targeting != null) {
            attacker.targeting.targeting.set(attacker,false);
            attacker.targeting = null;
        }
    }
    
    public static function start_grab(victim:GrabAccepter,attacker:GrabProducer) {
        victim.grabAttacker.set(attacker,true);
        victim.grabState = GRABBED;
        //attacker.grab = victim;
                
    }
}