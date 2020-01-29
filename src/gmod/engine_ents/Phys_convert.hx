package gmod.engine_ents;
#if server
/**
	Turns an arbitrary entity into a physically simulated entity. i.e. brush entities will behave like func_physbox, model entities behave like prop_physics.
**/
@:forward
abstract Phys_convert(Entity) to Entity {
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
		Converts this entity's target to a physically simulated object.
	**/
    public extern inline function FireConvertTarget(delay:Float) {
        untyped this.Fire("ConvertTarget",untyped null,delay);
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
		Entity to convert

		Name of the entity that will be converted to a physics object when the ConvertTarget input is fired.
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
		Model Swap Entity
	**/
    public var swapmodel(get,set):String;

    @:noCompletion
    public extern inline function get_swapmodel():String {
        return untyped this.GetKeyValues().swapmodel;
    }
    
    @:noCompletion
    public extern inline function set_swapmodel(value:String):String {
        return untyped this.SetKeyValue("swapmodel",untyped value);
    }
    
    /**
		Mass Override

		Sets the mass when the object(s) are converted (0 means auto-calculate)
	**/
    public var massoverride(get,set):Float;

    @:noCompletion
    public extern inline function get_massoverride():Float {
        return untyped this.GetKeyValues().massoverride;
    }
    
    @:noCompletion
    public extern inline function set_massoverride(value:Float):Float {
        return untyped this.SetKeyValue("massoverride",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_convert}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_convert}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_convert}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_convert}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires after the conversion has taken place.
	**/
    public extern inline function OutputOnConvert(callback:Callback<{activator:Phys_convert}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnConvert",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_convertSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_convertSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_convertSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_convert");
    }
}



enum abstract Phys_convertSpawnFlags(Int) to Int {
	var CONVERT_ASLEEP = 1;
	var CONVERT_AS_DEBRIS = 2;
}

#end
