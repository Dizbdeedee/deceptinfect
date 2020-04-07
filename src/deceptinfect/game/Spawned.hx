package deceptinfect.game;

import deceptinfect.game.SpawnSystem.Spawn;

class Spawned extends Component {

    var spawn:Spawn;

    public function new(sp:Spawn) {
        super();
        spawn = sp;
    }
}