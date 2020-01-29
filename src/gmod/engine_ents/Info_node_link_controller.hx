package gmod.engine_ents;
#if server
/**
	An entity that controls all connections between nodes that intersect the controller's volume. This allows for mass enabling/disabling of all node connections through a volume.
**/
@:forward
abstract Info_node_link_controller(Entity) to Entity {
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
    
    /**
		Change the allowed pass when off
	**/
    public extern inline function FireSetAllowed(param:String,delay:Float) {
        untyped this.Fire("SetAllowed",untyped param,delay);
    }
    
    /**
		Change the invert exclusion rule
	**/
    public extern inline function FireSetInvert(param:Int,delay:Float) {
        untyped this.Fire("SetInvert",untyped param,delay);
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
		Mins
	**/
    public var mins(get,set):Vector;

    @:noCompletion
    public extern inline function get_mins():Vector {
        return untyped this.GetKeyValues().mins;
    }
    
    @:noCompletion
    public extern inline function set_mins(value:Vector):Vector {
        return untyped this.SetKeyValue("mins",untyped value);
    }
    
    /**
		Maxs
	**/
    public var maxs(get,set):Vector;

    @:noCompletion
    public extern inline function get_maxs():Vector {
        return untyped this.GetKeyValues().maxs;
    }
    
    @:noCompletion
    public extern inline function set_maxs(value:Vector):Vector {
        return untyped this.SetKeyValue("maxs",untyped value);
    }
    
    /**
		Initial State
	**/
    public var initialstate(get,set):Info_node_link_controllerinitialstateChoices;

    @:noCompletion
    public extern inline function get_initialstate():Info_node_link_controllerinitialstateChoices {
        return untyped this.GetKeyValues().initialstate;
    }
    
    @:noCompletion
    public extern inline function set_initialstate(value:Info_node_link_controllerinitialstateChoices):Info_node_link_controllerinitialstateChoices {
        return untyped this.SetKeyValue("initialstate",untyped value);
    }
    
    /**
		Use Larger Radius (for air links)

		Set this to 'Yes' if this controller is intended to control air links. Air links connect using a larger search radius so leaving this at 'No' might miss some air links.
	**/
    public var useairlinkradius(get,set):Info_node_link_controlleruseairlinkradiusChoices;

    @:noCompletion
    public extern inline function get_useairlinkradius():Info_node_link_controlleruseairlinkradiusChoices {
        return untyped this.GetKeyValues().useairlinkradius;
    }
    
    @:noCompletion
    public extern inline function set_useairlinkradius(value:Info_node_link_controlleruseairlinkradiusChoices):Info_node_link_controlleruseairlinkradiusChoices {
        return untyped this.SetKeyValue("useairlinkradius",untyped value);
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
    public var InvertAllow(get,set):Info_node_link_controllerInvertAllowChoices;

    @:noCompletion
    public extern inline function get_InvertAllow():Info_node_link_controllerInvertAllowChoices {
        return untyped this.GetKeyValues().InvertAllow;
    }
    
    @:noCompletion
    public extern inline function set_InvertAllow(value:Info_node_link_controllerInvertAllowChoices):Info_node_link_controllerInvertAllowChoices {
        return untyped this.SetKeyValue("InvertAllow",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Info_node_link_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Info_node_link_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Info_node_link_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Info_node_link_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_node_link_controller");
    }
}

enum abstract Info_node_link_controlleruseairlinkradiusChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Info_node_link_controllerinitialstateChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
}
enum abstract Info_node_link_controllerInvertAllowChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
