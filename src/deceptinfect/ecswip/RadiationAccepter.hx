package deceptinfect.ecswip;

import deceptinfect.ecswip.RadiationSystem;

class RadiationAccepter extends Component {

    public var sourceRates:Map<RadiationID,Float>; //fill in
    public var diminish:Float = 0.75;
    
    public var accepting:Bool = false;
    // public var contaminatable:Bool = true;
    public static var id(default,null) = RateManager.getAddRateTicket();
    
    
    
    public function new() {
        super();
    }
}