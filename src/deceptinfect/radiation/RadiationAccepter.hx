package deceptinfect.radiation;

import deceptinfect.radiation.RadiationSystem;
import deceptinfect.ecswip.Component;
import deceptinfect.radiation.ContaminationAccepter;
class RadiationAccepter extends Component {

    public var radiation:Map<RadiationID,Float> = []; //fill in
    public var diminish:Float = 0.75;
    
    public var acceptContam:Option<ContaminationAccepter> = None;
    public var accepting:Bool = false;
    public function new() {
        super();
    }
}

typedef RadAcceptOptions = {
    /**
        If accepting contamination, provide here
    **/
    var ?contaminate:ContaminationAccepter;
    /**
        Rate to diminish each source by. Default 0.75
    **/
    var ?diminish:Float;
}

