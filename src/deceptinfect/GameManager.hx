package deceptinfect;
import deceptinfect.Networking.N_GameState;
import deceptinfect.ecswip.PlayerComponent;
import gmod.engine_ents.Game_end;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.ecswip.GrabAccepter;
import deceptinfect.ecswip.HiddenHealthComponent;
import deceptinfect.ecswip.RateComponent;
import deceptinfect.ecswip.SpectateComponent;
import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.GEntCompat;
import deceptinfect.GameInstance;

class GameManager {


    public static var state(default,#if server set #else null #end):GAME_STATE = WAIT;
    public static var Game:GameInstance;


    public static function sure():GameInstance {
        return switch (state) {
            case SETTING_UP(x) | PLAYING(x) | ENDING(x):
                x;
            case WAIT:
                throw "Game not avaliable at sure statement!";
        }
    }
    
    #if server
    public static function thinkWait() {
        if (PlayerLib.GetCount() > GameValues.MIN_PLAYERS) {
            initAllPlayers();
        }
    }

    static function set_state(x:GAME_STATE):GAME_STATE {
        for (p in PlayerLib.GetAll()) {
            Networking.sendGameState({
                state : x, 
            },p);
        }
        trace("set state...");
        return state = x;
    }

    public static function initAllPlayers() {
        for (player in PlayerLib.GetAll()) {
            var ent = new GPlayerCompat(new PlayerComponent(player));
            var p = ent.id;
            var infcomp = new InfectionComponent();
            var spec = new SpectateComponent();
            var rate = new RateComponent();
            var health = new HiddenHealthComponent();
            var grabaccept = new GrabAccepter();
            var radaccept = new RadiationAccepter();
            
            p.add_component(infcomp);
            p.add_component(spec);
            p.add_component(rate);
            p.add_component(health);
            p.add_component(grabaccept);
            p.add_component(radaccept);

        }
    }


    @:expose("startGame")
    public static function startGame() {
        initAllPlayers();
        var game = new GameInstance();
        state = PLAYING(game);
    }

    #end
    #if client
    public static function init() {
        Networking.GameStateSignal.handle(gameStateChanged);
    }
    
    static function gameStateChanged(x:N_GameState) {
        trace('game state changed $x');
        switch (x.state) {
            case WAIT:
            case SETTING_UP:
                state = SETTING_UP(new GameInstance());
            case ENDING:
                
            case PLAYING:
                state = PLAYING(new GameInstance());
        }
    }
    #end
}
enum GAME_STATE {
    WAIT;
    SETTING_UP(x:GameInstance);
    PLAYING(x:GameInstance);
    ENDING(x:GameInstance);
}

enum abstract Net_GAME_STATE_VAL(Int) to Int from Int {
    var WAIT = 0;
    var SETTING_UP = 1;
    var PLAYING = 2;
    var ENDING = 3;

    @:from
    public static function fromGAME_STATE(x:GAME_STATE) {
        return switch (x) {
            case GAME_STATE.WAIT:
                WAIT;
            case GAME_STATE.SETTING_UP(_):
                SETTING_UP;
            case GAME_STATE.PLAYING(_):
                PLAYING;
            case GAME_STATE.ENDING(_):
                ENDING;
        }
    }
}