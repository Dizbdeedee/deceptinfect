package gmod.engine_ents;
#if server
/**
	APC Controller
**/
@:forward
abstract Point_apc_controller(Entity) to Entity {
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
		Turn the APC rockets on
	**/
    public extern inline function FireActivate(delay:Float) {
        untyped this.Fire("Activate",untyped null,delay);
    }
    
    /**
		Turn the APC rockets off (go dormant)
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
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
		Yaw rate
	**/
    public var yawrate(get,set):String;

    @:noCompletion
    public extern inline function get_yawrate():String {
        return untyped this.GetKeyValues().yawrate;
    }
    
    @:noCompletion
    public extern inline function set_yawrate(value:String):String {
        return untyped this.SetKeyValue("yawrate",untyped value);
    }
    
    /**
		Yaw tolerance
	**/
    public var yawtolerance(get,set):String;

    @:noCompletion
    public extern inline function get_yawtolerance():String {
        return untyped this.GetKeyValues().yawtolerance;
    }
    
    @:noCompletion
    public extern inline function set_yawtolerance(value:String):String {
        return untyped this.SetKeyValue("yawtolerance",untyped value);
    }
    
    /**
		Pitch rate
	**/
    public var pitchrate(get,set):String;

    @:noCompletion
    public extern inline function get_pitchrate():String {
        return untyped this.GetKeyValues().pitchrate;
    }
    
    @:noCompletion
    public extern inline function set_pitchrate(value:String):String {
        return untyped this.SetKeyValue("pitchrate",untyped value);
    }
    
    /**
		Pitch tolerance
	**/
    public var pitchtolerance(get,set):String;

    @:noCompletion
    public extern inline function get_pitchtolerance():String {
        return untyped this.GetKeyValues().pitchtolerance;
    }
    
    @:noCompletion
    public extern inline function set_pitchtolerance(value:String):String {
        return untyped this.SetKeyValue("pitchtolerance",untyped value);
    }
    
    /**
		Rotate Start Sound
	**/
    public var rotatestartsound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatestartsound():String {
        return untyped this.GetKeyValues().rotatestartsound;
    }
    
    @:noCompletion
    public extern inline function set_rotatestartsound(value:String):String {
        return untyped this.SetKeyValue("rotatestartsound",untyped value);
    }
    
    /**
		Rotate Loop Sound
	**/
    public var rotatesound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatesound():String {
        return untyped this.GetKeyValues().rotatesound;
    }
    
    @:noCompletion
    public extern inline function set_rotatesound(value:String):String {
        return untyped this.SetKeyValue("rotatesound",untyped value);
    }
    
    /**
		Rotate Stop Sound
	**/
    public var rotatestopsound(get,set):String;

    @:noCompletion
    public extern inline function get_rotatestopsound():String {
        return untyped this.GetKeyValues().rotatestopsound;
    }
    
    @:noCompletion
    public extern inline function set_rotatestopsound(value:String):String {
        return untyped this.SetKeyValue("rotatestopsound",untyped value);
    }
    
    /**
		Minmum target range
	**/
    public var minRange(get,set):String;

    @:noCompletion
    public extern inline function get_minRange():String {
        return untyped this.GetKeyValues().minRange;
    }
    
    @:noCompletion
    public extern inline function set_minRange(value:String):String {
        return untyped this.SetKeyValue("minRange",untyped value);
    }
    
    /**
		Maximum target range
	**/
    public var maxRange(get,set):String;

    @:noCompletion
    public extern inline function get_maxRange():String {
        return untyped this.GetKeyValues().maxRange;
    }
    
    @:noCompletion
    public extern inline function set_maxRange(value:String):String {
        return untyped this.SetKeyValue("maxRange",untyped value);
    }
    
    /**
		Name of entity I should follow/attack
	**/
    public var targetentityname(get,set):String;

    @:noCompletion
    public extern inline function get_targetentityname():String {
        return untyped this.GetKeyValues().targetentityname;
    }
    
    @:noCompletion
    public extern inline function set_targetentityname(value:String):String {
        return untyped this.SetKeyValue("targetentityname",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_apc_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_apc_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_apc_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_apc_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fires when a valid target is found and the APC should shoot rockets
	**/
    public extern inline function OutputOnFireAtTarget(callback:Callback<{activator:Point_apc_controller}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFireAtTarget",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Point_apc_controllerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Point_apc_controllerSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Point_apc_controllerSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_apc_controller");
    }
}



enum abstract Point_apc_controllerSpawnFlags(Int) to Int {
	var ACTIVE = 1;
}

#end
