package gmod.engine_ents;
#if server
/**
	An entity to control wind in the map. Partially functional.
**/
@:forward
abstract Env_wind(Entity) to Entity {
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
		Min normal speed

		Minimum speed of the wind while idling.
	**/
    public var minwind(get,set):Int;

    @:noCompletion
    public extern inline function get_minwind():Int {
        return untyped this.GetKeyValues().minwind;
    }
    
    @:noCompletion
    public extern inline function set_minwind(value:Int):Int {
        return untyped this.SetKeyValue("minwind",untyped value);
    }
    
    /**
		Max normal speed

		Maximum speed of the wind while idling.
	**/
    public var maxwind(get,set):Int;

    @:noCompletion
    public extern inline function get_maxwind():Int {
        return untyped this.GetKeyValues().maxwind;
    }
    
    @:noCompletion
    public extern inline function set_maxwind(value:Int):Int {
        return untyped this.SetKeyValue("maxwind",untyped value);
    }
    
    /**
		Min gust speed

		Minimum speed of wind gusts.
	**/
    public var mingust(get,set):Int;

    @:noCompletion
    public extern inline function get_mingust():Int {
        return untyped this.GetKeyValues().mingust;
    }
    
    @:noCompletion
    public extern inline function set_mingust(value:Int):Int {
        return untyped this.SetKeyValue("mingust",untyped value);
    }
    
    /**
		Max gust speed

		Maximum speed of wind gusts.
	**/
    public var maxgust(get,set):Int;

    @:noCompletion
    public extern inline function get_maxgust():Int {
        return untyped this.GetKeyValues().maxgust;
    }
    
    @:noCompletion
    public extern inline function set_maxgust(value:Int):Int {
        return untyped this.SetKeyValue("maxgust",untyped value);
    }
    
    /**
		Min gust delay

		Minimum time delay between random gusts.
	**/
    public var mingustdelay(get,set):Int;

    @:noCompletion
    public extern inline function get_mingustdelay():Int {
        return untyped this.GetKeyValues().mingustdelay;
    }
    
    @:noCompletion
    public extern inline function set_mingustdelay(value:Int):Int {
        return untyped this.SetKeyValue("mingustdelay",untyped value);
    }
    
    /**
		Max gust delay

		Maximum time delay between random gusts.
	**/
    public var maxgustdelay(get,set):Int;

    @:noCompletion
    public extern inline function get_maxgustdelay():Int {
        return untyped this.GetKeyValues().maxgustdelay;
    }
    
    @:noCompletion
    public extern inline function set_maxgustdelay(value:Int):Int {
        return untyped this.SetKeyValue("maxgustdelay",untyped value);
    }
    
    /**
		Gust Duration

		How long will the wind gust for.
	**/
    public var gustduration(get,set):Int;

    @:noCompletion
    public extern inline function get_gustduration():Int {
        return untyped this.GetKeyValues().gustduration;
    }
    
    @:noCompletion
    public extern inline function set_gustduration(value:Int):Int {
        return untyped this.SetKeyValue("gustduration",untyped value);
    }
    
    /**
		Max gust dir change (degrees)

		Maximum amount that the wind's direction changes due to a gust.
	**/
    public var gustdirchange(get,set):Int;

    @:noCompletion
    public extern inline function get_gustdirchange():Int {
        return untyped this.GetKeyValues().gustdirchange;
    }
    
    @:noCompletion
    public extern inline function set_gustdirchange(value:Int):Int {
        return untyped this.SetKeyValue("gustdirchange",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when a wind gust begins.
	**/
    public extern inline function OutputOnGustStart(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGustStart",callback);
    }
    
    /**
		Fired when a wind gust ends.
	**/
    public extern inline function OutputOnGustEnd(callback:Callback<{activator:Env_wind}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnGustEnd",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_wind");
    }
}





#end
