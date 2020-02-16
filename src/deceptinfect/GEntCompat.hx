package deceptinfect;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import gmod.types.Entity;
@:forward
abstract GEntCompat(Entity) from Entity to Entity {

    public var id(get,never):DI_ID;

    public inline function get_id() {
        return untyped this.id;
    }

    public inline function has_id():Option<DI_ID> {
        return switch(id) {
            case null:
                None;
            case x:
                Some(x);
        }
    }

    public inline function get_component<T:Component>(x:Class<T>):ComponentState<T> {
        return id.get_component(x);
    }

    public function infectedPlayer():Option<PlayerComponent> {
        return switch(has_id()) {
            case Some(id):
                switch [id.get_component(PlayerComponent),id.get_component(InfectedComponent)] {
                    case [COMPONENT(p),COMPONENT(_)]:
                        Some(p);
                    default:
                        None;
                };
            default:
                None;
        };
    }

    public inline function isPlayer():Option<PlayerComponent> {
        return switch(has_id()) {
            case Some(id):
                switch id.get_component(PlayerComponent) {
                    case COMPONENT(p):
                        Some(p);
                    default:
                        None;
                }
            default:
                None;
        }
    }

    public inline function new(x:Entity) {
        this = x;
        untyped x.id = ComponentManager.addGEnt(this);
    } 
}
@:forward
abstract GPlayerCompat(Player) from Player to Player {

    public var id(get,never):DI_ID;

    public inline function get_id() {
        return untyped this.id;
    }

    
    public inline function get_component<T:Component>(x:Class<T>):ComponentState<T> {
        return id.get_component(x);
    }

    public inline function isInfected():Bool {
        return id.get_component(InfectedComponent).equals(COMPONENT(null));
    }

    public inline function new(x:PlayerComponent) {
        this = x.player;
        untyped x.id = ComponentManager.addPlayer(x);
    }
}