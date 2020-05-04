package deceptinfect.util;

abstract VectorString(String) from String to String {

    @:to
    public inline function toVec():Vector {
        return UtilLib.StringToType(this,"vector");
    }

    @:from
    public static inline function fromVec(x:Vector):VectorString {
        return UtilLib.TypeToString(x);
    }
}

// abstract StringThing<T>(T) {
//     @:to
//     public inline function toStr():String {
//         return UtilLib.TypeToString(this);
//     }

//     @:to
//     public static inline function toVector

//     @:to
//     public function toVector(x:Vector) {
//         return UtilLib.StringToType(x,"vector");
//     }

//     @:from
// }

// abstract StringVector(Vector) from Vector to Vector {

//     @:to
//     public static function toStr() {

//     }
// }