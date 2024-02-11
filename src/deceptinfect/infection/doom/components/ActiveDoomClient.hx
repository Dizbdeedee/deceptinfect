package deceptinfect.infection.doom.components;

import deceptinfect.ecswip.ReplicatedComponent;
import deceptinfect.infection.doom.components.ActiveDoom.DoomPower;

@:replicated(SOME(CURRENT_PLAYER))
class ActiveDoomClient extends ReplicatedComponent {
	@:s
	var doomPower:DoomPower = LOW_DOOM;
}
