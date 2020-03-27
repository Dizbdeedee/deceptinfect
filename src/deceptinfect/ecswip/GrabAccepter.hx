package deceptinfect.ecswip;

import deceptinfect.ecswip.ComponentManager.DI_ID;

/**
    More of a tag... really
**/
class GrabAccepter extends Component {
    public var grabAttacker:Map<GrabProducer,Bool> = [];
    public var grabState:GrabState = NOT_GRABBED;
    public var targeting:Map<GrabProducer,Bool> = [];
    public var numTargeting:Int = 0;
    public var overwhelm = 2;
    
}

enum GrabState {
    NOT_GRABBED;

    START_GRAB;
    GRABBED;
}