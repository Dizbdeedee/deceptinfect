package deceptinfect.ecswip;

using Safety;
@:autoBuild(deceptinfect.macros.SystemMacro.build())
class System {

	var onInit:Signal<Noise> = new SignalTrigger().asSignal();

	final systemManager:SystemManager;

	final componentManager:ComponentManager;

	#if client
	function init_client() {}

	function run_client():Void {}
	#end

	#if server
	function init_server() {}

	function run_server():Void {}
	#end

	function init_shared() {}

	function run_shared() {}

	public function new(_componentManager:ComponentManager,_systemManager:SystemManager) {
		systemManager = _systemManager;
		componentManager = _componentManager;
	}

	public final function init() {
		#if client
		init_client();
		#elseif server
		init_server();
		#end
		init_shared();
		(cast onInit : SignalTrigger<Noise>).trigger(Noise);
	}

	public final function run() {
		#if client
		run_client();
		#elseif server
		run_server();
		#end
		run_shared();
	}

}
