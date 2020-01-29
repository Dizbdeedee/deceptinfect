package gmod.engine_ents;
#if server
/**
	A filter that filters a potential enemy entity by a set of criteria.
**/
@:forward
abstract Filter_enemy(Entity) to Entity {
    //Inputs
    
    /**
		Test the activator against the filter and fires OnPass or OnFail output.
	**/
    public extern inline function FireTestActivator(delay:Float) {
        untyped this.Fire("TestActivator",untyped null,delay);
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
    
    //Keyvalues
    
    /**
		Filter mode

		If set to Allow, only entities who match the criteria will pass the filter. If set to Disallow, only entities who do NOT match the criteria will pass the filter.
	**/
    public var Negated(get,set):Filter_enemyNegatedChoices;

    @:noCompletion
    public extern inline function get_Negated():Filter_enemyNegatedChoices {
        return untyped this.GetKeyValues().Negated;
    }
    
    @:noCompletion
    public extern inline function set_Negated(value:Filter_enemyNegatedChoices):Filter_enemyNegatedChoices {
        return untyped this.SetKeyValue("Negated",untyped value);
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
		Name/Classname

		The classname or entity name to filter by. If the filter mode is Allow, only entities whose class name matches the given string will pass the filter. If the filter mode is Disallow, all entities EXCEPT those whose class name matches the given string will pass the filter.
	**/
    public var filtername(get,set):String;

    @:noCompletion
    public extern inline function get_filtername():String {
        return untyped this.GetKeyValues().filtername;
    }
    
    @:noCompletion
    public extern inline function set_filtername(value:String):String {
        return untyped this.SetKeyValue("filtername",untyped value);
    }
    
    /**
		Radius

		Radius by which to test the proximity of the enemy.  If the filter mode is Allow, only entities whose distance is equal to or closer than the radius will pass the filter. If the filter mode is Disallow, all entities outside the radius will pass the filter.
	**/
    public var filter_radius(get,set):Float;

    @:noCompletion
    public extern inline function get_filter_radius():Float {
        return untyped this.GetKeyValues().filter_radius;
    }
    
    @:noCompletion
    public extern inline function set_filter_radius(value:Float):Float {
        return untyped this.SetKeyValue("filter_radius",untyped value);
    }
    
    /**
		Outer Radius

		Enemies outside this radius are considered invalid if Allow is set and valid if Disallow is set.
	**/
    public var filter_outer_radius(get,set):Float;

    @:noCompletion
    public extern inline function get_filter_outer_radius():Float {
        return untyped this.GetKeyValues().filter_outer_radius;
    }
    
    @:noCompletion
    public extern inline function set_filter_outer_radius(value:Float):Float {
        return untyped this.SetKeyValue("filter_outer_radius",untyped value);
    }
    
    /**
		Max Squadmates Per Enemy

		Maximum number of squadmates allowed to target any given entity.
	**/
    public var filter_max_per_enemy(get,set):Int;

    @:noCompletion
    public extern inline function get_filter_max_per_enemy():Int {
        return untyped this.GetKeyValues().filter_max_per_enemy;
    }
    
    @:noCompletion
    public extern inline function set_filter_max_per_enemy(value:Int):Int {
        return untyped this.SetKeyValue("filter_max_per_enemy",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to TestActivator input if the activator passes the filter.
	**/
    public extern inline function OutputOnPass(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnPass",callback);
    }
    
    /**
		Fired in response to TestActivator input if the activator fails to pass the filter.
	**/
    public extern inline function OutputOnFail(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFail",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Filter_enemy}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Filter_enemySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Filter_enemySpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Filter_enemySpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("filter_enemy");
    }
}

enum abstract Filter_enemyNegatedChoices(Int) to Int {
	var ALLOW_ENTITIES_THAT_MATCH_CRITERIA = 0;
	var DISALLOW_ENTITIES_THAT_MATCH_CRITERIA = 1;
}


enum abstract Filter_enemySpawnFlags(Int) to Int {
	var DO_NOT_LOSE_TARGET_IF_ALREADY_AQUIRED_BUT_FILTER_FAILED = 1;
}

#end
