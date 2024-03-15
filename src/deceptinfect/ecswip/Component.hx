package deceptinfect.ecswip;

// import hxbit.NetworkSerializable;

@:publicFields
@:autoBuild(deceptinfect.macros.ComponentMacro.build())
@:keepSub
@:using(deceptinfect.macros.ClassToID.Component_Use)
@:using(deceptinfect.ecswip.Component.ComponentTools)
abstract class Component {
	public function new() {}

	abstract function getCompID():Int;

	public function getName() {
		return Type.getClassName(Type.getClass(this));
	}

	var componentLifetime(get, never):ComponentLifetime;

	function get_componentLifetime():ComponentLifetime {
		return ROUND;
	}
}

class ComponentTools {
	public static function sure<T:Component>(x:ComponentState<T>):T {
		return switch (x) {
			case Comp(comp):
				comp;
			default:
				throw "Component not avaliable...";
		}
	}
}

@:using(deceptinfect.ecswip.Component.ComponentTools)
enum ComponentState<T:Component> {
	NONE; // i'm going to shove my own pasts head down the toilet
	Comp(comp:T);
}

enum ComponentLifetime {
	NEVER_DELETE;
	GAME;
	ROUND;
}
