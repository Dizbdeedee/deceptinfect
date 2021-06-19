package deceptinfect.ecswip;

class Spectate {
	// TODO add ability to spectate other entities
	#if server
	public static function chooseSpectateTarget(x:PlayerComponent, dir:Spec_Direction) {
		var player = x.player;
		var iter = switch (dir) {
			case FORWARDS:
				1;
			case BACKWARDS:
				-1;
		}
		var specCur = x.spec_next;
		var specNext = x.spec_next + iter;
		var players = PlayerLib.GetAll();
		var specd = false;
		while (specNext != specCur) {
			var target = players[specNext];
			if (Gmod.IsValid(target) && target.Alive()) {
				player.SpectateEntity(target);
				player.SetObserverMode(OBS_MODE_CHASE);
				specd = true;
			}
			specNext += iter;
			if (specNext < 1) {
				specNext = players.length();
			} else if (specNext > players.length()) {
				specNext = 0;
			}
		}
		if (!specd) {
			trace("No spectatable players found");
		}
		x.spec_next = specNext;
	}
	#end
}

enum Spec_Direction {
	FORWARDS;
	BACKWARDS;
}
