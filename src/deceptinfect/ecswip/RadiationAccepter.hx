package deceptinfect.ecswip;

import deceptinfect.ecswip.RadiationSystem;

class RadiationAccepter extends Component {

    public var sourceRates:Map<RadiationID,Float>; //fill in
    public var diminish:Float = 0.75;
    
    public var accepting:Bool = false;
    public function new() {
        super();
    }
}