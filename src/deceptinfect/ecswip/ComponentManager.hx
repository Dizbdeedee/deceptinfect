package deceptinfect.ecswip;
import deceptinfect.ecswip.Component;
import deceptinfect.ecswip.MyFirstComponent;
class ComponentManager {


    public static var entities:Array<DI_Entity> = [];
    

    public static function addEnt(x:DI_Entity) {
        entities.push(x);
    }

    @:expose("gameLoop")
    public static function gameLoop2() {
        for (entity in entities) {
            if (entity.has_component(MyFirstComponent) && entity.has_component(MyOtherComponent)) {
                trace('x:${entity.components.getComponent(MyFirstComponent).x}y:${entity.components.getComponent(MyOtherComponent)}');
            } else {
                throw "missing component...";
            }
            
        }
    }
}