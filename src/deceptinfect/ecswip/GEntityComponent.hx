package deceptinfect.ecswip;

class GEntityComponent extends Component {
	@:s public var entity:deceptinfect.hxbit.NEntity;

	public function new(e:Entity) {
		super();
		entity = e;
	}
}
