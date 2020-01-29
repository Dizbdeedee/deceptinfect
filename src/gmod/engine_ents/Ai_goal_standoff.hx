package gmod.engine_ents;
#if server
/**
	AI Goal Standoff
**/
@:forward
abstract Ai_goal_standoff(Entity) to Entity {
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
		Begin contesting position
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Cease contesting position
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Set aggressiveness
	**/
    public extern inline function FireSetAggressiveness(param:Int,delay:Float) {
        untyped this.Fire("SetAggressiveness",untyped param,delay);
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
		Actor(s) to affect
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
		Search Type

		How to search for the entities using the targetname.
	**/
    public var SearchType(get,set):Ai_goal_standoffSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_goal_standoffSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_goal_standoffSearchTypeChoices):Ai_goal_standoffSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    /**
		Start Active
	**/
    public var StartActive(get,set):Ai_goal_standoffStartActiveChoices;

    @:noCompletion
    public extern inline function get_StartActive():Ai_goal_standoffStartActiveChoices {
        return untyped this.GetKeyValues().StartActive;
    }
    
    @:noCompletion
    public extern inline function set_StartActive(value:Ai_goal_standoffStartActiveChoices):Ai_goal_standoffStartActiveChoices {
        return untyped this.SetKeyValue("StartActive",untyped value);
    }
    
    /**
		Reaction to tactical change

		What to do if leader moves, threat is neutralized, hint group changes, etc
	**/
    public var HintGroupChangeReaction(get,set):Choices;

    @:noCompletion
    public extern inline function get_HintGroupChangeReaction():Choices {
        return untyped this.GetKeyValues().HintGroupChangeReaction;
    }
    
    @:noCompletion
    public extern inline function set_HintGroupChangeReaction(value:Choices):Choices {
        return untyped this.SetKeyValue("HintGroupChangeReaction",untyped value);
    }
    
    /**
		Aggressiveness
	**/
    public var Aggressiveness(get,set):Choices;

    @:noCompletion
    public extern inline function get_Aggressiveness():Choices {
        return untyped this.GetKeyValues().Aggressiveness;
    }
    
    @:noCompletion
    public extern inline function set_Aggressiveness(value:Choices):Choices {
        return untyped this.SetKeyValue("Aggressiveness",untyped value);
    }
    
    /**
		Player battleline

		Player defines a battle line, applies to allies only
	**/
    public var PlayerBattleline(get,set):Ai_goal_standoffPlayerBattlelineChoices;

    @:noCompletion
    public extern inline function get_PlayerBattleline():Ai_goal_standoffPlayerBattlelineChoices {
        return untyped this.GetKeyValues().PlayerBattleline;
    }
    
    @:noCompletion
    public extern inline function set_PlayerBattleline(value:Ai_goal_standoffPlayerBattlelineChoices):Ai_goal_standoffPlayerBattlelineChoices {
        return untyped this.SetKeyValue("PlayerBattleline",untyped value);
    }
    
    /**
		Stay at cover location

		When have suitable cover, don't change it (disables advancing to battle line)
	**/
    public var StayAtCover(get,set):Ai_goal_standoffStayAtCoverChoices;

    @:noCompletion
    public extern inline function get_StayAtCover():Ai_goal_standoffStayAtCoverChoices {
        return untyped this.GetKeyValues().StayAtCover;
    }
    
    @:noCompletion
    public extern inline function set_StayAtCover(value:Ai_goal_standoffStayAtCoverChoices):Ai_goal_standoffStayAtCoverChoices {
        return untyped this.SetKeyValue("StayAtCover",untyped value);
    }
    
    /**
		Abandon if enemies hide

		If no enemy detected recently, stop the standoff
	**/
    public var AbandonIfEnemyHides(get,set):Ai_goal_standoffAbandonIfEnemyHidesChoices;

    @:noCompletion
    public extern inline function get_AbandonIfEnemyHides():Ai_goal_standoffAbandonIfEnemyHidesChoices {
        return untyped this.GetKeyValues().AbandonIfEnemyHides;
    }
    
    @:noCompletion
    public extern inline function set_AbandonIfEnemyHides(value:Ai_goal_standoffAbandonIfEnemyHidesChoices):Ai_goal_standoffAbandonIfEnemyHidesChoices {
        return untyped this.SetKeyValue("AbandonIfEnemyHides",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_goal_standoff}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_goal_standoff}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_goal_standoff}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_goal_standoff}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_goal_standoff");
    }
}

enum abstract Ai_goal_standoffStayAtCoverChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_standoffStartActiveChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_standoffSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
}
enum abstract Ai_goal_standoffPlayerBattlelineChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_goal_standoffAbandonIfEnemyHidesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
