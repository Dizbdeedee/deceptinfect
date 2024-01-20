#if macro
import haxe.macro.Type.ClassField;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

using tink.MacroApi;
#end

class CommitArea {
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
				trace('Missing commit area ${printStore[i]}');
			} else {
				trace('Hit commit area ${printStore[i]}');
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

	public static macro function COMMITAREA(run:haxe.macro.Expr) {
		var p = Context.currentPos();
		var expr = setupbuild('_COMMITAREA$nextPrinter', () -> {
			return macro class {
				@:keep
				@:keepInit
				static function __init__() {
					@:privateAccess CommitArea._addToList($v{nextPrinter}, "COMMITAREA - " + $run);
				}
			}
		});
		return macro {
			$expr;
			@:privateAccess @:pos(p) CommitArea._commitArea($v{nextPrinter++}, "COMMITAREA - " + $run);
		}
	}
}
