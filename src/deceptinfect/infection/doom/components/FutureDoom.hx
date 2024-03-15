package deceptinfect.infection.doom.components;

class FutureDoom extends Component {
	var rollTimeBase:Float = 45;

	var rollTimeHigh:Int = 30;

	var rollTimeLow:Int = 12;

	var curRollBase:Float = 45;

	var curRollNeg = 7;

	var rerollSkipTimer = .01; // muhahaha

	var rerollReset = .05; // mercy

	var baseChanceToGo = .4; // we can fiddle around with this i guess

	var activeRollTime:Float = 0;

	var checkStatus:FutureDoomCheck = UNSCHEDULED_CHECK;

	var active:FutureDoomActive = INACTIVE(.0);

	var futureDoom:FutureDoomState = LOW_DOOM;

	var highChance = .7;

	var mediumChance = .3;

	var lowChance = .06;

	var lowThreshold:Float = 65;

	var mediumThreshold:Float = 75;

	var highThreshold:Float = 90;

	// if you roll successfully multiple times, you are more lucky, and are rewarded abstractly.
	// be lucky.
	var badRollModifierFirst = 0.2;

	var badRollModifierOthers = 0.4;

	var timesRolled = 0;

	var currentModifier:Float = .0;

	var overallDoomCooldown = 50;

	var doomMin:Int = 15;

	var doomMax:Int = 60;

	var difficultyModifier = 10;
}

enum FutureDoomCheck {
	SCHEDULED_CHECK(active_roll_time_end:Float);
	UNSCHEDULED_CHECK;
	NOW;
	NONE;
	COOLDOWN(time:Float);
}

enum FutureDoomActive {
	INACTIVE(timeActive:Ref<Float>);
	ACTIVE(timeInactive:Ref<Float>);
	ACTIVE_ALWAYS;
}

enum FutureDoomState {
	LOW_DOOM;
	MEDIUM_DOOM;
	HIGH_DOOM;
}
