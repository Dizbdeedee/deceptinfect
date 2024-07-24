package deceptinfect.ents;

import deceptinfect.game.components.InfoStorage;
import deceptinfect.ecswip.compat.GPlayerCompat;

class Di_note extends gmod.sent.SentBuild<gmod.sent.ENT_ANIM> {
	static final properties = {
		Base: "base_anim"
	}

	override function Initialize() {}

	#if server
	override function Use(activator:Entity, caller:Entity, useType:Float, value:Float) {
		if (!activator.IsPlayer()) {
			return;
		}
		var ply:GPlayerCompat = cast activator;
		switch (ply.get(InfoStorage)) {
			case Comp(c_info):
				// blah
				self.Remove();
			default:
		}
	}
	#end
}
