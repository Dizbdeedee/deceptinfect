package deceptinfect.ecswip;

class VirtualPosition extends Component {
	@:isVar
	public var pos(get, set):Null<deceptinfect.hxbit.NVector>;
	@:isVar
	public var ang(get, set):Null<Angle>;
	@:noCompletion
	public var ent(default, null):Null<Entity>;

	@:noCompletion
	public function get_pos() {
		if (ent == null) {
			return pos;
		} else {
			return ent.GetPos();
		}
	}

	@:noCompletion
	public function get_ang() {
		if (ent == null) {
			return ang;
		} else {
			return ent.GetAngles();
		}
	}

	@:noCompletion
	public function set_pos(set:deceptinfect.hxbit.NVector):deceptinfect.hxbit.NVector {
		if (ent == null) {
			return pos = set;
		} else {
			ent.SetPos(set);
			return set;
		}
	}

	@:noCompletion
	public function set_ang(set:Angle):Angle {
		if (ent == null) {
			return ang = set;
		} else {
			ent.SetAngles(set);
			return set;
		}
	}

	public function new(choice:ChooseVirPos) {
		super();
		switch (choice) {
			case ENT(x):
				ent = x;
			case REAL(vec, ang):
				this.pos = vec;
				this.ang = ang;
		}
	}

	override function get_componentLifetime():ComponentLifetime {
		return NEVER_DELETE;
	}
}

enum ChooseVirPos {
	ENT(x:Entity);
	REAL(vec:Vector, ang:Angle);
}
