package gmod.engine_ents;
#if server
/**
	An entity that draws a text message on player's HUDs.
**/
@:forward
abstract Env_message(Entity) to Entity {
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
		Shows the message and plays the sound.
	**/
    public extern inline function FireShowMessage(delay:Float) {
        untyped this.Fire("ShowMessage",untyped null,delay);
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
		Message Text
	**/
    public var message(get,set):String;

    @:noCompletion
    public extern inline function get_message():String {
        return untyped this.GetKeyValues().message;
    }
    
    @:noCompletion
    public extern inline function set_message(value:String):String {
        return untyped this.SetKeyValue("message",untyped value);
    }
    
    /**
		Sound Effect

		When the message is shown, this sound effect will be played, originating from this entity.
	**/
    public var messagesound(get,set):String;

    @:noCompletion
    public extern inline function get_messagesound():String {
        return untyped this.GetKeyValues().messagesound;
    }
    
    @:noCompletion
    public extern inline function set_messagesound(value:String):String {
        return untyped this.SetKeyValue("messagesound",untyped value);
    }
    
    /**
		Volume 0-10

		Volume of the sound effect.
	**/
    public var messagevolume(get,set):String;

    @:noCompletion
    public extern inline function get_messagevolume():String {
        return untyped this.GetKeyValues().messagevolume;
    }
    
    @:noCompletion
    public extern inline function set_messagevolume(value:String):String {
        return untyped this.SetKeyValue("messagevolume",untyped value);
    }
    
    /**
		Sound Radius
	**/
    public var messageattenuation(get,set):Choices;

    @:noCompletion
    public extern inline function get_messageattenuation():Choices {
        return untyped this.GetKeyValues().messageattenuation;
    }
    
    @:noCompletion
    public extern inline function set_messageattenuation(value:Choices):Choices {
        return untyped this.SetKeyValue("messageattenuation",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_message}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_message}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_message}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_message}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the message is activated.
	**/
    public extern inline function OutputOnShowMessage(callback:Callback<{activator:Env_message}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnShowMessage",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_messageSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_messageSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_messageSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_message");
    }
}



enum abstract Env_messageSpawnFlags(Int) to Int {
	var PLAY_ONCE = 1;
	var ALL_CLIENTS = 2;
}

#end
