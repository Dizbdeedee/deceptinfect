package deceptinfect.radiation;

import lua.lib.luv.fs.FileSystemPoll;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ecswip.RateComponent;
import deceptinfect.GEntCompat;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.ecswip.RateSystem;
import deceptinfect.ecswip.Family;

class RadiationSystem {
   
    static var nextRadiationID:RadiationID = new RadiationID();

    static var radRateID:AddRateID = RateSystem.getAddRateTicket();

    
    public static function getNextRadiatonID():RadiationID {
        nextRadiationID++;
        return nextRadiationID - 1;

    }

    static var _acceptFamily:Family = new Family([RadiationAccepter,RateComponent,GEntityComponent]);
    static var _produceFamily:Family = new Family([RadiationProducer,VirtualPosition]);
    public static function run() {
        
        for (acceptEnt in ComponentManager.entities) {
            switch [acceptEnt.get(RadiationAccepter),acceptEnt.get(RateComponent),acceptEnt.get(GEntityComponent)] {
                case [Comp(c_radAccept),Comp(c_rateAccept),Comp(c_radGEnt)]:
                    for (produceEnt in ComponentManager.entities) {
                        switch [produceEnt.get(RadiationProducer),produceEnt.get(VirtualPosition)] {
                            case [Comp(c_radProduce),Comp(c_producePos)]:
                                

                                var dist = c_producePos.pos.Distance(c_radGEnt.entity.GetPos());
                                switch getTotalRadiation(dist,c_radProduce) {
                                    case Some(rate):
                                        c_radAccept.radiation.set(c_radProduce.id,rate);
                                    default:
                                }
                                switch [c_radProduce.contamProducer,c_radAccept.acceptContam] {
                                    case [Some(c_contamProduce),Some(c_contamAccept)]:
                                        if (shouldContam(dist,c_contamProduce)) {
                                            var time = c_contamAccept.contam_time.addTime(c_radProduce.id);
                                            if (shouldRoll(time,c_contamProduce)) {
                                                var randRoll = Math.random();
                                                if (randRoll < c_contamProduce.check) {
                                                    trace("Contaminated");
                                                }
                                            }
                                        }
                                        
                                    default:
                                }
                            default:
                        }

                    }
                    c_rateAccept.addRates.set(radRateID,getTotalRadiationRate(c_radAccept));

                default:
            }
        }
        
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
        return time > contamProduce.time;
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