package deceptinfect;

class EntityExt {
    public static function facingBehind(me:Entity,target:Entity) {
        var vec1 = new Angle(0,me.EyeAngles().y,0).Forward();
        var vec2 = new Angle(0,target.EyeAngles().y,0).Forward();
        var dot = Math.acos(vec1.Dot(vec2));
        return dot < Math.PI / 4;
    }
}