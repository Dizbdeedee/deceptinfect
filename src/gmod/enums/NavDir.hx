/**
    Enumerations used by CNavArea methods. These Enums correspond to each side of a CNavArea
	**Note:** These enumerations do not exist in game and are listed here only for reference!
**/
@:native("_G")
extern enum abstract NavDir(Int) {
    /**
        South from given [CNavArea](https://wiki.garrysmod.com/page/Category:CNavArea)
    **/
    var SOUTH;
    /**
        East from given [CNavArea](https://wiki.garrysmod.com/page/Category:CNavArea)
    **/
    var EAST;
    /**
        North from given [CNavArea](https://wiki.garrysmod.com/page/Category:CNavArea)
    **/
    var NORTH;
    /**
        West from given [CNavArea](https://wiki.garrysmod.com/page/Category:CNavArea)
    **/
    var WEST;
    
}