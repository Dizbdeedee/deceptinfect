package deceptinfect.grab.components;

class GrabSearchLink extends Component {
	var grabSearcher:DI_ID;

	var grabVictim:DI_ID;

	var grabSearchLinkState:GrabSearchLinkState = INVALID(.0);

	var attackerTime:ThresholdState = THRESHOLD(.0);

	var contributorTime:ThresholdState = THRESHOLD(.0);
}

enum GrabSearchLinkState {
	VALID(timeInvalid:Ref<Float>);
	INVALID(timeValid:Ref<Float>);
}

enum ThresholdState {
	THRESHOLD_REACHED(timeInvalid:Ref<Float>);
	THRESHOLD(timeValid:Ref<Float>);
}
