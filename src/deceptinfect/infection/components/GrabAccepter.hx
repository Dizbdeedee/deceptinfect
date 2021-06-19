package deceptinfect.infection.components;

import deceptinfect.util.Cooldown;

/**
    More of a tag... really
**/
class GrabAccepter extends Component {

    public var grabAttacker:Map<GrabProducer,Bool> = [];

    public var grabState:GrabAcceptState = NOT_GRABBED(0);

    public var targeting:Map<GrabProducer,Bool> = [];


    public var overwhelm = 2;
    
}

enum GrabAcceptState {
    NOT_GRABBED(numTargeting:Ref<Int>);
    GRABBED;
    UNAVALIABLE(x:Cooldown);

    
}