package deceptinfect.infection.doom.components;

import deceptinfect.ecswip.ReplicatedComponent;

@:replicated(SOME(INFECTED))
class ActiveDoom extends ReplicatedComponent {
	@:s
	var doomPower:DoomPower = LOW_DOOM;

	var activeDoomSet:ActiveDoomSet = UNSET;

	var highPercent = .7;

	var mediumPercent = .3;

	var lowPercent = .03;

	var damagePenalty = .6;

	var originalTime:Float = 25;
}

enum DoomPower {
	LOW_DOOM;
	MEDIUM_DOOM;
	HIGH_DOOM;
}

enum ActiveDoomSet {
	UNSET;
	ACTIVE(end:Float);
}
