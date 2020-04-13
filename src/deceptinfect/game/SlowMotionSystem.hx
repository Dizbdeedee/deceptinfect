package deceptinfect.game;

import deceptinfect.game.WinSystem.Win;
import deceptinfect.GameManager.GAME_STATE;

class SlowMotionSystem extends System {

    #if server

    var slowMotion:SlowMotionState = INACTIVE;

    var finishtime = 1.5;

    var startval = 0.25;
    
    var endval = 0.03;

    public var slowMotionEnd(default,never):Signal<Noise>;
    var slowMotionEndTrig:SignalTrigger<Noise> = new SignalTrigger();

    public function new() {
        super();
        untyped slowMotionEnd = slowMotionEndTrig.asSignal();
    }
    override function init_server() {
        GameManager.stateChange.handle(stateChange);
        getSystem(WinSystem).newWinner.handle(winChange);
    }

    function winChange(x:Win) {
        switch (x) {
        case WIN_HUMAN | WIN_INF:
            GameLib.SetTimeScale(startval);
            // GameLib.ConsoleCommand('host_timescale $startval\n');
            slowMotion = ACTIVE(GlobalLib.RealTime() + finishtime,GlobalLib.RealTime());

        default:
        }
    }
    function stateChange(x:GAME_STATE) {
        switch (x) {
            case WAIT:
                GameLib.ConsoleCommand("phys_timescale 1\n");
            default:
        }
    }
    
    override function run_server() {
        switch (slowMotion) {
            case ACTIVE(target,start):
                if (GlobalLib.RealTime() > target) {
                    slowMotion = FINISHED;
                    GameLib.SetTimeScale(1);
                    GameLib.ConsoleCommand("phys_timescale 0\n");
                    // GameLib.ConsoleCommand("host_timescale 1\n");
                    slowMotionEndTrig.trigger(null);
                    return;
                }    
                var lp = (GlobalLib.RealTime() - start) / (target - start);
                var val = GlobalLib.Lerp(lp,startval,endval);
                GameLib.SetTimeScale(val);
                // GameLib.ConsoleCommand('host_timescale $val\n');
            default:

        }
    }
    #end


}

enum SlowMotionState {
    ACTIVE(target:Float,start:Float);
    INACTIVE;
    FINISHED;
}