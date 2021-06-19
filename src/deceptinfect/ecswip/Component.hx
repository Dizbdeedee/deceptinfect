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

	function onRemove() {}
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

	public static inline function getOwner(x:Component):DI_ID {
		return ComponentManager.getIDFromComponent(x);
	}
}

@:using(deceptinfect.ecswip.Component.ComponentTools)
enum ComponentState<T:Component> {
	NONE;
	Comp(comp:T);
}

