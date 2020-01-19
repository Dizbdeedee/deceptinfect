package gmod.macros;

import sys.io.File;
import sys.FileSystem;
import haxe.macro.Type.TypedExpr;
import haxe.macro.Type.TVar;
import haxe.macro.Type.ClassType;
#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.TypeTools;
using haxe.macro.ExprTools;
using haxe.macro.TypedExprTools;
#end

private typedef FuncConstr = {
    args : Array<{v:TVar,value:Null<TypedExpr>}>,
    rtn : haxe.macro.Type,
    name : String
}
class GenerateHooksFile {
    
    static var buf = new StringBuf();
    #if macro

    public static function build():Array<Field> {
        var fields = Context.getBuildFields();
        var cls = Context.getLocalClass().get();
        var shitType = Context.getType("gmod.hooks.Gm");
        var superType = shitType.getClass();
        
        
        // var superType = cls.superClass.t.get();
        var array:Array<FuncConstr> = [];
        
        addFields(superType,array);
        // var hook = Context.toComplexType(Context.getType("Hook"));
        for (fc in array) {
            // var m = macro : gmod.Hooks.Hook<() -> Void>;
            
            
            // var typePath:TypePath = m.getParameters()[0];
            var args:Array<ComplexType> = [];
            var rtn:ComplexType = fc.rtn.toComplexType();
            for (arg in fc.args) {
                //trace(Context.toComplexType(arg.v.t));
                var complex = Context.toComplexType(arg.v.t);
                var name = "";
                var normalPath = switch (complex) {
                    case TPath(struct = {pack : ["gmod",_]}):
                        //trace(struct.name);
                        TPath({name : struct.name,pack : [] });
                    case p = TPath(_):
                        p;
                    default:
                        throw "nooo";
                }
                // var normalPath = TPath({
                //     name : "",
                //     pack : []
                // });
                var roomWithAView = TNamed(arg.v.name,normalPath);

                args.push(roomWithAView);
                // args.push();

            }

            
            var funcType = TFunction(args,rtn);
            var typeParams = [TypeParam.TPType(funcType)];
            
            var hookPath:TypePath = {
                name : "Hook",
                pack : [],
                params : typeParams,
            
                
            }
            var hookType = Context.toComplexType(Context.getType("gmod.Hooks.Hook"));
            var expr = macro new $hookPath($v{fc.name});
            var field:Field = {
                kind : FieldType.FVar(null,expr),
                name : fc.name,
                pos : Context.currentPos(),
                access: [Access.APublic,Access.AStatic,Access.AFinal,Access.AInline]
                
            }
            fields.push(field);
        }
        return fields;
    }

    public static function buildFile():Array<Field> {
        var cls = Context.getLocalClass().get();
        var superType = cls.superClass.t.get();
        var array:Array<FuncConstr> = [];
        
        addFields(superType,array);
        buf.add("package gmod;\n");
        buf.add("class Hooks {\n");
        
        for (fc in array) {
            buf.add('\tpublic static inline final ${fc.name} = new Hook<(${addArgs(fc.args)}) -> ${fc.rtn.toString()}>("${fc.name}");\n');
            // trace(fc.args[0].v.t);
        }
        buf.add("}");
        Context.onAfterGenerate(createFile);
        
       
        
        return null;
    }
    #end
    static function createFile() {
        trace(buf);
        FileSystem.createDirectory('temp');    
        File.saveContent("temp/Hooks.hx",buf.toString());
    }
    #if macro
    static function addArgs(args:Array<{v:TVar,value:Null<TypedExpr>}>):String {
        var argStr = new StringBuf();
        var x = 0;
        for (arg in args) {
            argStr.add('${arg.v.name}:${arg.v.t.toString()}');
            if (x != args.length - 1) {
                argStr.add(',');
            }
            x++;
        }
        return argStr.toString();
    }

    //recursivly get supertype
    public static function addFields(cls:ClassType,ar:Array<FuncConstr>) {
    //    trace(cls.statics.get());
        for (field in cls.fields.get()) {
            switch (field.expr()) {
                case null:
                case {expr : TFunction(tfunc)}:
                    ar.push({
                        args : tfunc.args,
                        rtn : tfunc.t,
                        name : field.name
                    });
                default:

            }
        }
    }
    #end
}

