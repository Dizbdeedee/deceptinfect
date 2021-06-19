package deceptinfect.game.components;
import deceptinfect.infection.InfectionComponent.INF_STATE;
import gmod.enums.DMG;

class DeathInfo extends Component {
    var di:EDeathInfo;
}

class EDeathInfo {

    var cause:DMG;
    var inf:INF_STATE;
    var time:Float;

    var attacker:Attacker;

}

enum Attacker {
    SELF;
    WORLD;
    ENEMY(health:Float,inf:INF_STATE);
}