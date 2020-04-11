package deceptinfect.client;

import deceptinfect.infection.InfectionComponent;
import deceptinfect.GameManager.GAME_STATE;
#if client
class Hud { 

    static var cache:Map<Axis,Map<Int,Float>> = [Axis.X => [],Axis.Y => []];
    static var baseReso = [X => 1920,Y => 1080];
    static var statetext:Map<GAME_STATE,String> = [
        WAIT => "Waiting for players...",
        PLAYING => "Round in progress...",
        ENDING => "Round has ended.."
    ];
    public static function CSS(axis:Axis,req:Int) {
        var map = cache.get(axis);
        if (!map.exists(req)) {
            var multiplier = axisToMultiplier(axis);
            var result = MathLib.floor((req / baseReso.get(axis)) * multiplier);
            map.set(req,result);
        }
        return map.get(req);
    }

    static function axisToMultiplier(axis:Axis) {
        return switch (axis) {
            case X:
                GlobalLib.ScrW();
            case Y:
                GlobalLib.ScrH();
        }
    }

    public static function paint() {
        targetID();
        infectionMeter();
    }

    static function targetID() {
        var target = GlobalLib.LocalPlayer().GetEyeTrace().Entity;
        if (!GlobalLib.IsValid(target) || !target.IsPlayer()) {return;}
        var player:Player = cast target;
        SurfaceLib.SetTextPos(CSS(X,0),CSS(Y,250));
        SurfaceLib.SetFont("TargetID");
        SurfaceLib.DrawText(player.Name());
        //isinfected, then draw infection percent ect.
    }

    static function grabbedBlank() {
        //if grabbed, go black
    }

    static function infectionMeter() {
        var inf = switch [PlayerManager.getLocalPlayer().has_id(),GameManager.state] {
            case [Some(id = _.get(InfectionComponent) => Comp(c_i)),PLAYING]:
                trace(id);
                c_i;
            default:
                return;
        }
        
        SurfaceLib.SetDrawColor(180,180,180,255);
        SurfaceLib.DrawRect(CSS(X,750),CSS(Y,825),CSS(X,300),CSS(Y,30));
        if (inf.getInfValue() < 70) {
            SurfaceLib.SetDrawColor(0,0,255,255);
        } else if (inf.getInfValue() < 90) {
            SurfaceLib.SetDrawColor(255,165,0,255);

        } else if (inf.getInfValue() < 100) {
            SurfaceLib.SetDrawColor(255,0,0,255);
        } else {
            SurfaceLib.SetDrawColor(128,0,128,255);
        }
        SurfaceLib.DrawRect(CSS(X,750),CSS(Y,825),CSS(X,Math.floor(3 * inf.getInfValue())),CSS(Y,30));
        SurfaceLib.SetFont("DermaLarge");
        SurfaceLib.SetTextColor(255,255,255);
        SurfaceLib.SetTextPos(0,CSS(Y,600));
        SurfaceLib.DrawText(StringLib.format("Infection: %6.3f%% ",inf.getInfValue()));
        //contaminated ect.
    }

    static function stateText() {
        var roundtxt = statetext.get(GameManager.state);
        SurfaceLib.SetTextColor(255,255,255);
        SurfaceLib.SetTextPos(0,CSS(Y,1000));
        SurfaceLib.DrawText(roundtxt);
    }
}

private enum Axis {
    X;
    Y;
}
#end