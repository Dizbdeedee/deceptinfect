package deceptinfect.ecswip;

class GEntityComponent extends ReplicatedComponent {
	@:s public var entity:deceptinfect.hxbit.NEntity;

	public function new(e:Entity) {
		super();
		entity = e;
	}
}
