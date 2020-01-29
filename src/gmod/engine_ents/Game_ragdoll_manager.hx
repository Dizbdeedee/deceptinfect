package gmod.engine_ents;
#if server
/**
	An entity to control the number of ragdolls in the world, for performance reasons.
**/
@:forward
abstract Game_ragdoll_manager(Entity) to Entity {
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
		Set the Max Ragdoll Count.
	**/
    public extern inline function FireSetMaxRagdollCount(param:Int,delay:Float) {
        untyped this.Fire("SetMaxRagdollCount",untyped param,delay);
    }
    
    /**
		Set the Max Ragdoll Count on DX8 hardware.
	**/
    public extern inline function FireSetMaxRagdollCountDX8(param:Int,delay:Float) {
        untyped this.Fire("SetMaxRagdollCountDX8",untyped param,delay);
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
		Max Ragdoll Count

		Sets the max number of ragdolls that can be in the world at a time (if they are flagged to fade). Set to -1 if you want to use the default value (g_ragdoll_maxcount).
	**/
    public var MaxRagdollCount(get,set):Int;

    @:noCompletion
    public extern inline function get_MaxRagdollCount():Int {
        return untyped this.GetKeyValues().MaxRagdollCount;
    }
    
    @:noCompletion
    public extern inline function set_MaxRagdollCount(value:Int):Int {
        return untyped this.SetKeyValue("MaxRagdollCount",untyped value);
    }
    
    /**
		Max Ragdoll Count DX8

		Sets the max number of ragdolls that can be in the world at a time on DX8 hardware (if they are flagged to fade). Set to -1 if you want to use the 'Max Ragdoll Count' value.
	**/
    public var MaxRagdollCountDX8(get,set):Int;

    @:noCompletion
    public extern inline function get_MaxRagdollCountDX8():Int {
        return untyped this.GetKeyValues().MaxRagdollCountDX8;
    }
    
    @:noCompletion
    public extern inline function set_MaxRagdollCountDX8(value:Int):Int {
        return untyped this.SetKeyValue("MaxRagdollCountDX8",untyped value);
    }
    
    /**
		Save Important Ragdolls

		Should the ragdoll manager make sure ally ragdolls aren't deleted?
	**/
    public var SaveImportant(get,set):Game_ragdoll_managerSaveImportantChoices;

    @:noCompletion
    public extern inline function get_SaveImportant():Game_ragdoll_managerSaveImportantChoices {
        return untyped this.GetKeyValues().SaveImportant;
    }
    
    @:noCompletion
    public extern inline function set_SaveImportant(value:Game_ragdoll_managerSaveImportantChoices):Game_ragdoll_managerSaveImportantChoices {
        return untyped this.SetKeyValue("SaveImportant",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Game_ragdoll_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Game_ragdoll_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Game_ragdoll_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Game_ragdoll_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("game_ragdoll_manager");
    }
}

enum abstract Game_ragdoll_managerSaveImportantChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
