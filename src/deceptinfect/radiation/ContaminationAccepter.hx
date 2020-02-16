package deceptinfect.radiation;

import deceptinfect.radiation.RadiationSystem;

class ContaminationAccepter {

    public var contams:Map<RadiationID,RadiationProducer> = [];

    

}

enum ContamAcceptState {
    REJECTING;
    ACCEPTING(x:ContaminationAccepter);
}
