package deceptinfect;


@:transitive
abstract SeralizableRef(Array<Float>) to Array<Float> from Array<Float> {
	public var value(get, set):Float;
	
	inline function new() this = [];
	
	@:to inline function get_value():Float return this[0];
	inline function set_value(param:Float) return this[0] = param;
	
	public function toString():String return '@[' + Std.string(value)+']';
	
	@:noUsing @:from static inline public function to(v:Float):SeralizableRef {
	  var ret = new SeralizableRef();
	  ret.value = v;
	  return ret;
	}
  }

abstract SeraliazablePlayer(haxe.ds.Vector<Int>) {
	// @:to
	// public inline function to():Int {
	//     var dis:Player = this;
	//     dis.
	// }
}
