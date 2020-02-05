package gmod;

import gmod.panels.DTree;

// @:autoBuild(gmod.macros.PanelMacro.build())
interface PanelInterface<T> {

}

// @:genericBuild(gmod.macros.PanelMacro.build())
class PanelTest<T> {
    public function test() {
        
    }
}

class TestTwo extends PanelHelper_DTree {
    
    override function DoClick() {
        
        
        trace("DtreeOverride");
    }

    override function DoRightClick() {
        
    }

    override function OnNodeSelected(node:Panel) {
        
    }
    
    
    
   

}
// class TestFour extends PanelHelper_DTree_Node {

// }

// class TestThree extends PanelHelper_DTree {
//     override function DoClick() {
//         super.DoClick();
//     }
// }
// @:native("HELP")
// extern class TestThree extends  {
//     function d():Void;
// }

// class TestFour extends TestThree {
//     override function d() {
        
//     }
// }