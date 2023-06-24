package deceptinfect;

import deceptinfect.ecswip.Component;
import deceptinfect.infection.components.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.ents.EntSetup;

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
        var setup:EntSetup = HookLib.Run("di_setupgentcompat",this);
        var systemManager = setup.systemManager;
        var componentManager = setup.componentManager;
        untyped x.id = componentManager.addGEnt(this);
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
        return switch (untyped this.id) {
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

    public inline function new(x:PlayerComponent) {
        this = x.player;
        var setup:EntSetup = HookLib.Run("di_setupgplayercompat",this);
        var systemManager = setup.systemManager;
        var componentManager = setup.componentManager;
        untyped x.player.id = componentManager.addPlayer(this);
        untyped (cast this.id : DI_ID).add_component(new deceptinfect.ecswip.ReplicatedEntity());
    }
}
