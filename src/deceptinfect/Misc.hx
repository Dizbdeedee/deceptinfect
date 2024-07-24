package deceptinfect;

//wouf
class Misc {
	public static var roundModels:Array<String> = [
		"models/player/mossman.mdl",
		"models/player/alyx.mdl",
		"models/player/barney.mdl",
		"models/player/breen.mdl",
		"models/player/Eli.mdl",
		"models/player/gman_high.mdl",
		"models/player/kleiner.mdl",
		"models/player/monk.mdl",
		"models/player/odessa.mdl",
		"models/player/Group03/Female_01.mdl",
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",
		"models/player/Group03/Female_04.mdl",
		"models/player/Group03/Female_06.mdl",
		"models/player/Group03/Male_01.mdl",
		"models/player/Group03/Male_02.mdl",
		"models/player/Group03/Male_03.mdl",
		"models/player/Group03/Male_04.mdl",
		"models/player/Group03/Male_05.mdl",
		"models/player/Group03/Male_06.mdl",
		"models/player/Group03/Male_07.mdl",
		"models/player/Group03/Male_08.mdl",
		"models/player/Group03/Male_09.mdl",
	];

	// TODO expand weapon system
	public static var roundWeapons:Array<String> = ["weapon_mor_ump"];

	public static var startingWeapons:Array<String> = ["weapon_mor_p229"];

	public static var infModel:String = "models/player/zombie_classic.mdl";

	public static var deathSounds:Map<ModelType, Array<String>> = [
		ZOMBIE => ["npc/zombie/zombie_die1.wav"],
		HUMAN_MALE => ["vo/npc/barney/ba_pain06.wav", "vo/npc/male01/pain09.wav",]
	];
}

enum ModelType {
	ZOMBIE;
	HUMAN_MALE;
}
