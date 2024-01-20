package deceptinfect.infection.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(CURRENT_PLAYER))
class InfectionPoints extends ReplicatedComponent {
	@:s var points:Int = 0;
}
