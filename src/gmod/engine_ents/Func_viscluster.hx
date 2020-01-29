package gmod.engine_ents;
#if server
/**
	Any leaves touching this brush will have their vis merged together into a single cluster.  Use multiple func_viscluster entities to reduce vis time
**/
@:forward
abstract Func_viscluster(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_viscluster");
    }
}





#end
