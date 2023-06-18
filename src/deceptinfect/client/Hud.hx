package deceptinfect.client;

import deceptinfect.infection.components.DoomClient;
import deceptinfect.infection.components.InfectionPoints;
import deceptinfect.game.components.BatteryInfo;
import deceptinfect.macros.IterateEnt;
import deceptinfect.infection.components.InfectionLookData;
import deceptinfect.GameManager2.GAME_STATE_2;
import deceptinfect.game.GameSystem;
import gmod.stringtypes.Hook.GMHook;
import deceptinfect.game.components.StatInfo;
import deceptinfect.infection.InfectionComponent;
import deceptinfect.game.components.WinGame;

#if client
class Hud extends System {
    var cache:Map<Axis, Map<Int, Float>> = [Axis.X => [], Axis.Y => []];
    var baseReso = [X => 1920, Y => 1080];
    var statetext:Map<Int, String> = [
        WAIT.getIndex() => "Waiting for players...",
        PLAYING.getIndex() => "Round in progress...",
        ENDING(null).getIndex() => "Round has ended.."
    ];

    public function CSS(axis:Axis, req:Int) {
        var map = cache.get(axis);
        if (!map.exists(req)) {
            var multiplier = axisToMultiplier(axis);
            var result = MathLib.floor((req / baseReso.get(axis)) * multiplier);
            map.set(req, result);
        }
        return map.get(req);
    }

    function axisToMultiplier(axis:Axis) {
        return switch (axis) {
            case X:
                Gmod.ScrW();
            case Y:
                Gmod.ScrH();
        }
    }

    // public override function init_client() {
    //     // HookLib.Add(GMHook.HUDPaint,"di_hudpaint",paint);
    // }

    public function paint() {
        targetID();
        infectionMeter();
        stateText();
        batteryInfo();
        infectionPoints();
        doom();
        win();
    }

    function intpretInfection(state:INF_STATE) {
        return switch (state) {
            case NOT_INFECTED(inf):
                inf.value;
            case INFECTED:
                100;
        }
    }

    function targetID() {
        var target:GEntCompat = Gmod.LocalPlayer().GetEyeTrace().Entity;
        if (!Gmod.IsValid(target) || !target.IsPlayer()) {
            return;
        }
        var player:Player = cast target;
        SurfaceLib.SetTextPos(CSS(X,900), CSS(Y,540));
        SurfaceLib.SetFont("TargetID");
        SurfaceLib.SetTextColor(255,255,255);
        SurfaceLib.DrawText(player.Name());
        switch (target.has_id()) {
            case Some(_.get(InfectionLookData) => Comp(c_inf)):
                SurfaceLib.SetTextPos(CSS(X,900),CSS(Y,500));
                SurfaceLib.SetFont("TargetID");
                SurfaceLib.DrawText(StringLib.format("Infection: %6.2f%%", intpretInfection(c_inf.infection)));
            default:
        }
        // isinfected, then draw infection percent ect.
    }

    function statueInfo() {
        var tr = PlayerManager.getLocalPlayer().GetEyeTrace();
        switch (tr.Entity.validID2()) {
            case HAS_ID(id):
                switch id.get(StatInfo) {
                    case Comp(c_stat):
                        SurfaceLib.SetTextPos(0, CSS(Y,400));
                        SurfaceLib.SetTextColor(255, 255, 255);
                        SurfaceLib.DrawText(c_stat.name);
                        SurfaceLib.SetTextPos(0, CSS(Y,450));
                        SurfaceLib.DrawText(Std.string(c_stat.health));
                        SurfaceLib.SetTextPos(0, CSS(Y,500));
                        SurfaceLib.DrawText(Std.string(c_stat.inf));
                    // trace(c_stat.name);
                    default:
                }
            default:
        }
    }

    function grabbedBlank() {
        // if grabbed, go black
    }

    function infectionMeter() {
        var inf = switch [PlayerManager.getLocalPlayer().has_id()] {
            case [Some(_.get(InfectionComponent) => Comp(c_i))]:
                // trace(id);
                c_i;
            default:
                return;
        }
        SurfaceLib.SetDrawColor(180, 180, 180, 255);
        SurfaceLib.DrawRect(CSS(X, 750), CSS(Y, 825), CSS(X, 300), CSS(Y, 30));
        if (inf.getInfValue() < 70) {
            SurfaceLib.SetDrawColor(0, 0, 255, 255);
        } else if (inf.getInfValue() < 90) {
            SurfaceLib.SetDrawColor(255, 165, 0, 255);
        } else if (inf.getInfValue() < 100) {
            SurfaceLib.SetDrawColor(255, 0, 0, 255);
        } else {
            SurfaceLib.SetDrawColor(128, 0, 128, 255);
        }
        SurfaceLib.DrawRect(CSS(X, 750), CSS(Y, 825), CSS(X, Math.floor(3 * inf.getInfValue())), CSS(Y, 30));
        SurfaceLib.SetFont("DermaLarge");
        SurfaceLib.SetTextColor(255, 255, 255);
        SurfaceLib.SetTextPos(0, CSS(Y, 600));
        SurfaceLib.DrawText(StringLib.format("Infection: %6.3f%% ", inf.getInfValue()));
        // contaminated ect.
    }

    function stateText() {
        IterateEnt.iterGet([GameManager2],[{state : s}],function () {
            if (!statetext.exists(s.getIndex())) {
                break;
            }
            SurfaceLib.SetFont("DermaLarge");
            SurfaceLib.SetTextColor(255, 255, 255);
            SurfaceLib.SetTextPos(0, CSS(Y, 800));
            SurfaceLib.DrawText(statetext.get(s.getIndex()));
            break;
        });
        // var roundtxt = statetext.get(GameSystem.get().getGameManager().state.getIndex());

    }

    function batteryInfo() {
        IterateEnt.iterGet([BatteryInfo],[{charge : c}],
        function () {
            SurfaceLib.SetFont("DermaLarge");
            SurfaceLib.SetTextColor(255, 255, 255);
            SurfaceLib.SetTextPos(0, CSS(Y, 700));
            SurfaceLib.DrawText("Battery: " + c);
            break;
        });
    }

    function infectionPoints() {
        IterateEnt.iterGet([InfectionPoints],[{points : p}],
        function () {
            SurfaceLib.SetFont("DermaLarge");
            SurfaceLib.SetTextColor(255,255,255);
            SurfaceLib.SetTextPos(0, CSS(Y, 200));
            SurfaceLib.DrawText("Points: " + p);
            break;
        });
    }

    function doom() {
        IterateEnt.iterGet([DoomClient],[_],function () {
            SurfaceLib.SetFont("DermaLarge");
            SurfaceLib.SetTextColor(255,0,0);
            SurfaceLib.SetTextPos(0, CSS(Y,300));
            SurfaceLib.DrawText("!!");
        });
    }

    function win() {
        IterateEnt.iterGet([WinGame],[{win : win}],function () {
            SurfaceLib.SetFont("DermaLarge");
            SurfaceLib.SetTextColor(255,255,255);
            SurfaceLib.SetTextPos(CSS(X,800),CSS(Y,400));
            SurfaceLib.DrawText(switch (win) {
                case WIN_HUMAN:
                    "Humans win!";
                case WIN_INF:
                    "Infected win!";
                default:
                    "Nobody won...";
            });
        });
    }


}

private enum Axis {
    X;
    Y;
}
#end
