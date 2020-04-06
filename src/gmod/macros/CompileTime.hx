package gmod.macros;

class CompileTime {

    public static macro function C_square(x:Int) {
        var sq = x*x;
        return macro $v{sq};
    }
}