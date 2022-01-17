package deceptinfect.game.components;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.hxbit.NVector;


@:replicated(SOME(INFECTED))
class NestPos extends ReplicatedComponent {

    @:s var pos:NVector;

    public function new(pos:Vector) {
        super();
        this.pos = pos;
    }
    
}