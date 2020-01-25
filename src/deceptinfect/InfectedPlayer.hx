package deceptinfect;

import deceptinfect.DI_Player;

@:forward
abstract InfectedPlayer(_InfectedPlayer) {

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
    
    var grab:Grab
    function new(x:DI_Player) {

    }
}