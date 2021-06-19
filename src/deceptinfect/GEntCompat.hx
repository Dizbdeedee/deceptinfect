package deceptinfect;

import deceptinfect.ecswip.Component;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;

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
		untyped x.id = ComponentManager.addGEnt(this);
	}
}

@:forward
@:using(deceptinfect.macros.ClassToID.GPlayerCompat_Use)
abstract GPlayerCompat(Player) from Player to Player {
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

	public inline function has_id_2():Bool {
		return switch (id) {
			case null:
				false;
			case x:
				true;
		}
	}

	// public inline function get<T:Component>(x:Class<T>):ComponentState<T> {
	//     return id.get(x);
	// }
	// public inline function add_component<T:Component>(x:Class<T>):ComponentState<T> {
	//     return
	// }
	// public inline function isInfected():Bool {
	//     return id.get(InfectedComponent).equals(Comp(null));
	// }

	public inline function new(x:PlayerComponent) {
		this = x.player;
		untyped x.player.id = ComponentManager.addPlayer(this);
	}
}
