package deceptinfect.macros;

import haxe.macro.Context;

class SystemMacro {
    #if macro
	public static function build() {
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass().get().name;
		final clsType = switch (Context.getLocalType()) {
			case TInst(_.get() => typ, _):
				typ;
			default:
				throw "not a class";
		}
		final typ = Context.toComplexType(Context.getLocalType());
		fields.push({
			name: "get",
			access: [APublic, AStatic, AInline],
			pos: Context.currentPos(),
            kind: FFun({
                args: [],
                expr: macro return SystemManager.getSystem($i{clsType.name}),
                
            })
		});
	
		return fields;
	}
	#end
}