package deceptinfect.game;

import deceptinfect.GameManager.GAME_STATE;

class SlowMotionSystem extends System {

    #if server

    var slowMotion:SlowMotionState = INACTIVE;  
    override function init_server() {
        GameManager.stateChange.handle(stateChange);
    }

    function stateChange(x:GAME_STATE) {
        switch (x) {
        case ENDING(_, _):
        default:
        }
    }
    #end
}

enum SlowMotionState {
    ACTIVE();
    INACTIVE;
}