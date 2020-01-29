package gmod.engine_ents;
#if server
/**
	A trigger volume that can be told to push all physics objects that are inside of it in the direction specified by this trigger's angles.
Also outputs the force at the time of impact for anyone else that wants to use it.
**/
@:forward
abstract Trigger_impact(Entity) to Entity {
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
		Fire the impact, pushing all entities within the volume.
	**/
    public extern inline function FireImpact(param:Float,delay:Float) {
        untyped this.Fire("Impact",untyped param,delay);
    }
    
    /**
		Set the magnitude of the impact.
	**/
    public extern inline function FireSetMagnitude(param:Float,delay:Float) {
        untyped this.Fire("SetMagnitude",untyped param,delay);
    }
    
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
    
    /**
		Origin (X Y Z)

		The position of this entity's center in the world. Rotating entities typically rotate around their origin.
	**/
    public var origin(get,set):String;

    @:noCompletion
    public extern inline function get_origin():String {
        return untyped this.GetKeyValues().origin;
    }
    
    @:noCompletion
    public extern inline function set_origin(value:String):String {
        return untyped this.SetKeyValue("origin",untyped value);
    }
    
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
		Magnitude

		The strength of the impact. Negative values reverse the direction.
	**/
    public var Magnitude(get,set):Float;

    @:noCompletion
    public extern inline function get_Magnitude():Float {
        return untyped this.GetKeyValues().Magnitude;
    }
    
    @:noCompletion
    public extern inline function set_Magnitude(value:Float):Float {
        return untyped this.SetKeyValue("Magnitude",untyped value);
    }
    
    /**
		Noise

		The amount of directional noise (0-1). 0 = no noise, 1 = random direction.
	**/
    public var noise(get,set):Float;

    @:noCompletion
    public extern inline function get_noise():Float {
        return untyped this.GetKeyValues().noise;
    }
    
    @:noCompletion
    public extern inline function set_noise(value:Float):Float {
        return untyped this.SetKeyValue("noise",untyped value);
    }
    
    /**
		Viewkick

		The amount to kick player's view if the player is in the trigger.  Proportional to magnitude (0-1).
	**/
    public var viewkick(get,set):Float;

    @:noCompletion
    public extern inline function get_viewkick():Float {
        return untyped this.GetKeyValues().viewkick;
    }
    
    @:noCompletion
    public extern inline function set_viewkick(value:Float):Float {
        return untyped this.SetKeyValue("viewkick",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Trigger_impact}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Trigger_impact}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Trigger_impact}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Trigger_impact}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired after an impact. The parameter passed along is the force of the impact that was generated.
	**/
    public extern inline function OutputImpactForce(callback:Callback<{activator:Trigger_impact,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"ImpactForce",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_impact");
    }
}





#end
