package deceptinfect.radiation;

import deceptinfect.ecswip.Component;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.util.TimeKeep;
class ContaminationAccepter extends Component {
    public var contam_time:TimeKeep<RadiationID> = new TimeKeep();
    

}

// enum ContamAcceptState {
//     REJECTING;
//     ACCEPTING(x:ContaminationAccepter);
// }
