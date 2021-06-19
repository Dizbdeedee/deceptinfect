package deceptinfect.macros;

using Lambda;
#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end
class IterateEnt2 {
    #if macro
    static function blockToExprArr(block:haxe.macro.Expr):Array<Expr> {
        return switch (block) {
            case {expr: EBlock(exprs), pos: pos}:
                // trace(exprs);
                exprs;
            case {pos : pos}:
                Context.error("Not a block...",pos);
        }
    }

    static function insert(block:haxe.macro.Expr,... exprs:Array<Expr>) {
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

    

    static function comparisons(getArr:haxe.macro.Expr) {     
      
        final arr:Array<Expr> = switch (getArr) {
			case {expr: EArrayDecl(values), pos: pos}:
                values.mapi((i,x) -> switch (x) {
                    case x if (i == 0):
                        final id = ClassToID.idMacro(x);                        
                        blockToExprArr(macro {
                            var __lowest:Int = __compArr[$id].n;
                            var __lowest_comp = $id;
                        });
                       
                    case {expr: EConst(CIdent(_))} if (i != 0):
                        final id = ClassToID.idMacro(x);
                        blockToExprArr(macro {
                            __n = __compArr[$id].n;
                            if (__n < __lowest) {
                                __lowest = __n;
                                __lowest_comp = $id;
                            }
                        });
                    default:
                        Context.error("Nothing works here....",Context.currentPos());
                        [];
                }).flatten();
			case {pos : pos}:
				Context.error("Not a get array", pos);
				[];
		}
        return blockToExprArr(insert(macro {
            @:noCompletion var __n = 0;
            @:a(0) null;
        },arr));
       
    }

    static function if_statement(getArr:haxe.macro.Expr,name:String) {
        return switch (getArr) {
			case {expr: EArrayDecl(values), pos: pos}:
                values.map((x) -> {
                    final id = ClassToID.idMacro(x);
                    macro __compArr[$id].has_component($i{name}); 
                }).fold((cur, prev) -> 
                    if (prev == null) {
                        cur;
                    } else {
                        macro $prev && $cur;
                    }
                ,null);
			case {pos : pos}:
				Context.error("Not a get array", pos);
				macro null;
		}
        
    }

    static function switch_head(getArr:Expr,name:String) {
        return switch (getArr) {
			case {expr: EArrayDecl(values), pos: pos}:
                macro $a{values.map((x) -> {
                    final id = ClassToID.idMacro(x);
                    macro __compArr.get_component($id).get_component($i{name});
                })};
			case {pos : pos}:
				Context.error("Not a case array", pos);
				macro null;
		}
    }
    #end
    public static macro function iterGet(getArr:Expr, cases:Expr, func:Expr) {
		var name;
		var expr;

		switch (func) {
			case {expr: EFunction(_, {args: [{name: _argName}], expr: _expr})}:
				name = _argName;
				expr = _expr;
			case {expr: EFunction(_, {args: [], expr: _expr}), pos: pos}:
				name = IterateEnt.renameVar(Context.getLocalTVars(), pos);
				expr = _expr;
			case {pos: pos}:
				Context.error("Incorrect format", pos);
			default:
				throw "hmm";
		}
		// trace(getArr);
        final comparisons = comparisons(getArr);
        
        final block = macro {
            final __compArr = deceptinfect.ecswip.ComponentManager.components_3;
            @:a(0) null;
            final __lowestInt = __compArr[__lowest_comp].internal;
			for (__int_id in 1...__lowest) {
                final $name:deceptinfect.ecswip.ComponentManager.DI_ID = __lowestInt[__int_id];
                if ($e{if_statement(getArr,name)}) {
                    switch ($e{switch_head(getArr,name)}) {
                        case $cases:
                            $expr;
                        default:
                            null;
                    }
                }
			}
        }
        final expr:Expr = insert(block,comparisons);
		return expr;
	}
    
}
