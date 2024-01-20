package deceptinfect.infection.components;

import deceptinfect.infection.InfectionComponent.INF_STATE;
import deceptinfect.ecswip.ReplicatedComponent;

class InfectionLookData extends ReplicatedComponent {
	@:s var infection:INF_STATE;

	public function new() {
		super();
	}
}
