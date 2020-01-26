package deceptinfect;

import deceptinfect.Radiation.RadiationManager;
using gmod.PairTools;
using tink.CoreApi;
/**
    Contains instance of running game. Not active when waiting for players.
**/
class Game {
    
    
    public static var currentGame:GAME;
    
    public var state(default,null):GAME_STATE = WAIT;
    public var numPlayers = 0;
    public var players(default,null):Array<DI_Player> = [];
    public var queen:DI_Player;
    /**
        Maximum amount of time until everyone's infected
    **/
    public var gameTime:Float;
    public var radiationManager:RadiationManager = new RadiationManager();
    
    public var difftime(default,null):Float;

    var gameStartedTrigger:SignalTrigger<Noise> = new SignalTrigger();
    public var gameStarted(default,null):Signal<Noise>;

    
    
    public var lastTick:Null<Float> = null;
    public var baseInfection:Ref<Float>;

    public static function sure():Game {
        switch (currentGame) {
            case AVALIABLE(x):
                return x;
            default:
                throw ("Game not avaliable at sure statement!");
        }
    }

    @:expose
    static public function startGame(){
        var game = AVALIABLE(new Game());
        currentGame = game;
        
    }


    function new() {
        gameStarted = gameStartedTrigger.asSignal();
    }

    public function getDiffTime() {
        return GlobalLib.CurTime() - lastTick;
    }

    public function think() {
        if (lastTick == null) {
            lastTick = GlobalLib.CurTime();
        }
        difftime = GlobalLib.CurTime() - lastTick;
        baseInfection.value = calcBaseInfection();
        
        lastTick = GlobalLib.CurTime(); //NOTE should be last thing ran
    }

    

    public function addPlayers() {
        for (player in PlayerLib.GetAll()) {
            players.push(player);
        }
    }

    public function calcBaseInfection():Float {
        var baseInf = (100 / gameTime) * difftime;
        return baseInf;
    }

    
    
}

// class GAMETOOLS {
    
//     public static function sure2(x:GAME):Game {
//         switch (x) {
//             case AVALIABLE(x):
//                 return x;
//             default:
//                 throw ("Game not avaliable at sure statement!");
//         }
//     }
//     public static function sure(x:Class<Game>):Game {
        
//     }
// }

// @:using(deceptinfect.Game.GAMETOOLS)

enum GAME {
    NOT_AVALIABLE;
    /**
        Game instance avaliable
    **/
    AVALIABLE(x:Game);
}

enum GAME_STATE {
    WAIT;
    PLAYING(playState:PLAYING_STATE);
}

enum PLAYING_STATE {
    NORMAL;
    EVAC;
}