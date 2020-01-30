package deceptinfect;

using tink.CoreApi;

/**
    Controls infection state
**/
class Infection implements InfectionComponent {

    public var infection:INF_STATE = NOT_INFECTED(0);
    public var rate(default,set):Float = 1;
    public var baseInfection:Ref<Float>;
    var infectedTrigger:SignalTrigger<Noise> = new SignalTrigger();
    public var onInfected(default,null):Signal<Noise>;
    public var acceptingInfection:AcceptingInfection;
    
    public function new() {
        onInfected = infectedTrigger.asSignal();
    }
    public function handleInfection() {
        //TODO put back if not using ecs
    }

    public function set_rate(r:Float):Float {
        return rate = r;
    }
    function baseInfect() {
        infect((baseInfection:Float) * rate);
    }

    public function think() {
        baseInfect();

    }


    public function infect(f:Float) {
        switch ([infection,acceptingInfection]) {
            case [NOT_INFECTED(inf),ACCEPTING]:
                setInfection(inf + f);
            default:
        }
    }
    public function setInfection(inf:Float) {
        switch([infection,acceptingInfection]) {
            case [NOT_INFECTED(x),ACCEPTING]:
                x = inf;
                handleInfection();
            default:
        }
    }


    

    

}

interface InfectionComponent {
    var rate(default,set):Float;
    var onInfected(default,null):Signal<Noise>;
    var baseInfection:Ref<Float>;
    var acceptingInfection:AcceptingInfection;
    var infection:INF_STATE;
    function infect(f:Float):Void;
    function setInfection(f:Float):Void;
    function think():Void;

    
    
}

typedef InfectionMessageInfo = {
    infection : Float,
}

enum AcceptingInfection {
    ACCEPTING;
    REJECTING;
}


enum INF_STATE {
    NOT_INFECTED(inf:Float);
    INFECTED;
}



// enum TARGET {
//     NO_TARGET;
//     TARGET(p:Player);
// }
