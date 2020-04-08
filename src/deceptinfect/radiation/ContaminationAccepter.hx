package deceptinfect.radiation;

import deceptinfect.ecswip.Component;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.util.TimeKeep;
class ContaminationAccepter extends Component {

    #if server
    public var contam_time:TimeKeep<RadiationID> = new TimeKeep();
    #end

}
