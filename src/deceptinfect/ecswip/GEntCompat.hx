package deceptinfect.ecswip;
import deceptinfect.ecswip.ComponentManager;

@:forward
abstract GEntCompat(Entity) from Entity to Entity {

    public var id(get,never):DI_ID;

    public inline function get_id() {
        return untyped this.id;
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

    public inline function new(x:PlayerComponent) {
        this = x.player;
        untyped x.id = ComponentManager.addPlayer(x);
    }
}