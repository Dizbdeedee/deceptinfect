package gmod.engine_ents;
#if server
/**
	Launches Combine balls.
**/
@:forward
abstract Point_combine_ball_launcher(Entity) to Entity {
    //Inputs
    
    /**
		Enable spawning of combine balls
	**/
    public extern inline function FireEnable(delay:Float) {
        untyped this.Fire("Enable",untyped null,delay);
    }
    
    /**
		Disable spawning of combine balls
	**/
    public extern inline function FireDisable(delay:Float) {
        untyped this.Fire("Disable",untyped null,delay);
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
		Launch a ball from the spawner.
	**/
    public extern inline function FireLaunchBall(delay:Float) {
        untyped this.Fire("LaunchBall",untyped null,delay);
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
		Ball count

		This is how many balls will be bouncing around inside the spawner
	**/
    public var ballcount(get,set):Int;

    @:noCompletion
    public extern inline function get_ballcount():Int {
        return untyped this.GetKeyValues().ballcount;
    }
    
    @:noCompletion
    public extern inline function set_ballcount(value:Int):Int {
        return untyped this.SetKeyValue("ballcount",untyped value);
    }
    
    /**
		Min ball speed

		The minimum speed of balls that fly in the spawner
	**/
    public var minspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_minspeed():Float {
        return untyped this.GetKeyValues().minspeed;
    }
    
    @:noCompletion
    public extern inline function set_minspeed(value:Float):Float {
        return untyped this.SetKeyValue("minspeed",untyped value);
    }
    
    /**
		Max ball speed

		The maximum speed of balls that fly in the spawner
	**/
    public var maxspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_maxspeed():Float {
        return untyped this.GetKeyValues().maxspeed;
    }
    
    @:noCompletion
    public extern inline function set_maxspeed(value:Float):Float {
        return untyped this.SetKeyValue("maxspeed",untyped value);
    }
    
    /**
		Ball radius

		The radius of the energy balls
	**/
    public var ballradius(get,set):Float;

    @:noCompletion
    public extern inline function get_ballradius():Float {
        return untyped this.GetKeyValues().ballradius;
    }
    
    @:noCompletion
    public extern inline function set_ballradius(value:Float):Float {
        return untyped this.SetKeyValue("ballradius",untyped value);
    }
    
    /**
		Ball Type
	**/
    public var balltype(get,set):Point_combine_ball_launcherballtypeChoices;

    @:noCompletion
    public extern inline function get_balltype():Point_combine_ball_launcherballtypeChoices {
        return untyped this.GetKeyValues().balltype;
    }
    
    @:noCompletion
    public extern inline function set_balltype(value:Point_combine_ball_launcherballtypeChoices):Point_combine_ball_launcherballtypeChoices {
        return untyped this.SetKeyValue("balltype",untyped value);
    }
    
    /**
		Ball Respawn Time

		The energy balls respawn time
	**/
    public var ballrespawntime(get,set):Float;

    @:noCompletion
    public extern inline function get_ballrespawntime():Float {
        return untyped this.GetKeyValues().ballrespawntime;
    }
    
    @:noCompletion
    public extern inline function set_ballrespawntime(value:Float):Float {
        return untyped this.SetKeyValue("ballrespawntime",untyped value);
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
		Noise to launch direction

		Noise in degrees added to the launch direction.
	**/
    public var launchconenoise(get,set):Float;

    @:noCompletion
    public extern inline function get_launchconenoise():Float {
        return untyped this.GetKeyValues().launchconenoise;
    }
    
    @:noCompletion
    public extern inline function set_launchconenoise(value:Float):Float {
        return untyped this.SetKeyValue("launchconenoise",untyped value);
    }
    
    /**
		Name of bullseye

		If you select the Attach Bullseye spawnflag, you may specify a name here which will be given to the bullseye.
	**/
    public var bullseyename(get,set):String;

    @:noCompletion
    public extern inline function get_bullseyename():String {
        return untyped this.GetKeyValues().bullseyename;
    }
    
    @:noCompletion
    public extern inline function set_bullseyename(value:String):String {
        return untyped this.SetKeyValue("bullseyename",untyped value);
    }
    
    /**
		Max number of bounces

		Maximum number of bounces the balls are allowed to do before they are removed.
	**/
    public var maxballbounces(get,set):Int;

    @:noCompletion
    public extern inline function get_maxballbounces():Int {
        return untyped this.GetKeyValues().maxballbounces;
    }
    
    @:noCompletion
    public extern inline function set_maxballbounces(value:Int):Int {
        return untyped this.SetKeyValue("maxballbounces",untyped value);
    }
    
    //Outputs
    
    /**
		Fired when a combine ball is grabbed from the field by a mega physcannon
	**/
    public extern inline function OutputOnBallGrabbed(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBallGrabbed",callback);
    }
    
    /**
		Fired when a combine ball is reinserted into the field (only gets triggered when Combine Power supply is checked)
	**/
    public extern inline function OutputOnBallReinserted(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBallReinserted",callback);
    }
    
    /**
		Fired when a combine ball in hits the top side of the field (only gets triggered when Combine Power supply is checked)
	**/
    public extern inline function OutputOnBallHitTopSide(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBallHitTopSide",callback);
    }
    
    /**
		Fired when a combine ball in hits the bottom side of the field (only gets triggered when Combine Power supply is checked)
	**/
    public extern inline function OutputOnBallHitBottomSide(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnBallHitBottomSide",callback);
    }
    
    /**
		Fired when the last combine ball is grabbed from the field by a mega physcannon
	**/
    public extern inline function OutputOnLastBallGrabbed(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnLastBallGrabbed",callback);
    }
    
    /**
		Fired when the first combine ball is reinserted into the field (only gets triggered when Combine Power supply is checked)
	**/
    public extern inline function OutputOnFirstBallReinserted(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFirstBallReinserted",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_combine_ball_launcher}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_combine_ball_launcherSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_combine_ball_launcherSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_combine_ball_launcherSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_combine_ball_launcher");
    }
}

enum abstract Point_combine_ball_launcherballtypeChoices(Int) to Int {
	var COMBINE_ENERGY_BALL_1 = 0;
	var COMBINE_ENERGY_BALL_2 = 1;
	var COMBINE_ENERGY_BALL_3 = 2;
}


enum abstract Point_combine_ball_launcherSpawnFlags(Int) to Int {
	var START_INACTIVE = 4096;
	var COMBINE_POWER_SUPPLY = 8192;
	var ATTACH_BULLSEYE = 1;
	var BALLS_SHOULD_COLLIDE_AGAINST_PLAYER = 2;
}

#end
