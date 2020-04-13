package deceptinfect.util;

abstract AngleString(String) from String to String {

    @:from
    public static inline function fromAng(x:Angle):AngleString {
        return UtilLib.TypeToString(x);
    }

    public inline function toAngle():Angle {
        return UtilLib.StringToType(this,"angle");
    }
    
}