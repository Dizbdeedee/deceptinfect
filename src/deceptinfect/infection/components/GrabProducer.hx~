package deceptinfect.ecswip;

import deceptinfect.util.Cooldown;
import deceptinfect.ecswip.ComponentManager.DI_ID;

class GrabProducer extends Component {

    public var grabindex = 0;
    public var grabinc:Float = 0.0;
    public var damage:Float = 0.0;
    public var threshold:Float = 50.0;
    public var looktargets:Bool = false;
    public var targeting:Null<GrabAccepter> = null;

    public var nextCooldown:Float = 5;

    public var grabDist:Float = 70;
    public var grabState(default,#if server set #else default #end):GrabProduceState = READY(NOT_SEARCHING);
    #if server
    public function set_grabState(newGrabState:GrabProduceState):GrabProduceState {
        
        switch [grabState,newGrabState] {
            case [READY(TARGET(old)),READY(TARGET(newt))] if (old == newt):
            case [READY(TARGET(old)),x]:
                var c_accept = old.get_sure(GrabAccepter);
                c_accept.numTargeting--;
            default:
        }
        return grabState = newGrabState;
        
    }
    #end
    
    
}

enum SearchingState {
    NOT_SEARCHING;
    SEARCHING;
    TARGET(vic:DI_ID);
}

enum GrabProduceState {
    READY(search:SearchingState);
    GRABBING(victim:DI_ID);
    NOT_READY(x:Cooldown);
    
}