package deceptinfect.ecswip;

class GrabSystem extends System {

    #if server
    override function run_server() {
        for (produce in ComponentManager.entities) {
            switch produce.get(GrabProducer) {
            case Comp(c_grabProduce):
                for (accept in ComponentManager.entities) {
                    switch (accept.get(GrabAccepter)) {
                    case Comp(c_grabAccept):

                    default:
                    }

                }
            default:
            }

        }
    }
    #end
}