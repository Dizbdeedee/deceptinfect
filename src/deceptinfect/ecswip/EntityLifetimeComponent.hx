package deceptinfect.ecswip;

class EntityLifetimeComponent extends Component {
	var entityLifetime:EntityLifetime;
}

enum EntityLifetime {
	NEVER_DELETE;
	GAME;
	ROUND;
}
