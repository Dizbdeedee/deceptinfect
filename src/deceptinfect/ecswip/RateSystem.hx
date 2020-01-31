package deceptinfect.ecswip;

class RateSystem {    
    static var nextAddRate:Int = 0;
    static var nextMultiRate:Int = 0;    
    public static function getAddRateTicket():AddRateID {
        nextAddRate++;
        return nextAddRate - 1;
    }

    public static function getMultiRateTicket():MultiplierRateID { //TODO implement
        nextMultiRate++;
        return nextMultiRate - 1; 
    }

    public static function addRate(rt:RateComponent,id:AddRateID,rate:Float) {
        rt.addRates.set(id,rate);
    }
    
}

typedef Rate = {
    rate : Float
}

abstract AddRateID(Int) from Int {
}

abstract MultiplierRateID(Int) from Int {

}