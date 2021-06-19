package deceptinfect.radiation;

import deceptinfect.macros.IterateEnt;
import deceptinfect.util.Util;
import deceptinfect.radiation.RadiationTypes.RadTypes;
import haxe.iterators.StringKeyValueIteratorUnicode;
import deceptinfect.ecswip.System;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.infection.RateComponent;
import deceptinfect.ecswip.GEntityComponent;
import deceptinfect.infection.systems.RateSystem;
import deceptinfect.ecswip.Family;

class Famile<A,B,C,D> {

}

//finish?
var derka:Famile<RadiationProducer,VirtualPosition,RadSource,RadSource>;
class RadiationSystem extends System {
   
    static var nextRadiationID:RadiationID = new RadiationID();

    static var radRateID:AddRateID = RateSystem.getAddRateTicket();

    
    public static function getNextRadiatonID():RadiationID {
        nextRadiationID++;
        return nextRadiationID - 1;

    }

    #if server
    override function run_server() {
        IterateEnt.iterGet(derka,
            [accept_accept,accept_rate,accept_pos,_],
            () -> {
                accept_accept.radiation.clear();
                IterateEnt.iterGet([RadiationProducer,VirtualPosition,RadSource],
                    [produce_produce,produce_pos,_],
                    (produce) -> {
                        var dist = produce_pos.pos.Distance(accept_pos.pos);
                        
                        switch getTotalRadiation(dist,produce_produce) {
                        case Some(rate):
                            //trace('rate $rate');
                            accept_accept.radiation.set(produce,rate);
                        default:
                        }
                    });
                accept_rate.addRates.set(radRateID,getTotalRadiationRate(accept_accept));
        });
    }
    #end

    @:expose("testRadiation")
    static function testRadiation(vec:Vector) {
        var ent = ComponentManager.addEntity();
        ent.add_component(new VirtualPosition(REAL(vec,new Angle(0,0,0))));
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