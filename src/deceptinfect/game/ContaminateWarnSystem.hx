package deceptinfect.game;

import deceptinfect.statuses.Contaminated;

class ContaminateWarnSystem extends System {
	public static final net_contaminateWarn = new deceptinfect.net.NET_Server<"di_contaminatewarn", {}>();

	#if server
	override function init_server() {
		ComponentManager.getCreateSignal(Contaminated.compID).handle(newContam);
	}

	function newContam(x:CompAddSignal<Contaminated>) {
		TimerLib.Simple(5, () -> {});
	}

	// override function run_server() {
	// }
	#end
}
