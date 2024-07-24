package deceptinfect.ecswip.compat;

import deceptinfect.ents.EntSetup;

//ecswip...
@:forward
@:using(deceptinfect.macros.ClassToID.GEntCompat_Use)
abstract GEntCompat(Entity) from Entity to Entity {
	public var id(get, never):DI_ID;

	@:noCompletion
	public inline function get_id() {
		return untyped this.id;
	}

	public inline function has_id():Option<DI_ID> {
		return switch (id) {
			case null:
				None;
			case x:
				Some(x);
		}
	}

	public inline function new(x:Entity) {
		this = x;
		var setup:EntSetup = HookLib.Run("di_setupgentcompat", this);
		var systemManager = setup.systemManager;
		var componentManager = setup.componentManager;
		untyped x.id = componentManager.addGEnt(this);
	}
}