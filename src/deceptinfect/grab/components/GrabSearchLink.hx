package deceptinfect.grab.components;

class GrabSearchLink extends Component {
	var grabSearcher:DI_ID;

	var grabVictim:DI_ID;

	var grabSearchLinkState:GrabSearchLinkState;
}

enum GrabSearchLinkState {
	VALID(timeInvalid:Float);
	INVALID(timeValid:Float);
}
