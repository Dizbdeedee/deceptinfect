package deceptinfect.macros;

import haxe.macro.Context;
using Lambda;
class ReplicatedComponentMacro { 
    public static function build() {
        #if macro
        final fields = Context.getBuildFields();
        final cls = Context.getLocalClass().get();
        var id = ClassToID.getIDStr(cls.name);

        if (!Context.defined("server")) return null;
        
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
                    case FFun({expr : exprDef = {expr: EBlock(exprArr)}}):
                        final finalExpr = macro {@:a(0) null; replicated = $expr;}
                        exprDef.expr = IterateEnt2.insert(finalExpr,exprArr).expr;
                    default:
                }
            }
        }
        
        for (field in fields) {
            switch [field.kind,field.meta] {
                case [FVar(t, e),[{name: ":s"}]]:
                    trace(field.name);
                    field.kind = FProp("default","set",t,e);
                    fields.push({
                        name: 'set_${field.name}',
                        kind: FFun({
                            args: [{
                                name: "set"
                            }],
                            expr: macro {
                                fieldsChanged = true;
                                return $i{field.name} = set;
                            }
                        }),
                        access: [AInline,AExtern],
                        pos: Context.currentPos()
                    });
                case [FProp(_, "set", t, e),[{name : ":s"}]]:
                    final setFun = fields.find((findField) -> findField.name == 'set_${field.name}');
                    if (setFun == null) {
                        trace('Could not find set function... ${field.name}');
                        return null;
                    }
                    switch (setFun.kind) {
                        case FFun({expr: exprDef = {expr: EBlock(exprArr)}}):
                            final finalExpr = macro {fieldsChanged = true; @:a(0) null;}
                            
                            exprDef.expr = IterateEnt2.insert(finalExpr,exprArr).expr;
                        default:
                            trace("not a set expr");
                    }
                default:
            }
        }
        return fields;

        #end
    }
}