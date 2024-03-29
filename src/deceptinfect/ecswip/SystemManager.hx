package deceptinfect.ecswip;

import haxe.ds.ObjectMap;

// need to keep the old interface :(
interface SystemManager {
	function get<T:System>(cls:Class<T>):T;
	function getSystem<T:System>(cls:Class<T>):Null<T>;
	function runAllSystems():Void;
	function initAllSystems():Void;
	function destroySystems():Void;
}

class SystemManagerDef implements SystemManager {
	var getSystems:ObjectMap<Class<Dynamic>, System> = new ObjectMap();

	var makeSystems:(systemManager:SystemManager) -> haxe.ds.ObjectMap<Class<Dynamic>, System>;

	var runSystems(default, null):Array<Class<Dynamic>>;

	var initSystems(default, null):Array<Class<Dynamic>>;

	public function new(_initSystems:Array<Class<Dynamic>>, _runSystems:Array<Class<Dynamic>>,
			_makeSystems:(systemManager:SystemManager) -> haxe.ds.ObjectMap<Class<Dynamic>, System>) {
		initSystems = _initSystems;
		runSystems = _runSystems;
		makeSystems = _makeSystems;
		getSystems = makeSystems(this);
	}

	public function getSystem<T:System>(cls:Class<T>):T {
		return cast getSystems.get(cls);
	}

	public function get<T:System>(cls:Class<T>):T {
		return cast getSystems.get(cls);
	}

	// request -- Some() None

	@:expose("getSystem")
	@:noCompletion
	static function getSystemExt(name:String) {
		throw "Hmmm, implement this";
		// final result = getSystems.get(Type.resolveClass(name));
		// return if (result == null) {
		//     throw 'getSystemExt: Can\'t find $name';
		// } else {
		//     result;
		// }
	}

	static var profile:Profiler = new Profiler();

	public function runAllSystems() {
		profile.profile("start", true);
		for (clsSystem in runSystems) {
			final name = Type.getClassName(clsSystem);
			profile.profile(name);
			getSystems.get(clsSystem)
				.run();
		}
		profile.resetprofile();
		profile.report();
	}

	@:expose("systemReport")
	public static function beginReporting() {
		profile = new Profiler();
		profile.beginProfiling();
	}

	public function initAllSystems() {
		trace("INIT ALL SYSTEMS");
		var systemsInit = 0;
		for (clsSystem in initSystems) {
			trace('SYSTEM ${systemsInit++} $clsSystem');
			getSystems.get(clsSystem)
				.init();
		}
		trace('FINISH ${systemsInit}');
	}

	public function destroySystems() {
		getSystems.clear();
		getSystems = makeSystems(this);
	}
}
