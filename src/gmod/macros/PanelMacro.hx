package gmod.macros;

#if (macro)
import haxe.macro.Type.ClassType;
import haxe.macro.Type.ClassField;
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.macro.ExprTools.ExprArrayTools;

private typedef Generate = {
    genName : String,
    entLuaType : String,

    funcs : Array<Field>,
}
#end
class PanelMacro {
    #if macro
    static var generate:Array<Generate> = [];
    static var onGenerate = false;
    

    public static function getSuperFields(c:ClassType):Array<ClassField> {
        trace(c.name);
        var superc = c.superClass;
        var fields = c.fields.get();
        if (superc != null) {
            var _superc = superc.t.get();
            return fields.concat(getSuperFields(_superc));
        } else {
            return fields;
        }
    }

    public static function argToFuncArg(x:{name: String,opt : Bool,t: haxe.macro.Type}):FunctionArg {
        var arg:FunctionArg = {
            name: x.name,
            opt: x.opt,
            type : Context.toComplexType(x.t)
        }
        return arg;
    }
    public static function classFuncToField(x:ClassField):Field {
        
        var _args:Array<FunctionArg> = [];
        var exprArgs = [];
        var _ret:haxe.macro.Type;
        switch (x.type) {
            case TFun(args, ret):
                exprArgs = [];    
                for (arg in args) {
                    _args.push(argToFuncArg(arg));
                    exprArgs.push(macro $i{arg.name});
                }
                
                _ret = ret;
            default:
                throw "unhandled yet...";
        }
        
        // trace(_ret);
        var name = x.name;
        
        var func:Function = switch (_ret) {
            case TAbstract(_.get().name => "Void", params):
                
                {
                    args : _args,
                    ret :  Context.toComplexType(_ret),
                    expr : macro self.$name($a{exprArgs})
                };
            default:

                {
                    args : _args,
                    ret :  Context.toComplexType(_ret),
                    expr : macro return self.$name($a{exprArgs}),
                };
        }
        // var filter = function (msg:Message) {
        //     return switch (msg){
        //         case Warning(msg, pos):
        //             trace(msg);
        //             true;

        //         default:
        //             false;
        //     }
        // }
        // if (filter(Context.getMessages()[0])) {
        //     Context.getMessages().remove(Context.getMessages()[0]);
        // }
        
        
        var access:Array<Access> = switch (x.meta.has(":hook")) {
            case false:
                [Access.AOverride,Access.AFinal,Access.APublic];
            default:
                [Access.AOverride,Access.APrivate];
        }
        var field:Field = {
            kind : FieldType.FFun(func),
            name : x.name,
            pos : Context.currentPos(),
            doc : x.doc,
            access: access
            
        }

        return field;

    }
    public static function build():Array<Field> {
        var cls = Context.getLocalClass().get();
        var type = Context.toComplexType(Context.getLocalType());
        var fields = Context.getBuildFields();
        
        var overridename;
        
        var targetClass = cls.interfaces[0].params[0].getClass();
        var nuClass = macro class {
            public function lolTest():Int {
                return 2;
            }
        }
        

        

        trace("meme");

        for (stuff in getSuperFields(targetClass)) {
            fields.push(classFuncToField(stuff));
        }
        
        
    


        return fields;
    }
    #end
}

