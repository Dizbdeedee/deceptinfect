package gmod.engine_ents;
#if server
/**
	A portal brush used to manage visibility in maps. Portals define areas, which are spaces that are connected in the map. Both sides of a portal cannot touch the same area, for example, a doughnut shaped map would require at least two portals to divide the map into two areas. A linear map could be divided into two areas with a single area portal.
**/
@:forward
abstract Func_areaportal(Entity) to Entity {
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
		Open the portal. When the portal is open is can be seen through.
	**/
    public extern inline function FireOpen(delay:Float) {
        untyped this.Fire("Open",untyped null,delay);
    }
    
    /**
		Close the portal. When the portal is closed it cannot be seen through.
	**/
    public extern inline function FireClose(delay:Float) {
        untyped this.Fire("Close",untyped null,delay);
    }
    
    /**
		Toggle the open/closed state of the portal.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
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
		Name of Linked Door

		(Optional) The name of a door whose open/closed state controls the on/off state of this area portal.
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
		Initial State
	**/
    public var StartOpen(get,set):Func_areaportalStartOpenChoices;

    @:noCompletion
    public extern inline function get_StartOpen():Func_areaportalStartOpenChoices {
        return untyped this.GetKeyValues().StartOpen;
    }
    
    @:noCompletion
    public extern inline function set_StartOpen(value:Func_areaportalStartOpenChoices):Func_areaportalStartOpenChoices {
        return untyped this.SetKeyValue("StartOpen",untyped value);
    }
    
    /**
		Portal Version

		(Don't change). Differentiates between shipping HL2 maps and maps using new engine features.
	**/
    public var PortalVersion(get,never):Int;

    @:noCompletion
    public extern inline function get_PortalVersion():Int {
        return untyped this.GetKeyValues().PortalVersion;
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_areaportal}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_areaportal}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_areaportal}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_areaportal}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_areaportal");
    }
}

enum abstract Func_areaportalStartOpenChoices(Int) to Int {
	var CLOSED = 0;
	var OPEN = 1;
}




#end
