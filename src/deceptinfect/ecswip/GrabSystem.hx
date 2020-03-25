package deceptinfect.ecswip;

class GrabSystem extends System {

    #if server
    override function run_server() {
        for (e in ComponentManager.entities) {
            switch e.get(GrabProducer) {
            case Comp(x):
            default:
            }

        }
    }
    #end
}