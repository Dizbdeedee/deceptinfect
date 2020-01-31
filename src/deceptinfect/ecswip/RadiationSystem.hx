package deceptinfect.ecswip;

import deceptinfect.ecswip.RateSystem;
class RadiationSystem {
   
    static var nextRadiationID:RadiationID = new RadiationID();

    static var radRateID:AddRateID = RateSystem.getAddRateTicket();
    //Oh god
    //My first """"""ecs""""" system and this is what i came up with
    //God have mercy on us all
    //TODO refactor at somepoint
    public static function update() {

        for (acceptEnt in ComponentManager.entities) {
            switch [acceptEnt.get_component(RadiationAccepter),acceptEnt.get_component(RateComponent),acceptEnt.get_gent()] {
                case [COMPONENT(acceptComp = _.accepting => true),COMPONENT(rateComp),GEnt(acceptG)]:
                    
                    for (produceEnt in ComponentManager.entities) {
                        switch [produceEnt.get_component(RadiationProducer),produceEnt.get_gent()] {
                            case [COMPONENT(produceComp),GEnt(produceG)] :
                                switch (radiationDistanceCalc(produceG,produceComp,acceptG)) {
                                    case Some(rate):
                                        acceptComp.sourceRates.set(produceComp.id,rate);
                                    case None:
                                        continue;
                                }
                                
                            
                            default:
                        }

                    }
                    rateComp.addRates.set(radRateID,getTotalRadiationRate(acceptComp));

                default:
            }
        }
        
    }

    public static function getNextRadiatonID():RadiationID {
        nextRadiationID++;
        return nextRadiationID - 1;

    }

    static function radiationDistanceCalc(radEnt:GEntCompat,rad:RadiationProducer,acceptEnt:GEntCompat):Option<Float> {
        var dist = radEnt.GetPos().Distance(acceptEnt.GetPos());
        if (dist < rad.radius ) {
            return Some((rad.maxrate - 1) * ((rad.radius - dist) / rad.radius));
        } else {
            return None;
        }
    }
    static function getTotalRadiationRate(r:RadiationAccepter):Float {
        
        var sortFunc = (x:Float,y:Float) -> if (x == y) return 0; else if (x < y) return -1; else return 1;
        var sorted:Array<Float> = [];
        //TODO optimise???
        for (_ => rate in r.sourceRates) {
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