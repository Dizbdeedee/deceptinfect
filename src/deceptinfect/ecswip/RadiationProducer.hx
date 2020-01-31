package deceptinfect.ecswip;

import deceptinfect.ecswip.RadiationSystem;

class RadiationProducer extends Component {
    
    var lifetime:Float;
    //public var attatched:RadiationAttatched = NOT_ATTATCHED;
    public var id:RadiationID = RadiationSystem.getNextRadiatonID();   
    
    public var type:RadiationType; //TODO actually make work
    public var state:RadiationState = ENABLED;
    public var maxrate:Float;
    public var radius:Float;
    
    public function new() {
        super();
    }

}


enum RadiationState {
    ENABLED;
    DISABLED;
    DESTROYED;
}

enum ContaminationType {
    /**
        Always contaminate, no matter the target
    **/
    ALWAYS;
    /**
        Contaminate only if there is nothing with the same type on the object
    **/
    SAME_TYPE;
    /**
        Contaminate only if there is nothing from the same base source on the object
    **/
    SAME_SOURCE;
}

