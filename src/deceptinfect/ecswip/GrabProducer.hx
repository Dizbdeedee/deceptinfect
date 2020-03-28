package deceptinfect.ecswip;

import deceptinfect.util.Cooldown;
import deceptinfect.ecswip.ComponentManager.DI_ID;

class GrabProducer extends Component {

    public var grab:Null<DI_ID> = null;

    public var grabindex = 0;
    public var grabinc:Float = 0.0;
    public var damage:Float = 0.0;
    public var threshold:Float = 50.0;
    public var looktargets:Bool = false;
    public var targeting:Null<GrabAccepter> = null;

    public var nextCooldown:Float = 5;


    public var searchState:SearchingState = NOT_SEARCHING;
    public var grabState:GrabProduceState = READY;
    
    
}

enum SearchingState {
    NOT_SEARCHING;
    SEARCHING;
    TARGET(vic:DI_ID);
}

enum GrabProduceState {
    READY;
    GRABBING(victim:DI_ID);
    NOT_READY(x:Cooldown)
    
}