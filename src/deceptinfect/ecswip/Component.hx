package deceptinfect.ecswip;

// import hxbit.NetworkSerializable;

@:publicFields
@:autoBuild(deceptinfect.macros.ComponentMacro.build())
@:keepSub
class Component {
	public function new() {}

	@:s var serverID:DI_ID;

	function onRemove() {}
}
