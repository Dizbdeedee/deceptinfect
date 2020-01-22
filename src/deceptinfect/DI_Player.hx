package deceptinfect;
import deceptinfect.Infected.GrabbableComponent;
import haxe.display.Display.GotoTypeDefinitionResult;
import gmod.safety.InvalidObject;
import deceptinfect.InfectionComponent;
import gmod.types.Player;
using gmod.safety.Safety;

@:forward
abstract DI_Player(_DI_Player) from _DI_Player to _DI_Player {

    public inline function new(p:Player) {
        this = p.annex.get(_DI_Player);
    }

    @:from
    public static inline function fromPlayer(p:Player):DI_Player {
        return new DI_Player(p);
    }

    @:to
    public inline function toPlayer():Player {
        return this.gPlayer;

    }


}

private class _DI_Player {

    public var gPlayer(default,null):Player;

    public var infection:InfectionComponent;

    public var infectedPlayer:InfectedPlayer;

    public var grab:GrabbableComponent;

    public function new(p:Player) {
        gPlayer = p;
    }

    public function spectateNextPlayer() {
        
    }

     

    public function chooseSpectateTarget(spec:Spectate,dir:SpectateDir) {
        
        var iter = switch (dir) {
            case FORWARD:
                1;
            case BACKWARD:
                -1;
        }
        var specNext = spec.current + iter;
        var specCurrent = spec.current;
        var players = Game.currentGame.players;
        while (specNext != specCurrent) {
            var target:Player = players[specNext];
            switch (target.valid()) {
                case VALID(_.Alive() => true):
                    gPlayer.SpectateEntity(target);
                    gPlayer.SetObserverMode(OBS_MODE_CHASE);
                default:
                    
                    
            }
        }

    }

}

// class 

enum SpectateDir {
    FORWARD;
    BACKWARD;
}

enum SpectateState {
    NOT_SPECTATING;
    FREE_ROAM;
    TARGET_PLAYER(p:Player);
    TARGET_ENTITY(e:Entity);
}



typedef Spectate = {
    state : SpectateState,
    current : Int,
}

