package deceptinfect;

@:forward
abstract SeralizableRef<T>(tink.CoreApi.Ref<T>) from Ref<T> to Ref<T> {
	// @:to
	// public inline function to():haxe.ds.Vector<T> {
	//     return cast this;
	// }
	// public static inline function from<T>(x:haxe.ds.Vector<T>):SeralizableRef<T> {
	// }
}

abstract SeraliazablePlayer(haxe.ds.Vector<Int>) {
	// @:to
	// public inline function to():Int {
	//     var dis:Player = this;
	//     dis.
	// }
}
