package deceptinfect.radiation;

import deceptinfect.ecswip.Component;

class RadiationAccepter extends Component {
	public var diminish:Float = 0.75;

	var rate:Float = 0;

	public function new(options:RadAcceptOptions) {
		super();
		if (options.diminish != null) {
			diminish = options.diminish;
		}
	}
}

typedef RadAcceptOptions = {
	/**
		If accepting contamination, provide here
	**/
	var ?contaminate:ContaminationAccepter;

	/**
		Rate to diminish each source by. Default 0.75
	**/
	var ?diminish:Float;
}
