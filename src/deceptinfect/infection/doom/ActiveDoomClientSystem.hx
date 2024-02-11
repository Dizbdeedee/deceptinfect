package deceptinfect.infection.doom;

import deceptinfect.infection.doom.components.ActiveDoomClient;

abstract class ActiveDoomClientSystem extends System {}

class ActiveDoomClientSystemDef extends ActiveDoomClientSystem {
	#if client
	override function init_client() {
		componentManager.getAddSignal(ClassToID.idc(ActiveDoomUserClient))
			.handle((doom) -> {
				SurfaceLib.PlaySound(sound);
			});
	}

	override function run_client() {
		IterateEnt.iterGet([ActiveDoomUserClient])
		{}
	}
	#end
}
