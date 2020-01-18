package gmod.safety;
import gmod.libs.GlobalLib;
using gmod.safety.Safety;
typedef CanCheckValid = {
    function IsValid():Bool;
}
/**
Wrapper around possible invalid gmod objects, equivalent to Null<T>
Use gmod.safety to unwrap these safely
**/
@:forward
abstract InvalidObject<T:CanCheckValid>(T) from T to T {
    // @:to
    // public inline function toOb():T {
        
    //     #if gdebug
    //         return !GlobalLib.IsValid(this) ? throw "Value not valid at sure statement!": this;
    //     #else
    //         return this;
    //     #end
    // }
    

}

/*
@:forward
@:CoreType
abstract InvalidObject<T> from T to T {
    
}*/