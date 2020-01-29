package gmod.engine_ents;
#if server
/**
	Test entity for Ken!
**/
@:forward
abstract Test_sidelist(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Sides
	**/
    public var sides(get,set):String;

    @:noCompletion
    public extern inline function get_sides():String {
        return untyped this.GetKeyValues().sides;
    }
    
    @:noCompletion
    public extern inline function set_sides(value:String):String {
        return untyped this.SetKeyValue("sides",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("test_sidelist");
    }
}





#end
