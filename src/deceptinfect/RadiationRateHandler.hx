package deceptinfect;

import deceptinfect.RateHandler.RateProvider;
import deceptinfect.Radiation;
class RadiationRateHandler {
    var sourceRates:Map<RadiationID,Float>; //fill in
    var diminish:Float = 0.75;
    var rate:RateProvider;
    public static var id(default,null) = RateManager.getAddRateTicket();
    
    
    
    public function new(e:RateProvider) {
        rate = e;
    }

    function think() {
        rate.updateAddRate(id,calcSourceRate());
    }
    function calcSourceRate():Float {
        var sortFunc = (x:Float,y:Float) -> if (x == y) return 0; else if (x < y) return -1; else return 1;
        var sorted:Array<Float> = [];
        //TODO optimise???
        for (_ => rate in sourceRates) {
            sorted.push(rate);
        }
        sorted.sort(sortFunc);
        var total:Float = 0;
        for (i in 0...sorted.length) {
            total = total + sorted[i] * Math.pow(diminish,i);
        }
        return total;
    }

    function updateRadiationRate(rad:RadiationID,rate:Float) {
        sourceRates.set(rad,rate);
    }
}

