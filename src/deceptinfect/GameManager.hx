package deceptinfect;
import deceptinfect.infection.InfectionSystem;
import deceptinfect.ecswip.DamagePenaltyHidden;
import deceptinfect.abilities.FormComponent;
import deceptinfect.ecswip.VirtualPosition;
import deceptinfect.radiation.RadiationProducer;
import deceptinfect.ecswip.GrabProducer;
import deceptinfect.infection.InfectedComponent;
import deceptinfect.ecswip.PlayerComponent;
import deceptinfect.radiation.RadiationAccepter;
import deceptinfect.radiation.ContaminationAccepter;
import deceptinfect.ecswip.GrabAccepter;
import deceptinfect.ecswip.HiddenHealthComponent;
import deceptinfect.infection.RateComponent;
import deceptinfect.ecswip.SpectateComponent;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.ecswip.ComponentManager;
import deceptinfect.GEntCompat;
import deceptinfect.GameInstance;

class GameManager {


    public static var state(default,#if server set #else null #end):GAME_STATE = WAIT;
    static var Game:GameInstance;

    public static final net_gamestate = new gmod.NET_Server<"gamestate",{state : Net_GAME_STATE_VAL}>();
    
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
   
    public static function initPlayer(ply:GPlayerCompat) {
        var p = ply.id;
        // var ent = new GPlayerCompat(new PlayerComponent(x));
        // var p = ent.id;
        var infcomp = new InfectionComponent();
        var spec = new SpectateComponent();
        var rate = new RateComponent();
        var health = new HiddenHealthComponent();
        var grabaccept = new GrabAccepter();
        var radaccept = new RadiationAccepter({contaminate: new ContaminationAccepter()});
        var virpos = new VirtualPosition(ply);
        
        p.add_component(infcomp);
        p.add_component(spec);
        p.add_component(rate);
        p.add_component(health);
        p.add_component(grabaccept);
        p.add_component(radaccept);
        p.add_component(virpos);
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
            net_gamestate.send({
                state : x, 
            },p);
        }
        trace("set state...");
        return state = x;
    }


    public static function initInfectedPlayer(x:DI_ID) {
        x.add_component(new InfectedComponent());
        x.add_component(new GrabProducer());
        x.add_component(new HiddenHealthComponent());
        x.add_component(new FormComponent());
        x.add_component(new DamagePenaltyHidden());
        var c_inf = x.get_sure(InfectionComponent);
    
        
        // getSystem(InfectionSystem).makeInfected(x);
        var c_accept = x.get_sure(GrabAccepter);
        //x.remove_component(GrabAccepter);
        c_accept.grabState = UNAVALIABLE(UNAVALIABLE);
        // trace(c_accept.grabState);
        var rad = RadiationProducer.createFromType(INF);
        rad.state = DISABLED;
        x.add_component(rad);
    }
    public static function initAllPlayers() {
        var choose = MathLib.random(1,PlayerLib.GetCount());
        
        for (ind => player in PlayerManager.getPlayers()) {
            initPlayer(player);
            if (ind == choose) {
                getSystem(InfectionSystem).makeInfected(player.id);
            }
            
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

        net_gamestate.signal.handle(gameStateChanged);
    }
    
    static function gameStateChanged(x:{state : Int}) {
        trace('game state changed $x');
        switch (x.state) {
            case WAIT:
            case SETTING_UP:
                state = SETTING_UP(new GameInstance());
            case ENDING:
                
            case PLAYING:
                state = PLAYING(new GameInstance());
                // PlayerManager.getLocalPlayerID().add_component(new InfectionComponent());
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