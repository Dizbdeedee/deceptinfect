package deceptinfect;

abstract DistSquared(Float) to Float {
    

    @:op(A < B)
    static function less(x:DistSquared,y:DistSquared):Bool;
    
    @:op(A > B)
    static function more(x:DistSquared,y:DistSquared):Bool;

    @:op(A == B)
    static function eq(x:DistSquared,y:DistSquared):Bool;

    @:op(A - B)
    static function minus(x:DistSquared,y:DistSquared):DistSquared;
    @:op(A + B)
    static function plus(x:DistSquared,y:DistSquared):DistSquared;

    @:commutative
    @:op(A * B)
    static function multiply(x:DistSquared,y:Float):Float;
    
    @:op(A / B)
    static function divide(x:DistSquared,y:DistSquared):DistSquared;

    @:commutative
    @:op(A / B)
    static function divide2(x:DistSquared,y:Float):Float;

    @:from
    static function convert(x:Float):DistSquared {
	return cast MathLib.pow(x,2);
    }

}

class DistSqSafe {

    public inline static function distSq(us:Vector,them:Vector):DistSquared {
	return cast us.DistToSqr(them);
    }
}