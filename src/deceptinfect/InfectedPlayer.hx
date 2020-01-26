package deceptinfect;

import deceptinfect.DI_Player;

@:forward
abstract InfectedPlayer(_InfectedPlayer) {

    public function new(x:DI_Player) {
        this = new _InfectedPlayer(x);
    }
    
    @:from
    static function toInfected(p:DI_Player):InfectedPlayer {
        return switch (p.infectedPlayer) {
            case INFECTED(infplayer):
                infplayer;
            case NOT_INFECTED:
                throw "Attempt to use non infected as infected!";
        }        
    }


}

private class _InfectedPlayer {
    
    
    public function new(x:DI_Player) {

    }
}