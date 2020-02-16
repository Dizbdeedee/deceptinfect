package deceptinfect.radiation;

import deceptinfect.radiation.ContaminationProducer.ContaminationProducerOptions;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.ecswip.Component;
import deceptinfect.radiation.RadiationTypes;
class RadiationProducer extends Component {
    //public var attatched:RadiationAttatched = NOT_ATTATCHED;
    public var id:RadiationID = RadiationSystem.getNextRadiatonID();   
    public var state:RadiationState = ENABLED;
    public var maxrate:Float;

    public var type:Null<RadTypes>;
    public var radius:Float;

    public var contamProducer:Option<ContaminationProducer> = None;
    public var lifetime:RadLifetime;
    
    public static function createFromType(type:RadTypes) {
        return new RadiationProducer(RadiationTypes.types[type]);
    }

    public function new(options:RadiationProduceOptions) {
        super();
        maxrate = options.maxrate;
        radius = options.radius;
        lifetime = options.lifetime;
    }

}


enum RadiationState {
    ENABLED;
    DISABLED;
    DESTROYED;
}

enum RadLifetime {
    FINITE(x:Float);
    INFINITE;
}

typedef RadiationProduceOptions = {
    var maxrate:Float;
    var radius:Float;
    var ?lifetime:RadLifetime;
    var ?attatch:Entity;
    var ?contaminate:ContaminationProducerOptions;
}
