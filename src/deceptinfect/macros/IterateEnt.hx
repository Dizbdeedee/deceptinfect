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

    public static function if_statement(getArr:haxe.macro.Expr,name:String) {
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

    public static function switch_head(getArr:Expr,name:String) {
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
        // var name;
		// var expr;
        // switch (func) {
		// 	case {expr: EFunction(_, {args: [{name: _argName}], expr: _expr})}:
		// 		name = _argName;
		// 		expr = _expr;
		// 	case {expr: EFunction(_, {args: [], expr: _expr}), pos: pos}:
		// 		name = renameVar(Context.getLocalTVars(), pos);
		// 		expr = _expr;
		// 	case {pos: pos}:
		// 		Context.error("Incorrect format", pos);
		// 	default:
		// 		throw "hmm";
		// }
        // final block = macro {
        //     final $name = deceptinfect.ecswip.ComponentManager.components_3[ClassToID.idMacro($get)].internal[1];
        //     // switch (deceptinfect.ecswip.ComponentManager.components_3[ClassToID.idMacro($get)].components[1])
        // }
        return macro null;

    }

	
    public static macro function iterGet(getArr:Expr, cases:Expr, func:Expr) {
		var name;
		var expr;

		switch (func) {
			case {expr: EFunction(_, {args: [{name: _argName}], expr : e})}:
				name = _argName;
				expr = e;
			case {expr: EFunction(_, {args: [], expr: e}), pos: pos}:
				name = renameVar(Context.getLocalTVars(), pos);
				expr = e;
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
    
	//nocheckin
	//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARRRRRRRRRRRRRRRRRRGGGHHHHHH
    public static macro function get(getArr:Expr, cases:Expr, func:Expr, ?noMatch:Expr) {
		var name;
		var expr;
		var exprNone = macro null;
		switch (func) {
			case {expr: EFunction(_, {args: [{name: _argName}], expr: _expr =  {expr : EBlock(arr)}}), pos : pos}:
				name = _argName;
				expr = if (noMatch == null) {
					_expr;
				} else {
					var finalArr = arr.slice(0,arr.length - 1);  
					finalArr.push(macro finalExpr = $e{arr[arr.length - 1]});
					{expr : EBlock(finalArr), pos: pos};
				}
			case {expr: EFunction(_, {args: [], expr: _expr = {expr : EBlock(arr)}}), pos: pos}:
				name = renameVar(Context.getLocalTVars(), pos);
				expr = if (noMatch == null) {
					_expr;
				} else {
					var finalArr = arr.slice(0,arr.length - 1);  
					finalArr.push(macro finalExpr = $e{arr[arr.length - 1]});
					{expr : EBlock(finalArr), pos: pos};
				}
			case {pos: pos}:
				Context.error("Incorrect format", pos);
				return macro null;
			default:
				Context.error("Invalid func",Context.currentPos());
				return macro null;
		}
		switch (noMatch) {
			case {expr: EFunction(_, {args: [], expr: expr})}:
				exprNone = expr;
			case {expr : EConst(CIdent("null"))}:
			default:
				Context.error("Invalid noMatch",Context.currentPos());
				return macro null;
				
		}
		switch (expr.expr) {
			case EBlock(arr):
				arr.push(macro break);
			default:
				Context.error("Your're're a big boy, figure it out",Context.currentPos()); //nocheckin
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
							break;
							
                    } 
                }
			}
        }
		final blockNoMatch = macro {
            final __compArr = deceptinfect.ecswip.ComponentManager.components_3;
            @:a(0) null;
            final __lowestInt = __compArr[__lowest_comp].internal;
			var finalExpr = null;
			for (__int_id in 1...__lowest) {
                final $name:deceptinfect.ecswip.ComponentManager.DI_ID = __lowestInt[__int_id];
                if ($e{if_statement(getArr,name)}) {
                    switch ($e{switch_head(getArr,name)}) {
                        case $cases:
                            $expr;
							break;
                        default:
                    }
                }
			}
			if (finalExpr == null) {
				$exprNone;
			} else {
				finalExpr;
			}
		}
		
		final expr:Expr = if (noMatch != null) {
			insert(blockNoMatch,comparisons);
		} else {
			insert(block,comparisons);
		}
		return macro $expr;
	}

	
    
}
