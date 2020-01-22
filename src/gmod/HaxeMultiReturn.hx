package gmod;
import haxe.ds.BalancedTree.TreeNode;
import haxe.DynamicAccess;
import lua.Table;
using lua.TableTools;

// @:genericBuild(gmod.macros.MultiReturn.build())
// class MultiReturn<T> {

// }

/**
    Use this with a typedef to define the ability to multireturn from a haxe function.
    This adds a bit of overhead in exchange for typed multireturns
**/
abstract HaxeMultiReturn<T>(Dynamic) {
    @:from
    public inline static function multiReturn<T:Dynamic>(rtns:T):HaxeMultiReturn<T> {
        var tbl = Table.create();
        for (name => value in (rtns : DynamicAccess<Dynamic>)) {
            tbl[name.charCodeAt(0) - 96] = value;
        }
        return tbl.unpack();    
    }
}






// private class MyMultiReturnTest {
//     public function derka():MultiReturnHelper<MyMultiReturn> {
        
         
//     }
// }