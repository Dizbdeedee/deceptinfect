package deceptinfect.client;

import gmod.helpers.GLinked;
import gmod.panels.DFrame;
import gmod.helpers.panel.PanelBuild;

typedef GSabotagePanel = GLinked<DFrame,SabotagePanel>;
@:expose("sabopanel")
class SabotagePanel extends PanelBuild<gmod.panels.DFrame> {
    
    public static var inst(get,null):GSabotagePanel = null;

    public static function get_inst():GSabotagePanel {
        if (inst == null) {
            inst = VguiLib.Create(gclass);
        }
        return inst;
    }
   
    override function Init() {
        trace("Panel created");
        self.SetPos(0,0);
        self.SetSize(600,400);
        self.SetTitle("Sabotage");
        self.MouseCapture(true);
        self.SetVisible(true);
        self.SetDraggable(true);
        self.ShowCloseButton(true);
    }
}
@:expose("s")
class SaboPanel3 extends PanelBuild<gmod.panels.DFrame> {
    override function Init() {

    }
}

@:expose("f")
class SaboPanel4 extends PanelBuild<gmod.panels.DFrame> {
    override function Init() {

    }
}

typedef GSaboPanel2 = GLinked<gmod.panels.DFrame,SaboPanel2>;
@:expose("sabopanel2")
class SaboPanel2 extends SabotagePanel {

    public static var inst(get,null):GSaboPanel2 = null;

    public static function get_inst():GSaboPanel2 {
        if (inst == null) {
            inst = VguiLib.Create(gclass);
        }
        return inst;
    }

    override function Init() {
        trace("Panel2 created");
        self.SetPos(0,0);
        self.SetSize(600,400);
        self.SetTitle("Sabotage");
        self.MouseCapture(true);
        self.SetVisible(true);
        self.SetDraggable(true);
        self.ShowCloseButton(true);
    }
}
