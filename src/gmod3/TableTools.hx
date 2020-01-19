package gmod;

class TableTools {

    public static inline function length<X,Y>(table:Table<X,Y>):Int {
        return untyped __lua__("#{0}",table);
    }
}