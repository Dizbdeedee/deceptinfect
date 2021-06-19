package deceptinfect.macros;

using haxe.macro.ExprTools;


class ForEntities {
	public static macro function forEnts(exprs:Array<haxe.macro.Expr>) {
		#if macro
		// final identifier = switch (x) {
		//     case null:
		// 	"ent";
		//     case {expr : EConst(CIdent(s))}:
		// 	s;

		// }
		return macro for (__x in 0...deceptinfect.ecswip.ComponentManager.entities) {
			final ent:DI_ID = __x;
			$a{exprs}
		}
		#end
	}

	public static macro function forEntsIdent(ident:haxe.macro.Expr, exprs:Array<haxe.macro.Expr>) {
		#if macro
		final ident = switch (ident) {
			case {expr: EConst(CIdent(s))}:
				s;
			default:
				throw "could not generate forents";
		}
		return macro for (__x in 0...entities) {
			final ent:DI_ID = __x;
			$a{exprs}
		}
		#end
	}
}
