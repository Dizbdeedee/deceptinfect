package gmod.engine_ents;
#if server
/**
	A dynamic connection between two navigation nodes. You specify the node IDs of the start and end nodes, and then you can use entity I/O to turn on and off the connection. This could be used to create or destroy a connection in the nodegraph because of some event in your map (a bridge being created/destroyed, etc).
**/
@:forward
abstract Info_node_link(Entity) to Entity {
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
		Turn the link on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn the link off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
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
		Start node ID

		The node ID of one end of the node connection.
	**/
    public var StartNode(get,set):String;

    @:noCompletion
    public extern inline function get_StartNode():String {
        return untyped this.GetKeyValues().StartNode;
    }
    
    @:noCompletion
    public extern inline function set_StartNode(value:String):String {
        return untyped this.SetKeyValue("StartNode",untyped value);
    }
    
    /**
		End node ID

		The node ID of one end of the node connection.
	**/
    public var EndNode(get,set):String;

    @:noCompletion
    public extern inline function get_EndNode():String {
        return untyped this.GetKeyValues().EndNode;
    }
    
    @:noCompletion
    public extern inline function set_EndNode(value:String):String {
        return untyped this.SetKeyValue("EndNode",untyped value);
    }
    
    /**
		Initial State
	**/
    public var initialstate(get,set):Info_node_linkinitialstateChoices;

    @:noCompletion
    public extern inline function get_initialstate():Info_node_linkinitialstateChoices {
        return untyped this.GetKeyValues().initialstate;
    }
    
    @:noCompletion
    public extern inline function set_initialstate(value:Info_node_linkinitialstateChoices):Info_node_linkinitialstateChoices {
        return untyped this.SetKeyValue("initialstate",untyped value);
    }
    
    /**
		Type of Connection
	**/
    public var linktype(get,set):Info_node_linklinktypeChoices;

    @:noCompletion
    public extern inline function get_linktype():Info_node_linklinktypeChoices {
        return untyped this.GetKeyValues().linktype;
    }
    
    @:noCompletion
    public extern inline function set_linktype(value:Info_node_linklinktypeChoices):Info_node_linklinktypeChoices {
        return untyped this.SetKeyValue("linktype",untyped value);
    }
    
    /**
		Allow Pass When Off

		Entity or class to allow passage even when node is off
	**/
    public var AllowUse(get,set):String;

    @:noCompletion
    public extern inline function get_AllowUse():String {
        return untyped this.GetKeyValues().AllowUse;
    }
    
    @:noCompletion
    public extern inline function set_AllowUse(value:String):String {
        return untyped this.SetKeyValue("AllowUse",untyped value);
    }
    
    /**
		Invert exclusion rules

		Allowed entity is the only entity NOT allowed when this is set to 'yes'
	**/
    public var InvertAllow(get,set):Info_node_linkInvertAllowChoices;

    @:noCompletion
    public extern inline function get_InvertAllow():Info_node_linkInvertAllowChoices {
        return untyped this.GetKeyValues().InvertAllow;
    }
    
    @:noCompletion
    public extern inline function set_InvertAllow(value:Info_node_linkInvertAllowChoices):Info_node_linkInvertAllowChoices {
        return untyped this.SetKeyValue("InvertAllow",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Info_node_link}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Info_node_link}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Info_node_link}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Info_node_link}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Info_node_linkSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Info_node_linkSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Info_node_linkSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_node_link");
    }
}

enum abstract Info_node_linklinktypeChoices(Int) to Int {
	var GROUND = 1;
	var JUMP = 2;
	var FLY = 4;
	var CLIMB = 8;
}
enum abstract Info_node_linkinitialstateChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
}
enum abstract Info_node_linkInvertAllowChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Info_node_linkSpawnFlags(Int) to Int {
	var FORCE_HUMAN_CONNECT = 1;
	var FORCE_SMALLCENTERED_CONNECT = 2;
	var FORCE_WIDEHUMAN_CONNECT = 4;
	var FORCE_TINY_CONNECT = 8;
	var FORCE_WIDESHORT_CONNECT = 16;
	var FORCE_MEDIUM_CONNECT = 32;
	var FORCE_TINYCENTERED_CONNECT = 64;
	var FORCE_LARGE_CONNECT = 128;
	var FORCE_LARGECENTERED_CONNECT = 256;
	var FORCE_MEDIUMTALL_CONNECT = 512;
}

#end
