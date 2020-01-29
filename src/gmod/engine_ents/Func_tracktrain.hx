package gmod.engine_ents;
#if server
/**
	A moving platform that the player can ride. It follows a path of path_track entities.
NOTE: Build your train so that the front of the train is facing down the X axis. When it spawns it will automatically rotate to face the next path_track on the path.
**/
@:forward
abstract Func_tracktrain(Entity) to Entity {
    //Inputs
    
    /**
		Set the speed of the train, as a ratio of max speed [0, 1]
	**/
    public extern inline function FireSetSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetSpeed",untyped param,delay);
    }
    
    /**
		Set the speed of the train, as a ratio of max speed. Negative values reverse the direction [-1, 1]
	**/
    public extern inline function FireSetSpeedDir(param:Float,delay:Float) {
        untyped this.Fire("SetSpeedDir",untyped param,delay);
    }
    
    /**
		Set the speed of the train. Must be a positive value from 0 to max speed.
	**/
    public extern inline function FireSetSpeedReal(param:Float,delay:Float) {
        untyped this.Fire("SetSpeedReal",untyped param,delay);
    }
    
    /**
		Stop the train.
	**/
    public extern inline function FireStop(delay:Float) {
        untyped this.Fire("Stop",untyped null,delay);
    }
    
    /**
		Start the train moving forward.
	**/
    public extern inline function FireStartForward(delay:Float) {
        untyped this.Fire("StartForward",untyped null,delay);
    }
    
    /**
		Start the train moving backward.
	**/
    public extern inline function FireStartBackward(delay:Float) {
        untyped this.Fire("StartBackward",untyped null,delay);
    }
    
    /**
		Resume the train moving in the current direction after it was stopped via the 'Stop' or 'Toggle' input.
	**/
    public extern inline function FireResume(delay:Float) {
        untyped this.Fire("Resume",untyped null,delay);
    }
    
    /**
		Reverse the direction of the train.
	**/
    public extern inline function FireReverse(delay:Float) {
        untyped this.Fire("Reverse",untyped null,delay);
    }
    
    /**
		Toggle the train between start and stop.
	**/
    public extern inline function FireToggle(delay:Float) {
        untyped this.Fire("Toggle",untyped null,delay);
    }
    
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
		Set the sprite's alpha (0 - 255).
	**/
    public extern inline function FireAlpha(param:Int,delay:Float) {
        untyped this.Fire("Alpha",untyped param,delay);
    }
    
    /**
		Set the sprite's color (R G B).
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
    }
    
    /**
		Turn shadow off.
	**/
    public extern inline function FireDisableShadow(delay:Float) {
        untyped this.Fire("DisableShadow",untyped null,delay);
    }
    
    /**
		Turn shadow on.
	**/
    public extern inline function FireEnableShadow(delay:Float) {
        untyped this.Fire("EnableShadow",untyped null,delay);
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
		Accel/Decel to the specified speed, as a ratio of max speed. Negative values reverse the direction [-1, 1]
	**/
    public extern inline function FireSetSpeedDirAccel(param:Float,delay:Float) {
        untyped this.Fire("SetSpeedDirAccel",untyped param,delay);
    }
    
    /**
		Teleport train to the designated path track.
	**/
    public extern inline function FireTeleportToPathTrack(param:String,delay:Float) {
        untyped this.Fire("TeleportToPathTrack",untyped param,delay);
    }
    
    /**
		Applies the given modifier to all forward speeds. [0, 1]
	**/
    public extern inline function FireSetSpeedForwardModifier(param:Float,delay:Float) {
        untyped this.Fire("SetSpeedForwardModifier",untyped param,delay);
    }
    
    //Keyvalues
    
    /**
		First Stop Target

		The name of the first path_track in the train's path. The train will spawn at this path_track. It will also turn to face direction indicated by the 'Orientation Type' setting.
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
		Max Speed (units / second)

		The maximum speed that this train can move. Any speeds applied to this train, such as by path_tracks or SetSpeed inputs, will be clipped to this maximum value.
	**/
    public var startspeed(get,set):Int;

    @:noCompletion
    public extern inline function get_startspeed():Int {
        return untyped this.GetKeyValues().startspeed;
    }
    
    @:noCompletion
    public extern inline function set_startspeed(value:Int):Int {
        return untyped this.SetKeyValue("startspeed",untyped value);
    }
    
    /**
		Initial Speed (units / second)

		The speed that the train will move at after it spawns, 0 = stopped.
	**/
    public var speed(get,set):Int;

    @:noCompletion
    public extern inline function get_speed():Int {
        return untyped this.GetKeyValues().speed;
    }
    
    @:noCompletion
    public extern inline function set_speed(value:Int):Int {
        return untyped this.SetKeyValue("speed",untyped value);
    }
    
    /**
		Change Velocity

		The method through which this train changes its velocity as it moves along the path.
	**/
    public var velocitytype(get,set):Func_tracktrainvelocitytypeChoices;

    @:noCompletion
    public extern inline function get_velocitytype():Func_tracktrainvelocitytypeChoices {
        return untyped this.GetKeyValues().velocitytype;
    }
    
    @:noCompletion
    public extern inline function set_velocitytype(value:Func_tracktrainvelocitytypeChoices):Func_tracktrainvelocitytypeChoices {
        return untyped this.SetKeyValue("velocitytype",untyped value);
    }
    
    /**
		Change angles

		The method through which this train changes its orientation as it moves along the path.
	**/
    public var orientationtype(get,set):Func_tracktrainorientationtypeChoices;

    @:noCompletion
    public extern inline function get_orientationtype():Func_tracktrainorientationtypeChoices {
        return untyped this.GetKeyValues().orientationtype;
    }
    
    @:noCompletion
    public extern inline function set_orientationtype(value:Func_tracktrainorientationtypeChoices):Func_tracktrainorientationtypeChoices {
        return untyped this.SetKeyValue("orientationtype",untyped value);
    }
    
    /**
		Distance Between the Wheels

		Used for turning and stopping.
	**/
    public var wheels(get,set):Int;

    @:noCompletion
    public extern inline function get_wheels():Int {
        return untyped this.GetKeyValues().wheels;
    }
    
    @:noCompletion
    public extern inline function set_wheels(value:Int):Int {
        return untyped this.SetKeyValue("wheels",untyped value);
    }
    
    /**
		Height above track

		The height above the track that this train moves.
	**/
    public var height(get,set):Int;

    @:noCompletion
    public extern inline function get_height():Int {
        return untyped this.GetKeyValues().height;
    }
    
    @:noCompletion
    public extern inline function set_height(value:Int):Int {
        return untyped this.SetKeyValue("height",untyped value);
    }
    
    /**
		Bank Angle on Turns
	**/
    public var bank(get,set):String;

    @:noCompletion
    public extern inline function get_bank():String {
        return untyped this.GetKeyValues().bank;
    }
    
    @:noCompletion
    public extern inline function set_bank(value:String):String {
        return untyped this.SetKeyValue("bank",untyped value);
    }
    
    /**
		Damage on Crush

		The amount of damage this train does to entities that block it.
	**/
    public var dmg(get,set):Int;

    @:noCompletion
    public extern inline function get_dmg():Int {
        return untyped this.GetKeyValues().dmg;
    }
    
    @:noCompletion
    public extern inline function set_dmg(value:Int):Int {
        return untyped this.SetKeyValue("dmg",untyped value);
    }
    
    /**
		Minimum Light Level

		The minimum level of ambient light that hits this brush.
	**/
    public var _minlight(get,set):String;

    @:noCompletion
    public extern inline function get__minlight():String {
        return untyped this.GetKeyValues()._minlight;
    }
    
    @:noCompletion
    public extern inline function set__minlight(value:String):String {
        return untyped this.SetKeyValue("_minlight",untyped value);
    }
    
    /**
		Move Sound

		A sound that is played (and looped) while the train is moving.
	**/
    public var MoveSound(get,set):String;

    @:noCompletion
    public extern inline function get_MoveSound():String {
        return untyped this.GetKeyValues().MoveSound;
    }
    
    @:noCompletion
    public extern inline function set_MoveSound(value:String):String {
        return untyped this.SetKeyValue("MoveSound",untyped value);
    }
    
    /**
		Move Ping Sound

		A sound that is played more frequently as the train speeds up.
	**/
    public var MovePingSound(get,set):String;

    @:noCompletion
    public extern inline function get_MovePingSound():String {
        return untyped this.GetKeyValues().MovePingSound;
    }
    
    @:noCompletion
    public extern inline function set_MovePingSound(value:String):String {
        return untyped this.SetKeyValue("MovePingSound",untyped value);
    }
    
    /**
		Start Sound

		A sound played when the train starts moving.
	**/
    public var StartSound(get,set):String;

    @:noCompletion
    public extern inline function get_StartSound():String {
        return untyped this.GetKeyValues().StartSound;
    }
    
    @:noCompletion
    public extern inline function set_StartSound(value:String):String {
        return untyped this.SetKeyValue("StartSound",untyped value);
    }
    
    /**
		Stop Sound

		A sound played when the train stops moving.
	**/
    public var StopSound(get,set):String;

    @:noCompletion
    public extern inline function get_StopSound():String {
        return untyped this.GetKeyValues().StopSound;
    }
    
    @:noCompletion
    public extern inline function set_StopSound(value:String):String {
        return untyped this.SetKeyValue("StopSound",untyped value);
    }
    
    /**
		Volume (10 = loudest)
	**/
    public var volume(get,set):Int;

    @:noCompletion
    public extern inline function get_volume():Int {
        return untyped this.GetKeyValues().volume;
    }
    
    @:noCompletion
    public extern inline function set_volume(value:Int):Int {
        return untyped this.SetKeyValue("volume",untyped value);
    }
    
    /**
		Min pitch (1-255, > 100 = higher)

		The sound pitch value that the train will approach as it comes to a stop.
	**/
    public var MoveSoundMinPitch(get,set):Int;

    @:noCompletion
    public extern inline function get_MoveSoundMinPitch():Int {
        return untyped this.GetKeyValues().MoveSoundMinPitch;
    }
    
    @:noCompletion
    public extern inline function set_MoveSoundMinPitch(value:Int):Int {
        return untyped this.SetKeyValue("MoveSoundMinPitch",untyped value);
    }
    
    /**
		Max pitch (1-255, > 100 = higher)

		The sound pitch value that the train will approach as it approaches its max speed (or 1000 inches/second if the 'Use max speed for pitch shifting move sound' flag is not set).
	**/
    public var MoveSoundMaxPitch(get,set):Int;

    @:noCompletion
    public extern inline function get_MoveSoundMaxPitch():Int {
        return untyped this.GetKeyValues().MoveSoundMaxPitch;
    }
    
    @:noCompletion
    public extern inline function set_MoveSoundMaxPitch(value:Int):Int {
        return untyped this.SetKeyValue("MoveSoundMaxPitch",untyped value);
    }
    
    /**
		Min move sound interval

		Minimum interval at which to play the move ping sound.
	**/
    public var MoveSoundMinTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MoveSoundMinTime():Float {
        return untyped this.GetKeyValues().MoveSoundMinTime;
    }
    
    @:noCompletion
    public extern inline function set_MoveSoundMinTime(value:Float):Float {
        return untyped this.SetKeyValue("MoveSoundMinTime",untyped value);
    }
    
    /**
		Max move sound interval

		Maximum interval at which to play the move ping sound.
	**/
    public var MoveSoundMaxTime(get,set):Float;

    @:noCompletion
    public extern inline function get_MoveSoundMaxTime():Float {
        return untyped this.GetKeyValues().MoveSoundMaxTime;
    }
    
    @:noCompletion
    public extern inline function set_MoveSoundMaxTime(value:Float):Float {
        return untyped this.SetKeyValue("MoveSoundMaxTime",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_tracktraingmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_tracktraingmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_tracktraingmod_allowphysgunChoices):Func_tracktraingmod_allowphysgunChoices {
        return untyped this.SetKeyValue("gmod_allowphysgun",untyped value);
    }
    
    /**
		Sandbox Tool Whitelist

		If set, only given tools can be used on this entity.
You need to supply the tool class names, the names of the .lua files of those tools.
This also includes the context menu properties!
	**/
    public var gmod_allowtools(get,set):String;

    @:noCompletion
    public extern inline function get_gmod_allowtools():String {
        return untyped this.GetKeyValues().gmod_allowtools;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowtools(value:String):String {
        return untyped this.SetKeyValue("gmod_allowtools",untyped value);
    }
    
    /**
		Global Entity Name

		Name by which this entity is linked to another entity in a different map. When the player transitions to a new map, entities in the new map with globalnames matching entities in the previous map will have the previous map's state copied over their state.
	**/
    public var globalname(get,set):String;

    @:noCompletion
    public extern inline function get_globalname():String {
        return untyped this.GetKeyValues().globalname;
    }
    
    @:noCompletion
    public extern inline function set_globalname(value:String):String {
        return untyped this.SetKeyValue("globalname",untyped value);
    }
    
    /**
		Origin (X Y Z)

		The position of this entity's center in the world. Rotating entities typically rotate around their origin.
	**/
    public var origin(get,set):String;

    @:noCompletion
    public extern inline function get_origin():String {
        return untyped this.GetKeyValues().origin;
    }
    
    @:noCompletion
    public extern inline function set_origin(value:String):String {
        return untyped this.SetKeyValue("origin",untyped value);
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
		Render Mode

		Used to set a non-standard rendering mode on this entity. See also 'FX Amount' and 'FX Color'.
	**/
    public var rendermode(get,set):Func_tracktrainrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_tracktrainrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_tracktrainrendermodeChoices):Func_tracktrainrendermodeChoices {
        return untyped this.SetKeyValue("rendermode",untyped value);
    }
    
    /**
		FX Amount (0 - 255)

		The FX amount is used by the selected Render Mode.
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
		FX Color (R G B)

		The FX color is used by the selected Render Mode.
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
		Disable Receiving Shadows
	**/
    public var disablereceiveshadows(get,set):Func_tracktraindisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_tracktraindisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_tracktraindisablereceiveshadowsChoices):Func_tracktraindisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_tracktrainrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_tracktrainrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_tracktrainrenderfxChoices):Func_tracktrainrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
    }
    
    /**
		Disable shadows
	**/
    public var disableshadows(get,set):Func_tracktraindisableshadowsChoices;

    @:noCompletion
    public extern inline function get_disableshadows():Func_tracktraindisableshadowsChoices {
        return untyped this.GetKeyValues().disableshadows;
    }
    
    @:noCompletion
    public extern inline function set_disableshadows(value:Func_tracktraindisableshadowsChoices):Func_tracktraindisableshadowsChoices {
        return untyped this.SetKeyValue("disableshadows",untyped value);
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
		Manual Train Speed

		Train Speed is controlled through IO, handles accel, decel times.
	**/
    public var ManualSpeedChanges(get,set):Func_tracktrainManualSpeedChangesChoices;

    @:noCompletion
    public extern inline function get_ManualSpeedChanges():Func_tracktrainManualSpeedChangesChoices {
        return untyped this.GetKeyValues().ManualSpeedChanges;
    }
    
    @:noCompletion
    public extern inline function set_ManualSpeedChanges(value:Func_tracktrainManualSpeedChangesChoices):Func_tracktrainManualSpeedChangesChoices {
        return untyped this.SetKeyValue("ManualSpeedChanges",untyped value);
    }
    
    /**
		Manual Accel Speed

		Units per second to accelerate to target speed.
	**/
    public var ManualAccelSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_ManualAccelSpeed():Float {
        return untyped this.GetKeyValues().ManualAccelSpeed;
    }
    
    @:noCompletion
    public extern inline function set_ManualAccelSpeed(value:Float):Float {
        return untyped this.SetKeyValue("ManualAccelSpeed",untyped value);
    }
    
    /**
		Manual Decel Speed

		Units per second to decelerate to target speed.
	**/
    public var ManualDecelSpeed(get,set):Float;

    @:noCompletion
    public extern inline function get_ManualDecelSpeed():Float {
        return untyped this.GetKeyValues().ManualDecelSpeed;
    }
    
    @:noCompletion
    public extern inline function set_ManualDecelSpeed(value:Float):Float {
        return untyped this.SetKeyValue("ManualDecelSpeed",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_tracktrain}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_tracktrain}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_tracktrain}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_tracktrain}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the train starts moving in either direction.
	**/
    public extern inline function OutputOnStart(callback:Callback<{activator:Func_tracktrain}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnStart",callback);
    }
    
    /**
		Fires when this train picks a new point to move towards (and just after OnStart).
	**/
    public extern inline function OutputOnNext(callback:Callback<{activator:Func_tracktrain,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnNext",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_tracktrainSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_tracktrainSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_tracktrainSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_tracktrain");
    }
}

