package deceptinfect.macros;
#if macro
import haxe.macro.Expr;
import haxe.macro.Context;

#end
class IterateEnt {

    
    public static macro function iter(methods:Expr,cases:Expr,func:Expr) {
        var name;
        var expr;
        switch (func) {
            case {expr: EFunction(FArrow, {args: [{name: _argName}], expr: _expr})}:
                name = _argName;
                expr = _expr;
            default:
                Context.error("Incorrect format",Context.currentPos());

        }
        return macro {
            for ($i{name} in entities) {
                switch ($methods) {
                    case $cases:
                        $expr;
                    default:
                        $i{name};

                }
            }
        }
    }

    public static macro function m_getAll(ident:ExprOf<DI_ID>,getArr:Expr,caseArr:Expr,func:Expr) {
        final varname = switch (Context.typeExpr(ident)) {
            // case {expr : EConst(CIdent(s))}:
            //     s;
            case {expr: TLocal({name: n}), pos: pos}:
                n;
            case {pos: pos}:
                Context.error("Not an identifer...",pos);
                throw "...";
            default:
                throw "Huh?";

        }
        // var name;
        var expr;
        switch (func) {
            case {expr: EFunction(FArrow, {args: [], expr: _expr})}: //{name: _argName}
                // name = _argName;
                expr = _expr;
            default:
                Context.error("Incorrect format",Context.currentPos());
                throw "Nope";

        }
        final getExpr = getArrToExpr(getArr,varname);
        final cases = caseArrToExpr(caseArr);
        return macro switch ($getExpr) {
                case $cases:
                    $expr;
                default:
                    null;
        };
    }
    #if macro
    static function getArrToExpr(getArr:Expr,name:String) {
        return switch (getArr) {
            case {expr: EArrayDecl(values), pos : pos}:
                {expr : EArrayDecl(values.map((x) -> 
                    switch (x) {
                        case {expr: EConst(CIdent(_))}:
                            macro $i{name}.get($x);
                        default:
                            x;
                    }
                    
                )), pos : pos};
            default:
                Context.error("Nope",Context.currentPos());
                return macro null;
        }
    }

    static function caseArrToExpr(caseArr:Expr) {
        return switch (caseArr) {
            case {expr : EArrayDecl(values), pos : pos}:
                {expr : EArrayDecl(values.map((val) -> {
                    // trace(val);
                    return switch (val) {
                        case ident = {expr : EConst(CIdent(_))}:
                            macro Comp($ident);
                        default:
                            val;
                    }
                })), pos : pos};
            default:
                Context.error("Nope",Context.currentPos());
                throw "Garbage";
        }
    }

    #end

    public static macro function iterGet(getArr:Expr,cases:Expr,func:Expr) {
        var name;
        var expr;
        switch (func) {
            case {expr: EFunction(FArrow, {args: [{name: _argName}], expr: _expr})}:
                name = _argName;
                expr = _expr;
            default:
                Context.error("Incorrect format",Context.currentPos());

        }
        final getExprs:haxe.macro.Expr = getArrToExpr(getArr,name);
        final cases:haxe.macro.Expr = caseArrToExpr(cases);


        return macro {
            for ($i{name} in entities) {
                switch ($getExprs) {
                    case $cases:
                        $expr;
                    default:
                        $i{name};

                }
            }
        }
    }

}