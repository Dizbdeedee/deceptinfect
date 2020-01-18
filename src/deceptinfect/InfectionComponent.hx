package deceptinfect;

class InfectionComponent {

    var infection:INF_STATE = NOT_INFECTED(0);
    var rate:Float = 1;
    
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
                onInfected();
            default:
        }
    }

    public function baseInfection() {

    }

    function onInfected() {

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
