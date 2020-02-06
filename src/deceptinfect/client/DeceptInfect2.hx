package deceptinfect.client;

import haxe.display.JsonModuleTypes.JsonAnon;
#if client
@:build(gmod.macros.GamemodeMacro.build())
class DeceptInfect2 extends gmod.hooks.Gm {
    
    static var resolutionScale = [
        Axis.X => 1920,
        Axis.Y => 1080
    ];
    static var cache:Map<Axis,Map<Int,Float>> = [Axis.X => [],Axis.Y => []];
    override function HUDPaint() {
        super.HUDPaint();
    }

    function CSS(axis:Axis,num:Int):Float {
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
        //nicknaming blah blah
        //SurfaceLib.DrawText()
        
    }

}

private enum Axis {
    X;
    Y;
}
#end