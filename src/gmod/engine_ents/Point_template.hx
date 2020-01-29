package gmod.engine_ents;
#if server
/**
	Turns an entity, or set of entities, into a single template that can be instanced anywhere, and multiple times. If there are interdependencies (entity I/O, hierarchy, or other name references) between the entities in the template, the entities in the template will have their names changed and the interdependencies will be reconnected to the changes names. The name change format is as follows: '<original name>&0000', where the 0000 will be replaced with the current global template instance, so wildcard searches for '<original name>*' will still find them.
If you don't want the name fixup to happen, because you're only spawning the template once, or you want inputs to trigger all instances of the template, check the 'Preserve entity names' spawnflag. 
To spawn the template in other places, use an env_entity_maker.
**/
@:forward
abstract Point_template(Entity) to Entity {
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
		Spawn an instance of the template at the original position.
	**/
    public extern inline function FireForceSpawn(delay:Float) {
        untyped this.Fire("ForceSpawn",untyped null,delay);
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
		Template 1
	**/
    public var Template01(get,set):String;

    @:noCompletion
    public extern inline function get_Template01():String {
        return untyped this.GetKeyValues().Template01;
    }
    
    @:noCompletion
    public extern inline function set_Template01(value:String):String {
        return untyped this.SetKeyValue("Template01",untyped value);
    }
    
    /**
		Template 2
	**/
    public var Template02(get,set):String;

    @:noCompletion
    public extern inline function get_Template02():String {
        return untyped this.GetKeyValues().Template02;
    }
    
    @:noCompletion
    public extern inline function set_Template02(value:String):String {
        return untyped this.SetKeyValue("Template02",untyped value);
    }
    
    /**
		Template 3
	**/
    public var Template03(get,set):String;

    @:noCompletion
    public extern inline function get_Template03():String {
        return untyped this.GetKeyValues().Template03;
    }
    
    @:noCompletion
    public extern inline function set_Template03(value:String):String {
        return untyped this.SetKeyValue("Template03",untyped value);
    }
    
    /**
		Template 4
	**/
    public var Template04(get,set):String;

    @:noCompletion
    public extern inline function get_Template04():String {
        return untyped this.GetKeyValues().Template04;
    }
    
    @:noCompletion
    public extern inline function set_Template04(value:String):String {
        return untyped this.SetKeyValue("Template04",untyped value);
    }
    
    /**
		Template 5
	**/
    public var Template05(get,set):String;

    @:noCompletion
    public extern inline function get_Template05():String {
        return untyped this.GetKeyValues().Template05;
    }
    
    @:noCompletion
    public extern inline function set_Template05(value:String):String {
        return untyped this.SetKeyValue("Template05",untyped value);
    }
    
    /**
		Template 6
	**/
    public var Template06(get,set):String;

    @:noCompletion
    public extern inline function get_Template06():String {
        return untyped this.GetKeyValues().Template06;
    }
    
    @:noCompletion
    public extern inline function set_Template06(value:String):String {
        return untyped this.SetKeyValue("Template06",untyped value);
    }
    
    /**
		Template 7
	**/
    public var Template07(get,set):String;

    @:noCompletion
    public extern inline function get_Template07():String {
        return untyped this.GetKeyValues().Template07;
    }
    
    @:noCompletion
    public extern inline function set_Template07(value:String):String {
        return untyped this.SetKeyValue("Template07",untyped value);
    }
    
    /**
		Template 8
	**/
    public var Template08(get,set):String;

    @:noCompletion
    public extern inline function get_Template08():String {
        return untyped this.GetKeyValues().Template08;
    }
    
    @:noCompletion
    public extern inline function set_Template08(value:String):String {
        return untyped this.SetKeyValue("Template08",untyped value);
    }
    
    /**
		Template 9
	**/
    public var Template09(get,set):String;

    @:noCompletion
    public extern inline function get_Template09():String {
        return untyped this.GetKeyValues().Template09;
    }
    
    @:noCompletion
    public extern inline function set_Template09(value:String):String {
        return untyped this.SetKeyValue("Template09",untyped value);
    }
    
    /**
		Template 10
	**/
    public var Template10(get,set):String;

    @:noCompletion
    public extern inline function get_Template10():String {
        return untyped this.GetKeyValues().Template10;
    }
    
    @:noCompletion
    public extern inline function set_Template10(value:String):String {
        return untyped this.SetKeyValue("Template10",untyped value);
    }
    
    /**
		Template 11
	**/
    public var Template11(get,set):String;

    @:noCompletion
    public extern inline function get_Template11():String {
        return untyped this.GetKeyValues().Template11;
    }
    
    @:noCompletion
    public extern inline function set_Template11(value:String):String {
        return untyped this.SetKeyValue("Template11",untyped value);
    }
    
    /**
		Template 12
	**/
    public var Template12(get,set):String;

    @:noCompletion
    public extern inline function get_Template12():String {
        return untyped this.GetKeyValues().Template12;
    }
    
    @:noCompletion
    public extern inline function set_Template12(value:String):String {
        return untyped this.SetKeyValue("Template12",untyped value);
    }
    
    /**
		Template 13
	**/
    public var Template13(get,set):String;

    @:noCompletion
    public extern inline function get_Template13():String {
        return untyped this.GetKeyValues().Template13;
    }
    
    @:noCompletion
    public extern inline function set_Template13(value:String):String {
        return untyped this.SetKeyValue("Template13",untyped value);
    }
    
    /**
		Template 14
	**/
    public var Template14(get,set):String;

    @:noCompletion
    public extern inline function get_Template14():String {
        return untyped this.GetKeyValues().Template14;
    }
    
    @:noCompletion
    public extern inline function set_Template14(value:String):String {
        return untyped this.SetKeyValue("Template14",untyped value);
    }
    
    /**
		Template 15
	**/
    public var Template15(get,set):String;

    @:noCompletion
    public extern inline function get_Template15():String {
        return untyped this.GetKeyValues().Template15;
    }
    
    @:noCompletion
    public extern inline function set_Template15(value:String):String {
        return untyped this.SetKeyValue("Template15",untyped value);
    }
    
    /**
		Template 16
	**/
    public var Template16(get,set):String;

    @:noCompletion
    public extern inline function get_Template16():String {
        return untyped this.GetKeyValues().Template16;
    }
    
    @:noCompletion
    public extern inline function set_Template16(value:String):String {
        return untyped this.SetKeyValue("Template16",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_template}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_template}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_template}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_template}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired after spawning an instance of this template.
	**/
    public extern inline function OutputOnEntitySpawned(callback:Callback<{activator:Point_template}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnEntitySpawned",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_templateSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_templateSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_templateSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_template");
    }
}



enum abstract Point_templateSpawnFlags(Int) to Int {
	var DONT_REMOVE_TEMPLATE_ENTITIES = 1;
	var PRESERVE_ENTITY_NAMES_DONT_DO_NAME_FIXUP = 2;
}

#end
