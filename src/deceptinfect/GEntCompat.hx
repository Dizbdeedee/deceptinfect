package deceptinfect;
import gmod.EntityClass.HaxeGeneratedEntity;
import deceptinfect.ecswip.Component;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.ecswip.ComponentManager;
import gmod.types.Entity;
@:forward
abstract GEntCompat(Entity) from Entity to Entity from HaxeGeneratedEntity<Dynamic,Entity> {

    public var id(get,never):DI_ID;

    @:noCompletion
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

    public inline function get<T:Component>(x:Class<T>):ComponentState<T> {
        return id.get(x);
    }

    public function infectedPlayer():Option<PlayerComponent> {
        return switch(has_id()) {
            case Some(id):
                switch [id.get(PlayerComponent),id.get(InfectedComponent)] {
                    case [Comp(p),Comp(_)]:
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
                switch id.get(PlayerComponent) {
                    case Comp(p):
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

    @:noCompletion
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

    public inline function has_id_2():Bool {
        return switch (id) {
            case null:
                false;
            case x:
                true;
        }
    }
    public inline function get<T:Component>(x:Class<T>):ComponentState<T> {
        return id.get(x);
    }

    // public inline function add_component<T:Component>(x:Class<T>):ComponentState<T> {
    //     return 
    // }

    public inline function isInfected():Bool {
        return id.get(InfectedComponent).equals(Comp(null));
    }

    public inline function new(x:PlayerComponent) {
        this = x.player;
        untyped x.player.id = ComponentManager.addPlayer(this);
    }
}