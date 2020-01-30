package deceptinfect;

import deceptinfect.Radiation.RadiationManager;
import haxe.ds.List;
import haxe.ds.ListSort;
import haxe.ds.ArraySort;
import deceptinfect.RateManager;

/**
    Handles producing a rate value, using adders and multipliers
**/
class RateHandler implements RateProvider {
    
    var addRates:Map<AddRateID,Float> = [];
    var multipliers:Map<MultiplierRateID,Float> = [];
    
    var infection:InfectionComponent;
  
    
    public function new(i:InfectionComponent) {
        infection = i;
        
    }

    
    public function getRate():Float {
        var adds = calcAddRates();
        var multipliers = calcMultipliers();
        return adds * multipliers;
    }
    function calcMultipliers():Float {
        var total:Float = 0;
        for (_ => multi in multipliers) {
            total += multi;
        }
        return total;
    }
    
    public function removeAddRate(id:AddRateID) {
        addRates.remove(id);
    }
    public function updateAddRate(id:AddRateID,x:Float) {
        addRates.set(id,x);
    }
    public function updateMultiRate(id:MultiplierRateID,x:Float) {
        multipliers.set(id,x); 
    }
    public function removeMultiRate(id:MultiplierRateID) {
        multipliers.remove(id);
    }
    function calcAddRates():Float {
        var total:Float = 0;
        for (_ => add in addRates) {
            total += add;
        }
        return total;
    }

}

typedef AddRate = {
    id : AddRateID,
    add : Float
}

typedef MultiplierRate = {
    id : MultiplierRateID,
    multi : Float
}



// typedef Source_Test = {
//     maxrate : Int,
//     radius : Int,
//     contam_chance : Float,
//     contam_check_time : Float,
//     contam_time : Int,
//     contam_dist : Int 
// }

interface RateProvider {
    /**
        Used by InfectionComponent
    **/
    function getRate():Float;
    
    function updateAddRate(id:AddRateID,x:Float):Void;
    function removeAddRate(id:AddRateID):Void;
    function updateMultiRate(id:MultiplierRateID,x:Float):Void;
    function removeMultiRate(id:MultiplierRateID):Void;
    
    
}

