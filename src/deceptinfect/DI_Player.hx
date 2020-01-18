package deceptinfect;
import haxe.display.Display.GotoTypeDefinitionResult;
import gmod.safety.InvalidObject;
import deceptinfect.InfectionComponent;
import gmod.types.Player;
using gmod.safety.Safety;

@:forward
abstract DI_Player(_DI_Player) {

    public function new(p:Player) {
        var di_ply = new _DI_Player(p);
        untyped p._DI_Player = di_ply;
        this = di_ply;
    }

    @:from
    public static inline function fromPlayer(p:Player):DI_Player {
        return untyped p._DI_Player;
    }

    @:to
    public inline function toPlayer():Player {
        #if disafety
        return this.gPlayer.sure();
        #else
        return this.gPlayer;
        #end

    }


}

private class _DI_Player {

    public var gPlayer(default,null):Player;

    public var infection:InfectionComponent;


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