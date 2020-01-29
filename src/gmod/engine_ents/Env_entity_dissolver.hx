package gmod.engine_ents;
#if server
/**
	Entity Dissolver
**/
@:forward
abstract Env_entity_dissolver(Entity) to Entity {
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
		Dissolve target, if no target is passed it'll use the target specified in the target field.
	**/
    public extern inline function FireDissolve(param:String,delay:Float) {
        untyped this.Fire("Dissolve",untyped param,delay);
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
		Target to Dissolve

		Targetname of the entity you want to dissolve.
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
		Magnitude

		How strongly to push away from the center.
	**/
    public var magnitude(get,set):Int;

    @:noCompletion
    public extern inline function get_magnitude():Int {
        return untyped this.GetKeyValues().magnitude;
    }
    
    @:noCompletion
    public extern inline function set_magnitude(value:Int):Int {
        return untyped this.SetKeyValue("magnitude",untyped value);
    }
    
    /**
		Dissolve Type
	**/
    public var dissolvetype(get,set):Env_entity_dissolverdissolvetypeChoices;

    @:noCompletion
    public extern inline function get_dissolvetype():Env_entity_dissolverdissolvetypeChoices {
        return untyped this.GetKeyValues().dissolvetype;
    }
    
    @:noCompletion
    public extern inline function set_dissolvetype(value:Env_entity_dissolverdissolvetypeChoices):Env_entity_dissolverdissolvetypeChoices {
        return untyped this.SetKeyValue("dissolvetype",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_entity_dissolver}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_entity_dissolver}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_entity_dissolver}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_entity_dissolver}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_entity_dissolver");
    }
}

enum abstract Env_entity_dissolverdissolvetypeChoices(Int) to Int {
	var ENERGY = 0;
	var HEAVY_ELECTRICAL = 1;
	var LIGHT_ELECTRICAL = 2;
	var CORE_EFFECT = 3;
}




#end
