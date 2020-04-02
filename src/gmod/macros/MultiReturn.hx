package gmod.macros;
#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;

class MultiReturn {
    
    static function classFieldToField(x:ClassField):Field {
        return {
            name: x.name,
            kind: FieldType.FVar(Context.toComplexType(x.type)),
            pos: Context.currentPos(),
            doc : x.doc,
        }
    }
    static public function build():ComplexType {
        var type = Context.getLocalType();
        var cls;
        switch (type) {
            case TInst(_, [TInst(_.get() => c = {meta : _.has(":multiReturn") => true}, _)]):
                cls = c;
            default:
        }

        var anon:TypeDefinition = {
            pack: [],
            name: 'A_${cls.name}',
            pos: Context.currentPos(),
            kind: TypeDefKind.TDStructure,
            fields : []
        }
        var abs = macro class {

        }
        var fieldArray = [];
        for (clsfield in cls.fields.get()) {
            fieldArray.push(classFieldToField(clsfield));
        }
        anon.fields = fieldArray;
        return null;
    }
}
#end