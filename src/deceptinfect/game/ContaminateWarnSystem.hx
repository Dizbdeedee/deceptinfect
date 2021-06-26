package deceptinfect.game;

import deceptinfect.statuses.Contaminated;

class ContaminateWarnSystem extends System {

	
	#if server
	override function init_server() {
	}

	function newContam(x:CompAddSignal<Contaminated>) {
	}

	// override function run_server() {
	// }
	#end
}
