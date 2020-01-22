package gmod.macros;
#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;

class MultiReturn {
  static public function build() {
    switch (Context.getLocalType()) {
      case TInst(_, [t1]):
        trace(t1);
      case t:
        Context.error("Class expected", Context.currentPos());
    }
    return null;
  }
}
#end