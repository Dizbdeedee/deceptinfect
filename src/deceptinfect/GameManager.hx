package deceptinfect;
import deceptinfect.ecswip.SystemManager;
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

    public static final net_gamestate = new gmod.NET_Server<"gamestate",{state : Net_GAME_STATE_VAL,time : Float}>();
    
    public static function shouldAllowRespawn() {
        return switch (state) {
            case WAIT:
                true;
            default:
                false;
        }
    }
    #if server
    public static function sure():GameInstance {
        return switch (state) {
            case SETTING_UP(x,_) | PLAYING(x) | ENDING(x,_):
                x;
            case WAIT:
                throw "Game not avaliable at sure statement!";
        }
    }

    #end
   
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
    static function thinkWait() {
        if (PlayerLib.GetCount() > GameValues.MIN_PLAYERS) {
            state = SETTING_UP(new GameInstance(),GlobalLib.CurTime() + GameValues.SETUP_TIME);
        }
    }

    

    @:allow(deceptinfect.DeceptInfect.Think)
    static function think() {
        switch state {
        case WAIT:
            thinkWait();
            
        case SETTING_UP(x,time):
            if (GlobalLib.CurTime() > time) {
                state = PLAYING(x);
            }

        case PLAYING(x):
            x.think();
        case ENDING(x,time):
            if (GlobalLib.CurTime() > time) {
                state = WAIT;
            }

        }
    }

    static function set_state(x:GAME_STATE):GAME_STATE {
        var time = 0.0;
        switch [state,x] {
        case [ENDING(_),WAIT]:
            SystemManager.make();
            for (ent in entities) {
                ComponentManager.removeEntity(ent);
            }
            for (p in PlayerLib.GetAll()) {
                new GPlayerCompat(new PlayerComponent(p));
            }
        case [SETTING_UP(x,_),PLAYING(y)]:

        case [WAIT,PLAYING(x)]:
            initAllPlayers();
            x.start();    
        case [WAIT,SETTING_UP(x,t)]:
            time = t;
        case [PLAYING(x),ENDING(y,t)]:
            time = t;


        default:
            throw "Unsupported state transition";
        }
        for (p in PlayerLib.GetAll()) {
            net_gamestate.send({
                state : x,
                time : time
            },p);
        }
        trace('set state... $x');
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
    public static function startGame(?skipintro=false) {
        var game = new GameInstance();
        if (skipintro) {
            state = PLAYING(game);
        } else {
            state = SETTING_UP(game,GlobalLib.CurTime() + GameValues.SETUP_TIME);
            
        }
    }

    #end
    #if client
    public static function init() {

        net_gamestate.signal.handle(gameStateChanged);
    }
    
    static function gameStateChanged(x:{state : Net_GAME_STATE_VAL,time : Float}) {
        trace('game state changed $x');
        state = x.state;
    }
    #end
}
enum GAME_STATE {
    WAIT;
    SETTING_UP #if server ( x:GameInstance,time:Float ) #end;
    PLAYING #if server (x:GameInstance) #end;
    ENDING #if server (x:GameInstance,time:Float) #end;
}

enum abstract Net_GAME_STATE_VAL(Int) to Int from Int {
    var WAIT = 0;
    var SETTING_UP = 1;
    var PLAYING = 2;
    var ENDING = 3;
    #if server
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
    #end

    #if client
    @:to
    public function toGAME_STATE():GAME_STATE {
        return switch (this) {
        case WAIT:
            GAME_STATE.WAIT;
        case SETTING_UP:
            GAME_STATE.SETTING_UP;
        case PLAYING:
            GAME_STATE.PLAYING;
        case ENDING:
            GAME_STATE.ENDING;
        default:
            throw "Unhandled net game state conversion";
        }
    }
    #end
}