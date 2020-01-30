package deceptinfect;

import deceptinfect.Radiation.RadiationTarget;
import tink.CoreApi.Noise;
import deceptinfect.Infected.GrabbableComponent;
import gmod.safety.InvalidObject;
import deceptinfect.InfectionComponent;
import gmod.types.Player;
using gmod.safety.Safety;
import deceptinfect.GameEntity;

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

private class _DI_Player implements RadiationTarget {

    public var gPlayer(default,null):Player;

    public var infection:InfectionComponent;
    public var pos(get,set):Vector;
    public var index(get,never):EntityID;
    public var infectedPlayer:InfectedAbilitiesState = NOT_INFECTED;
    public var radhandler:ComponentState<RadiationRateHandler>;
    public var rate:RateHandler;
    public var hiddenHealth:Float;
    public var grab:GrabbableComponent;

    public function new(p:Player) {
        gPlayer = p;
        
    }

    public function spectateNextPlayer() {
        
    }

    public function get_pos():Vector {
        return gPlayer.GetPos();
    }

    public function get_index():EntityID {
        return gPlayer.EntIndex();
    }

    public function set_pos(v:Vector):Vector {
        gPlayer.SetPos(v);
        return v;
    }

    public function initGame() {
        
        switch (Game.currentGame) {
            case AVALIABLE(game):
                rate = new RateHandler(infection);
                radhandler = COMPONENT(new RadiationRateHandler(rate,this));
                infection = new Infection();
                infection.onInfected.handle(onInfected);
                infection.baseInfection = game.baseInfection;
            default:
                trace("Attempt to init game when no game avaliable!");
        }
        
    }

    public function onInfected(x:Noise) {
        infectedPlayer = INFECTED(new InfectedPlayer(this));
        
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

