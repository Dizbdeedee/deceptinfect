package gmod.engine_ents;
#if server
/**
	This entity indicates the position and facing direction at which the player will spawn. Any number of info_player_start entities may be placed in a map for when working in cordoned-off portions of the map. When multiple info_player_start entities are present in a map, set the 'Master' spawnflag on one of them to indicate which one should be used when running the entire map.
**/
@:forward
abstract Info_player_start(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Pitch Yaw Roll (Y Z X)

		This entity's orientation in the world. Pitch is rotation around the Y axis, yaw is the rotation around the Z axis, roll is the rotation around the X axis.
	**/
    public var angles(get,set):Angle;

    @:noCompletion
    public extern inline function get_angles():Angle {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:Angle):Angle {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    //Outputs
    

    
    public extern inline function addSpawnFlag(spawnflag:Info_player_startSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Info_player_startSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Info_player_startSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_player_start");
    }
}



enum abstract Info_player_startSpawnFlags(Int) to Int {
	var MASTER_HAS_PRIORITY_IF_MULTIPLE_INFOPLAYERSTARTS_EXIST = 1;
}

#end
