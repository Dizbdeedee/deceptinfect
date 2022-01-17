package deceptinfect.radiation;

import deceptinfect.radiation.ContaminationProducer.ContaminationProducerOptions;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.ecswip.Component;
import deceptinfect.radiation.RadiationTypes;
using deceptinfect.DistSquared;


class RadiationProducer extends Component {
	public var state:RadiationState = ENABLED;
	public var maxrate:Float;

	// public var type:Null<RadTypes>;
	public var radius:DistSquared;

	public function new(options:RadiationProduceOptions) {
		super();
		maxrate = options.maxrate;
		radius = options.radius.safeSquare();
	}

	public function copy() {}
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
}
