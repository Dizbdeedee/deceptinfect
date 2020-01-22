package deceptinfect;

import deceptinfect.DI_Player;
@:forward
abstract InfectedPlayer(DI_Player) to DI_Player {

    @:from
    static function toInfected(p:DI_Player):InfectedPlayer {
        return null;
        switch (p.infection.infection) {
            case INFECTED:

            default:
                throw ("Attempt to use non infected player as infected!");
        }        
    }


}

// class InfectedPlayer {

// }