package gmod.engine_ents;
#if server
/**
	An entity used to create a jet of steam.
**/
@:forward
abstract Env_steam(Entity) to Entity {
    //Inputs
    
    /**
		Changes the entity's parent in the movement hierarchy.
	**/
    public extern inline function FireSetParent(param:String,delay:Float) {
        untyped this.Fire("SetParent",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on its parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment.
	**/
    public extern inline function FireSetParentAttachment(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachment",untyped param,delay);
    }
    
    /**
		Change this entity to attach to a specific attachment point on it's parent. Entities must be parented before being sent this input. The parameter passed in should be the name of the attachment. The entity will maintain it's position relative to the parent at the time it is attached.
	**/
    public extern inline function FireSetParentAttachmentMaintainOffset(param:String,delay:Float) {
        untyped this.Fire("SetParentAttachmentMaintainOffset",untyped param,delay);
    }
    
    /**
		Removes this entity from the the movement hierarchy, leaving it free to move independently.
	**/
    public extern inline function FireClearParent(delay:Float) {
        untyped this.Fire("ClearParent",untyped null,delay);
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
    
    /**
		Turns the steam jet on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turns the steam jet off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Toggles the steam jet between on and off.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
    /**
		Sets the length of steam jet.
	**/
    public extern inline function FireJetLength(param:Int,delay:Float) {
        untyped this.Fire("JetLength",untyped param,delay);
    }
    
    /**
		Sets the particle emission rate in particles per second.
	**/
    public extern inline function FireRate(param:Int,delay:Float) {
        untyped this.Fire("Rate",untyped param,delay);
    }
    
    /**
		Sets the default speed of the particles in units per second.
	**/
    public extern inline function FireSpeed(param:Int,delay:Float) {
        untyped this.Fire("Speed",untyped param,delay);
    }
    
    /**
		Sets the spread speed in units per second.
	**/
    public extern inline function FireSpreadSpeed(param:Int,delay:Float) {
        untyped this.Fire("SpreadSpeed",untyped param,delay);
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
		Parent

		The name of this entity's parent in the movement hierarchy. Entities with parents move with their parent.
	**/
    public var parentname(get,set):String;

    @:noCompletion
    public extern inline function get_parentname():String {
        return untyped this.GetKeyValues().parentname;
    }
    
    @:noCompletion
    public extern inline function set_parentname(value:String):String {
        return untyped this.SetKeyValue("parentname",untyped value);
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
		Initial State
	**/
    public var InitialState(get,set):Env_steamInitialStateChoices;

    @:noCompletion
    public extern inline function get_InitialState():Env_steamInitialStateChoices {
        return untyped this.GetKeyValues().InitialState;
    }
    
    @:noCompletion
    public extern inline function set_InitialState(value:Env_steamInitialStateChoices):Env_steamInitialStateChoices {
        return untyped this.SetKeyValue("InitialState",untyped value);
    }
    
    /**
		Particle Type
	**/
    public var type(get,set):Env_steamtypeChoices;

    @:noCompletion
    public extern inline function get_type():Env_steamtypeChoices {
        return untyped this.GetKeyValues().type;
    }
    
    @:noCompletion
    public extern inline function set_type(value:Env_steamtypeChoices):Env_steamtypeChoices {
        return untyped this.SetKeyValue("type",untyped value);
    }
    
    /**
		Spread Speed

		The amount of random spread in the particle's velocity after they spawn.
	**/
    public var SpreadSpeed(get,set):Int;

    @:noCompletion
    public extern inline function get_SpreadSpeed():Int {
        return untyped this.GetKeyValues().SpreadSpeed;
    }
    
    @:noCompletion
    public extern inline function set_SpreadSpeed(value:Int):Int {
        return untyped this.SetKeyValue("SpreadSpeed",untyped value);
    }
    
    /**
		Speed

		The default speed at which the particles move after they spawn.
	**/
    public var Speed(get,set):Int;

    @:noCompletion
    public extern inline function get_Speed():Int {
        return untyped this.GetKeyValues().Speed;
    }
    
    @:noCompletion
    public extern inline function set_Speed(value:Int):Int {
        return untyped this.SetKeyValue("Speed",untyped value);
    }
    
    /**
		Particle start size

		The initial size of the particles after they spawn.
	**/
    public var StartSize(get,set):Int;

    @:noCompletion
    public extern inline function get_StartSize():Int {
        return untyped this.GetKeyValues().StartSize;
    }
    
    @:noCompletion
    public extern inline function set_StartSize(value:Int):Int {
        return untyped this.SetKeyValue("StartSize",untyped value);
    }
    
    /**
		Particle end size

		The size of the particles at the point at which they are removed.
	**/
    public var EndSize(get,set):Int;

    @:noCompletion
    public extern inline function get_EndSize():Int {
        return untyped this.GetKeyValues().EndSize;
    }
    
    @:noCompletion
    public extern inline function set_EndSize(value:Int):Int {
        return untyped this.SetKeyValue("EndSize",untyped value);
    }
    
    /**
		Emission rate

		The rate of particle emission. i.e. particles per second.
	**/
    public var Rate(get,set):Int;

    @:noCompletion
    public extern inline function get_Rate():Int {
        return untyped this.GetKeyValues().Rate;
    }
    
    @:noCompletion
    public extern inline function set_Rate(value:Int):Int {
        return untyped this.SetKeyValue("Rate",untyped value);
    }
    
    /**
		Color (R G B)
	**/
    public var rendercolor(get,set):String;

    @:noCompletion
    public extern inline function get_rendercolor():String {
        return untyped this.GetKeyValues().rendercolor;
    }
    
    @:noCompletion
    public extern inline function set_rendercolor(value:String):String {
        return untyped this.SetKeyValue("rendercolor",untyped value);
    }
    
    /**
		Length of steam jet

		The length of the jet determines the lifetime of each particle.
	**/
    public var JetLength(get,set):Int;

    @:noCompletion
    public extern inline function get_JetLength():Int {
        return untyped this.GetKeyValues().JetLength;
    }
    
    @:noCompletion
    public extern inline function set_JetLength(value:Int):Int {
        return untyped this.SetKeyValue("JetLength",untyped value);
    }
    
    /**
		Translucency
	**/
    public var renderamt(get,set):Int;

    @:noCompletion
    public extern inline function get_renderamt():Int {
        return untyped this.GetKeyValues().renderamt;
    }
    
    @:noCompletion
    public extern inline function set_renderamt(value:Int):Int {
        return untyped this.SetKeyValue("renderamt",untyped value);
    }
    
    /**
		How fast does the particles spin
	**/
    public var rollspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_rollspeed():Float {
        return untyped this.GetKeyValues().rollspeed;
    }
    
    @:noCompletion
    public extern inline function set_rollspeed(value:Float):Float {
        return untyped this.SetKeyValue("rollspeed",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_steam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_steam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_steam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_steam}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_steamSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_steamSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_steamSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_steam");
    }
}

enum abstract Env_steamtypeChoices(Int) to Int {
	var NORMAL = 0;
	var HEAT_WAVE = 1;
}
enum abstract Env_steamInitialStateChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
}


enum abstract Env_steamSpawnFlags(Int) to Int {
	var EMISSIVE = 1;
}

#end
