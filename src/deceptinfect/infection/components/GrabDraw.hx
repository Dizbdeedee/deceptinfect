package deceptinfect.infection.components;

import deceptinfect.ecswip.ComponentManager.DI_ID;

class GrabDraw extends Component {
	public var ent1:Entity;
	public var ent2:Entity;

	public function new(ent1:Entity, ent2:Entity) {
		super();
		this.ent1 = ent1;
		this.ent2 = ent2;
	}
}
