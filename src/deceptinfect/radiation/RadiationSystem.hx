package deceptinfect.radiation;

import deceptinfect.radiation.RadiationTypes.RadTypes;
import haxe.iterators.StringKeyValueIteratorUnicode;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.infection.RateComponent;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.infection.RateSystem;
import deceptinfect.ecswip.Family;

class RadiationSystem extends System {
   
    static var nextRadiationID:RadiationID = new RadiationID();

    static var radRateID:AddRateID = RateSystem.getAddRateTicket();

    
    public static function getNextRadiatonID():RadiationID {
        nextRadiationID++;
        return nextRadiationID - 1;

    }

    static var _acceptFamily:Family = new Family([RadiationAccepter,RateComponent,GEntityComponent]);
    static var _produceFamily:Family = new Family([RadiationProducer,VirtualPosition]);
    #if server
    override function run_server() {
        
        for (acceptEnt in ComponentManager.entities) {
            switch [acceptEnt.get(RadiationAccepter),acceptEnt.get(RateComponent),acceptEnt.get(GEntityComponent)] {
            case [Comp(c_radAccept),Comp(c_rateAccept),Comp(c_radGEnt)]:
                //trace("radiationaccepter");
                for (produceEnt in ComponentManager.entities) {
                    switch [produceEnt.get(RadiationProducer),produceEnt.get(VirtualPosition)] {
                    case [Comp(c_radProduce),Comp(c_producePos)]:

                        var dist = c_producePos.pos.Distance(c_radGEnt.entity.GetPos());
                        //trace('producing $dist');
                        switch getTotalRadiation(dist,c_radProduce) {
                        case Some(rate):
                            //trace('rate $rate');
                            c_radAccept.radiation.set(c_radProduce.id,rate);
                        default:
                        }
                        switch [c_radProduce.contamProducer,c_radAccept.acceptContam] {
                        case [Some(c_contamProduce),Some(c_contamAccept)]:
                            //trace("contamination working");
                            if (shouldContam(dist,c_contamProduce)) {
                                var time = c_contamAccept.contam_time.addTime(c_radProduce.id);
                                //trace('time $time');
                                if (shouldRoll(time,c_contamProduce)) {
                                    c_contamAccept.contam_time.resetTime(c_radProduce.id);
                                    //trace('roll');
                                    var randRoll = Math.random();
                                    if (randRoll < c_contamProduce.chance) {
                                        var rad = ComponentManager.addEntity();
                                        var c_newRadProduce = new RadiationProducer({
                                            maxrate: c_radProduce.maxrate, 
                                            radius: c_radProduce.radius,
                                            contaminate: c_contamProduce.options,
                                            type: c_radProduce.type,
                                            lifetime: c_contamProduce.contam_time
                                        });
                                        c_newRadProduce.base = c_radProduce.id;
                                        rad.add_component(c_newRadProduce);
                                        rad.add_component(new VirtualPosition(c_radGEnt.entity));
                                    }
                                }
                            } else {
                                c_contamAccept.contam_time.removeTime(c_radProduce.id);
                            }
                            
                        default:
                        }
                    default:
                    }

                }
                c_rateAccept.addRates.set(radRateID,getTotalRadiationRate(c_radAccept));
                //trace(c_rateAccept.addRates);
            default:
            }
        }
        
    }
    #end

    @:expose("testRadiation")
    static function testRadiation(vec:Vector) {
        var ent = ComponentManager.addEntity();
        ent.add_component(new VirtualPosition(null,vec,new Angle(0,0,0)));
        ent.add_component(RadiationProducer.createFromType(RadTypes.NEST));

    }
    
    static function getTotalRadiation(dist:Float,rad:RadiationProducer):Option<Float> {
        if (dist < rad.radius) {
            return Some((rad.maxrate - 1) * ((rad.radius - dist) / rad.radius));
        } else {
            return None;
        }
    }

    static inline function shouldContam(dist:Float,contamProduce:ContaminationProducer):Bool {
        return dist < contamProduce.dist;
    }

    static inline function shouldRoll(time:Float,contamProduce:ContaminationProducer):Bool {
        return time > contamProduce.check;
    }

    
    


    static function getTotalRadiationRate(r:RadiationAccepter):Float {
        
        var sortFunc = (x:Float,y:Float) -> if (x == y) return 0; else if (x < y) return -1; else return 1;
        var sorted:Array<Float> = [];
        //TODO optimise???
        for (_ => rate in r.radiation) {
            sorted.push(rate);
        }
        sorted.sort(sortFunc);
        var total:Float = 0;
        for (i in 0...sorted.length) {
            total = total + sorted[i] * Math.pow(r.diminish,i);
        }
        
        return total;
    }
}

abstract RadiationID(Int) to Int from Int {
    public extern inline function new() {
        this = 0;
    }
}

abstract RadiationType(Int) to Int from Int {

}