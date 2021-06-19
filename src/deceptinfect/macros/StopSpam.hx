package deceptinfect.macros;

import haxe.macro.Context;

class StopSpam {
	#if macro
	public static function build() {
		if (!Context.defined("debug"))
			return null;
		final fields = Context.getBuildFields();
		for (field in fields) {
			switch [field.kind, field.meta.filter((meta) -> meta.name == ":spam")] {
				case [FFun(fun = {expr: funExpr = {expr: EBlock(arr)}}), [_]]:
					var t = macro try {
						$a{arr}
					} catch (e:haxe.Exception) {
						if (deceptinfect.macros.SpamTracker.shouldShow(e.message)) {
							throw e;
						}
					}
					fun.expr = t;
				default:
			}
		}
		return fields;
	}
	#end
}
