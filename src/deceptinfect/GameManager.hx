package deceptinfect;
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

    public static var state(default,null):GAME_STATE = WAIT;
    public static var Game:GameInstance;


    public static function sure():GameInstance {
        return switch (state) {
            case SETTING_UP(x) | PLAYING(x) | ENDING(x):
                x;
            case WAIT:
                throw "Game not avaliable at sure statement!";
        }
    }
    
    public static function thinkWait() {
        if (PlayerLib.GetCount() > GameValues.MIN_PLAYERS) {
            initAllPlayers();
        }
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
}
enum GAME_STATE {
    WAIT;
    SETTING_UP(x:GameInstance);
    PLAYING(x:GameInstance);
    ENDING(x:GameInstance);
}