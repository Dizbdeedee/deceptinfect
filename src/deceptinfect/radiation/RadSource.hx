package deceptinfect.radiation;

import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.radiation.RadiationProducer;
import deceptinfect.radiation.ContaminationProducer;
import deceptinfect.radiation.RadiationProducer.RadiationProduceOptions;
import deceptinfect.radiation.ContaminationProducer.ContaminationProducerOptions;
import deceptinfect.radiation.RadiationProducer.RadLifetime;
import deceptinfect.radiation.RadiationTypes.RadTypes;
/**
    Goes on radiation entity **NOT** the entity actually producing
**/
class RadSource extends Component {
    var base:DI_ID;
    var type:RadTypes;

    var attatch:DI_ID;

    var lifetime:RadLifetime;

    var state:RadSourceState = INACTIVE;

    var rso:RadSourceOptions;

    function new(rso:RadSourceOptions) {
        super();
        attatch = rso.attatch;
        type = rso.type;
        lifetime = rso.lifetime;
        this.rso = rso;

    }
}

typedef RadSourceOptions = {
    type : RadTypes,
    ?attatch : DI_ID,
    lifetime : RadLifetime,
    options : RadSourceOp
    
}

enum RadSourceOp {
    CONTAM(op:ContaminationProducerOptions);
    RAD(op:RadiationProduceOptions);
    BOTH(rpo:RadiationProduceOptions,cpo:ContaminationProducerOptions);
}

typedef NewRadSourceReturn = {
    c_rs : RadSource,
    c_contam :Option<ContaminationProducer>,
    c_radproduce : Option<RadiationProducer>,
}

enum RadSourceState {
    ACTIVE(x:RadTime);
    INACTIVE;
}

enum RadTime {
    INFINITE;
    FINITE(removetime:Float);
}