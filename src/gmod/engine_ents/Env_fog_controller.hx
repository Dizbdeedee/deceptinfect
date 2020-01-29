package gmod.engine_ents;
#if server
/**
	An entity that controls the fog and view distance in the map.
**/
@:forward
abstract Env_fog_controller(Entity) to Entity {
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
		Set the fog start distance.
	**/
    public extern inline function FireSetStartDist(param:Float,delay:Float) {
        untyped this.Fire("SetStartDist",untyped param,delay);
    }
    
    /**
		Set the fog end distance.
	**/
    public extern inline function FireSetEndDist(param:Float,delay:Float) {
        untyped this.Fire("SetEndDist",untyped param,delay);
    }
    
    /**
		Turn the fog on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn the fog off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Set the primary fog color.
	**/
    public extern inline function FireSetColor(param:String,delay:Float) {
        untyped this.Fire("SetColor",untyped param,delay);
    }
    
    /**
		Set the secondary fog color.
	**/
    public extern inline function FireSetColorSecondary(param:String,delay:Float) {
        untyped this.Fire("SetColorSecondary",untyped param,delay);
    }
    
    /**
		Set the far clip plane distance.
	**/
    public extern inline function FireSetFarZ(param:Int,delay:Float) {
        untyped this.Fire("SetFarZ",untyped param,delay);
    }
    
    /**
		Set the angles to use for the secondary fog direction.
	**/
    public extern inline function FireSetAngles(param:String,delay:Float) {
        untyped this.Fire("SetAngles",untyped param,delay);
    }
    
    /**
		Set the primary fog color.
	**/
    public extern inline function FireSetColorLerpTo(param:String,delay:Float) {
        untyped this.Fire("SetColorLerpTo",untyped param,delay);
    }
    
    /**
		Set the secondary fog color.
	**/
    public extern inline function FireSetColorSecondaryLerpTo(param:String,delay:Float) {
        untyped this.Fire("SetColorSecondaryLerpTo",untyped param,delay);
    }
    
    /**
		Set the fog start distance.
	**/
    public extern inline function FireSetStartDistLerpTo(param:Float,delay:Float) {
        untyped this.Fire("SetStartDistLerpTo",untyped param,delay);
    }
    
    /**
		Set the fog end distance.
	**/
    public extern inline function FireSetEndDistLerpTo(param:Float,delay:Float) {
        untyped this.Fire("SetEndDistLerpTo",untyped param,delay);
    }
    
    /**
		Start fog transition.
	**/
    public extern inline function FireStartFogTransition(delay:Float) {
        untyped this.Fire("StartFogTransition",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Pitch Yaw Roll (Y Z X)

		This entity's orientation in the world. Pitch is rotation around the Y axis, yaw is the rotation around the Z axis, roll is the rotation around the X axis.
	**/
    public var angles(get,set):Angle;

    @:noCompletion
    public extern inline function get_angles():Angle {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:Angle):Angle {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    /**
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Env_fog_controllermindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Env_fog_controllermindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Env_fog_controllermindxlevelChoices):Env_fog_controllermindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Env_fog_controllermaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Env_fog_controllermaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Env_fog_controllermaxdxlevelChoices):Env_fog_controllermaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
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
		Fog Enable
	**/
    public var fogenable(get,set):Env_fog_controllerfogenableChoices;

    @:noCompletion
    public extern inline function get_fogenable():Env_fog_controllerfogenableChoices {
        return untyped this.GetKeyValues().fogenable;
    }
    
    @:noCompletion
    public extern inline function set_fogenable(value:Env_fog_controllerfogenableChoices):Env_fog_controllerfogenableChoices {
        return untyped this.SetKeyValue("fogenable",untyped value);
    }
    
    /**
		Fog Blend
	**/
    public var fogblend(get,set):Env_fog_controllerfogblendChoices;

    @:noCompletion
    public extern inline function get_fogblend():Env_fog_controllerfogblendChoices {
        return untyped this.GetKeyValues().fogblend;
    }
    
    @:noCompletion
    public extern inline function set_fogblend(value:Env_fog_controllerfogblendChoices):Env_fog_controllerfogblendChoices {
        return untyped this.SetKeyValue("fogblend",untyped value);
    }
    
    /**
		Use Angles for Fog Dir
	**/
    public var use_angles(get,set):Env_fog_controlleruse_anglesChoices;

    @:noCompletion
    public extern inline function get_use_angles():Env_fog_controlleruse_anglesChoices {
        return untyped this.GetKeyValues().use_angles;
    }
    
    @:noCompletion
    public extern inline function set_use_angles(value:Env_fog_controlleruse_anglesChoices):Env_fog_controlleruse_anglesChoices {
        return untyped this.SetKeyValue("use_angles",untyped value);
    }
    
    /**
		Primary Fog Color
	**/
    public var fogcolor(get,set):String;

    @:noCompletion
    public extern inline function get_fogcolor():String {
        return untyped this.GetKeyValues().fogcolor;
    }
    
    @:noCompletion
    public extern inline function set_fogcolor(value:String):String {
        return untyped this.SetKeyValue("fogcolor",untyped value);
    }
    
    /**
		Secondary Fog Color
	**/
    public var fogcolor2(get,set):String;

    @:noCompletion
    public extern inline function get_fogcolor2():String {
        return untyped this.GetKeyValues().fogcolor2;
    }
    
    @:noCompletion
    public extern inline function set_fogcolor2(value:String):String {
        return untyped this.SetKeyValue("fogcolor2",untyped value);
    }
    
    /**
		Primary Fog Direction
	**/
    public var fogdir(get,set):String;

    @:noCompletion
    public extern inline function get_fogdir():String {
        return untyped this.GetKeyValues().fogdir;
    }
    
    @:noCompletion
    public extern inline function set_fogdir(value:String):String {
        return untyped this.SetKeyValue("fogdir",untyped value);
    }
    
    /**
		Fog Start
	**/
    public var fogstart(get,set):String;

    @:noCompletion
    public extern inline function get_fogstart():String {
        return untyped this.GetKeyValues().fogstart;
    }
    
    @:noCompletion
    public extern inline function set_fogstart(value:String):String {
        return untyped this.SetKeyValue("fogstart",untyped value);
    }
    
    /**
		Fog End
	**/
    public var fogend(get,set):String;

    @:noCompletion
    public extern inline function get_fogend():String {
        return untyped this.GetKeyValues().fogend;
    }
    
    @:noCompletion
    public extern inline function set_fogend(value:String):String {
        return untyped this.SetKeyValue("fogend",untyped value);
    }
    
    /**
		Fog Max Density [0..1]
	**/
    public var fogmaxdensity(get,set):Float;

    @:noCompletion
    public extern inline function get_fogmaxdensity():Float {
        return untyped this.GetKeyValues().fogmaxdensity;
    }
    
    @:noCompletion
    public extern inline function set_fogmaxdensity(value:Float):Float {
        return untyped this.SetKeyValue("fogmaxdensity",untyped value);
    }
    
    /**
		Interpolate time
	**/
    public var foglerptime(get,set):Float;

    @:noCompletion
    public extern inline function get_foglerptime():Float {
        return untyped this.GetKeyValues().foglerptime;
    }
    
    @:noCompletion
    public extern inline function set_foglerptime(value:Float):Float {
        return untyped this.SetKeyValue("foglerptime",untyped value);
    }
    
    /**
		Far Z Clip Plane
	**/
    public var farz(get,set):String;

    @:noCompletion
    public extern inline function get_farz():String {
        return untyped this.GetKeyValues().farz;
    }
    
    @:noCompletion
    public extern inline function set_farz(value:String):String {
        return untyped this.SetKeyValue("farz",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_fog_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_fog_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_fog_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_fog_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_fog_controllerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_fog_controllerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_fog_controllerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_fog_controller");
    }
}

enum abstract Env_fog_controlleruse_anglesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_fog_controllermindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Env_fog_controllermaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Env_fog_controllerfogenableChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_fog_controllerfogblendChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_fog_controllerSpawnFlags(Int) to Int {
	var MASTER_HAS_PRIORITY_IF_MULTIPLE_ENVFOGCONTROLLERS_EXIST = 1;
}

#end
