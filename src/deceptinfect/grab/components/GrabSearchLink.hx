package deceptinfect.grab.components;

class GrabSearchLink extends Component {
	var grabSearcher:DI_ID;

	var grabVictim:DI_ID;

	var grabSearchLinkState:GrabSearchLinkState = INVALID(.0);
}

enum GrabSearchLinkState {
	VALID(timeInvalid:Ref<Float>);
	INVALID(timeValid:Ref<Float>);
}
