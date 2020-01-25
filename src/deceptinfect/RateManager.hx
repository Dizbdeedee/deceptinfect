package deceptinfect;

class RateManager { //implements RateManagerI
    static var nextAddRate:Int = 0;
    static var nextMultiRate:Int = 0;

    

    public static function getAddRateTicket():AddRateID {
        nextAddRate++;
        return nextAddRate - 1;
    }

    public static function getMultiRateTicket():MultiplierRateID {
        return -1;
    }
    
}

// interface RateManagerI {
//     function getAddRateTicket():AddRateID;
//     function getMultiRateTicket():MultiplierRateID;
// }

abstract AddRateID(Int) from Int {
}

abstract MultiplierRateID(Int) from Int {

}