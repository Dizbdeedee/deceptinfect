package deceptinfect.lib;

import gmod.helpers.LuaArray;

@:native("_G.MR")
extern class MRBsp {
	/**
		Defaults to current map if none selected
	**/
	static function OpenBSP(?name:String):haxe.extern.EitherType<Bool, BSP>;
}

extern class BSP {
	final m_map:String;

	final m_ident:Int;

	final m_version:Int;

	final m_lumps:LuaArrayExt<Dynamic>;

	final m_file:gmod.gclass.File;

	function GetLumpInfo():Dynamic;

	function Close():Void;

	function ReadLump(lumpID:Int):Any;

	function GetLumpFacesTotal():Int;

	function ReadLumpFaces():LuaArrayExt<Faces>;

	function ReadLumpDispInfo():LuaArrayExt<DispInfo>;

	function ReadLumpPlanes():LuaArrayExt<Planes>;

	function ReadLumpBrushes():LuaArrayExt<Brushes>;

	function ReadLumpBrushSides():LuaArrayExt<BrushSides>;

	function ReadLumpTexData():LuaArrayExt<TexData>;

	function ReadLumpTextDataStringData():LuaArrayExt<String>;
}

typedef DispInfo = Dynamic;
typedef Planes = Dynamic;

typedef Faces = {
	planenum:Int,
	side:Int,
	onNode:Int,
	firstedge:Int,
	numedges:Int,
	texinfo:Int,
	dispinfo:Int,
	surfaceFogVolumeID:Int,
	styles:LuaArrayExt<Int>,
	lightofs:Int,
	area:Float,
	LightmapTextureMinsInLuxels:LuaArrayExt<Int>,
	LightmapTextureSizeInLuxels:LuaArrayExt<Int>,
	origFace:Int,
	numPrims:Int,
	firstPrimID:Int,
	smoothingGroups:Int
};

typedef Brushes = Dynamic;

typedef TexInfo = {
	textureVecs:LuaArrayExt<LuaArrayExt<Float>>,
	lightmapVecs:LuaArrayExt<LuaArrayExt<Float>>,
	flags:Int,
	texdata:Int
};

typedef TexData = {
	reflectivity:Vector,
	nameStringTableID:Int,
	width:Int,
	height:Int,
	view_width:Int,
	view_height:Int
};

typedef BrushSides = Dynamic;
