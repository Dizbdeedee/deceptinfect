package deceptinfect.game;

import deceptinfect.util.Cooldown;

class Ragdoll extends Component {

    // var owner:DI_ID;

    var reveal:RagdollReveal = NO_REVEAL;
    var owner:DI_ID;

    // public function new(owner:DI_ID) {
    //     super();
    //     this.owner = owner;
    // }
}

enum RagdollReveal {
    WAIT(time:Ref<Float>);
    REVEAL;

    NO_REVEAL;
}