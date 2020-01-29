package gmod.engine_ents;
#if server
/**
	A navigation node for flying NPCs. Air navigation nodes are baked into the nodegraph so that NPCs can move to them. Air nodes do not fall to the ground when they spawn.
**/
@:forward
abstract Info_node_air(Entity) to Entity {
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
    
    /**
		NodeHeight
	**/
    public var nodeheight(get,set):Int;

    @:noCompletion
    public extern inline function get_nodeheight():Int {
        return untyped this.GetKeyValues().nodeheight;
    }
    
    @:noCompletion
    public extern inline function set_nodeheight(value:Int):Int {
        return untyped this.SetKeyValue("nodeheight",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_node_air");
    }
}





#end
