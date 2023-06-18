package deceptinfect.game;

import deceptinfect.GameManager2.GAME_STATE_2;
import deceptinfect.macros.IterateEnt;
import deceptinfect.game.WinSystem.Win;
import deceptinfect.ecswip.SystemManager;

class SlowMotionSystem extends System {

    public var slowMotionEnd(default, never):Signal<Noise>;

}

class SlowMotionSystemDef extends SlowMotionSystem {
    #if server
    var slowMotion:SlowMotionState = INACTIVE;

    var finishtime = 1.5;

    var startval = 0.25;

    var endval = 0.03;

    var slowMotionEndTrig:SignalTrigger<Noise> = new SignalTrigger();

    public function new(_componentManager:ComponentManager,_systemManager:SystemManager) {
        super(_componentManager,_systemManager);
        untyped slowMotionEnd = slowMotionEndTrig.asSignal();
    }

    override function init_server() {
        final runUntilDoneSystem = systemManager.get(RunUntilDoneSystem);
        runUntilDoneSystem.addRunner(() -> {
            IterateEnt.iterGet([GameManager2],[{stateChanged : sc}],function () {
                trace("Hello statechange!!!!!!!");
                sc.handle(stateChange);
                return true;
            });
            return false;
        });
        runUntilDoneSystem.addRunner(() -> {
            IterateEnt.iterGet([WinManager],[{winSignal : ws}],function () {
                ws.handle(winChange);
                return true;
            });
            return false;
        });



        //nocheckin
    }



    function winChange(x:Win) {
        switch (x) {
            case WIN_HUMAN | WIN_INF:
                GameLib.SetTimeScale(startval);
                slowMotion = ACTIVE(Gmod.RealTime() + finishtime, Gmod.RealTime());
            default:
        }
    }

    function stateChange(x:GAME_STATE_2) {
        switch (x) {
            case WAIT:
                GameLib.ConsoleCommand("phys_timescale 1\n");
            default:
        }
    }

    override function run_server() {

        switch (slowMotion) {
            case ACTIVE(target, start):
                if (Gmod.RealTime() > target) {
                    slowMotion = FINISHED;
                    GameLib.SetTimeScale(1);
                    GameLib.ConsoleCommand("phys_timescale 0\n");
                    // GameLib.ConsoleCommand("host_timescale 1\n");
                    slowMotionEndTrig.trigger(null);
                    return;
                }
                var lp = (Gmod.RealTime() - start) / (target - start);
                var val = Gmod.Lerp(lp, startval, endval);
                GameLib.SetTimeScale(val);
            // GameLib.ConsoleCommand('host_timescale $val\n');
            default:
        }
    }
    #end
}

enum SlowMotionState {
    ACTIVE(target:Float, start:Float);
    INACTIVE;
    FINISHED;
}
