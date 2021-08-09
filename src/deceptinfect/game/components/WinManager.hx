package deceptinfect.game.components;

import deceptinfect.game.WinSystem.Win;

@:structInit 
class WinManager extends Component {

    var winSignal:Signal<Win>;

    var winTrigger:SignalTrigger<Win>;

}