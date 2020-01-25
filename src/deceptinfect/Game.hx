package deceptinfect;

using gmod.PairTools;
using tink.CoreApi;
/**
    Contains instance of running game. Not active when waiting for players.
**/
class Game {
    
    
    public static var currentGame:GAME;
    
    public var state:
    public var numPlayers = 0;
    public var players(default,null):Array<DI_Player> = [];
    public var queen:DI_Player;
    /**
        Maximum amount of time until everyone's infected
    **/
    public var gameTime:Float;
    
    public var lastTick:Float = null;
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


    public function new() {

    }

    public function getDiffTime() {
        return GlobalLib.CurTime() - lastTick;
    }

    public function think() {
        if (lastTick == null) {
            lastTick = GlobalLib.CurTime();   
        }
        baseInfection.value = calcBaseInfection();
        
        lastTick = GlobalLib.CurTime(); //NOTE should be last thing ran
    }

    public function addPlayers() {
        for (player in PlayerLib.GetAll()) {
            players.push(player);
        }
    }

    public function calcBaseInfection():Float {
        var difftime = GlobalLib.CurTime() - lastTick;
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
    PLAYING(playState:PLAYING_STATE)
}

enum PLAYING_STATE {
    NORMAL;
    EVAC;
}