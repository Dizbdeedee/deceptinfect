package gmod.enums;
/**
    Enumerations used by CNavArea methods. These Enums correspond to each corner of a CNavArea
	**Note:** These enumerations do not exist in game and are listed here only for reference!
**/
@:native("_G")
extern enum abstract NavCorner(Int) {
    /**
        North West Corner
    **/
    var NORTH_WEST;
    /**
        South East Corner
    **/
    var SOUTH_EAST;
    /**
        Represents all corners, only applicable to certain functions, such as [CNavArea](https://wiki.garrysmod.com/page/Category:CNavArea):[PlaceOnGround](https://wiki.garrysmod.com/page/CNavArea/PlaceOnGround).
    **/
    var NUM_CORNERS;
    /**
        North East Corner
    **/
    var NORTH_EAST;
    /**
        South West Corner
    **/
    var SOUTH_WEST;
    
}