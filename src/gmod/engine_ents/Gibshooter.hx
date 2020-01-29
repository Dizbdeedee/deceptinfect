package gmod.engine_ents;
#if server
/**
	An entity that shoots out gibs. Style of body part depends on language type.
**/
@:forward
abstract Gibshooter(Entity) to Entity {
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
		Force the gibshooter to create and shoot a gib.
	**/
    public extern inline function FireShoot(delay:Float) {
        untyped this.Fire("Shoot",untyped null,delay);
    }
    
    //Keyvalues
    
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
		Gib Direction (Pitch Yaw Roll)

		The direction the gibs will fly.
	**/
    public var angles(get,set):String;

    @:noCompletion
    public extern inline function get_angles():String {
        return untyped this.GetKeyValues().angles;
    }
    
    @:noCompletion
    public extern inline function set_angles(value:String):String {
        return untyped this.SetKeyValue("angles",untyped value);
    }
    
    /**
		Number of Gibs

		Total number of gibs to shoot each time it's activated.
	**/
    public var m_iGibs(get,set):Int;

    @:noCompletion
    public extern inline function get_m_iGibs():Int {
        return untyped this.GetKeyValues().m_iGibs;
    }
    
    @:noCompletion
    public extern inline function set_m_iGibs(value:Int):Int {
        return untyped this.SetKeyValue("m_iGibs",untyped value);
    }
    
    /**
		Delay between shots

		Delay (in seconds) between shooting each gib. If 0, all gibs shoot at once.
	**/
    public var delay(get,set):String;

    @:noCompletion
    public extern inline function get_delay():String {
        return untyped this.GetKeyValues().delay;
    }
    
    @:noCompletion
    public extern inline function set_delay(value:String):String {
        return untyped this.SetKeyValue("delay",untyped value);
    }
    
    /**
		Gib Angles (Pitch Yaw Roll)

		The orientation of the spawned gibs.
	**/
    public var gibangles(get,set):String;

    @:noCompletion
    public extern inline function get_gibangles():String {
        return untyped this.GetKeyValues().gibangles;
    }
    
    @:noCompletion
    public extern inline function set_gibangles(value:String):String {
        return untyped this.SetKeyValue("gibangles",untyped value);
    }
    
    /**
		Max angular velocity

		How fast (degrees/sec) the gib pieces should spin. They will spin on x and y axis at between 10% and 100% of this speed.
	**/
    public var gibanglevelocity(get,set):String;

    @:noCompletion
    public extern inline function get_gibanglevelocity():String {
        return untyped this.GetKeyValues().gibanglevelocity;
    }
    
    @:noCompletion
    public extern inline function set_gibanglevelocity(value:String):String {
        return untyped this.SetKeyValue("gibanglevelocity",untyped value);
    }
    
    /**
		Gib Velocity

		Speed of the fired gibs
	**/
    public var m_flVelocity(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flVelocity():Int {
        return untyped this.GetKeyValues().m_flVelocity;
    }
    
    @:noCompletion
    public extern inline function set_m_flVelocity(value:Int):Int {
        return untyped this.SetKeyValue("m_flVelocity",untyped value);
    }
    
    /**
		Course Variance

		How much variance in the direction gibs are fired.
	**/
    public var m_flVariance(get,set):String;

    @:noCompletion
    public extern inline function get_m_flVariance():String {
        return untyped this.GetKeyValues().m_flVariance;
    }
    
    @:noCompletion
    public extern inline function set_m_flVariance(value:String):String {
        return untyped this.SetKeyValue("m_flVariance",untyped value);
    }
    
    /**
		Gib Life

		Time in seconds for gibs to live +/- 5%
	**/
    public var m_flGibLife(get,set):String;

    @:noCompletion
    public extern inline function get_m_flGibLife():String {
        return untyped this.GetKeyValues().m_flGibLife;
    }
    
    @:noCompletion
    public extern inline function set_m_flGibLife(value:String):String {
        return untyped this.SetKeyValue("m_flGibLife",untyped value);
    }
    
    /**
		Lighting Origin

		Select an info_lighting to specify a location to sample lighting from for all gibs spawned by this shooter, instead of their own origins.
	**/
    public var lightingorigin(get,set):String;

    @:noCompletion
    public extern inline function get_lightingorigin():String {
        return untyped this.GetKeyValues().lightingorigin;
    }
    
    @:noCompletion
    public extern inline function set_lightingorigin(value:String):String {
        return untyped this.SetKeyValue("lightingorigin",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Gibshooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Gibshooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Gibshooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Gibshooter}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:GibshooterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:GibshooterSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<GibshooterSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("gibshooter");
    }
}



enum abstract GibshooterSpawnFlags(Int) to Int {
	var REPEATABLE = 1;
}

#end
