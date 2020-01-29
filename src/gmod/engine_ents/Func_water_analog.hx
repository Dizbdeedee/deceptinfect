package gmod.engine_ents;
#if server
/**
	A water brush entity that moves linearly along a given distance, in a given direction
**/
@:forward
abstract Func_water_analog(Entity) to Entity {
    //Inputs
    
    /**
		Changes the entity's parent in the movement hierarchy.
	**/
    public extern inline function FireSetParent(param:String,delay:Float) {
        untyped this.Fire("SetParent",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on its parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment.
	**/
    public extern inline function FireSetParentAttachment(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachment",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on it's parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment. The entity will maintain it's position relative to the parent at the time it is attached.
	**/
    public extern inline function FireSetParentAttachmentMaintainOffset(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachmentMaintainOffset",untyped param,delay);
    }
    
    /**
		Removes this entity from the the movement hierarchy, leaving it free to move independently.
	**/
    public extern inline function FireClearParent(delay:Float) {
        untyped this.Fire("ClearParent",untyped null,delay);
    }
    
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
		Move the water brush to the end position (starting position + (move direction * move distance)).
	**/
    public extern inline function FireOpen(delay:Float) {
        untyped this.Fire("Open",untyped null,delay);
    }
    
    /**
		Move the water brush to the starting position.
	**/
    public extern inline function FireClose(delay:Float) {
        untyped this.Fire("Close",untyped null,delay);
    }
    
    /**
		Move the water brush to a specific position between 0.0 and 1.0, where 0 is the starting position and 1 is the starting position + (move direction * move distance).
	**/
    public extern inline function FireSetPosition(param:String,delay:Float) {
        untyped this.Fire("SetPosition",untyped param,delay);
    }
    
    //Keyvalues
    
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
		Parent

		The name of this entity's parent in the movement hierarchy. Entities with parents move with their parent.
	**/
    public var parentname(get,set):String;

    @:noCompletion
    public extern inline function get_parentname():String {
        return untyped this.GetKeyValues().parentname;
    }
    
    @:noCompletion
    public extern inline function set_parentname(value:String):String {
        return untyped this.SetKeyValue("parentname",untyped value);
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
		Move Direction (Pitch Yaw Roll)

		The direction the water will move, when told to 'Open'.
	**/
    public var movedir(get,set):Angle;

    @:noCompletion
    public extern inline function get_movedir():Angle {
        return untyped this.GetKeyValues().movedir;
    }
    
    @:noCompletion
    public extern inline function set_movedir(value:Angle):Angle {
        return untyped this.SetKeyValue("movedir",untyped value);
    }
    
    /**
		Start Position

		Position of the water brush when spawned. The range is a value between 0.0 and 1.0, where 0 is the starting position and 1 is the starting position + (move direction * move distance).
	**/
    public var startposition(get,set):Float;

    @:noCompletion
    public extern inline function get_startposition():Float {
        return untyped this.GetKeyValues().startposition;
    }
    
    @:noCompletion
    public extern inline function set_startposition(value:Float):Float {
        return untyped this.SetKeyValue("startposition",untyped value);
    }
    
    /**
		Speed

		The speed that the water brush moves, in inches per second.
	**/
    public var speed(get,set):Int;

    @:noCompletion
    public extern inline function get_speed():Int {
        return untyped this.GetKeyValues().speed;
    }
    
    @:noCompletion
    public extern inline function set_speed(value:Int):Int {
        return untyped this.SetKeyValue("speed",untyped value);
    }
    
    /**
		Move Distance

		The distance from the starting point that the water brush should move, in inches.
	**/
    public var movedistance(get,set):Float;

    @:noCompletion
    public extern inline function get_movedistance():Float {
        return untyped this.GetKeyValues().movedistance;
    }
    
    @:noCompletion
    public extern inline function set_movedistance(value:Float):Float {
        return untyped this.SetKeyValue("movedistance",untyped value);
    }
    
    /**
		Sound played when the water brush starts moving.
	**/
    public var startsound(get,set):String;

    @:noCompletion
    public extern inline function get_startsound():String {
        return untyped this.GetKeyValues().startsound;
    }
    
    @:noCompletion
    public extern inline function set_startsound(value:String):String {
        return untyped this.SetKeyValue("startsound",untyped value);
    }
    
    /**
		Sound played when the water brush stops moving.
	**/
    public var stopsound(get,set):String;

    @:noCompletion
    public extern inline function get_stopsound():String {
        return untyped this.GetKeyValues().stopsound;
    }
    
    @:noCompletion
    public extern inline function set_stopsound(value:String):String {
        return untyped this.SetKeyValue("stopsound",untyped value);
    }
    
    /**
		Wave Height
	**/
    public var WaveHeight(get,set):String;

    @:noCompletion
    public extern inline function get_WaveHeight():String {
        return untyped this.GetKeyValues().WaveHeight;
    }
    
    @:noCompletion
    public extern inline function set_WaveHeight(value:String):String {
        return untyped this.SetKeyValue("WaveHeight",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the water brush reaches the end position (starting position + (move direction * move distance)).
	**/
    public extern inline function OutputOnFullyOpen(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyOpen",callback);
    }
    
    /**
		Fired when the water brush reaches the starting position.
	**/
    public extern inline function OutputOnFullyClosed(callback:Callback<{activator:Func_water_analog}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyClosed",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_water_analog");
    }
}





#end
