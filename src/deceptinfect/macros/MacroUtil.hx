package deceptinfect.macros;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;

using Lambda;

function insert(block:haxe.macro.Expr,... exprs:Array<Expr>) {
    return switch (block) {
        case {expr: EBlock(blExp), pos : pos}:
            {expr : EBlock(blExp.fold((curExpr,newBlock:Array<Expr>) -> 
                switch curExpr {
                    case {expr: EMeta({name: ":a", params : [{expr: EConst(CInt(n))}]}, {expr : attached})} if (Std.parseInt(n) != null):
                        switch (attached) {
                            case EConst(CIdent("null")):
                                newBlock.concat(exprs[Std.parseInt(n)]);
                            default:
                                Context.error("I warned you dawg... i told you",pos);
                        }
                    default:
                        newBlock.push(curExpr);
                        newBlock;
                }
            ,[])), pos : pos};
        case {pos : pos}:
            Context.error("Not a block...",pos);        
    }   
}

function renameVar(map:Map<String, Dynamic>, pos:haxe.macro.Expr.Position) {
    var name = "ent";
    if (!map.exists(name)) {
        return name;
    }
    var success = false;
    var tries = 1;
    while (tries < 100) {
        if (!map.exists(name + tries)) {
            success = true;
            break;
        }
        tries++;
    }
    return if (!success) {
        Context.error("Could not rename var..?", pos);
        throw "woah";
    } else {
        return name + tries;
    }
}

function blockToExprArr(block:haxe.macro.Expr):Array<Expr> {
    return switch (block) {
        case {expr: EBlock(exprs), pos: pos}:
            exprs;
        case {pos : pos}:
            Context.error("Not a block...",pos);
    }
}

#end