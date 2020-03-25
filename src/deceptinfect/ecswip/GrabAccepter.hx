package deceptinfect.ecswip;

/**
    More of a tag... really
**/
class GrabAccepter extends Component {
    public var grabAttacker:Map<GrabProducer,Bool> = [];
    public var grabState:GrabState = NOT_GRABBED;
    public var targeting:Map<GrabProducer,Bool> = [];
}

enum GrabState {
    NOT_GRABBED;

    START_GRAB;
    GRABBED;
}