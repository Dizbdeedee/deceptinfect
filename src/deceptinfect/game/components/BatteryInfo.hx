package deceptinfect.game.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(ALL)
class BatteryInfo extends ReplicatedComponent {

	@:s var charge:Float = .0;

}