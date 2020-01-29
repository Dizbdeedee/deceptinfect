package gmod.engine_ents;
#if server
/**
	Change Hint Group
**/
@:forward
abstract Ai_changehintgroup(Entity) to Entity {
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
		Removes this entity from the world
	**/
    public extern inline function FireKill(delay:Float) {
        untyped this.Fire("Kill",untyped null,delay);
    }
    
    /**
		Change the Hint Group
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
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
		Search Type

		How to search for the entities to change.
	**/
    public var SearchType(get,set):Ai_changehintgroupSearchTypeChoices;

    @:noCompletion
    public extern inline function get_SearchType():Ai_changehintgroupSearchTypeChoices {
        return untyped this.GetKeyValues().SearchType;
    }
    
    @:noCompletion
    public extern inline function set_SearchType(value:Ai_changehintgroupSearchTypeChoices):Ai_changehintgroupSearchTypeChoices {
        return untyped this.SetKeyValue("SearchType",untyped value);
    }
    
    /**
		Name to search for
	**/
    public var SearchName(get,set):String;

    @:noCompletion
    public extern inline function get_SearchName():String {
        return untyped this.GetKeyValues().SearchName;
    }
    
    @:noCompletion
    public extern inline function set_SearchName(value:String):String {
        return untyped this.SetKeyValue("SearchName",untyped value);
    }
    
    /**
		New Hint Group
	**/
    public var NewHintGroup(get,set):String;

    @:noCompletion
    public extern inline function get_NewHintGroup():String {
        return untyped this.GetKeyValues().NewHintGroup;
    }
    
    @:noCompletion
    public extern inline function set_NewHintGroup(value:String):String {
        return untyped this.SetKeyValue("NewHintGroup",untyped value);
    }
    
    /**
		Search Radius

		Radius to search (0 for all of map)
	**/
    public var Radius(get,set):String;

    @:noCompletion
    public extern inline function get_Radius():String {
        return untyped this.GetKeyValues().Radius;
    }
    
    @:noCompletion
    public extern inline function set_Radius(value:String):String {
        return untyped this.SetKeyValue("Radius",untyped value);
    }
    
    /**
		Hint Limit Nav

		Limits NPC to using specified hint group for navigation requests, does not limit local navigation.
	**/
    public var hintlimiting(get,set):Ai_changehintgrouphintlimitingChoices;

    @:noCompletion
    public extern inline function get_hintlimiting():Ai_changehintgrouphintlimitingChoices {
        return untyped this.GetKeyValues().hintlimiting;
    }
    
    @:noCompletion
    public extern inline function set_hintlimiting(value:Ai_changehintgrouphintlimitingChoices):Ai_changehintgrouphintlimitingChoices {
        return untyped this.SetKeyValue("hintlimiting",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Ai_changehintgroup}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Ai_changehintgroup}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Ai_changehintgroup}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Ai_changehintgroup}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("ai_changehintgroup");
    }
}

enum abstract Ai_changehintgrouphintlimitingChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Ai_changehintgroupSearchTypeChoices(Int) to Int {
	var ENTITY_NAME = 0;
	var CLASSNAME = 1;
	var OLD_HINT_GROUP = 2;
}




#end
