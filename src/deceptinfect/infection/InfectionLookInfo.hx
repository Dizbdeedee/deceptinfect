package deceptinfect.infection;

import deceptinfect.util.TimeKeep;

class InfectionLookInfo extends Component {
	#if server
	var lookat:TimeKeep<DI_ID> = new TimeKeep();
	var threshold:Float = 2.0;
	#end
}
