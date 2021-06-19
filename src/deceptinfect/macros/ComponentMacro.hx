package deceptinfect.macros;

import haxe.macro.Context;

class ComponentMacro {
	#if macro
	public static function build() {
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass().get().name;
		var id = ClassToID.getIDStr(cls);
		// trace(Context.getLocalType());
		final clsType = switch (Context.getLocalType()) {
			case TInst(_.get() => typ, _):
				typ;
			default:
				throw "not a class";
		}
		final typ = Context.toComplexType(Context.getLocalType());
		// trace('init $cls with $id');
		final initexpr = macro deceptinfect.ecswip.ComponentManager.initComponent($v{id},$v{clsType.name});
		fields.push({
			name: "compID",
			access: [AFinal, APublic, AStatic, AInline],
			kind: FVar(macro:deceptinfect.ecswip.ComponentManager.ComponentID<$typ>, macro $v{id}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "__init__",
			access: [AStatic],
			kind: FFun({
				args: [],
				expr: initexpr,
				ret: null
			}),
			pos: Context.currentPos(),
			meta: [
				{
					name: ":keep",
					pos: Context.currentPos()
				}
			]
		});
		return fields;
	}
	#end
}
