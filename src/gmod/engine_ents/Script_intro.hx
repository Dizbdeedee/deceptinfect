package gmod.engine_ents;
#if server
/**
	Script: Custom entity used to handle the intro sequence.
**/
@:forward
abstract Script_intro(Entity) to Entity {
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
		Take control of the player's view and start blending the two scenes.
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Stop controlling the view.
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Set the viewpoint to blend with the player's viewpoint.
	**/
    public extern inline function FireSetCameraViewEntity(param:String,delay:Float) {
        untyped this.Fire("SetCameraViewEntity",untyped param,delay);
    }
    
    /**
		Set the blending mode to use.
	**/
    public extern inline function FireSetBlendMode(param:Int,delay:Float) {
        untyped this.Fire("SetBlendMode",untyped param,delay);
    }
    
    /**
		Set the fov for the second camera.
	**/
    public extern inline function FireSetFOV(param:Int,delay:Float) {
        untyped this.Fire("SetFOV",untyped param,delay);
    }
    
    /**
		Set the FOV to blend to over time. Follow this with a SetFOVBlendTime input to start the fov blend.
	**/
    public extern inline function FireSetNextFOV(param:Int,delay:Float) {
        untyped this.Fire("SetNextFOV",untyped param,delay);
    }
    
    /**
		Set the amount of time it should take to blend to the next fov target, and start blending.
	**/
    public extern inline function FireSetFOVBlendTime(param:Float,delay:Float) {
        untyped this.Fire("SetFOVBlendTime",untyped param,delay);
    }
    
    /**
		Set the blending mode to blend to over time. Follow this with a SetNextBlendTime input to start the mode blend.
	**/
    public extern inline function FireSetNextBlendMode(param:Int,delay:Float) {
        untyped this.Fire("SetNextBlendMode",untyped param,delay);
    }
    
    /**
		Set the amount of time it should take to blend to the next mode, and start blending.
	**/
    public extern inline function FireSetNextBlendTime(param:Float,delay:Float) {
        untyped this.Fire("SetNextBlendTime",untyped param,delay);
    }
    
    /**
		Fade to a specific alpha amount of an amount of time. Parameters: <alpha> <duration>
	**/
    public extern inline function FireFadeTo(param:String,delay:Float) {
        untyped this.Fire("FadeTo",untyped param,delay);
    }
    
    /**
		Set the fade color. Parameters: <Red> <Green> <Blue>
	**/
    public extern inline function FireSetFadeColor(param:String,delay:Float) {
        untyped this.Fire("SetFadeColor",untyped param,delay);
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
		Match env_zoom's FOV transition

		Whether the script should match env_zoom's FOV transition.
	**/
    public var alternatefovchange(get,set):Script_introalternatefovchangeChoices;

    @:noCompletion
    public extern inline function get_alternatefovchange():Script_introalternatefovchangeChoices {
        return untyped this.GetKeyValues().alternatefovchange;
    }
    
    @:noCompletion
    public extern inline function set_alternatefovchange(value:Script_introalternatefovchangeChoices):Script_introalternatefovchangeChoices {
        return untyped this.SetKeyValue("alternatefovchange",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Script_intro}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Script_intro}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Script_intro}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Script_intro}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("script_intro");
    }
}

enum abstract Script_introalternatefovchangeChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
