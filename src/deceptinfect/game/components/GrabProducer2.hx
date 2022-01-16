package deceptinfect.game.components;

import deceptinfect.abilities.FormComponent.Cooldown;

class GrabProducer2 extends Component {

    var producerState:GrabProduceState = READY(NOT_SEARCHING);

    var nextCooldown:Float = 5;

    var grabDist:Float = 70;

}

enum SearchingState {
	NOT_SEARCHING;
	SEARCHING;
	TARGET(vic:DI_ID);
}

enum GrabProduceState {
	READY(search:SearchingState);
	GRABBING(victim:DI_ID);
	NOT_READY(x:Cooldown);
}