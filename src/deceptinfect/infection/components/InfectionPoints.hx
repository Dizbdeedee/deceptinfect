package deceptinfect.infection.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:repliacted(SOME(CURRENT_PLAYER))
class InfectionPoints extends ReplicatedComponent {

    var points:Int = 0;
}