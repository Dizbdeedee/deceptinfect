package gmod.engine_ents;
#if server
/**
	An entity that can be used to enables/disable vphysics collisions between two target entities.
**/
@:forward
abstract Logic_collision_pair(Entity) to Entity {
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
		Enable collisions between the first and second entity.
	**/
    public extern inline function FireEnableCollisions(delay:Float) {
        untyped this.Fire("EnableCollisions",untyped null,delay);
    }
    
    /**
		Disable collisions between the first and second entity.
	**/
    public extern inline function FireDisableCollisions(delay:Float) {
        untyped this.Fire("DisableCollisions",untyped null,delay);
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
		Attachment 1

		The first entity.
	**/
    public var attach1(get,set):String;

    @:noCompletion
    public extern inline function get_attach1():String {
        return untyped this.GetKeyValues().attach1;
    }
    
    @:noCompletion
    public extern inline function set_attach1(value:String):String {
        return untyped this.SetKeyValue("attach1",untyped value);
    }
    
    /**
		Attachment 2

		The second entity.
	**/
    public var attach2(get,set):String;

    @:noCompletion
    public extern inline function get_attach2():String {
        return untyped this.GetKeyValues().attach2;
    }
    
    @:noCompletion
    public extern inline function set_attach2(value:String):String {
        return untyped this.SetKeyValue("attach2",untyped value);
    }
    
    /**
		Start with collisions disabled
	**/
    public var startdisabled(get,set):Logic_collision_pairstartdisabledChoices;

    @:noCompletion
    public extern inline function get_startdisabled():Logic_collision_pairstartdisabledChoices {
        return untyped this.GetKeyValues().startdisabled;
    }
    
    @:noCompletion
    public extern inline function set_startdisabled(value:Logic_collision_pairstartdisabledChoices):Logic_collision_pairstartdisabledChoices {
        return untyped this.SetKeyValue("startdisabled",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_collision_pair}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_collision_pair}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_collision_pair}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_collision_pair}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_collision_pair");
    }
}

enum abstract Logic_collision_pairstartdisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
