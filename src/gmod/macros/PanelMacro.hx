package gmod.macros;

import gmod.macros.InitMacro;
import sys.FileSystem;
import haxe.iterators.StringKeyValueIteratorUnicode;
import haxe.rtti.CType.Classdef;
import haxe.macro.Type.Ref;
import sys.io.File;
import haxe.macro.Type.ClassType;
import haxe.macro.Type.ClassField;
#if (macro)
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
class PanelMacro {

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
        var _ret:haxe.macro.Type;
        switch (x.type) {
            case TFun(args, ret):
                for (arg in args) {
                    _args.push(argToFuncArg(arg));
                }
                _ret = ret;
            default:
                throw "unhandled yet...";
        }
        
        // trace(_ret);
        
        var func:Function = switch (_ret) {
            case TAbstract(_.get().name => "Void", params):
                {
                    args : _args,
                    ret :  Context.toComplexType(_ret),
                    expr : macro {}
                };
            default:

                {
                    args : _args,
                    ret :  Context.toComplexType(_ret),
                    expr : macro return null,
                };
        }
        var access:Array<Access> = switch (x.meta.has(":hook")) {
            case false:
                [Access.AFinal,Access.APublic];
            default:
                [];
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
}

#end