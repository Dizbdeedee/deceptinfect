package deceptinfect.client;

import deceptinfect.ecswip.InfectionComponent;
import deceptinfect.ecswip.InfectedComponent;
#if client
@:build(gmod.macros.GamemodeMacro.build())
class DeceptInfect2 extends gmod.hooks.Gm {
    
    static var resolutionScale = [
        Axis.X => 1920,
        Axis.Y => 1080
    ];
    static var cache:Map<Axis,Map<Float,Float>> = [Axis.X => [],Axis.Y => []];
    override function HUDPaint() {
        super.HUDPaint();
    }

    function CSS(axis:Axis,num:Float):Float {
        if (!cache.get(axis).exists(num)) {
            var multiplier = switch (axis) {
                case X:
                    GlobalLib.ScrW();
                case Y:
                    GlobalLib.ScrH();
            }
            var result = Math.ffloor((num / resolutionScale[axis]) * multiplier);
            return result;
        } else {
            return cache.get(axis).get(num);
        }
    }
    function drawTargetID() {
        var target = GlobalLib.LocalPlayer().GetEyeTrace().Entity;
        if (!GlobalLib.IsValid(target) || !target.IsPlayer()) {return;}
        SurfaceLib.SetTextPos(CSS(X,0),CSS(Y,250));
        SurfaceLib.SetFont("TargetID");
        if (PlayerManager.getLocalPlayer().isInfected()) {

        }
        
        //nicknaming blah blahi
        //SurfaceLib.DrawText()
        
    }

    function drawInfectionMeter() {
        var lp = PlayerManager.getLocalPlayer();
        switch [lp.get_component(InfectionComponent),GameManager.state] {
            case [COMPONENT(inf),PLAYING(_)]:
                SurfaceLib.SetDrawColor(180,180,180,255);
                SurfaceLib.DrawRect(CSS(X,750),CSS(Y,825),CSS(X,300),CSS(Y,30));
                var barExtend:Float;
                switch (inf.infection) {
                    case NOT_INFECTED(x) if (x.value < 70):
                        SurfaceLib.SetDrawColor(0,0,255,255);
                        barExtend = x;
                    case NOT_INFECTED(x) if (x.value < 90):
                        SurfaceLib.SetDrawColor(255,165,0,255);
                        barExtend = x;
                    case NOT_INFECTED(x) if (x.value < 100):
                        SurfaceLib.SetDrawColor(255,0,0,255);
                        barExtend = x;
                    default:
                        SurfaceLib.SetDrawColor(128,0,128,255);
                        barExtend = 100;
                }
                SurfaceLib.DrawRect(CSS(X,750),CSS(Y,825),CSS(X,3.0 * barExtend),CSS(Y,30));
                SurfaceLib.SetFont("DermaLarge");
                SurfaceLib.SetTextColor(255,255,255);
                SurfaceLib.SetTextPos(0,CSS(Y,600));
                SurfaceLib.DrawText(StringLib.format("Infection: %6.3f%% ",barExtend)); //TODO infection value of 100?
                
            default:

        }
    }

}

private enum Axis {
    X;
    Y;
}
#end