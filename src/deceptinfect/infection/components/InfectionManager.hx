package deceptinfect.infection.components;

class InfectionManager extends Component {
	var averageInfection:Float;

	override function get_componentLifetime():ComponentLifetime {
		return NEVER_DELETE;
	}
}
