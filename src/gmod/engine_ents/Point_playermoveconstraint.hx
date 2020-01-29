package gmod.engine_ents;
#if server
/**
	An entity that constrains players to a radius around itself, slowing them down the closer they get to the edge of the radius.
**/
@:forward
abstract Point_playermoveconstraint(Entity) to Entity {
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
		Start constraining any players within the radius.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Stop constraining any players previously constrained.
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
		Radius

		Radius to constrain players to.
	**/
    public var radius(get,set):Float;

    @:noCompletion
    public extern inline function get_radius():Float {
        return untyped this.GetKeyValues().radius;
    }
    
    @:noCompletion
    public extern inline function set_radius(value:Float):Float {
        return untyped this.SetKeyValue("radius",untyped value);
    }
    
    /**
		Constraint Width

		Width of the constraint edge. This is the distance in which to start slowing players down as they approach the edge of the radius.
	**/
    public var width(get,set):Float;

    @:noCompletion
    public extern inline function get_width():Float {
        return untyped this.GetKeyValues().width;
    }
    
    @:noCompletion
    public extern inline function set_width(value:Float):Float {
        return untyped this.SetKeyValue("width",untyped value);
    }
    
    /**
		Speed Factor

		Factor applied to the player's max speed as they approach the radius edge.
	**/
    public var speedfactor(get,set):Float;

    @:noCompletion
    public extern inline function get_speedfactor():Float {
        return untyped this.GetKeyValues().speedfactor;
    }
    
    @:noCompletion
    public extern inline function set_speedfactor(value:Float):Float {
        return untyped this.SetKeyValue("speedfactor",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_playermoveconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_playermoveconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_playermoveconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_playermoveconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when a player breaks through the constraint.
	**/
    public extern inline function OutputOnConstraintBroken(callback:Callback<{activator:Point_playermoveconstraint}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnConstraintBroken",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_playermoveconstraint");
    }
}





#end
