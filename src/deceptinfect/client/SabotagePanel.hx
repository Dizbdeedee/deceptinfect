package deceptinfect.client;

import gmod.HaxeGen;
import gmod.panels.DFrame;
import gmod.PanelBuild;

typedef GSabotagePanel = HaxeGen<DFrame,SabotagePanel>;
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
        self.SetPos(1920 / 2,1080 / 2);
        self.SetSize(600,400);
        
        self.SetTitle("Sabotage");
        self.MouseCapture(true);
        self.SetVisible(false);
        self.SetDraggable(true);
        self.ShowCloseButton(true);
        
    }
}

