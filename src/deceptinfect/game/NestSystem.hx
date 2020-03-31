package deceptinfect.game;

class NestSystem extends System {
    #if server
    override function run_server() {
        for (ent in entities) {
            switch ent.get(NestComponent) {
            case Comp(c_nest):
            default:
            }
        }
    }
    #end
}