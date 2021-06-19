package deceptinfect.radiation;

import deceptinfect.radiation.ContaminationProducer.ContaminationProducerOptions;
import deceptinfect.radiation.RadiationSystem;
import deceptinfect.ecswip.Component;
import deceptinfect.radiation.RadiationTypes;

class RadiationProducer extends Component {
	public var state:RadiationState = ENABLED;
	public var maxrate:Float;

	// public var type:Null<RadTypes>;
	public var radius:DistSquared;

	// var options:RadiationProduceOptions;
	// public static function createFromType(type:RadTypes):RadiationProducer {
	//     // var radProduce = new RadiationProducer(RadiationTypes.types[type]);
	//     return new RadiationProducer(RadiationTypes.types[type]);
	// }

	public function new(options:RadiationProduceOptions) {
		super();

		maxrate = options.maxrate;
		radius = options.radius;
		// lifetime = options.lifetime;
		// this.options = options;
		// if (options.contaminate != null) {
		//     contamProducer = Some(new ContaminationProducer(options.contaminate));
		// }
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
