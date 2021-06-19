package deceptinfect.ecswip;

// import hxbit.NetworkSerializable;

@:publicFields
@:autoBuild(deceptinfect.macros.ComponentMacro.build())
@:keepSub
@:using(deceptinfect.macros.ClassToID.Component_Use)
abstract class Component {
	public function new() {
	}

	abstract function getCompID():Int;

	function onRemove() {}
}
