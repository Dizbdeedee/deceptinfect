package deceptinfect;
import deceptinfect.Infected.GrabbableComponent;
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

    public var infectedPlayer:InfectedAbilitiesState;

    public var hiddenHealth:Float;
    public var grab:GrabbableComponent;

    public function new(p:Player) {
        
        
        gPlayer = p;
    }

    public function spectateNextPlayer() {
        
    }

    public function initGame() {
        switch (Game.currentGame) {
            case AVALIABLE(game):
                var rate = new RateHandler(infection);
                var radhandler = new RadiationRateHandler(rate);
                infection = new Infection();
                infection.baseInfection = game.baseInfection;
            default:
                throw "Attempt to init game when no game avaliable!";
        }
        
    }

    #if server
    public function chooseSpectateTarget(spec:Spectate,dir:SpectateDir) {
        
        var iter = switch (dir) {
            case FORWARD:
                1;
            case BACKWARD:
                -1;
        }
        var specNext = spec.current + iter;
        var specCurrent = spec.current;
        var players = PlayerLib.GetAll();
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

    public function think() {
        
    }

    
    #end
}

enum InfectedAbilitiesState {
    NOT_INFECTED;
    INFECTED(x:InfectedPlayer);

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

