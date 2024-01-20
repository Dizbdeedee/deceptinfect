package deceptinfect.macros;

import haxe.macro.Context;

using Lambda;

import deceptinfect.macros.MacroUtil;

class ReplicatedComponentMacro {
	public static function build() {
		#if macro
		final fields = Context.getBuildFields();
		final cls = Context.getLocalClass()
			.get();
		var id = ClassToID.getIDStr(cls.name);

		if (!Context.defined("server"))
			return null;

		if (cls.meta != null && cls.meta.has(":replicated")) {
			var expr = cls.meta.extract(":replicated")[0].params[0];
			var fieldNew = fields.find((findField) -> findField.name == "new");
			if (fieldNew == null) {
				fields.push({
					name: "new",
					kind: FFun({
						args: [],
						expr: macro {super(); replicated = $expr;},
					}),
					pos: Context.currentPos()
				});
			} else {
				switch (fieldNew.kind) {
					case FFun({expr: exprDef = {expr: EBlock(exprArr)}}):
						final finalExpr = macro {@:a(0) null; replicated = $expr;}
						exprDef.expr = insert(finalExpr, exprArr).expr;
					default:
				}
			}
		}

		for (field in fields) {
			switch [field.kind, field.meta] {
				case [FVar(t, e), [{name: ":s"}]]:
					field.kind = FProp("default", "set", t, e);
					fields.push({
						name: 'set_${field.name}',
						kind: FFun({
							args: [
								{
									name: "set"
								}
							],
							expr: macro {
								var result = $i{field.name} = set;
								fieldsChanged = true;
								return result;
							}
						}),
						// access: [AInline,AExtern],
						pos: Context.currentPos()
					});
				case [FProp(_, "set", t, e), [{name: ":s"}]]:
					Context.error("TODO, macro stuff", field.pos);
					throw "TODO";
				default:
			}
		}
		return fields;
		#end
	}
}
