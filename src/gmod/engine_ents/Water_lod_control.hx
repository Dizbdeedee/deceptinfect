package gmod.engine_ents;
#if server
/**
	An entity used to control the LOD behavior of any water in the map. If your map has water, this entity is required.
**/
@:forward
abstract Water_lod_control(Entity) to Entity {
    //Inputs
    
    /**
		Removes this entity from the world.
	**/
    public extern inline function FireKill(delay:Float) {
        untyped this.Fire("Kill",untyped null,delay);
    }
    
    /**
		Removes this entity and all its children from the world.
	**/
    public extern inline function FireKillHierarchy(delay:Float) {
        untyped this.Fire("KillHierarchy",untyped null,delay);
    }
    
    /**
		Adds an entity I/O connection to this entity. Format: <output name> <targetname>:<inputname>:<parameter>:<delay>:<max times to fire (-1 == infinite)>. Very dangerous, use with care.
	**/
    public extern inline function FireAddOutput(param:String,delay:Float) {
        untyped this.Fire("AddOutput",untyped param,delay);
    }
    
    /**
		Causes this entity's OnUser1 output to be fired.
	**/
    public extern inline function FireFireUser1(delay:Float) {
        untyped this.Fire("FireUser1",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser2 output to be fired.
	**/
    public extern inline function FireFireUser2(delay:Float) {
        untyped this.Fire("FireUser2",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser3 output to be fired.
	**/
    public extern inline function FireFireUser3(delay:Float) {
        untyped this.Fire("FireUser3",untyped null,delay);
    }
    
    /**
		Causes this entity's OnUser4 output to be fired.
	**/
    public extern inline function FireFireUser4(delay:Float) {
        untyped this.Fire("FireUser4",untyped null,delay);
    }
    
    /**
		Set the distance that water starts transitioning to cheap water.
	**/
    public extern inline function FireSetCheapWaterStartDistance(param:Float,delay:Float) {
        untyped this.Fire("SetCheapWaterStartDistance",untyped param,delay);
    }
    
    /**
		Set the distance that water finishes transitioning to cheap water.
	**/
    public extern inline function FireSetCheapWaterEndDistance(param:Float,delay:Float) {
        untyped this.Fire("SetCheapWaterEndDistance",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Name

		The name that other entities refer to this entity by.
	**/
    public var targetname(get,set):String;

    @:noCompletion
    public extern inline function get_targetname():String {
        return untyped this.GetKeyValues().targetname;
    }
    
    @:noCompletion
    public extern inline function set_targetname(value:String):String {
        return untyped this.SetKeyValue("targetname",untyped value);
    }
    
    /**
		Start Transition to Cheap Water

		This is the distance from the camera that water will start transitioning to cheap water, in inches.
	**/
    public var cheapwaterstartdistance(get,set):Float;

    @:noCompletion
    public extern inline function get_cheapwaterstartdistance():Float {
        return untyped this.GetKeyValues().cheapwaterstartdistance;
    }
    
    @:noCompletion
    public extern inline function set_cheapwaterstartdistance(value:Float):Float {
        return untyped this.SetKeyValue("cheapwaterstartdistance",untyped value);
    }
    
    /**
		End Transition to Cheap Water

		This is the distance from the camera that water will finish transitioning to cheap water, in inches.
	**/
    public var cheapwaterenddistance(get,set):Float;

    @:noCompletion
    public extern inline function get_cheapwaterenddistance():Float {
        return untyped this.GetKeyValues().cheapwaterenddistance;
    }
    
    @:noCompletion
    public extern inline function set_cheapwaterenddistance(value:Float):Float {
        return untyped this.SetKeyValue("cheapwaterenddistance",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Water_lod_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Water_lod_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Water_lod_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Water_lod_control}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("water_lod_control");
    }
}





#end
