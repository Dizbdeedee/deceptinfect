package gmod.engine_ents;
#if server
/**
	A navigation node for ground moving NPCs. Navigation nodes are baked into the nodegraph so that NPCs can move to them. Ground nodes fall to the ground when they spawn.
**/
@:forward
abstract Info_node(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Node ID
	**/
    public var nodeid(get,never):Int;

    @:noCompletion
    public extern inline function get_nodeid():Int {
        return untyped this.GetKeyValues().nodeid;
    }
    
    //Outputs
    

    
    public extern inline function addSpawnFlag(spawnflag:Info_nodeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Info_nodeSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Info_nodeSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_node");
    }
}



enum abstract Info_nodeSpawnFlags(Int) to Int {
	var FORCE_HUMAN_PERMISSION = 1;
	var FORCE_SMALLCENTERED_PERMISSION = 2;
	var FORCE_WIDEHUMAN_PERMISSION = 4;
	var FORCE_TINY_PERMISSIONT = 8;
	var FORCE_WIDESHORT_PERMISSION = 16;
	var FORCE_MEDIUM_PERMISSION = 32;
	var FORCE_TINYCENTERED_PERMISSION = 64;
	var FORCE_LARGE_PERMISSION = 128;
	var FORCE_LARGECENTERED_PERMISSION = 256;
	var KEEP_EDITOR_POSITION = 512;
}

#end
