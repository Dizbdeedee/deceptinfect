package deceptinfect;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.radiation.RadiationProducer;
import deceptinfect.ecswip.GrabProducer;
import deceptinfect.ecswip.InfectedComponent;
import deceptinfect.Networking.N_GameState;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.radiation.ContaminationAccepter;
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
    static var Game:GameInstance;

    public static function shouldAllowRespawn() {
        return switch (state) {
            case WAIT:
                true;
            default:
                false;
        }
    }
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

    public static function startWait() {
        for (player in PlayerManager.getPlayers()) {
            player.KillSilent();
            
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

    public static function initPlayer(x:Player) {
        var ent = new GPlayerCompat(new PlayerComponent(x));
        var p = ent.id;
        var infcomp = new InfectionComponent();
        var spec = new SpectateComponent();
        var rate = new RateComponent();
        var health = new HiddenHealthComponent();
        var grabaccept = new GrabAccepter();
        var radaccept = new RadiationAccepter({contaminate: new ContaminationAccepter()});
        var virpos = new VirtualPosition(x);
        p.add_component(infcomp);
        p.add_component(spec);
        p.add_component(rate);
        p.add_component(health);
        p.add_component(grabaccept);
        p.add_component(radaccept);
        p.add_component(virpos);
    }

    public static function initInfectedPlayer(x:DI_ID) {
        x.add_component(new InfectedComponent());
        x.add_component(new GrabProducer());
        x.add_component(new HiddenHealthComponent());
        var rad = RadiationProducer.createFromType(INF);
        rad.state = DISABLED;
        x.add_component(rad);
    }
    public static function initAllPlayers() {
        for (player in PlayerLib.GetAll()) {
            initPlayer(player);
        }
    }


    @:expose("startGame")
    public static function startGame() {
        initAllPlayers();
        var game = new GameInstance();
        state = PLAYING(game);
        game.start();
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