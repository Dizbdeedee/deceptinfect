package deceptinfect.util;

class PrintTimer {
	static var nextPrinter = 0;

	public static macro function print_time(time:Float, run:haxe.macro.Expr) {
		return macro deceptinfect.util.Util.printTimer_2($v{nextPrinter++}, $v{time}, $run);
	}
}
