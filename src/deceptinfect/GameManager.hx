package deceptinfect;
import deceptinfect.util.Util;
import deceptinfect.game.AliveComponent;
import deceptinfect.ents.Di_entities;
import deceptinfect.game.WinSystem;
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
using deceptinfect.util.PlayerExt;

class GameManager {


    public static var state(default,#if server set #else null #end):GAME_STATE = WAIT;
    static var Game:GameInstance;

    public static var diffTime(default,never):Null<Float> = null;

    static var lastTick:Float = 0.0;

    public static var stateChange:Signal<GAME_STATE>;

    static var stateTrig:SignalTrigger<GAME_STATE> = new SignalTrigger();
    public static final net_gamestate = new gmod.NET_Server<"gamestate",{state : Net_GAME_STATE_VAL,time : Float}>();
    #if server
    
    public static function isPlaying() {
        return switch(state) {
            case PLAYING(_):
                true;
            default:
                false;
        }
    }
    public static function shouldAllowRespawn() {
        return switch (state) {
            case WAIT | SETTING_UP(_,_):
                true;
            default:
                false;
        }
    }

    #end
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
        p.add_component(new AliveComponent());
    }

    #if server
    static function thinkWait() {
        var no = true;
        if (PlayerLib.GetCount() > GameValues.MIN_PLAYERS && !no) {
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
        if (untyped diffTime == null) {
            untyped diffTime = 0.0;
        } else {
            untyped diffTime = GlobalLib.CurTime() - lastTick;
        }
        lastTick = GlobalLib.CurTime();
    }
    #if server
    static function set_state(x:GAME_STATE):GAME_STATE {
        var time = 0.0;
        switch [state,x] {
        case [ENDING(_),WAIT]:
            cleanup();
        case [SETTING_UP(x,_),PLAYING(y)]:
            initAllPlayers();
            y.start();
            hookWin();
        case [WAIT,PLAYING(x)]:
            initAllPlayers();
            x.start();
            hookWin();
        case [WAIT,SETTING_UP(x,t)]:
            time = t;
        case [PLAYING(x),ENDING(y,t)]:
            time = t;
        case [PLAYING(x),PLAYING(y)]:
            cleanup();
            initAllPlayers();
            y.start();
            hookWin();

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
        stateTrig.trigger(x);
        return state = x;
    }
    #end

    @:expose("cleanup")
    public static function cleanup() {
        SystemManager.initAllSystems();
        for (ent in entities) {
            ComponentManager.removeEntity(ent);
        }
        for (ent in EntsLib.GetAll()) {
            switch (ent.GetClass()) {
            case Di_entities.di_charger | Di_entities.di_battery | Di_entities.di_nest | Di_entities.di_evac_zone | Di_entities.di_flare:
                ent.Remove();
            default:
            }
        }
        for (p in PlayerLib.GetAll()) {
            new GPlayerCompat(new PlayerComponent(p));
            p.KillSilent();
            p.Spawn();
        }
    }
    static function hookWin() {
        getSystem(WinSystem).newWinner.handle(newWin);
    }

    static function newWin(x:Win) {
        switch (x) {
        case WIN_HUMAN:
            trace("Humans win");
        case WIN_INF:
            trace("Infected win");
        case DRAW:
            trace("Draw. Boring...");
        }
        state = ENDING(state.getParameters()[0],GlobalLib.CurTime() + 10);
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

    #if server
    public static function initAllPlayers() {
        var choose = MathLib.random(1,PlayerLib.GetCount());
        
        for (ind => player in PlayerManager.getPlayers()) {
            initPlayer(player);
            if (ind == choose) {
                getSystem(InfectionSystem).makeInfected(player.id);
            }
            player.StripWeapons();
            player.Give(Misc.startingWeapons[0]);
            player.giveFullAmmo();
        }
    }

    #end
    @:expose("startGame")
    public static function startGame(?skipintro=false) {
        var game = new GameInstance();
        if (skipintro) {
            state = PLAYING(game);
        } else {
            state = SETTING_UP(game,GlobalLib.CurTime() + GameValues.SETUP_TIME);
            
        }
    }

    public static function init() {
        stateChange = stateTrig.asSignal();
    }
    #end


    #if client
    public static function init() {

        net_gamestate.signal.handle(gameStateChanged);
    }
    
    static function gameStateChanged(x:{state : Net_GAME_STATE_VAL,time : Float}) {
        trace('game state changed $x');
        state = x.state;
        switch (x.state) {
            case PLAYING:
                PlayerManager.getLocalPlayerID().add_component(new InfectionComponent());
            default:
        }
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