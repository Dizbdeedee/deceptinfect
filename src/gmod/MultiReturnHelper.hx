package gmod;
import lua.Table;
using lua.TableTools;
abstract MultiReturnHelper<T>(Dynamic) from T {
    public inline function new(under:Dynamic) {
        this = under;
    }

    @:from
    public inline static function multiReturn<T>(rtns:Table<Int,Dynamic>):MultiReturnHelper<T> {
        return new MultiReturnHelper<T>(rtns.unpack());
    }

    @:from
    public inline static function multiReturnTable<T>(rtns:Array<Dynamic>):MultiReturnHelper<T> {
        return new MultiReturnHelper<T>(Table.fromArray(rtns).unpack());
    }


    

   
}

private extern class MyMultiReturn {
    var a:Int;
}



private class MyMultiReturnTest {
    public function derka():MultiReturnHelper<MyMultiReturn> {
        
         
    }
}