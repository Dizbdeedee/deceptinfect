package deceptinfect.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.ExprTools;

import haxe.macro.Type;
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
				Context.toComplexType(Context.getType(t.get().module));
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
			// trace('init $type with $ourid');
			classMap.set(type, ourid);
			ourid;
		} else {
			classMap.get(type);
		}
	}
	#end
}


class DI_ID_Use {
	public static macro function get(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $diid);
		#end
	}

	public static macro function get_2(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro deceptinfect.ecswip.ComponentManager.getComponent($idMacro,$diid);
		#end
	}

	
	public static macro function replicate(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>,replState) {
		#if macro
		
		#end
	}

	

	public static macro function getAll(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, arr:Array<Expr>) {
		#if macro
		final actualArray = arr.map((e) -> {
			final idMacro = ClassToID.idMacro(e);
			macro deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $diid);
		});
		// switch (macro switch ([1,2,"apple"]) {
		// 	case [1,2,"apple"]:
		// 	default:
		// 	}) {
		// case {expr : ESwitch({expr : EArrayDecl(a)},_,_)}:
		//     trace(a);
		// case x:
		//     trace(x);
		//     throw "umm";
		// }
		final expr = {expr: EArrayDecl(actualArray), pos: Context.currentPos()}
		return macro($a{actualArray} : Array<Dynamic>);
		#end
	}

	public static macro function has_comp(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro deceptinfect.ecswip.ComponentManager.has_component($idMacro, $diid);
		#end
	}

	public static macro function get_sure(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro deceptinfect.ecswip.ComponentManager.getComponentForIDSure($idMacro, $diid);
		#end
	}

	public static macro function getRetInd(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:Expr) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro switch (deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $diid)) {
			case Comp(c_capt):
				c_capt;
			default:
				return;
		}
		#end
	}

	public static macro function getRet(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:Expr, caseExpr:Expr, capture:Expr) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro switch (deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $diid)) {
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

	public static macro function remove_component(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		return macro deceptinfect.ecswip.ComponentManager.removeComponent($idMacro, $diid);
		#end
	}

	public static macro function getOrAdd(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, cls:ExprOf<Class<Dynamic>>, args:Array<Expr>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		final typePath = switch (ClassToID.getInstanceTypeFromClass(cls)) {
			case TPath(tpath):
				tpath;
			default:
				throw "Something went very wrong";
		};
		return macro {
			final result = deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $diid);
			if (result == NONE) {
				deceptinfect.ecswip.ComponentManager.addComponent($idMacro, new $typePath($a{args}), $diid);
			} else {
				cast result.getParameters()[0];
			}
		}
		#end
	}

	public static macro function add_component(diid:ExprOf<deceptinfect.ecswip.ComponentManager.DI_ID>, obj:ExprOf<Dynamic>) {
		#if macro
		final idMacro = ClassToID.idMacroObj(obj);
		return macro deceptinfect.ecswip.ComponentManager.addComponent($idMacro, $obj, $diid);
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
		return macro deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $mac);
		#end
	}
}

class GPlayerCompat_Use {
	public static macro function get(gentCompat:ExprOf<deceptinfect.GEntCompat.GPlayerCompat>, cls:ExprOf<Class<Dynamic>>) {
		#if macro
		final idMacro = ClassToID.idMacro(cls);
		final mac = macro $e{gentCompat}.id;
		// trace(mac);
		return macro deceptinfect.ecswip.ComponentManager.getComponentForID($idMacro, $mac);
		#end
	}
}