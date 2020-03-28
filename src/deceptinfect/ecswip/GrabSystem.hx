package deceptinfect.ecswip;

import gmod.Hooks;
import deceptinfect.ecswip.SignalStorage.DamageEvent;
import deceptinfect.Networking.N_GrabEnd;
import deceptinfect.ecswip.ComponentManager.DI_ID;
import deceptinfect.Networking.N_GrabPos;
import deceptinfect.client.PVS;

class GrabSystem extends System {

    
    #if client
    static var hycord = GlobalLib.Material("cable/new_cable_lit").a;

    static var activeDraws:Map<Int,DI_ID> = [];
    
    override function init_client() {
        Networking.GrabUpdateSignal.handle(updateSig);
        Networking.GrabEndSignal.handle(remove);
    }

    static function updateSig(data:N_GrabPos) {
        if (!activeDraws.exists(data.index)) {
            trace('activated grab ${data.index}');
            var draw = ComponentManager.addEntity();
            draw.add_component(new GrabDraw(data.ent,data.ent2));
            activeDraws.set(data.index,draw);
        }
    }

    static function remove(data:N_GrabEnd) {
        trace('delete grab ${data.index}');
        if (activeDraws.exists(data.index)) {
            ComponentManager.removeEntity(activeDraws.get(data.index));
        } else {
            activeDraws.set(data.index,null);
        }
    }
    public static function drawCylinders() {
        for (ent in ComponentManager.entities) {
            switch ent.get(GrabDraw) {
            case Comp(draw):
                if (PVS.pvs.get(draw.ent1.EntIndex()) || PVS.pvs.get(draw.ent2.EntIndex())) {
                    render(draw.ent1.GetPos(),draw.ent2.GetPos());
                } else {
                    ComponentManager.removeEntity(ent);
                }
            default:
            }
        }
        return null;
    }

    static inline function render(posProduce:Vector,posVic:Vector) {
        RenderLib.SetMaterial(hycord);
        RenderLib.DrawBeam(posProduce,posVic,24,0,1,{r : 128,g: 0,b: 255,a:255});

    }
    #end 
    
    #if server
    
    static var grabindex = 0;

    
    override function init_server() {
        HookLib.Add(Hooks.EntityTakeDamage,"grabDamage",grabDamage);
    }
    static function grabDamage(ent:GEntCompat,dmg:CTakeDamageInfo) {
        if (ent.IsPlayer()) {
            switch (ent.id.get(GrabProducer)) {
            case Comp(c_produce):
                if (c_produce.grab != null) {
                    c_produce.damage += dmg.GetDamage();
                    if (c_produce.damage >= c_produce.threshold) {
                        grabStop(ent.id);
                    }
                }
            default:
            }
        }
        return null;
    }
    override function run_server() {
        for (attack in ComponentManager.entities) {
            switch [attack.get(GrabProducer),attack.get(GEntityComponent)] {
            case [Comp(c_grabProduce),Comp(_.entity => g_attack)]:
                
                if (c_grabProduce.grab != null) {
                    //trace('grab in progress');
                    var victim = c_grabProduce.grab;
                    var g_vic = switch (c_grabProduce.grab.get(GEntityComponent)) {
                    case Comp(gent):
                        gent.entity;
                    default:
                        
                        return;
                    }
                    var filter = GlobalLib.RecipientFilter();
                    filter.AddPVS(g_attack.GetPos());
                    filter.AddPVS(g_vic.GetPos());
                    Networking.sendFilterGrabUpdate({
                        index : c_grabProduce.grabindex,
                        ent: g_vic,
                        ent2: g_attack
                    },filter,true);
                    switch (victim.get(InfectionComponent)) {
                    case Comp(inf):
                        switch (inf.infection) {
                            case NOT_INFECTED(inf):
                                trace('infecting');
                                //TODO move
                                inf.value += calcGrabIncrease();
                            case INFECTED:
                                trace("infected");
                                grabStop(attack);
                        }
                    default:
                        throw "Victim has no infection component..";
                    }
                    

                }
            default:
            }

        }
    }

    static function grabStop(attack:DI_ID) {
        var c_produce = attack.get_sure(GrabProducer);
        var attackPos = attack.get_sure(VirtualPosition).pos;
        var vic = c_produce.grab;
        var vicPos = vic.get_sure(VirtualPosition).pos;
        var c_accept = vic.get_sure(GrabAccepter);
        c_produce.grab = null;
        c_accept.grabState = NOT_GRABBED;
        c_accept.grabAttacker.set(c_produce,false);
        switch (vic.get(PlayerComponent)) {
        case Comp(plyr):
            plyr.player.Freeze(false); 
        default:
        }
        switch (attack.get(PlayerComponent)) {
        case Comp(plyr):
            plyr.player.Freeze(false);
        default:
        }
        var filter = GlobalLib.RecipientFilter();
        filter.AddPVS(attackPos);
        filter.AddPVS(vicPos);
        Networking.sendFilterGrabEnd({index : c_produce.grabindex},filter);
    }

    public static function attemptGrab(attack:DI_ID,vic:DI_ID) {
        switch [attack.get(GrabProducer),vic.get(GrabAccepter)] {
        case [Comp(c_produce),Comp(c_accept)]:
            if (c_produce.grab == null) {
                
                grabStart(attack,vic);
            }
        default:
        }
        
    }

    public static function attemptTarget()

    
    static function grabStart(attack:DI_ID,vic:DI_ID) {
        trace("starting grab");
        var c_produce = attack.get_sure(GrabProducer);
        var c_accept = vic.get_sure(GrabAccepter);
        c_produce.grab = vic;
        c_accept.grabAttacker.set(c_produce,true);
        c_accept.grabState = GRABBED;
        c_produce.grabindex = grabindex++;
        switch (vic.get(PlayerComponent)) {
        case Comp(plyr):
            plyr.player.Freeze(true);
        default:
        }
        switch (attack.get(PlayerComponent)) {
        case Comp(plyr):
            plyr.player.Freeze(true);
        default:
        }
    }
    #end

    static function calcGrabIncrease():Float {
        return (100 / GameValues.GRAB_TIME) / Math.floor(1 / EngineLib.TickInterval());
    }
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

 
    
    
}