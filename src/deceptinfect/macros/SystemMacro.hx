package deceptinfect.macros;

import haxe.macro.Context;

class SystemMacro {
    #if macro
	public static function build() {
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass().get().name;
		var id = ClassToID.getIDStr(cls);
		// if (Context.getLocalModule() == "deceptinfect.ecswip.ReplicatedComponent") return null;
		// trace(Context.getLocalType());
		final clsType = switch (Context.getLocalType()) {
			case TInst(_.get() => typ, _):
				typ;
			default:
				throw "not a class";
		}
		final typ = Context.toComplexType(Context.getLocalType());
		// trace('init $cls with $id');
		// final initexpr = macro deceptinfect.ecswip.ComponentManager.initComponent($v{id},$v{clsType.name});
		fields.push({
			name: "get",
			access: [AFinal, APublic, AStatic, AInline],
			pos: Context.currentPos(),
            kind: FFun({
                args: [],
                expr: macro return SystemManager.getSystem($v{clsType.name}),
                
            })
		});
	
		return fields;
	}
	#end
}