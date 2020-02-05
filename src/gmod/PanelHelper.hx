package gmod;

class PanelHelper<T:Panel> {
    public var self(default,never):T;   
}

class PanelHelper_DTree extends PanelHelper<gmod.panels.DTree> {
    public function new() {
        
    }
}

abstract PanelHelper_<T:Panel>(PanelHelper<T>) to PanelHelper<T> from PanelHelper<T> {
    @:to
    public function toT<T:Panel>():T {
        return this.self;
    }
}

class TestTest {
    public static function test() {
        var dtree:PanelHelper_DTree = new PanelHelper_DTree();
        var p:gmod.panels.DTree = dtree;
    }
}