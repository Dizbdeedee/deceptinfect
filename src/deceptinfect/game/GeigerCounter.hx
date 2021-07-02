package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(CURRENT_PLAYER))
class GeigerCounter extends ReplicatedComponent {

    @:s var geiger:Float = 0.0;

}