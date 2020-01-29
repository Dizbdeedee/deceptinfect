package gmod.engine_ents;
#if server
/**
	An entity that can be used to control the idle speech patterns of a set of NPCs.
**/
@:forward
abstract Ai_speechfilter(Entity) to Entity {
    //Inputs
    
    /**
		Enable this entity.
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable this entity.
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
    }
    
    /**
		Adds a context to this entity's list of response contexts. The format should be 'key:value'.
	**/
    public extern inline function FireAddContext(param:String,delay:Float) {
        untyped this.Fire("AddContext",untyped param,delay);
    }
    
    /**
		Remove a context from this entity's list of response contexts. The name should match the 'key' of a previously added context.
	**/
    public extern inline function FireRemoveContext(param:String,delay:Float) {
        untyped this.Fire("RemoveContext",untyped param,delay);
    }
    
    /**
		Removes all contexts in this entity's list of response contexts.
	**/
    public extern inline function FireClearContext(delay:Float) {
        untyped this.Fire("ClearContext",untyped null,delay);
    }
    
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
		Allows designers to change the idle modifier at runtime
	**/
    public extern inline function FireSetIdleModifier(param:Float,delay:Float) {
        untyped this.Fire("SetIdleModifier",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Ai_speechfilterStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Ai_speechfilterStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Ai_speechfilterStartDisabledChoices):Ai_speechfilterStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
    }
    
    /**
		Response Contexts

		Response system context(s) for this entity. Format should be: 'key:value,key2:value2,etc'. When this entity speaks, the list of keys & values will be passed to the response rules system.
	**/
    public var ResponseContext(get,set):String;

    @:noCompletion
    public extern inline function get_ResponseContext():String {
        return untyped this.GetKeyValues().ResponseContext;
    }
    
    @:noCompletion
    public extern inline function set_ResponseContext(value:String):String {
        return untyped this.SetKeyValue("ResponseContext",untyped value);
    }
    
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
		Subject(s)

		This is the NPC(s) whose speech we're filtering. May be a targetname or a classname.
	**/
    public var subject(get,set):String;

    @:noCompletion
    public extern inline function get_subject():String {
        return untyped this.GetKeyValues().subject;
    }
    
    @:noCompletion
    public extern inline function set_subject(value:String):String {
        return untyped this.SetKeyValue("subject",untyped value);
    }
    
    /**
		Idle modifier.

		Multiplier to the percentage chance that our NPC(s) will idle speak. Set to 0 to prevent all idle speech.
	**/
    public var IdleModifier(get,set):Float;

    @:noCompletion
    public extern inline function get_IdleModifier():Float {
        return untyped this.GetKeyValues().IdleModifier;
    }
    
    @:noCompletion
    public extern inline function set_IdleModifier(value:Float):Float {
        return untyped this.SetKeyValue("IdleModifier",untyped value);
    }
    
    /**
		Greet Player?

		If set to Yes, our NPC(s) won't greet the player when they first meet him.
	**/
    public var NeverSayHello(get,set):Ai_speechfilterNeverSayHelloChoices;

    @:noCompletion
    public extern inline function get_NeverSayHello():Ai_speechfilterNeverSayHelloChoices {
        return untyped this.GetKeyValues().NeverSayHello;
    }
    
    @:noCompletion
    public extern inline function set_NeverSayHello(value:Ai_speechfilterNeverSayHelloChoices):Ai_speechfilterNeverSayHelloChoices {
        return untyped this.SetKeyValue("NeverSayHello",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_speechfilter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_speechfilter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_speechfilter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_speechfilter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_speechfilter");
    }
}

enum abstract Ai_speechfilterStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_speechfilterNeverSayHelloChoices(Int) to Int {
	var YES = 0;
	var NO = 1;
}




#end
