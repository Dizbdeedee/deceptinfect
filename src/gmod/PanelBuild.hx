package gmod;

import gmod.panels.DTree;

@:genericBuild(gmod.macros.PanelMacro.build())
class PanelBuild<T:Panel> {

}

// class TestTwo extends PanelHelper_DTree {
    
//     override function DoClick() {
        
        
//         trace("DtreeOverride");
//     }

//     override function DoRightClick() {
        
//     }

//     override function OnNodeSelected(node:Panel) {
        
//     }
//     override function Init() {
//         stuff();
//     }

//     function stuff() {
        
//         var paneel:Panel = this;
//     }

    
    
    
   

// }
// class TestFour extends PanelHelper_DTree_Node {
//     override function ActionSignal(signalName:String, signalValue:String) {
//         super.ActionSignal(signalName, signalValue);
//     }
//     override function AnimationThink() {
//         super.AnimationThink();
//     }
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