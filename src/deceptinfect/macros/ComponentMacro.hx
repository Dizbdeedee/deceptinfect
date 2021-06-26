package deceptinfect.macros;

import haxe.macro.Context;

class ComponentMacro {
	#if macro
	public static function build() {
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass().get().name;
		var id = ClassToID.getIDStr(cls);
		if (Context.getLocalModule() == "deceptinfect.ecswip.ReplicatedComponent") return null;
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
			name: "componentName",
			access: [AFinal, APublic, AStatic, AInline],
			kind: FVar(macro:String, macro $v{cls}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "getComponentName",
			access: [APublic],
			kind: FFun({
				args : [],
				expr: macro return $v{cls}
			}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "compID",
			access: [AFinal, APublic, AStatic, AInline],
			kind: FVar(macro:deceptinfect.ecswip.ComponentManager.ComponentID<$typ>, macro $v{id}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "getCompID",
			access: [APublic],
			kind: FFun({
				args : [],
				expr: macro return $v{id}
			}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "getAddSignal",
			access: [APublic,AStatic,AInline],
			kind: FFun({
				args: [],
				expr: macro return cast ComponentManager.getAddSignal($v{id}),
				ret: macro : tink.CoreApi.Signal<deceptinfect.ecswip.ComponentManager.CompAddSignal<$typ>>
			}),
			pos : Context.currentPos()
		});
		fields.push({
			name: "getRemoveSignal",
			access: [APublic,AStatic,AInline],
			kind: FFun({
				args: [],
				expr: macro return cast ComponentManager.getRemoveSignal($v{id}),
				ret: macro : tink.CoreApi.Signal<deceptinfect.ecswip.ComponentManager.CompRemoveSignal<$typ>>
			}),
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
			// meta: [
			// 	{
			// 		name: ":keep",
			// 		pos: Context.currentPos()
			// 	}
			// ]
		});
		return fields;
	}
	#end
}
