package deceptinfect.game.components;

import deceptinfect.ecswip.Component;
import deceptinfect.abilities.FormComponent.Cooldown;

class BatteryAccepter extends Component {
	public var charge:Float = 0.0;

	public var decay:Float = 0.01;

	public var satisfy:Float = 100.0;

	public var status:AccepterStatus = AVALIABLE;
}

enum AccepterStatus {
	AVALIABLE;
	SATISIFED;
	UNAVALIABLE(x:Cooldown);
}
