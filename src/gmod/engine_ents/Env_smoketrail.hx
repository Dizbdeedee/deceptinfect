package gmod.engine_ents;
#if server
/**
	An entity that creates a smoke trail.
**/
@:forward
abstract Env_smoketrail(Entity) to Entity {
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
		Sprite Opacity

		Opacity of the sprites (range from 0 - 1).
	**/
    public var opacity(get,set):Float;

    @:noCompletion
    public extern inline function get_opacity():Float {
        return untyped this.GetKeyValues().opacity;
    }
    
    @:noCompletion
    public extern inline function set_opacity(value:Float):Float {
        return untyped this.SetKeyValue("opacity",untyped value);
    }
    
    /**
		Spawn Rate

		Number of particles to emit each second.
	**/
    public var spawnrate(get,set):Float;

    @:noCompletion
    public extern inline function get_spawnrate():Float {
        return untyped this.GetKeyValues().spawnrate;
    }
    
    @:noCompletion
    public extern inline function set_spawnrate(value:Float):Float {
        return untyped this.SetKeyValue("spawnrate",untyped value);
    }
    
    /**
		Particle Life Time

		Number of seconds until each particle dies.
	**/
    public var lifetime(get,set):Float;

    @:noCompletion
    public extern inline function get_lifetime():Float {
        return untyped this.GetKeyValues().lifetime;
    }
    
    @:noCompletion
    public extern inline function set_lifetime(value:Float):Float {
        return untyped this.SetKeyValue("lifetime",untyped value);
    }
    
    /**
		Start Color

		Starting color of the emitted particles.
	**/
    public var startcolor(get,set):String;

    @:noCompletion
    public extern inline function get_startcolor():String {
        return untyped this.GetKeyValues().startcolor;
    }
    
    @:noCompletion
    public extern inline function set_startcolor(value:String):String {
        return untyped this.SetKeyValue("startcolor",untyped value);
    }
    
    /**
		End Color

		Ending color of the emitted particles.
	**/
    public var endcolor(get,set):String;

    @:noCompletion
    public extern inline function get_endcolor():String {
        return untyped this.GetKeyValues().endcolor;
    }
    
    @:noCompletion
    public extern inline function set_endcolor(value:String):String {
        return untyped this.SetKeyValue("endcolor",untyped value);
    }
    
    /**
		Emitter Life Time

		Number of seconds until the env_smoketrail stops emitting particles. 0 means never stop emitting particles.
	**/
    public var emittime(get,set):Float;

    @:noCompletion
    public extern inline function get_emittime():Float {
        return untyped this.GetKeyValues().emittime;
    }
    
    @:noCompletion
    public extern inline function set_emittime(value:Float):Float {
        return untyped this.SetKeyValue("emittime",untyped value);
    }
    
    /**
		Minimum Random Speed

		Minimum randomly-directed speed to use for emitted particles.
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
		Maximum Random Speed

		Maximum randomly-directed speed to use for emitted particles.
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
		Minimum Directed Speed

		Minimum speed along the env_smoketrail's forward direction (x axis) to use for emitted particles.
	**/
    public var mindirectedspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_mindirectedspeed():Float {
        return untyped this.GetKeyValues().mindirectedspeed;
    }
    
    @:noCompletion
    public extern inline function set_mindirectedspeed(value:Float):Float {
        return untyped this.SetKeyValue("mindirectedspeed",untyped value);
    }
    
    /**
		Maximum Directed Speed

		Maximum speed along the env_smoketrail's forward direction (x axis) to use for emitted particles.
	**/
    public var maxdirectedspeed(get,set):Float;

    @:noCompletion
    public extern inline function get_maxdirectedspeed():Float {
        return untyped this.GetKeyValues().maxdirectedspeed;
    }
    
    @:noCompletion
    public extern inline function set_maxdirectedspeed(value:Float):Float {
        return untyped this.SetKeyValue("maxdirectedspeed",untyped value);
    }
    
    /**
		Starting particle size

		Starting particle size.
	**/
    public var startsize(get,set):Float;

    @:noCompletion
    public extern inline function get_startsize():Float {
        return untyped this.GetKeyValues().startsize;
    }
    
    @:noCompletion
    public extern inline function set_startsize(value:Float):Float {
        return untyped this.SetKeyValue("startsize",untyped value);
    }
    
    /**
		Ending particle size

		Ending particle size.
	**/
    public var endsize(get,set):Float;

    @:noCompletion
    public extern inline function get_endsize():Float {
        return untyped this.GetKeyValues().endsize;
    }
    
    @:noCompletion
    public extern inline function set_endsize(value:Float):Float {
        return untyped this.SetKeyValue("endsize",untyped value);
    }
    
    /**
		Spawn radius

		Distance from env_smoketrail at which particles are emitted.
	**/
    public var spawnradius(get,set):Float;

    @:noCompletion
    public extern inline function get_spawnradius():Float {
        return untyped this.GetKeyValues().spawnradius;
    }
    
    @:noCompletion
    public extern inline function set_spawnradius(value:Float):Float {
        return untyped this.SetKeyValue("spawnradius",untyped value);
    }
    
    /**
		Fire Sprite
	**/
    public var firesprite(get,set):String;

    @:noCompletion
    public extern inline function get_firesprite():String {
        return untyped this.GetKeyValues().firesprite;
    }
    
    @:noCompletion
    public extern inline function set_firesprite(value:String):String {
        return untyped this.SetKeyValue("firesprite",untyped value);
    }
    
    /**
		Smoke Puff
	**/
    public var smokesprite(get,set):String;

    @:noCompletion
    public extern inline function get_smokesprite():String {
        return untyped this.GetKeyValues().smokesprite;
    }
    
    @:noCompletion
    public extern inline function set_smokesprite(value:String):String {
        return untyped this.SetKeyValue("smokesprite",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_smoketrail}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_smoketrail}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_smoketrail}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_smoketrail}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_smoketrail");
    }
}





#end
