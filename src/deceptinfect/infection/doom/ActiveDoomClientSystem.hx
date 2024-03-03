package deceptinfect.infection.doom;

import deceptinfect.infection.doom.components.ActiveDoomClient;
import deceptinfect.macros.ClassToID;

abstract class ActiveDoomClientSystem extends System {}

class ActiveDoomClientSystemDef extends ActiveDoomClientSystem {
	#if client
	static final sound = Gmod.Sound("deceptinfect/doom.wav");

	override function init_client() {
		componentManager.getAddSignal(ClassToID.idc(ActiveDoomClient))
			.handle((doom) -> {
				SurfaceLib.PlaySound(sound);
			});
	}

	override function run_client() {}
	#end
}
