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

// class TestTwo extends PanelHelper_DTree {
//     override function OnNodeSelected(node:Panel) {
        
//     }

// } 
@:native("HELP")
extern class TestThree extends Entity {
    function looool():Void;
}

class TestFour extends TestThree {
    override function looool() {
        
    }
}