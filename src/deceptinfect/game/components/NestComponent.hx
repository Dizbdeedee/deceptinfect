package deceptinfect.game.components;

import deceptinfect.ecswip.Component;

class NestComponent extends Component {
	public var nestState:NestState = INVISIBLE;

	public var health:Float = 1000.0;

	public var rate_end = 7.0;

	public var rate_start = 5.0;

	public var radius_start:DistSquared = 200;

	public var radius_end:DistSquared = 1000;

	public var rate_threshold_min = 10.0;

	public var rate_threshold_max = 75.0;
}

enum NestState {
	INVISIBLE;
	VISIBLE;
	DEAD;
}