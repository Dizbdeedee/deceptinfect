package deceptinfect;

import deceptinfect.Infected.GrabbableComponent;

interface GameEntity {
    
    var infection:ComponentState<InfectionComponent>;
    var infectedPlayer:ComponentState<InfectedPlayer>;
    var radhandler:ComponentState<RadiationRateHandler>;
    var rate:ComponentState<RateHandler>;
    var grab:ComponentState<GrabbableComponent>;
}

class ComponentTools {
    public static function sure<T>(state:ComponentState<T>):T {
        return switch (state) {
            case COMPONENT(comp):
                comp;
            default:
                throw "Attempt to use non existent component on entity!";
        } 
    }

    
}

@:using(deceptinfect.GameEntity.ComponentTools)
enum ComponentState<T> {
    NO_COMPONENT;
    COMPONENT(comp:T);
}
