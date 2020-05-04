package deceptinfect.ecswip;

import deceptinfect.util.Cooldown;
import deceptinfect.ecswip.ComponentManager.DI_ID;

/**
    More of a tag... really
**/
class GrabAccepter extends Component {
    public var grabAttacker:Map<GrabProducer,Bool> = [];
    public var grabState:GrabAcceptState = NOT_GRABBED;
    public var targeting:Map<GrabProducer,Bool> = [];
    public var numTargeting:Int = 0;
    public var overwhelm = 2;
    
}

enum GrabAcceptState {
    NOT_GRABBED;
    GRABBED;
    UNAVALIABLE(x:Cooldown);

    
}