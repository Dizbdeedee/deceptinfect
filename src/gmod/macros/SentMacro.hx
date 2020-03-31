package gmod.macros;

#if (macro)
import gmod.macros.InitMacro;
import sys.FileSystem;
import sys.io.File;
import haxe.macro.Type.ClassType;
import haxe.macro.Context;
import haxe.macro.Expr;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using haxe.macro.ComplexTypeTools;
using haxe.macro.ExprTools.ExprArrayTools;

private typedef Generate = {
    genName : String,
    ?entLuaType : String,

    funcs : Array<Field>,
    properties : {},
    weapon : Bool
}


class SentMacro {

    static var generate:Array<Generate> = [];
    static var onGenerate = false;
    public static function build(?weapon=false):Array<Field> {
        var properties = null;
        var cls = Context.getLocalClass().get();
        var type = Context.toComplexType(Context.getLocalType());
        var fields = Context.getBuildFields();
        var overridename;
        
        
        if (cls.meta.has(":expose")) {
            var param = cls.meta.extract(":expose")[0].params[0];
            switch(param.expr) {
                case EConst(c):
                    switch (c) {
                        case CString(s, kind):
                            overridename = s;
                        default:
                    
                    }
                default:
            }
        } else {
            overridename = cls.name;
        }
        var _ent = cls.findField("self");
        if (_ent == null) {
            throw "No self found";
        }
        var entType = Context.toComplexType(_ent.type);
        var fOverride:Array<Field> = [];
        var exprBuffer = macro {}
        for (field in fields) {
            switch [field.name,field.kind] {
                case ["properties",FVar(_, e)]:
                    try {
                        properties = e.getValue();
                    } catch (x:Dynamic) {
                        trace("Unable to get the value of properties");
                        return null;
                    }
                case [_,FFun(f)]:
                    switch (field.access) {
                        case [Access.AStatic]:
                        case [Access.AOverride]:
                            fOverride.push(field);
                        default:
                            if (field.meta.filter((f) -> return f.name == ":entExpose").length > 0) {
                                fOverride.push(field);
                            }
                    }
                default:
            }
        }
        if (properties == null) {
            throw "No ent propeties found";
        }

        var curEnt:FunctionArg = {
            name : "curEnt",
            type : entType,
        }
        var constructerFunc:Function = {
            args: [curEnt],
            expr : macro {untyped self = curEnt;},
            ret : null,
        }
        fields.push({
            name : "new",
            pos : Context.currentPos(),
            kind : FieldType.FFun(constructerFunc),
            access : [Access.APrivate]
        });
        var genName;
        if (!cls.meta.has(":expose")) {
            var newname = '${cls.name}';
            cls.meta.add(":expose",[macro $v{cls.name.toLowerCase()}],Context.currentPos());
            genName = newname.toLowerCase();
        } else {
            var expr = cls.meta.extract(":expose")[0].params[0];
            switch (expr.expr) {
                case EConst(CString(s, _)):
                    genName = s.toLowerCase();
                default:
                    genName = cls.name.toLowerCase();
            }
        }
        var entLuaType;
        if (!weapon) {
            var type = cls.findField("TYPE");
            entLuaType = switch (type.expr().expr) {
                case TConst(TString(s)):
                    s;
                default:
                    throw "no TYPE for ENT definition";
            }
        }
        generate.push({genName : genName,entLuaType : entLuaType,funcs : fOverride,properties : properties,weapon:weapon});
        if (!onGenerate) {
            Context.onAfterGenerate(afterGenerate);
            onGenerate = true;
        }
        cls.meta.add(":keep",[],Context.currentPos());
        return fields;
    }
    
    
    static function afterGenerate() {
        var baseStorage = InitMacro.baseEntFolder;
        if (baseStorage == null) {
            trace("no base storage to generate entity lua files");
            return;
        }
        
        var exportName = InitMacro.exportName;
        for (gen in generate) {
            var baseIdent:String;
            var _baseStorage:String;
            if (gen.weapon) {
                _baseStorage = '$baseStorage/weapons';
                baseIdent = "SWEP";
            } else {
                _baseStorage = '$baseStorage/entities';
                baseIdent = "ENT";
            }
            var filebuf = new StringBuf();
            var dyn:haxe.DynamicAccess<Dynamic> = cast gen.properties;
            function addy(key:String,val:Dynamic,?table = "") {
                if (Reflect.isObject(val) && Type.getClass(val) == null) {
                    filebuf.add('$key = {\n');
                    var structIterate:haxe.DynamicAccess<Dynamic> = val;
                    for (key_2 => val_2 in structIterate) {
                        addy(key_2,val_2,",");
                    }
                    filebuf.add('}$table\n');                    
                } else if (Std.is(val,String)) {
                    filebuf.add('$key = "$val"$table\n');
                } else {
                    filebuf.add('$key = $val$table\n');
                }
            }
            for (key => val in dyn) {
                addy('$baseIdent.$key',val);
            }
            if (!gen.weapon) {
                filebuf.add('$baseIdent.Type = "${gen.entLuaType}"\n');
            }
            #if server
                filebuf.add("AddCSLuaFile(\"cl_init.lua\")\n");
            #end
            #if client
                filebuf.add('\nfunction $baseIdent:Think(...)\n');
                filebuf.add('\tif (not self._gHaxeInit) then\n');
                filebuf.add('\t\tself._gHaxeBurrow:Initalize()\n');
                filebuf.add('\tend\n');
                filebuf.add('\tself._gHaxeBurrow:Think(...)\n');
                filebuf.add('end\n\n');
            #end
            filebuf.add('\nfunction $baseIdent:Initialize(...)\n');
            filebuf.add('\tlocal ent = $exportName.${gen.genName}.new(self)\n');
            filebuf.add("\tself._gHaxeBurrow = ent\n");
            filebuf.add("\tself._gHaxeBurrow:Initialize()\n");
            #if client
                filebuf.add("\tself._gHaxeInit = true\n");
            #end
            filebuf.add('end\n\n');
            for (field in gen.funcs) {
                switch (field.name) {
                    case "Initialize": 
                        continue;               
                    #if client
                    case "Think":
                        continue;
                    #end
                    default:
                }
                filebuf.add('function $baseIdent:${field.name}(...)\n');
                filebuf.add('\tself._gHaxeBurrow:${field.name}(...)\n');
                filebuf.add('end\n\n');
            }
            FileSystem.createDirectory('$_baseStorage/${gen.genName}');
            #if client
                File.saveContent('$_baseStorage/${gen.genName}/cl_init.lua',filebuf.toString());
            #elseif server
                File.saveContent('$_baseStorage/${gen.genName}/init.lua',filebuf.toString());
            #end
        }
    }
}

#end