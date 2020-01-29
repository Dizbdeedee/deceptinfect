package gmod.engine_ents;
#if server
/**
	Indicates items in the world that some NPCs may operate upon
**/
@:forward
abstract Ai_goal_operator(Entity) to Entity {
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
		Begin operating on the object
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Set the object's state to READY. Fire this input when the object has been unlocked/opened or otherwise made ready for interaction.
	**/
    public extern inline function FireSetStateReady(delay:Float) {
        untyped this.Fire("SetStateReady",untyped null,delay);
    }
    
    /**
		Fire this input when the NPC has completed the interaction with this object.
	**/
    public extern inline function FireSetStateFinished(delay:Float) {
        untyped this.Fire("SetStateFinished",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Start Disabled
	**/
    public var StartDisabled(get,set):Ai_goal_operatorStartDisabledChoices;

    @:noCompletion
    public extern inline function get_StartDisabled():Ai_goal_operatorStartDisabledChoices {
        return untyped this.GetKeyValues().StartDisabled;
    }
    
    @:noCompletion
    public extern inline function set_StartDisabled(value:Ai_goal_operatorStartDisabledChoices):Ai_goal_operatorStartDisabledChoices {
        return untyped this.SetKeyValue("StartDisabled",untyped value);
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
		Actor to affect

		NPC that should perform this operation
	**/
    public var actor(get,set):String;

    @:noCompletion
    public extern inline function get_actor():String {
        return untyped this.GetKeyValues().actor;
    }
    
    @:noCompletion
    public extern inline function set_actor(value:String):String {
        return untyped this.SetKeyValue("actor",untyped value);
    }
    
    /**
		Position entity

		Name of the entity that the NPC should move to in order to perform the operation.
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
		Context target

		(Optional) Name of an entity that the operator will use within context.
	**/
    public var contexttarget(get,set):String;

    @:noCompletion
    public extern inline function get_contexttarget():String {
        return untyped this.GetKeyValues().contexttarget;
    }
    
    @:noCompletion
    public extern inline function set_contexttarget(value:String):String {
        return untyped this.SetKeyValue("contexttarget",untyped value);
    }
    
    /**
		Initial State
	**/
    public var state(get,set):Ai_goal_operatorstateChoices;

    @:noCompletion
    public extern inline function get_state():Ai_goal_operatorstateChoices {
        return untyped this.GetKeyValues().state;
    }
    
    @:noCompletion
    public extern inline function set_state(value:Ai_goal_operatorstateChoices):Ai_goal_operatorstateChoices {
        return untyped this.SetKeyValue("state",untyped value);
    }
    
    /**
		How should NPC approach?
	**/
    public var moveto(get,set):Ai_goal_operatormovetoChoices;

    @:noCompletion
    public extern inline function get_moveto():Ai_goal_operatormovetoChoices {
        return untyped this.GetKeyValues().moveto;
    }
    
    @:noCompletion
    public extern inline function set_moveto(value:Ai_goal_operatormovetoChoices):Ai_goal_operatormovetoChoices {
        return untyped this.SetKeyValue("moveto",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the NPC begins to approach the position
	**/
    public extern inline function OutputOnBeginApproach(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBeginApproach",callback);
    }
    
    /**
		Make the item ready to operate
	**/
    public extern inline function OutputOnMakeReady(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnMakeReady",callback);
    }
    
    /**
		Fired when the NPC is ready to operate
	**/
    public extern inline function OutputOnBeginOperating(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBeginOperating",callback);
    }
    
    /**
		The item is done
	**/
    public extern inline function OutputOnFinished(callback:Callback<{activator:Ai_goal_operator}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFinished",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_operator");
    }
}

enum abstract Ai_goal_operatorstateChoices(Int) to Int {
	var NOT_READY_CLOSED_LOCKED_ETC = 0;
	var READY_OPEN_AND_ACCESSIBLE = 1;
}
enum abstract Ai_goal_operatormovetoChoices(Int) to Int {
	var DO_NOT_USE_THIS_SETTING = 0;
	var WALK = 1;
	var RUN = 2;
}
enum abstract Ai_goal_operatorStartDisabledChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
