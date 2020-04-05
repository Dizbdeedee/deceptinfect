package gmod.macros;

import haxe.macro.Expr;
import haxe.macro.Context;

class PanelMacroOverride {

    public static function build():Array<Field> {
        #if macro
        var fields = Context.getBuildFields();
        var exprAddToTable:Array<Expr> = [];
        var exprInit:Array<Expr> = [];
        var superType = switch (Context.getLocalClass().get().superClass) {
            case {params : p,t : _.get() => supercls}:
                supercls;
            default:
                return null;
        }
        
        var classname = cls.name;
        exprBuffer.push(macro var PANEL = lua.Table.create());
        var overrideninit = false;
        for (field in fields) {
            switch (field.kind) {
                case FFun(f):
                    if (field.access.indexOf(Access.AOverride) > -1 ||
                        field.meta.filter(f -> f.name == "exposePANEL").length > 0
                        ) {
                        var name = field.name;
                        if (name == "Init") {
                            overrideninit = true;
                            var str = 'PANEL.$name = function(dis,...) dis.gHaxeInit = {0}(dis) {1}:$name(...) end';
                            exprBuffer.push(macro untyped __lua__($v{str},this.new,this));
                        } else {
                            var str = 'PANEL.$name = function(_,...) return {0}:$name(...) end';
                            exprBuffer.push(macro untyped __lua__($v{str},this));
                        }
                        
                    }
                default:
            }
        }
        if (!overrideninit) {
            exprBuffer.push(macro untyped __lua__("PANEL.Init = function (dis,...) dis.gHaxeInit = {0}(dis)",this.new));
        }
        var supername = superType.name;
        exprBuffer.push(macro gmod.libs.VguiLib.Register($v{classname},PANEL,$v{supername}));
        var _cls = macro class Derka {

            public static function register() {

            }

        }
    
        (_cls.fields[0].kind.getParameters()[0]:Function).expr = macro $b{exprBuffer};
        fields.push(_cls.fields[0]);
        return fields;
        #else
        return null;
        #end
    }
    
}