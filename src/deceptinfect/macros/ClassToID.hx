package deceptinfect.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.ExprTools;
using Lambda;
#end

class ClassToID {
	static var id:Int = 0;

	static final classMap:Map<String, Int> = [];

	#if macro
	static var ident:String = null;

	static function getIdent(e:Expr) {
		switch (e.expr) {
			case EConst(CIdent(s)) | EField(_, s):
				ident = s;
			default:
				ident = null;
				ExprTools.iter(e, getIdent);
		}
	}
	#end

	#if macro
	public static function getInstanceTypeFromClass(cls:Expr) {
		return switch (Context.typeof(cls)) {
			case TType(t, params):
				Context.toComplexType(Context.getType(t.get()
					.module));
			case x:
				trace(cls.expr);
				trace(x);
				throw "not accepted";
		}
	}

	public static function idMacro(cls:Expr) {
		getIdent(cls);
		if (ident == null)
			throw "not valid type";
		final type = getInstanceTypeFromClass(cls);
		final retId = getIDStr(ident);
		final idMacro = macro($v{retId} : deceptinfect.ecswip.ComponentManager.ComponentID<$type>);
		return idMacro;
	}

	public static function getRawID(cls:Expr):Int {
		getIdent(cls);
		if (ident == null)
			throw "not valid type";
		final type = getInstanceTypeFromClass(cls);
		final retId = getIDStr(ident);
		return retId;
	}

	public static function idMacroObj(obj:Expr):Expr {
		final ident = switch (Context.typeof(obj)) {
			case TInst(_.get() => {name: n}, _):
				n;
			case TType(_.get() => {name: n}, _):
				n;
			case x:
				trace(x);
				throw "not accepted";
		}
		final type = Context.toComplexType(Context.typeof(obj));
		final retId = getIDStr(ident);
		final idMacro = macro($v{retId} : deceptinfect.ecswip.ComponentManager.ComponentID<$type>);
		return idMacro;
	}
	#end

	#if macro
	public static function getIDStr(type:String) {
		return if (!classMap.exists(type)) {
			final ourid = id++;
			classMap.set(type, ourid);
			ourid;
		} else {
			classMap.get(type);
		}
	}
	#end

	public static macro function idc(cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro $idMacro;
		#end
	}
}

class DI_ID_Use {
	public static macro function get(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro componentManager.getComponentForID($idMacro, $diid);
		#end
	}

	public static macro function get_2(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro componentManager.getComponent($idMacro, $diid);
		#end
	}

	#if macro
	static function if_statement(getArr:haxe.macro.Expr, name:Expr) {
		return switch (getArr) {
			case {expr: EArrayDecl(values), pos: pos}:
				values.map((x) -> {
					final id = ClassToID.idMacro(x);
					macro __compArr[$id].has_component($name);
				})
					.fold((cur, prev) -> if (prev == null) {
						cur;
					} else {
						macro $prev && $cur;
					}, null);
			case {pos: pos}:
				Context.error("Not a get array", pos);
				macro null;
		}
	}

	static function switch_head(getArr:Expr, name:Expr) {
		return switch (getArr) {
			case {expr: EArrayDecl(values), pos: pos}:
				macro $a{
					values.map((x) -> {
						final id = ClassToID.idMacro(x);
						macro __compArr.get_component($id)
							.get_component($name);
					})
				};
			case {pos: pos}:
				Context.error("Not a case array", pos);
				macro null;
		}
	}
	#end

	public static macro function hasExpr(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			getArr:Expr, cases:Expr, func:Expr) {
		var name = diid;
		var expr;
		switch (func) {
			case {expr: EFunction(_, {args: [{name: _argName}], expr: e})}:
				expr = e;
			case {expr: EFunction(_, {args: [], expr: e}), pos: pos}:
				expr = e;
			case {pos: pos}:
				Context.error("Incorrect format", pos);
			default:
				throw "hmm";
		}
		final block = macro {
			if ($e{if_statement(getArr, name)}) {
				switch ($e{switch_head(getArr, name)}) {
					case $cases:
						$expr;
					default:
						null;
				}
			}
		}
		return block;
	}

	public static macro function getAll(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			arr:Array<Expr>) {
		#if macro
		final actualArray = arr.map((e) -> {
			final idMacro = ClassToID.idMacro(e);
			macro componentManager.getComponentForID($idMacro, $diid);
		});
		final expr = {expr: EArrayDecl(actualArray), pos: Context.currentPos()}
		return macro($a{actualArray} : Array<Dynamic>);
		#end
	}

	public static macro function has_comp(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro componentManager.has_component($idMacro, $diid);
		#end
	}

	public static macro function get_sure(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro componentManager.getComponent($idMacro, $diid);
		#end
	}

	public static macro function getRetInd(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:Expr) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro switch (componentManager.getComponentForID($idMacro, $diid)) {
			case Comp(c_capt):
				c_capt;
			default:
				return;
		}
		#end
	}

	public static macro function getRet(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:Expr,
			caseExpr:Expr, capture:Expr) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro switch (componentManager.getComponentForID($idMacro, $diid)) {
			case Comp($e{caseExpr}):
				$e{capture};
			default:
				return;
		}
		#end
	}

	#if macro
	static function checkNullExpr(expr:Expr) {
		return switch (expr.expr) {
			case EConst(CIdent(s)) if (s == s):
				trace(s);
				true;
			default:
				false;
		};
	}
	#end

	public static macro function remove_component(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro componentManager.removeComponent($idMacro, $diid);
		#end
	}

	public static macro function getOrAdd(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			cls:ExprOf<Class<Dynamic>>, args:Array<Expr>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		final typePath = switch (ClassToID.getInstanceTypeFromClass(cls)) {
			case TPath(tpath):
				tpath;
			default:
				throw "Something went very wrong";
		};
		return macro {
			final result = componentManager.getComponentForID($idMacro, $diid);
			if (result == NONE) {
				componentManager.addComponent($idMacro, new $typePath($a{args}), $diid);
			} else {
				cast result.getParameters()[0];
			}
		}
		#end
	}

	public static macro function add_component(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>,
			obj:ExprOf<Dynamic>) {
		#if macro
		final idMacro = ClassToID.idMacroObj(obj);
		return macro componentManager.addComponent($idMacro, $obj, $diid);
		#end
	}

	public static macro function implode(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>) {
		#if macro
		return macro componentManager.removeEntity($diid);
		#end
	}
}

class Component_Use {
	/**
		ID from component
	**/
	public static macro function idm(cls:ExprOf<deceptinfect.ecswip.Component>) {
		#if macro
		return macro $e{ClassToID.idMacroObj(cls)};
		#end
	}
}

class GEntCompat_Use {
	public static macro function get(gentCompat:ExprOf<deceptinfect.GEntCompat>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);

		final mac = macro $e{gentCompat}.id;
		// trace(mac);
		return macro componentManager.getComponentForID($idMacro, $mac);
		#end
	}
}

class GPlayerCompat_Use {
	public static macro function get(gentCompat:ExprOf<deceptinfect.GEntCompat.GPlayerCompat>,
			cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		final mac = macro $e{gentCompat}.id;
		// trace(mac);
		return macro componentManager.getComponentForID($idMacro, $mac);
		#end
	}
}
