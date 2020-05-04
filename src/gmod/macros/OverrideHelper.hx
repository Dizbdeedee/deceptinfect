package gmod.macros;

#if (macro)
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.macro.ComplexTypeTools;
using haxe.macro.ExprTools.ExprArrayTools;
using StringTools;
#end
@:keep @:keepInit
class OverrideHelper {
    #if macro   
    static function isHook(x:Field):Bool {
        for (meta in x.meta) {
            if (meta.name == ":hook") {
                return true;
            }
        }
        return false;
    }

    static function handleMultiReturn(x:Field) {
        switch (x.kind) {
            case func = FFun({ret : _.toType() => _.toString() => _.endsWith("Return") => true}):
                func.getParameters()[0].ret = (macro : Dynamic);
                // func.ret = (macro : Dynamic);
            default:
        }  
    }
    public static function build():Array<Field> {
        var cls = Context.getLocalClass().get();
        //trace('${cls.isExtern}:${cls.name}');
        if (cls.isExtern) {
            //trace(cls.name);
            var fields = Context.getBuildFields();
            for (field in fields) {
                // if (isHook(field)) {
                //     field.access.remove(Access.APublic);
                //     field.access.push(Access.APrivate);
                // }
                handleMultiReturn(field);
            }
            // cls.meta.add(":native",[macro $v{"{} or a"}],Context.currentPos());
            return fields;
        }
        return null;
    }
    #end
}
