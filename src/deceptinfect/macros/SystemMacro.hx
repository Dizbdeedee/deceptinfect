package deceptinfect.macros;

import haxe.macro.ExprTools;
import haxe.macro.TypeTools;
import haxe.macro.Context;

class SystemMacro {
	#if macro
	public static function build() {
		return null;
		// final fields = Context.getBuildFields();
		// final cls = Context.getLocalClass().get().name;
		// final localType = Context.getLocalType();
		// final clsType = switch (localType) {
		// 	case TInst(_.get() => typ, _):
		// 		typ;
		// 	default:
		// 		Context.error("SystemMacro: Not a class!",Context.currentPos());
		// }
		// final typ = Context.toComplexType(Context.getLocalType());
		// var mmmmacro = macro {
		// 	var typeCheck:deceptinfect.World = this;
		// 	return systemManager.getSystem($i{clsType.name});
		// }

		// var reeeturn = {
		// 	expr: EBlock(
		// 		[{expr: EReturn()}]
		// 	)
		// }
		// var expr:haxe.macro.Expr.ExprDef = E

		// fields.push({
		// 	name: "get",
		// 	access: [APublic,AStatic, AMacro],
		// 	pos: Context.currentPos(),
		//     kind: FFun({
		//         args: [],
		// 		expr: reeeturn
		// 		// expr: macro {
		// 		// 	return macro {
		// 		// 		var typeCheck:deceptinfect.World = this;
		// 		// 		return systemManager.getSystem($i{clsType.name});
		// 		// 	}
		// 		// }
		//         // expr: macro return SystemManager.getSystem($i{clsType.name}),

		//     })
		// });

		// return fields;
	}
	#end
}
