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
            switch [acceptEnt.get(RadiationAccepter),acceptEnt.get(RateComponent),acceptEnt.get(VirtualPosition),acceptEnt.get(RadVictim)] {
            case [Comp(c_radAccept),Comp(c_rateAccept),Comp(c_radGEnt),Comp(c_radvic)]:
                //trace("radiationaccepter");
                for (produceEnt in ComponentManager.entities) {
                    switch [produceEnt.get(RadiationProducer),produceEnt.get(VirtualPosition),produceEnt.get(RadSource)] {
                    case [Comp(c_radProduce),Comp(c_producePos),Comp(c_radsource)]:
                        //c_radsource /c_radvic might be needed to prevent radiation from source when contaminated from source

                        var dist = c_producePos.pos.Distance(c_radGEnt.pos);
                        //trace('producing $dist');
                        switch getTotalRadiation(dist,c_radProduce) {
                        case Some(rate):
                            //trace('rate $rate');
                            c_radAccept.radiation.set(produceEnt,rate);
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
        // ent.add_component(RadiationProducer.createFromType(RadTypes.NEST));

    }
    
    static function getTotalRadiation(dist:Float,rad:RadiationProducer):Option<Float> {
        if (dist < rad.radius) {
            return Some((rad.maxrate - 1) * ((rad.radius - dist) / rad.radius));
        } else {
            return None;
        }
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