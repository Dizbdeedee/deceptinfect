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

	final m_lumps:LuaArray<Dynamic>;

	final m_file:gmod.gclass.File;

	function GetLumpInfo():Dynamic;

	function Close():Void;

	function ReadLump(lumpID:Int):Any;

	function GetLumpFacesTotal():Int;

	function ReadLumpFaces():LuaArray<Faces>;

	function ReadLumpDispInfo():LuaArray<DispInfo>;

	function ReadLumpPlanes():LuaArray<Planes>;

	function ReadLumpBrushes():LuaArray<Brushes>;

	function ReadLumpBrushSides():LuaArray<BrushSides>;

	function ReadLumpTexData():LuaArray<TexData>;

	function ReadLumpTextDataStringData():LuaArray<String>;
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
	styles:LuaArray<Int>,
	lightofs:Int,
	area:Float,
	LightmapTextureMinsInLuxels:LuaArray<Int>,
	LightmapTextureSizeInLuxels:LuaArray<Int>,
	origFace:Int,
	numPrims:Int,
	firstPrimID:Int,
	smoothingGroups:Int
};

typedef Brushes = Dynamic;

typedef TexInfo = {
	textureVecs:LuaArray<LuaArray<Float>>,
	lightmapVecs:LuaArray<LuaArray<Float>>,
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
