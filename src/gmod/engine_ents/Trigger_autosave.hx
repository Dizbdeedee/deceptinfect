package gmod.engine_ents;
#if server
/**
	A trigger volume that autosaves when the player touches it.
**/
@:forward
abstract Trigger_autosave(Entity) to Entity {
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
		Master

		Legacy support: The name of a master entity. If the master hasn't been activated, this entity will not activate.
	**/
    public var master(get,set):String;

    @:noCompletion
    public extern inline function get_master():String {
        return untyped this.GetKeyValues().master;
    }
    
    @:noCompletion
    public extern inline function set_master(value:String):String {
        return untyped this.SetKeyValue("master",untyped value);
    }
    
    /**
		Force New Level Unit

		If set, the save will discard any savedata from previous levels, for the purpose of keeping savegame filesizes down. Can only be safely used if there is no way for the player to return to previous levels.
	**/
    public var NewLevelUnit(get,set):Trigger_autosaveNewLevelUnitChoices;

    @:noCompletion
    public extern inline function get_NewLevelUnit():Trigger_autosaveNewLevelUnitChoices {
        return untyped this.GetKeyValues().NewLevelUnit;
    }
    
    @:noCompletion
    public extern inline function set_NewLevelUnit(value:Trigger_autosaveNewLevelUnitChoices):Trigger_autosaveNewLevelUnitChoices {
        return untyped this.SetKeyValue("NewLevelUnit",untyped value);
    }
    
    /**
		Dangerous Timer

		The number of seconds the player must survive before this autosave takes effect.
	**/
    public var DangerousTimer(get,set):Float;

    @:noCompletion
    public extern inline function get_DangerousTimer():Float {
        return untyped this.GetKeyValues().DangerousTimer;
    }
    
    @:noCompletion
    public extern inline function set_DangerousTimer(value:Float):Float {
        return untyped this.SetKeyValue("DangerousTimer",untyped value);
    }
    
    /**
		Minumum Hit Points

		Don't save dangerous when player has less than this many hitpoints.
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
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Trigger_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Trigger_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Trigger_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Trigger_autosave}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("trigger_autosave");
    }
}

enum abstract Trigger_autosaveNewLevelUnitChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
