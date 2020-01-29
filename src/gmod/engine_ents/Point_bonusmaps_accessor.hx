package gmod.engine_ents;
#if server
/**
	An entity that relays bonus maps changes.
**/
@:forward
abstract Point_bonusmaps_accessor(Entity) to Entity {
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
		Unlocks the filename/map combination.
	**/
    public extern inline function FireUnlock(delay:Float) {
        untyped this.Fire("Unlock",untyped null,delay);
    }
    
    /**
		Completes the filename/map combination.
	**/
    public extern inline function FireComplete(delay:Float) {
        untyped this.Fire("Complete",untyped null,delay);
    }
    
    /**
		Saves bonus map data.
	**/
    public extern inline function FireSave(delay:Float) {
        untyped this.Fire("Save",untyped null,delay);
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
		File Name
	**/
    public var filename(get,set):String;

    @:noCompletion
    public extern inline function get_filename():String {
        return untyped this.GetKeyValues().filename;
    }
    
    @:noCompletion
    public extern inline function set_filename(value:String):String {
        return untyped this.SetKeyValue("filename",untyped value);
    }
    
    /**
		Map Name
	**/
    public var mapname(get,set):String;

    @:noCompletion
    public extern inline function get_mapname():String {
        return untyped this.GetKeyValues().mapname;
    }
    
    @:noCompletion
    public extern inline function set_mapname(value:String):String {
        return untyped this.SetKeyValue("mapname",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_bonusmaps_accessor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_bonusmaps_accessor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_bonusmaps_accessor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_bonusmaps_accessor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_bonusmaps_accessor");
    }
}





#end