enum abstract Func_tracktrainvelocitytypeChoices(Int) to Int {
	var INSTANTANEOUSLY = 0;
	var LINEAR_BLEND = 1;
	var EASE_INEASE_OUT = 2;
}
enum abstract Func_tracktrainrendermodeChoices(Int) to Int {
	var NORMAL = 0;
	var COLOR = 1;
	var TEXTURE = 2;
	var GLOW = 3;
	var SOLID = 4;
	var ADDITIVE = 5;
	var ADDITIVE_FRACTIONAL_FRAME = 7;
	var WORLD_SPACE_GLOW = 9;
	var DONT_RENDER = 10;
}
enum abstract Func_tracktrainrenderfxChoices(Int) to Int {
	var NORMAL = 0;
	var SLOW_PULSE = 1;
	var FAST_PULSE = 2;
	var SLOW_WIDE_PULSE = 3;
	var FAST_WIDE_PULSE = 4;
	var SLOW_STROBE = 9;
	var FAST_STROBE = 10;
	var FASTER_STROBE = 11;
	var SLOW_FLICKER = 12;
	var FAST_FLICKER = 13;
	var SLOW_FADE_AWAY = 5;
	var FAST_FADE_AWAY = 6;
	var SLOW_BECOME_SOLID = 7;
	var FAST_BECOME_SOLID = 8;
	var CONSTANT_GLOW = 14;
	var DISTORT = 15;
	var HOLOGRAM_DISTORT__FADE = 16;
	var CULL_BY_DISTANCE_TEST = 23;
	var SPOTLIGHT_FX = 24;
	var FADE_NEAR = 26;
}
enum abstract Func_tracktrainorientationtypeChoices(Int) to Int {
	var NEVER_FIXED_ORIENTATION = 0;
	var NEAR_PATHTRACKS = 1;
	var LINEAR_BLEND = 2;
	var EASE_INEASE_OUT = 3;
}
enum abstract Func_tracktraingmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tracktraindisableshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tracktraindisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_tracktrainManualSpeedChangesChoices(Int) to Int {
	var OFF = 0;
	var ON = 1;
}


enum abstract Func_tracktrainSpawnFlags(Int) to Int {
	var NO_PITCH_XROT = 1;
	var NO_USER_CONTROL = 2;
	var PASSABLE = 8;
	var FIXED_ORIENTATION = 16;
	var HL1_TRAIN = 128;
	var USE_MAX_SPEED_FOR_PITCH_SHIFTING_MOVE_SOUND = 256;
	var IS_UNBLOCKABLE_BY_PLAYER = 512;
}

#end
