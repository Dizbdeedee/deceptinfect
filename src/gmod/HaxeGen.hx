package gmod;

@:forward
abstract HaxeGen<T,X>(T) from T to T {

    public var haxeGen(get,never):X;
    
    @:noCompletion
    extern inline function get_haxeGen():X {
        return untyped this._gHaxeBurrow;
    }

    @:to
    public extern inline function to():X {
        return untyped this._gHaxeBurrow;
    }




}