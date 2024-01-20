#if macro
import haxe.macro.Type.ClassField;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

using tink.MacroApi;
using Lambda;
#end

// COMMITAREA add assertcommitarea
class AssertCommitArea {
	#if !macro
	static var shouldPrintStore:Array<Bool>;

	static var printStore:Array<String>;

	static function _commitArea(ident:Int, str:String, ?pos:haxe.PosInfos) {
		final shouldPrint = shouldPrintStore[ident];
		if (!shouldPrint) {
			shouldPrintStore[ident] = true;
			haxe.Log.trace(str, pos);
		}
	}

	static function _addToList(ident:Int, str:String) {
		if (printStore == null) {
			printStore = [];
		}
		if (shouldPrintStore == null) {
			shouldPrintStore = [];
		}
		printStore[ident] = str;
		shouldPrintStore[ident] = false;
	}

	public static function endOfRun() {
		for (i in 0...printStore.length) {
			if (!shouldPrintStore[i]) {
				trace('Missing assertt ${printStore[i]}');
			} else {
				trace('Hit assertt ${printStore[i]}');
			}
		}
	}
	#end

	#if macro
	static var generated = false;

	static var nextPrinter = 0;

	static var generatedStorage:Map<String, haxe.macro.Expr.TypeDefinition> = [];

	static function enableNotFound() {
		if (!generated) {
			Context.onTypeNotFound((clsName) -> {
				return if (generatedStorage.exists(clsName)) {
					generatedStorage.get(clsName);
				} else {
					null;
				}
			});
			generated = true;
		}
	}

	static function setupbuild(buildname:String, generate:() -> haxe.macro.Expr.TypeDefinition) {
		enableNotFound();
		var td = generate();
		td.name = buildname;
		td.meta.push({name: ":keep", pos: Context.currentPos()});
		td.meta.push({name: ":keepInit", pos: Context.currentPos()});
		generatedStorage.set(buildname, td);
		return [buildname].drill();
	}
	#end

	public static macro function assertt(e:haxe.macro.Expr, label:haxe.macro.Expr) {
		var s = e.toString();
		var p = e.pos;
		var el = [];
		var descs = [];
		function add(e:Expr, s:String) {
			var v = "_tmp" + el.length;
			el.push(macro var $v = $e);
			descs.push(s);
			return v;
		}
		function map(e:Expr) {
			return switch (e.expr) {
				case EConst((CInt
					(_) | CFloat(_) | CString(_) | CRegexp(_) | CIdent("true" | "false" | "null"))):
					e;
				case _:
					var s = e.toString();
					e = e.map(map);
					macro $i{add(e, s)};
			}
		}
		var e = map(e);
		var p = Context.currentPos();
		var expr = setupbuild('_ASSCOMMITAREA$nextPrinter', () -> {
			return macro class {
				@:keep
				@:keepInit
				static function __init__() {
					@:privateAccess AssertCommitArea._addToList($v{nextPrinter}, "ASSERTT - " + $label);
				}
			}
		});
		var a = [for (i in 0...el.length) macro {expr: $v{descs[i]}, value: $i{"_tmp" + i}}];
		var newBl = el.toBlock();
		var belowBl = macro {
			$expr;
			@:privateAccess @:pos(p) AssertCommitArea._commitArea($v{nextPrinter++}, "ASSERTT - " + $label);
			if (!$e) {
				var assert = new Assert.AssertionFailure($v{s}, $a{a});
				@:pos(p) trace(assert.toString());
				@:pos(p) throw assert;
			}
		}
		return newBl.concat(belowBl);
	}
}
