package deceptinfect.infection;

import hxbit.Serializer;
import deceptinfect.ecswip.Component;
import deceptinfect.SeralizableRef;
class InfectionComponent extends Component {
    
  @:s public var infection(default,set):INF_STATE = NOT_INFECTED(0.0);
    public var rate:Float = 1;

    public var player:SeraliazablePlayer;
    public var baseInfection:BaseInfection = USING_GLOBAL;
    public var onInfected(default,null):Signal<Noise>;
    public var acceptingInfection:AcceptingInfection = ACCEPTING;

    public function getInfValue():Float {
        return switch(infection) {
            case NOT_INFECTED(inf):
                inf.value;
            case INFECTED:
                100;
        }
    }
    public function set_infection(x:INF_STATE):INF_STATE {
        // trace(x);
        return infection = x;
        
    }

    public function new() {
        super();
    }
}

typedef InfectionMessageInfo = {
    infection : Float,
}

enum AcceptingInfection {
    ACCEPTING;
    REJECTING;
}

enum BaseInfection {
    NOT_USING;
    USING_GLOBAL;
    USING_STATIC(rate:Float);
}


enum INF_STATE {
    NOT_INFECTED(inf:Ref<Float>);
    INFECTED;
}
