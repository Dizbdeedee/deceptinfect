package gmod.engine_ents;
#if server
/**
	An entity that can measure the movement of an entity relative to another entity and apply that movement to a third entity.
**/
@:forward
abstract Logic_measure_movement(Entity) to Entity {
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
		Set the Entity to Measure, whose movement should be measured.
	**/
    public extern inline function FireSetMeasureTarget(param:String,delay:Float) {
        untyped this.Fire("SetMeasureTarget",untyped param,delay);
    }
    
    /**
		Set the Measure Reference entity.
	**/
    public extern inline function FireSetMeasureReference(param:String,delay:Float) {
        untyped this.Fire("SetMeasureReference",untyped param,delay);
    }
    
    /**
		Set the Entity to Move, which will be moved to mimic the measured entity.
	**/
    public extern inline function FireTarget(param:String,delay:Float) {
        untyped this.Fire("Target",untyped param,delay);
    }
    
    /**
		Set the Movement Reference entity.
	**/
    public extern inline function FireSetTargetReference(param:String,delay:Float) {
        untyped this.Fire("SetTargetReference",untyped param,delay);
    }
    
    /**
		Set the scale to divide the measured movements by.
	**/
    public extern inline function FireSetTargetScale(param:Float,delay:Float) {
        untyped this.Fire("SetTargetScale",untyped param,delay);
    }
    
    /**
		Enable the logic_measure_movement.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable the logic_measure_movement.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
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
		Entity to Measure

		Entity whose movement you want to measure.
	**/
    public var MeasureTarget(get,set):String;

    @:noCompletion
    public extern inline function get_MeasureTarget():String {
        return untyped this.GetKeyValues().MeasureTarget;
    }
    
    @:noCompletion
    public extern inline function set_MeasureTarget(value:String):String {
        return untyped this.SetKeyValue("MeasureTarget",untyped value);
    }
    
    /**
		Measure Reference

		The movement of Entity to Measure will be measured relative to this entity.
	**/
    public var MeasureReference(get,set):String;

    @:noCompletion
    public extern inline function get_MeasureReference():String {
        return untyped this.GetKeyValues().MeasureReference;
    }
    
    @:noCompletion
    public extern inline function set_MeasureReference(value:String):String {
        return untyped this.SetKeyValue("MeasureReference",untyped value);
    }
    
    /**
		Entity to Move

		This entity will be moved to mimic the motions of Entity to Measure.
	**/
    public var Target(get,set):String;

    @:noCompletion
    public extern inline function get_Target():String {
        return untyped this.GetKeyValues().Target;
    }
    
    @:noCompletion
    public extern inline function set_Target(value:String):String {
        return untyped this.SetKeyValue("Target",untyped value);
    }
    
    /**
		Movement Reference

		The Entity to Move will move relative to this entity.
	**/
    public var TargetReference(get,set):String;

    @:noCompletion
    public extern inline function get_TargetReference():String {
        return untyped this.GetKeyValues().TargetReference;
    }
    
    @:noCompletion
    public extern inline function set_TargetReference(value:String):String {
        return untyped this.SetKeyValue("TargetReference",untyped value);
    }
    
    /**
		Movement scale

		A scale to divide the measured movements by, before applying those movements to the Entity to Move. 1 = target entity moves as much as the measured entity, 2 = target entity moves half as far as the measured entity, and 0.5 = target entity moves twice as far as the measured entity.
	**/
    public var TargetScale(get,set):Float;

    @:noCompletion
    public extern inline function get_TargetScale():Float {
        return untyped this.GetKeyValues().TargetScale;
    }
    
    @:noCompletion
    public extern inline function set_TargetScale(value:Float):Float {
        return untyped this.SetKeyValue("TargetScale",untyped value);
    }
    
    /**
		Measurement Type
	**/
    public var MeasureType(get,set):Logic_measure_movementMeasureTypeChoices;

    @:noCompletion
    public extern inline function get_MeasureType():Logic_measure_movementMeasureTypeChoices {
        return untyped this.GetKeyValues().MeasureType;
    }
    
    @:noCompletion
    public extern inline function set_MeasureType(value:Logic_measure_movementMeasureTypeChoices):Logic_measure_movementMeasureTypeChoices {
        return untyped this.SetKeyValue("MeasureType",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_measure_movement}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_measure_movement}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_measure_movement}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_measure_movement}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_measure_movement");
    }
}

enum abstract Logic_measure_movementMeasureTypeChoices(Int) to Int {
	var POSITION = 0;
	var EYE_POSITION = 1;
}




#end
