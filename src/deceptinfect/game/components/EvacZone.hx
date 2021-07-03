package deceptinfect.game.components;

import deceptinfect.SeralizableRef;
import deceptinfect.ecswip.ReplicatedComponent;


@:replicated(ALL)
class EvacZone extends ReplicatedComponent {

	var arrivetime:Float = 10.0;

	var leavetime:Float = 25.0;

	#if client
	var prevState:EvacState = NOT_ACTIVE;
	#end

	@:s var state:EvacState = NOT_ACTIVE;

}

enum EvacState {
	NOT_ACTIVE;
	ARRIVING(time:SeralizableRef);
	LEAVING(time:SeralizableRef);
}
