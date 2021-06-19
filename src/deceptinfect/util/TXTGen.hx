package gmod;

typedef GamemodeSetting = {
	/**
		Name of convar to alter
	**/
	var name:String;

	/**
		The text to show in game to describe this convar
	**/
	var text:String;

	/**
		The help text to show on the convar (in the console)
	**/
	var help:String;

	/**
		Either Text, CheckBox or Numeric. These are case-sensitive!
	**/
	var type:String;

	/**
		The default value for the convar
	**/
	var _default:String;

	/**
		Whether this convar should show up for singleplayer, just having this key will enable it, it doesn't matter what the value is
	**/
	var ?singleplayer:Bool;
}

typedef GamemodeTXT = {
	/**
		Parent gamemode. Use "base" for base gamemode
	**/
	var base:String;

	/**
		The 'nice' title of your gamemode. Can contain spaces and capitals.
	**/
	var ?title:String;

	/**
		The map filter for your gamemode. This is used to correctly categorise maps in the map selector. This should only be set if the maps are unique to your gamemode.
	**/
	var ?maps:String;

	/**
		Include and set to 1 if this gamemode should be selectable from the main menu
	**/
	var ?menusystem:Int;

	/**
		Optional. If your gamemode is on Workshop then this should be the workshopid of the file. (You won't have a workshopid until you upload - so you will need to set this in an update)
	**/
	var ?workshopid:Int;

	/**
		The settings table allows you to create server configuration convars for your gamemode. It's completely optional. Your text file doesn't have to have a settings section.

		These settings are configurable in the main menu in GMod. Each entry has a number of fields.
	**/
	var ?settings:Array<GamemodeSetting>;
}

@:genericBuild(gmod.macros.GamemodeTXT.build2())
class TXTGen<Const:GamemodeTXT> {}
