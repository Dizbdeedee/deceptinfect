package deceptinfect.game.components;

import deceptinfect.game.WinSystem.Win;
import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(ALL)
class WinGame extends ReplicatedComponent {

    @:s var win:Win;

    public function new(win:Win) {
        super();
        this.win = win;
    }
}