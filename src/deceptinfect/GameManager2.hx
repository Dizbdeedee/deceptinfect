package deceptinfect;

import deceptinfect.GameManager.GAME_STATE;
import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(ALL)
class GameManager2 extends ReplicatedComponent {

    @:s var state:GAME_STATE_2 = WAIT;

    var stateChanged:Signal<GAME_STATE_2>;

    var diffTime:Float = null;

    var lastTick:Float = 0.0;

}

enum GAME_STATE_2 {
    WAIT;
    SETTING_UP(time:Float);
    PLAYING;//no
    ENDING(time:Float);
}