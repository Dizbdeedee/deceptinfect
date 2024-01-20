package deceptinfect.macros;

import haxe.macro.Context;

class ComponentMacro {
	#if macro
	static var hookid:Int = 0;

	public static function build() {
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass()
			.get();
		if (Context.getLocalModule() == "deceptinfect.ecswip.ReplicatedComponent")
			return null;
		var id = ClassToID.getIDStr(cls.name);
		final clsType = switch (Context.getLocalType()) {
			case TInst(_.get() => typ, _):
				typ;
			default:
				Context.error("Not a class", Context.currentPos());
		}
		final typ = Context.toComplexType(Context.getLocalType());
		final initexpr = macro gmod.libs.HookLib.Add("di_createComponentsTable",
			$v{Std.string(hookid++)},
			(ct:deceptinfect.ecswip.ComponentManager.ComponentStorage) -> ct.initComponent($v{id}
				, $v{clsType.name}));
		fields.push({
			name: "componentName",
			access: [AFinal, APublic, AStatic, AInline],
			kind: FVar(macro :String, macro $v{cls.name}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "getComponentName",
			access: [APublic],
			kind: FFun({
				args: [],
				expr: macro return $v{cls.name}
			}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "compID",
			access: [AFinal, APublic, AStatic, AInline],
			kind: FVar(macro :deceptinfect.ecswip.ComponentManager.ComponentID<$typ>,
				macro $v{id}),
			pos: Context.currentPos()
		});
		fields.push({
			name: "getCompID",
			access: [APublic],
			kind: FFun({
				args: [],
				expr: macro return $v{id}
			}),
			pos: Context.currentPos()
		});
		// fields.push({
		//     name: "getAddSignal",
		//     access: [APublic,AStatic,AInline],
		//     kind: FFun({
		//         args: [],
		//         expr: macro return cast deceptinfect.ecswip.ComponentManager.getAddSignal($v{id}),
		//         ret: macro : tink.CoreApi.Signal<deceptinfect.ecswip.ComponentManager.CompAddSignalData<$typ>>
		//     }),
		//     pos : Context.currentPos()
		// });
		// fields.push({
		//     name: "getRemoveSignal",
		//     access: [APublic,AStatic,AInline],
		//     kind: FFun({
		//         args: [],
		//         expr: macro return cast deceptinfect.ecswip.ComponentManager.getRemoveSignal($v{id}),
		//         ret: macro : tink.CoreApi.Signal<deceptinfect.ecswip.ComponentManager.CompRemoveSignalData<$typ>>
		//     }),
		//     pos: Context.currentPos()
		// });
		fields.push({
			name: "__init__",
			access: [AStatic],
			kind: FFun({
				args: [],
				expr: initexpr,
				ret: null
			}),
			pos: Context.currentPos(),
		});
		return fields;
	}
	#end
}
