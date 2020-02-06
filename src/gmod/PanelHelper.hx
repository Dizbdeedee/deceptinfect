package gmod;

import haxe.ds.BalancedTree.TreeNode;
import gmod.libs.TableLib;
import gmod.libs.VguiLib;

class PanelHelper<T:Panel> {
    public var self(default,never):T;

    function new(?parent:Panel,?name:String) {
        var tb = VguiLib.RegisterTable(Table.create(),"Panel");//add 
        var vgui = VguiLib.CreateFromTable(tb,parent,name);
        Reflect.setField(this,"self",vgui);
    }

    
}