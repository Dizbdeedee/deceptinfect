package deceptinfect.util;

class Util {
	static var mappy_2:Map<Int, Float> = [];

	public static function printTimer_2(ident:Int, time:Float, run:() -> Void) {
		if (mappy_2.exists(ident)) {
			var nextTime = mappy_2.get(ident);
			if (Gmod.CurTime() > nextTime) {
				run();
				mappy_2.set(ident, Gmod.CurTime() + time);
			}
		} else {
			run();
			mappy_2.set(ident, Gmod.CurTime() + time);
		}
	}
}
