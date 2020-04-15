package deceptinfect.game;

import deceptinfect.statuses.Contaminated;

class ContaminateWarnSystem extends System {

    #if server
    override function init_server() {
        
        ComponentManager.getCreateSignal(Contaminated).handle(newContam);
    }

    function newContam(x:SCompAddSignal<Contaminated>) {
        
    }
    override function run_server() {
    }
    #end
}