package deceptinfect.ecswip;

using Safety;
@:using(deceptinfect.ecswip.System.System_Use)
class System {
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

	public function new() {}

	public final function init() {
		#if client
		init_client();
		#elseif server
		init_server();
		#end
		init_shared();
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

class System_Use {
	public static inline function get<T:System>(x:Class<T>) {
		return SystemManager.getSystem(x).sure();
	}

	
}