package deceptinfect.util;

abstract VectorString(String) from String to String {
	@:to
	public inline function toVec():Vector {
		return UtilLib.StringToType(this, "vector");
	}

	@:from
	public static inline function fromVec(x:Vector):VectorString {
		return UtilLib.TypeToString(x);
	}
}
