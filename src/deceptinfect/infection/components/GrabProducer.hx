package deceptinfect.infection.components;

import deceptinfect.util.Cooldown;
import deceptinfect.ecswip.ComponentManager.DI_ID;

class GrabProducer extends Component {
    public var grabindex = 0;
    public var damage:Float = 0.0;
    public var threshold:Float = 50.0;
    public var nextCooldown:Float = 5;

    public var grabDist:Float = 70;
    public var grabState:GrabProduceState = READY(NOT_SEARCHING);
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
