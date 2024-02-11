package deceptinfect.grab.components;

class GrabSearcher extends Component {
	var searchState:SearchState = SEARCH_INACTIVE;

	var searchTime:Float = 1;

	var searchInactiveTime:Float = .5;
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
