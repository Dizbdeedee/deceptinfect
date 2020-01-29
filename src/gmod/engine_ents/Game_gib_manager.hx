package gmod.engine_ents;
#if server
/**
	An entity to control the number of gibs in the world, for performance reasons.
**/
@:forward
abstract Game_gib_manager(Entity) to Entity {
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
		Set the max gib count.
	**/
    public extern inline function FireSetMaxPieces(param:Int,delay:Float) {
        untyped this.Fire("SetMaxPieces",untyped param,delay);
    }
    
    /**
		Set the max gib count under DX8.
	**/
    public extern inline function FireSetMaxPiecesDX8(param:Int,delay:Float) {
        untyped this.Fire("SetMaxPiecesDX8",untyped param,delay);
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
		Max Gib Count

		Sets the max number of gib that can be spawned at a time. (-1=no limit)
	**/
    public var maxpieces(get,set):Int;

    @:noCompletion
    public extern inline function get_maxpieces():Int {
        return untyped this.GetKeyValues().maxpieces;
    }
    
    @:noCompletion
    public extern inline function set_maxpieces(value:Int):Int {
        return untyped this.SetKeyValue("maxpieces",untyped value);
    }
    
    /**
		Max Gib Count On DX8

		Sets the max number of gib that can be spawned at a time under DX8. (-1=use Max Gib Count setting)
	**/
    public var maxpiecesdx8(get,set):Int;

    @:noCompletion
    public extern inline function get_maxpiecesdx8():Int {
        return untyped this.GetKeyValues().maxpiecesdx8;
    }
    
    @:noCompletion
    public extern inline function set_maxpiecesdx8(value:Int):Int {
        return untyped this.SetKeyValue("maxpiecesdx8",untyped value);
    }
    
    /**
		Allow New Gibs To Spawn

		If true, when the max gib count is reached, oldest gibs are removed as new gibs spawn. If false, new gibs will not be spawned once the gib limit is reached.
	**/
    public var allownewgibs(get,set):Game_gib_managerallownewgibsChoices;

    @:noCompletion
    public extern inline function get_allownewgibs():Game_gib_managerallownewgibsChoices {
        return untyped this.GetKeyValues().allownewgibs;
    }
    
    @:noCompletion
    public extern inline function set_allownewgibs(value:Game_gib_managerallownewgibsChoices):Game_gib_managerallownewgibsChoices {
        return untyped this.SetKeyValue("allownewgibs",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Game_gib_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Game_gib_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Game_gib_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Game_gib_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("game_gib_manager");
    }
}

enum abstract Game_gib_managerallownewgibsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
