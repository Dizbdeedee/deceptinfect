package deceptinfect.ecswip;

class GEntityComponent extends Component {
	@:s public var entity:deceptinfect.hxbit.NEntity;

	public function new(e:Entity) {
		super();
		entity = e;
	}

	override function get_componentLifetime():ComponentLifetime {
		return NEVER_DELETE;
	}
}
