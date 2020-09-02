package deceptinfect.util;

class ArrayTools {

    public static inline function getRandom<T>(x:Array<T>):T {
        return x[MathLib.random(0,x.length)];
    }

    public static inline function getRandomL<T>(x:lua.Table<Int,T>):T {
        var int:Int = MathLib.random(1,x.length());
        return x[int];
    }
}
