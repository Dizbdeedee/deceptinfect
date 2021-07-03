package deceptinfect.macros;

using Lambda;
#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import deceptinfect.macros.MacroUtil;
#end
class IterateEnt {
    #if macro
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

    public static macro function single(get:Expr,case_:Expr,func:Expr) {
        return macro null;
    }
    public static macro function iterGet(getArr:Expr, cases:Expr, func:Expr) {
		var name;
		var expr;

		switch (func) {
			case {expr: EFunction(_, {args: [{name: _argName}], expr: _expr})}:
				name = _argName;
				expr = _expr;
			case {expr: EFunction(_, {args: [], expr: _expr}), pos: pos}:
				name = renameVar(Context.getLocalTVars(), pos);
				expr = _expr;
			case {pos: pos}:
				Context.error("Incorrect format", pos);
			default:
				throw "hmm";
		}
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
