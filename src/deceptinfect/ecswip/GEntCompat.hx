package deceptinfect.ecswip;
import deceptinfect.ecswip.ComponentManager;

@:forward
abstract GEntCompat(Entity) to Entity {

    public var id(get,never):DI_ID;

    public inline function get_id() {
        return untyped this.id;
    }

    public inline function new(x:Entity) {
        this = x;
        untyped x.id = ComponentManager.addEnt(this);
    } 
}
