package deceptinfect.game;

import deceptinfect.ecswip.Component;

class NestComponent extends Component {

    public var nestState:NestState = INVISIBLE;
}

enum NestState {
    INVISIBLE;
    VISIBLE;
    DEAD;
}