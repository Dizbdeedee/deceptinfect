package gmod.engine_ents;
#if server
/**
	AI Ally Manager
**/
@:forward
abstract Ai_ally_manager(Entity) to Entity {
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
		Set maximum number of allies
	**/
    public extern inline function FireSetMaxAllies(param:Int,delay:Float) {
        untyped this.Fire("SetMaxAllies",untyped param,delay);
    }
    
    /**
		Set maximum number of medic allies
	**/
    public extern inline function FireSetMaxMedics(param:Int,delay:Float) {
        untyped this.Fire("SetMaxMedics",untyped param,delay);
    }
    
    /**
		Replenish player allies
	**/
    public extern inline function FireReplenish(delay:Float) {
        untyped this.Fire("Replenish",untyped null,delay);
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
		Maximum number of allies
	**/
    public var maxallies(get,set):Int;

    @:noCompletion
    public extern inline function get_maxallies():Int {
        return untyped this.GetKeyValues().maxallies;
    }
    
    @:noCompletion
    public extern inline function set_maxallies(value:Int):Int {
        return untyped this.SetKeyValue("maxallies",untyped value);
    }
    
    /**
		Maximum number of medics
	**/
    public var maxmedics(get,set):Int;

    @:noCompletion
    public extern inline function get_maxmedics():Int {
        return untyped this.GetKeyValues().maxmedics;
    }
    
    @:noCompletion
    public extern inline function set_maxmedics(value:Int):Int {
        return untyped this.SetKeyValue("maxmedics",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Spawn Medic Ally
	**/
    public extern inline function OutputSpawnMedicAlly(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnMedicAlly",callback);
    }
    
    /**
		Spawn Ally 0
	**/
    public extern inline function OutputSpawnAlly0(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly0",callback);
    }
    
    /**
		Spawn Ally 1
	**/
    public extern inline function OutputSpawnAlly1(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly1",callback);
    }
    
    /**
		Spawn Ally 2
	**/
    public extern inline function OutputSpawnAlly2(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly2",callback);
    }
    
    /**
		Spawn Ally 3
	**/
    public extern inline function OutputSpawnAlly3(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly3",callback);
    }
    
    /**
		Spawn Ally 4
	**/
    public extern inline function OutputSpawnAlly4(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly4",callback);
    }
    
    /**
		Spawn Ally 5
	**/
    public extern inline function OutputSpawnAlly5(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly5",callback);
    }
    
    /**
		Spawn Ally 6
	**/
    public extern inline function OutputSpawnAlly6(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly6",callback);
    }
    
    /**
		Spawn Ally 7
	**/
    public extern inline function OutputSpawnAlly7(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly7",callback);
    }
    
    /**
		Spawn Ally 8
	**/
    public extern inline function OutputSpawnAlly8(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly8",callback);
    }
    
    /**
		Spawn Ally 9
	**/
    public extern inline function OutputSpawnAlly9(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"SpawnAlly9",callback);
    }
    
    /**
		Fires when there are no more allies
	**/
    public extern inline function OutputOnZeroAllies(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnZeroAllies",callback);
    }
    
    /**
		Fires when there are no more allies
	**/
    public extern inline function OutputOnZeroMedicAllies(callback:Callback<{activator:Ai_ally_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnZeroMedicAllies",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_ally_manager");
    }
}





#end
