package deceptinfect.grab.components;

class GrabSearcher extends Component {
	var searchState:SearchState = SEARCH_INACTIVE;

	var attackTime:Float = 0.75;

	var contributeTime:Float = 2;

	var contributeToAttackLimit = 0.45;

	var lagTime = .1;

	var canSolo = false;
}

enum SearchState {
	SEARCH_ACTIVE;
	SEARCH_INACTIVE;
	DO_NOT_SEARCH(reason:DoNotSearch);
	SEARCH_UNDEFINED;
}

enum DoNotSearch {
	COOLDOWN(time:Float);
	END_OF_ROUND;
	GRAB_ACTIVE;
}
