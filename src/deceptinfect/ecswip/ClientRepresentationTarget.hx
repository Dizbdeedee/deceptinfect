package deceptinfect.ecswip;

import deceptinfect.hxbit.NPlayer;
import deceptinfect.ecswip.ReplicatedComponent.ReplicatedTarget;
import deceptinfect.hxbit.NEntity;


class ClientRepresentationTarget extends ReplicatedComponent {

    @:s var target:DI_ID;

    public function new(repl:ReplicatedTarget,target:DI_ID) {
        super();
        #if server
        replicated = repl;
        #end
        this.target = target;
    }
}
