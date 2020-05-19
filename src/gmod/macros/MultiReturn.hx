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
    @:persistent
    static var storage:Map<String,Bool> = [];
    static public function build():ComplexType {
        trace("lol");
        var type = Context.getLocalType();
        var cls = switch (type) {
            case TInst(_, [TInst(_.get() => c = {meta : _.has(":multiReturn") => true}, _)]):
                c;
            default:
                return null;
        }
        trace(cls.name);
        if (!storage.exists(cls.name)) {
            storage.set(cls.name,true);
            trace(cls.name);
            var anon:TypeDefinition = {
                pack: [],
                name: 'A_${cls.name}',
                pos: Context.currentPos(),
                kind: TypeDefKind.TDStructure,
                fields : []
            }
            var fieldArray = [];
            for (clsfield in cls.fields.get()) {
                fieldArray.push(classFieldToField(clsfield));
            }
            anon.fields = fieldArray;
            // Context.getLocalModule()
            Context.defineType(anon);
        }
        return null;
        // return TPath({pack : [],name : 'A_${cls.name}'});
    }
}
#end