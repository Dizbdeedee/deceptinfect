package deceptinfect.infection;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.SeralizableRef;

@:replicated(SOME(CURRENT_PLAYER))
class InfectionComponent extends ReplicatedComponent {
	@:s var infection:INF_STATE = NOT_INFECTED(0.0);

	var rate:Float = 0;

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

enum INF_STATE {
	NOT_INFECTED(inf:SeralizableRef);
	INFECTED;
}
