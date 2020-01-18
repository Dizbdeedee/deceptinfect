package deceptinfect;

using gmod.PairTools;
class Game {
    
    
    public var numPlayers = 0;
    public var players(default,null):Array<DI_Player> = [];
    public var queen:DI_Player;
    /**
        Maximum amount of time until everyone's infected
    **/
    public var gameTime:Float;
    public static var currentGame:Game;
    public var lastTick = 0.0;
    public var baseInfection:Float;

    

    @:expose
    static public function startGame(){
        var game = new Game();
        currentGame = game;
        game.start();
    }


    public function new() {

    }

    public function addPlayers() {
        for (player in PlayerLib.GetAll()) {
            players.push(player);
        }
    }

    public function start() {

    }

    public function calcBaseInfection():Float {
        var difftime = GlobalLib.CurTime() - lastTick;
        var baseInf = (100 / gameTime) * difftime;
        return baseInf;
    }

    
    
}

