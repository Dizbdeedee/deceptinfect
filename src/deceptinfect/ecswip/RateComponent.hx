package deceptinfect.ecswip;

class RateComponent extends Component {


    var addRates:Map<AddRateID,Float> = [];
    var multipliers:Map<MultiplierRateID,Float> = [];
    
    
  


}


abstract AddRateID(Int) from Int {
}

abstract MultiplierRateID(Int) from Int {

}