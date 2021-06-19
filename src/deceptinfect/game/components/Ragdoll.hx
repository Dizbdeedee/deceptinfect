package deceptinfect.game.components;

import gmod.enums.DMG;
import deceptinfect.infection.InfectionComponent.INF_STATE;
import deceptinfect.util.Cooldown;

class Ragdoll extends Component {
	var reveal:RagdollReveal = NO_REVEAL;

	var owner:DI_ID;
}

enum RagdollReveal {
	WAIT(time:Ref<Float>);
	REVEAL;
	NO_REVEAL;
}
