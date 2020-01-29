package gmod.engine_ents;
#if server
/**
	Scripted Sentence
**/
@:forward
abstract Scripted_sentence(Entity) to Entity {
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
		Starts the scripted sentence.
	**/
    public extern inline function FireBeginSentence(delay:Float) {
        untyped this.Fire("BeginSentence",untyped null,delay);
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
		Sentence Name
	**/
    public var sentence(get,set):String;

    @:noCompletion
    public extern inline function get_sentence():String {
        return untyped this.GetKeyValues().sentence;
    }
    
    @:noCompletion
    public extern inline function set_sentence(value:String):String {
        return untyped this.SetKeyValue("sentence",untyped value);
    }
    
    /**
		Speaker Type
	**/
    public var entity(get,set):String;

    @:noCompletion
    public extern inline function get_entity():String {
        return untyped this.GetKeyValues().entity;
    }
    
    @:noCompletion
    public extern inline function set_entity(value:String):String {
        return untyped this.SetKeyValue("entity",untyped value);
    }
    
    /**
		Additional Sentence Time
	**/
    public var delay(get,set):String;

    @:noCompletion
    public extern inline function get_delay():String {
        return untyped this.GetKeyValues().delay;
    }
    
    @:noCompletion
    public extern inline function set_delay(value:String):String {
        return untyped this.SetKeyValue("delay",untyped value);
    }
    
    /**
		Search Radius
	**/
    public var radius(get,set):Int;

    @:noCompletion
    public extern inline function get_radius():Int {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:Int):Int {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		Delay Before Refire
	**/
    public var refire(get,set):String;

    @:noCompletion
    public extern inline function get_refire():String {
        return untyped this.GetKeyValues().refire;
    }
    
    @:noCompletion
    public extern inline function set_refire(value:String):String {
        return untyped this.SetKeyValue("refire",untyped value);
    }
    
    /**
		Listener Type
	**/
    public var listener(get,set):String;

    @:noCompletion
    public extern inline function get_listener():String {
        return untyped this.GetKeyValues().listener;
    }
    
    @:noCompletion
    public extern inline function set_listener(value:String):String {
        return untyped this.SetKeyValue("listener",untyped value);
    }
    
    /**
		Volume 0-10
	**/
    public var volume(get,set):String;

    @:noCompletion
    public extern inline function get_volume():String {
        return untyped this.GetKeyValues().volume;
    }
    
    @:noCompletion
    public extern inline function set_volume(value:String):String {
        return untyped this.SetKeyValue("volume",untyped value);
    }
    
    /**
		Sound Radius
	**/
    public var attenuation(get,set):Choices;

    @:noCompletion
    public extern inline function get_attenuation():Choices {
        return untyped this.GetKeyValues().attenuation;
    }
    
    @:noCompletion
    public extern inline function set_attenuation(value:Choices):Choices {
        return untyped this.SetKeyValue("attenuation",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when the sentence begins
	**/
    public extern inline function OutputOnBeginSentence(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBeginSentence",callback);
    }
    
    /**
		Fires when the sentence ends
	**/
    public extern inline function OutputOnEndSentence(callback:Callback<{activator:Scripted_sentence}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEndSentence",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Scripted_sentenceSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Scripted_sentenceSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Scripted_sentenceSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("scripted_sentence");
    }
}



enum abstract Scripted_sentenceSpawnFlags(Int) to Int {
	var FIRE_ONCE = 1;
	var FOLLOWERS_ONLY = 2;
	var INTERRUPT_SPEECH = 4;
	var CONCURRENT = 8;
	var SPEAK_TO_ACTIVATOR = 16;
}

#end
