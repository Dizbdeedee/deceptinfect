package deceptinfect.game.components;

import deceptinfect.util.Cooldown;

class GrabAccepter2 extends Component {
	var grabState:GrabAcceptState;
}

enum GrabAcceptState {
	NOT_GRABBED(numTargeting:Ref<Int>);
	GRABBED;
	UNAVALIABLE(x:Cooldown);
}
