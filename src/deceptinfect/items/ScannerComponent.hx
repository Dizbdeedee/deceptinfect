package deceptinfect.items;

import deceptinfect.util.TimeKeep;

class ScannerComponent extends Component {

    var scanProgress:TimeKeep<DI_ID> = new TimeKeep();
    var time:Float = 30;
    var reliability_max = 0.7;
    var reliability_min = 0.5;

}
