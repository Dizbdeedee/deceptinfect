package deceptinfect.game.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(CURRENT_PLAYER))
class TerrorComponent extends ReplicatedComponent {
	@:s var terror:Float = 0;
}
