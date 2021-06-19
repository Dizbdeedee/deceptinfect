package deceptinfect.abilities;

import deceptinfect.ecswip.Component;

class FormComponent extends Component {
	public var formHealth:Float = 60.0;
	public var cooldown:Cooldown = ACTIVE;
	public var nextCooldown:Float = 5;
	public var form:CurrentForm = HUMAN;
	public var formMaxHealth:Float = 60.0;

	public var formModel:String = Misc.infModel;
}

enum CurrentForm {
	HUMAN;
	INFECTED;
}

enum Cooldown {
	ACTIVE;
	COOLDOWN(time:Float);
}
