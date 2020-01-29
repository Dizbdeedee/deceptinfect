package gmod.engine_ents;
#if server
/**
	An entity that detects if another entity's angular velocity meets or exceeds a threshold value.
**/
@:forward
abstract Point_angularvelocitysensor(Entity) to Entity {
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
		Checks to see if the Target Entity's angular velocity meets or exceeds the Threshold Velocity, firing either the OnGreaterThanOrEqualTo or OnLessThan output based on the result.
	**/
    public extern inline function FireTest(delay:Float) {
        untyped this.Fire("Test",untyped null,delay);
    }
    
    /**
		Checks to see if the Target Entity's angular velocity meets or exceeds the Threshold Velocity. Once the Fire Interval expires, fires the appropriate test result output if the result is stable throughout the Fire Interval.
	**/
    public extern inline function FireTestWithInterval(delay:Float) {
        untyped this.Fire("TestWithInterval",untyped null,delay);
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
		Target Entity Name

		Name of the entity whose angular velocity will be sensed.
	**/
    public var target(get,set):String;

    @:noCompletion
    public extern inline function get_target():String {
        return untyped this.GetKeyValues().target;
    }
    
    @:noCompletion
    public extern inline function set_target(value:String):String {
        return untyped this.SetKeyValue("target",untyped value);
    }
    
    /**
		Threshold Velocity

		The threshold angular velocity to compare against, in degrees per second.
	**/
    public var threshold(get,set):Float;

    @:noCompletion
    public extern inline function get_threshold():Float {
        return untyped this.GetKeyValues().threshold;
    }
    
    @:noCompletion
    public extern inline function set_threshold(value:Float):Float {
        return untyped this.SetKeyValue("threshold",untyped value);
    }
    
    /**
		Fire Interval

		Angular velocity must cross the threshold for at least this long to fire.
	**/
    public var fireinterval(get,set):Float;

    @:noCompletion
    public extern inline function get_fireinterval():Float {
        return untyped this.GetKeyValues().fireinterval;
    }
    
    @:noCompletion
    public extern inline function set_fireinterval(value:Float):Float {
        return untyped this.SetKeyValue("fireinterval",untyped value);
    }
    
    /**
		Axis
	**/
    public var axis(get,set):String;

    @:noCompletion
    public extern inline function get_axis():String {
        return untyped this.GetKeyValues().axis;
    }
    
    @:noCompletion
    public extern inline function set_axis(value:String):String {
        return untyped this.SetKeyValue("axis",untyped value);
    }
    
    /**
		Use Axis Helper

		Use axis helper to determine rotation values (clockwise/counter-clockwise).
	**/
    public var usehelper(get,set):Point_angularvelocitysensorusehelperChoices;

    @:noCompletion
    public extern inline function get_usehelper():Point_angularvelocitysensorusehelperChoices {
        return untyped this.GetKeyValues().usehelper;
    }
    
    @:noCompletion
    public extern inline function set_usehelper(value:Point_angularvelocitysensorusehelperChoices):Point_angularvelocitysensorusehelperChoices {
        return untyped this.SetKeyValue("usehelper",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the Target's Angular Velocity changes, passing the new magnitude of the angular velocity.
	**/
    public extern inline function OutputAngularVelocity(callback:Callback<{activator:Point_angularvelocitysensor,data:Float}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"AngularVelocity",callback);
    }
    
    /**
		Fired when the Target Entity goes from slower than the threshold angular velocity to faster than the threshold angular velocity.
	**/
    public extern inline function OutputOnGreaterThan(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGreaterThan",callback);
    }
    
    /**
		Fired when the Target Entity goes from slower than the threshold angular velocity to faster than the threshold angular velocity.
	**/
    public extern inline function OutputOnGreaterThanOrEqualTo(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGreaterThanOrEqualTo",callback);
    }
    
    /**
		Fired when the Target Entity goes from faster than the threshold angular velocity to slower than the threshold angular velocity.
	**/
    public extern inline function OutputOnLessThan(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLessThan",callback);
    }
    
    /**
		Fired when the Target Entity goes from faster than the threshold angular velocity to slower than the threshold angular velocity.
	**/
    public extern inline function OutputOnLessThanOrEqualTo(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLessThanOrEqualTo",callback);
    }
    
    /**
		Fired when the Target Entity reaches the threshold angular velocity from a different velocity.
	**/
    public extern inline function OutputOnEqualTo(callback:Callback<{activator:Point_angularvelocitysensor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEqualTo",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_angularvelocitysensor");
    }
}

enum abstract Point_angularvelocitysensorusehelperChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
