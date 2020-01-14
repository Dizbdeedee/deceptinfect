package gmod.safety;


typedef CanCheckValid = {
    function IsValid():Bool;
}
/**
Wrapper around possible invalid gmod objects, equivalent to Null<T>
Use gmod.safety to unwrap these safely
**/
abstract InvalidObject<T:CanCheckValid>(T) to T {
    
}

/*
@:forward
@:CoreType
abstract InvalidObject<T> from T to T {
    
}*/