package deceptinfect.macros;

import haxe.macro.Context;
class ReplicatedComponentMacro { 
    public static function build() {
        #if macro
        final fields = Context.getBuildFields();
        final cls = Context.getLocalClass().get().name;
        var id = ClassToID.getIDStr(cls);
        if (!Context.defined("server")) return null;
        
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
                default:
            }
        }
        return fields;

        #end
    }
}