package deceptinfect.infection;

import gmod.helpers.net.NVector;
import deceptinfect.ecswip.ReplicatedComponent;
import hxbit.Serializer;
import deceptinfect.ecswip.Component;
import deceptinfect.SeralizableRef;

class InfectionComponent extends ReplicatedComponent {
	@:s var infection(default, set):INF_STATE = NOT_INFECTED(0.0);

	
	var rate:Float = 1;

	var baseInfection:BaseInfection = USING_GLOBAL;
	var onInfected(default, null):Signal<Noise>;
	var acceptingInfection:AcceptingInfection = ACCEPTING;

	public function getInfValue():Float {
		return switch (infection) {
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
		#if server
		replicated = SOME(CURRENT_PLAYER);
		#end
	}
}

typedef InfectionMessageInfo = {
	infection:Float,
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

// @:forward
// @:transitive
// @:forwardStatics
// @:forward.new
// @:forward.variance
// abstract BetterRef<T>(tink.core.Ref<T>) {

// }

enum INF_STATE {
	NOT_INFECTED(inf:SeralizableRef);
	INFECTED;
}
