package deceptinfect.client;

import gmod.gclass.Panel;
import gmod.gclass.Panel;
import gmod.panels.DFrame;
import gmod.helpers.panel.PanelBuild;


class SabotagePanel extends PanelBuild<gmod.panels.DFrame> {
	
	override function Init():Void {
		trace("Panel created");
		self.SetPos(0, 0);
		self.SetSize(600, 400);
		self.SetTitle("Sabotage");
		self.MouseCapture(true);
		self.SetVisible(true);
		self.SetDraggable(true);
		self.ShowCloseButton(true);
	}

	override function Think():Void {
		// trace("Super think");
	}
}

class ExtendedSabotagePanel extends SabotagePanel {

	override function Init():Void {
		trace("Our own stuff");
	}

	override function Think():Void {
		// trace("Our own spam"); nocheckin
		super.Think();
	}

}
