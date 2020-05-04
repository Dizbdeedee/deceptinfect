package gmod;

import haxe.ds.BalancedTree.TreeNode;
import gmod.libs.TableLib;
import gmod.libs.VguiLib;



#if client

@:dce()
@:PanelHelper
@:autoBuild(gmod.macros.PanelMacroOverride.build())
class PanelHelper<T:Panel> {
    public final self:T;

    @:noCompletion
    function new(x:T) {
        self = x;
        
    }

    

    
}

class PanelHelper_2<T:Panel> extends PanelHelper<T> {
    public function EnableVerticalScrollBar() {
        // self.EnableVerticalScrollBar();
    }

    static function nu() {
        
    }
    
    public function hmm_2() {
        
    }
}

class PanelHelper_3<T:Panel> extends PanelHelper_2<T> {
    
    public function hmm() {
           
    }
}

class MyShittyClass extends PanelHelper_2<gmod.panels.DPanel> {
    public function hmmmmm_3() {
        
    }
}
#end