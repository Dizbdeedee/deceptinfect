package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(CURRENT_PLAYER))
class GeigerCounter extends ReplicatedComponent {
	@:s var geiger:Float = 0.0;

	var geigerHigh:Float = 2.5;

	var geigerLow:Float = 0;
}
