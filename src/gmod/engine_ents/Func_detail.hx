package gmod.engine_ents;
#if server
/**
	An entity that turns its brushes into detail brushes. Detail brushes do NOT contribute to visibility in the PVS. World geometry is not clipped to detail brushes, so if you have a small detail clump attached to a wall, the wall won't be cut up by the detail brush.func_detail is great for high-frequency brush geometry that's visual detail only. It is also ideal for reducing map VIS time.
**/
@:forward
abstract Func_detail(Entity) to Entity {
    //Inputs
    
    //Keyvalues
    
    /**
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Func_detailmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Func_detailmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Func_detailmindxlevelChoices):Func_detailmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Func_detailmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Func_detailmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Func_detailmaxdxlevelChoices):Func_detailmaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    //Outputs
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_detail");
    }
}

enum abstract Func_detailmindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Func_detailmaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}




#end
