package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.ecswip.ClientRepresentationTarget;

class CRTSystem extends System {
    #if server
    override function init_server() {
        ComponentManager.addSignal.handle((data) -> {
            if (data.comp is ReplicatedComponent && data.ent.has_comp(ClientRepresentationTarget)) {
                final crt = data.ent.get_2(ClientRepresentationTarget);
                final replComp = cast data.comp;
                replComp.replicated = MASTER(crt);
                trace("master repl set");
            }
        });
        ClientRepresentationTarget.getAddSignal().handle((data) -> {
            for (component in ComponentManager.components_3) {
                if (component.has_component(data.ent)) {
                    final comp = component.get_component(data.ent);
                    if (comp is ReplicatedComponent) {
                        final replComp:ReplicatedComponent = comp;
                        replComp.replicated = MASTER(data.comp);
                        trace("master repl set 2");
                    }
                }
            }
        });
    }
    #end
}