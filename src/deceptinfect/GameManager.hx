package deceptinfect;

import deceptinfect.ecswip.ReplicatedComponent;

// -> game
@:replicated(ALL)
class GameManager extends ReplicatedComponent {
	@:s var state:GAME_STATE_2 = WAIT;

	var stateChanged:Signal<GAME_STATE_2>;

	var diffTime:Float = null;

	var spawnAllowed = true;

	var lastTick:Float = 0.0;

	override function get_componentLifetime():ComponentLifetime {
		return NEVER_DELETE;
	}
}

enum GAME_STATE_2 {
	WAIT;
	SETTING_UP(time:Float);
	PLAYING; // no
	ENDING(time:Float);
}
