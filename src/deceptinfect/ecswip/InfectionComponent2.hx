package deceptinfect.ecswip;

class InfectionComponent2 extends Component {
    
    public var infection:INF_STATE = NOT_INFECTED(0);
    public var rate:Float = 1;
    public var baseInfection:BaseInfection;
    var infectedTrigger:SignalTrigger<Noise> = new SignalTrigger();
    public var onInfected(default,null):Signal<Noise>;
    public var acceptingInfection:AcceptingInfection;
        
    


}


typedef InfectionMessageInfo = {
    infection : Float,
}

enum AcceptingInfection {
    ACCEPTING;
    REJECTING;
}

enum BaseInfection {
    NOT_USING;
    USING_GLOBAL;
    USING_STATIC(rate:Float);
}


enum INF_STATE {
    NOT_INFECTED(inf:Float);
    INFECTED;
}