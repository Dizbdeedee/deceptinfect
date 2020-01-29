package gmod.engine_ents;
#if server
/**
	Ladder. Players will be able to move freely along this brush, as if it was a ladder.Apply the toolsinvisibleladder material to a func_ladder brush.
**/
@:forward
abstract Func_ladder(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_ladder");
    }
}





#end
