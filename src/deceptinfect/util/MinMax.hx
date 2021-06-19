package deceptinfect.util;

typedef MinMax = {
	mins:Vector,
	maxs:Vector
}

class MinMaxTools {
	public static function getCenter(x:MinMax):Vector {
		return ((x.maxs - x.mins) / 2) + x.mins;
	}
}
