package gmod.macros;
import haxe.macro.Expr.ComplexType;
#if macro

import sys.io.File;
import sys.FileSystem;
import haxe.macro.Context;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
import haxe.macro.Expr.Field;
class GamemodeTXT {
    static var struct:haxe.DynamicAccess<Dynamic>;
    static var afterGen:Bool = false;
    public static function build():Array<Field> {
        #if server
        var fields = Context.getBuildFields();
        for (field in fields) {
            switch [field.name,field.kind] {
            case ["properties",FVar(_, e)]:
                try {
                    struct = e.getValue();
                    break;
                } catch (x:Dynamic) {
                    trace("Could not get properties value");
                    return null;
                }
            default:
            }
            
        }
        if (!afterGen) {
            Context.onAfterGenerate(generateTXT);
            afterGen = true;
        }
        #end
        return null;
    }



    static function generateTXT() {
        var strBuffer = new StringBuf();
        var gamemodeName = Context.definedValue("gamemode");
        var addonName = Context.definedValue("addonName");
        strBuffer.add('"$gamemodeName"\n{\n');
        for (key => val in struct) {
            switch (key) {
            case "settings":
                strBuffer.add('\t"settings"\n\t{\n');
                var id = 1;
                var _val:Array<Dynamic> = val;
                for (setting in _val) {
                    strBuffer.add('\t\t$id\n\t\t{\n');
                    var _setting:haxe.DynamicAccess<Dynamic> = setting;
                    for (key_2 => val_2 in _setting) {
                        switch (key_2) {
                        case "_default":
                            key_2 = "default";
                        default:
                        }
                        strBuffer.add('\t\t\t"$key_2"\t\t"$val_2"\n');
                    }
                    strBuffer.add('\t\t}\n');
                    id++;
                }
                strBuffer.add('\t}\n');
            default:
                strBuffer.add('\t"$key"\t\t"$val"\n');
            }
        }
        strBuffer.add('}');
        File.saveContent('generated/$addonName/gamemodes/$gamemodeName/${gamemodeName}.txt',strBuffer.toString());
    }
}
#end