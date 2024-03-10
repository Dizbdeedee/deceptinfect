package deceptinfect.util;

class Mappy {
	public static inline function getOrDefArr<X, Y:Array<Z>, Z>(x:Map<X, Y>, key:X):Array<Z> {
		return switch (x.get(key)) {
			case null:
				[];
			case f:
				f;
		}
	}

	public static inline function getOrDefMap<X, Y:Map<Z, A>, Z:Dynamic, A>(x:Map<X, Y>, key:X):Map<Z, A> {
		return switch (x.get(key)) {
			case null:
				new Map<Z, A>();
			case x:
				x;
		}
	}
}
