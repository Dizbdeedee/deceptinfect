package gmod.macros;

#if (macro)
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.macro.ComplexTypeTools;
using haxe.macro.ExprTools.ExprArrayTools;

class OverrideHelper {
    
    static function isHook(x:Field):Bool {
        for (meta in x.meta) {
            if (meta.name == ":hook") {
                return true;
            }
        }
        return false;
    }

    static function isMultiReturn(x:Field) {
        return switch (x.kind) {
            case FFun({ret : _.toType() => z}):
                z.getClass()
        }  
    }
    public static function build():Array<Field> {
        var cls = Context.getLocalClass().get();
        
        if (cls.isExtern) {

            var fields = Context.getBuildFields();
            for (field in fields) {
                if (isHook(field)) {
                    field.access.remove(Access.APublic);
                    field.access.push(Access.APrivate);
                }
                if 
            }
            cls.meta.add(":native",[macro $v{"{} or a"}],Context.currentPos());
            
            
            return fields;
        }
        return null;
    }
}
#end