package deceptinfect.game;

import deceptinfect.ecswip.ReplicatedComponent;

class GeigerCounter extends ReplicatedComponent {

    @:s var geiger:Float = 0.0;


    public function new() {
        super();
        #if server
        replicated = SOME(CURRENT_PLAYER);
        #end
    }
}