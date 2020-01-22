package deceptinfect;

using tink.CoreApi;

class InfectionComponent {

    public var infection(default,null):INF_STATE = NOT_INFECTED(0);
    public var rate(default,null):Float = 1;

    public var baseInfection:Ref<Float>;

    public var onInfected:Signal<Noise>;
    var infectedTrigger:SignalTrigger<Noise>;
    
    public function handleInfection() {
        // if (not DeceptInfect)
        switch (infection) {
            case NOT_INFECTED(x) if (x >= 100):
                infection = INFECTED;
            case NOT_INFECTED(x) if (x <= 0):
                x = 0;
            default:
        }
        switch (infection) {
            case INFECTED:
                infectedTrigger.trigger(Noise);
            default:
        }
    }

    function baseInfect() {
        setInfection((baseInfection:Float) * rate);
    }

    public function setInfected() {
        infection = INFECTED;
    }

    public function infect(f:Float) {
        switch (infection) {
            case NOT_INFECTED(inf):
                setInfection(inf + f);
            default:
        }
    }



    
    public function setInfection(inf:Float) {
        switch(infection) {
            case NOT_INFECTED(x):
                x = inf;
                handleInfection();
            default:
        }
    }

    

    

}


enum INF_STATE {
    NOT_INFECTED(inf:Float);
    INFECTED;
}



// enum TARGET {
//     NO_TARGET;
//     TARGET(p:Player);
// }
