package gmod.engine_ents;
#if server
/**
	An entity that is used to look for opportunities to autosave.
**/
@:forward
abstract Logic_active_autosave(Entity) to Entity {
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
		Enable the entity
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Enable the entity
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
		Initiation Hit Points

		Start looking for an opportunity to save if player drops below this hitpoint level.
	**/
    public var MinimumHitPoints(get,set):Int;

    @:noCompletion
    public extern inline function get_MinimumHitPoints():Int {
        return untyped this.GetKeyValues().MinimumHitPoints;
    }
    
    @:noCompletion
    public extern inline function set_MinimumHitPoints(value:Int):Int {
        return untyped this.SetKeyValue("MinimumHitPoints",untyped value);
    }
    
    /**
		Trigger Hit Points

		If started looking for an opportunity, save when hitpoints reach this level.
	**/
    public var TriggerHitPoints(get,set):Int;

    @:noCompletion
    public extern inline function get_TriggerHitPoints():Int {
        return untyped this.GetKeyValues().TriggerHitPoints;
    }
    
    @:noCompletion
    public extern inline function set_TriggerHitPoints(value:Int):Int {
        return untyped this.SetKeyValue("TriggerHitPoints",untyped value);
    }
    
    /**
		Time to trigger

		If > 0, how long to try and get a save off before giving up
	**/
    public var TimeToTrigget(get,set):Float;

    @:noCompletion
    public extern inline function get_TimeToTrigget():Float {
        return untyped this.GetKeyValues().TimeToTrigget;
    }
    
    @:noCompletion
    public extern inline function set_TimeToTrigget(value:Float):Float {
        return untyped this.SetKeyValue("TimeToTrigget",untyped value);
    }
    
    /**
		Dangerous time

		If 0, just autosave. Otherwise, do an autosavedangerous with this time threshold
	**/
    public var DangerousTime(get,set):Float;

    @:noCompletion
    public extern inline function get_DangerousTime():Float {
        return untyped this.GetKeyValues().DangerousTime;
    }
    
    @:noCompletion
    public extern inline function set_DangerousTime(value:Float):Float {
        return untyped this.SetKeyValue("DangerousTime",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_active_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_active_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_active_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_active_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_active_autosave");
    }
}





#end
