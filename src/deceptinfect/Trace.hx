package deceptinfect;

import haxe.PosInfos;
import haxe.Log;

class Trace {
	public static function overridetrace() {
		#if server
		var oldtrace = Log.trace;
		Log.trace = function(v:Dynamic, ?infos:PosInfos) {
			var str = Log.formatOutput(v, infos);
			str = '\x1B[94m$str\x1B[0m';
			untyped __define_feature__("use._hx_print", _hx_print(str));
		}
		#end
	}
}
