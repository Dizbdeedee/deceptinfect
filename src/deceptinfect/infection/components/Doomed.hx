package deceptinfect.infection.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(SPECTATORS))
class Doomed extends ReplicatedComponent {
    @:s var doomTime:Float;

    public function new(doomTime:Float) {
        super();
        this.doomTime = doomTime;
    }
}