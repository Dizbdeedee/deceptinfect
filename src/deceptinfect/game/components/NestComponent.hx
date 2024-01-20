package deceptinfect.game.components;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.Component;

using deceptinfect.DistSquared;

@:replicated(SOME(INFECTED))
class NestComponent extends ReplicatedComponent {
	@:s public var nestState:NestState = INVISIBLE;

	@:s public var health:Float = 10; // nocheckin change back

	public var rate_end = 10;

	public var rate_start = 4;

	public var radius_start:DistSquared = 200.safeSquare();

	public var radius_end:DistSquared = 1000.safeSquare();

	public var rate_threshold_min = 10.0;

	public var rate_threshold_max = 75.0;
}

enum NestState {
	INVISIBLE;
	VISIBLE;
	DEAD;
}
