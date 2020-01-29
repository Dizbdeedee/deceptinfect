package gmod.engine_ents;
#if server
/**
	Morphs terrain by pulling vertices along a normal.

Place this entity the desired distance from a terrain surface and set ANGLES to the normal along which you want to pull the surface's vertices. If you set the INSTANT spawnflag, the morph will take place instantly instead of over time.

**/
@:forward
abstract Env_terrainmorph(Entity) to Entity {
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
		Begin Morph
	**/
    public extern inline function FireBeginMorph(delay:Float) {
        untyped this.Fire("BeginMorph",untyped null,delay);
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
		Start Radius

		Radius of the effect when morphing begins. Only this value is usedif the effect is flagged to occur instantly.
	**/
    public var startradius(get,set):Int;

    @:noCompletion
    public extern inline function get_startradius():Int {
        return untyped this.GetKeyValues().startradius;
    }
    
    @:noCompletion
    public extern inline function set_startradius(value:Int):Int {
        return untyped this.SetKeyValue("startradius",untyped value);
    }
    
    /**
		Goal Radius

		Radius of the effect at the end of morphing. The radius of this effect will change from Start Radius to Goal Radius over the duration of this effect. This value is ignored if the effect is flagged to occur instantly.
	**/
    public var goalradius(get,set):Int;

    @:noCompletion
    public extern inline function get_goalradius():Int {
        return untyped this.GetKeyValues().goalradius;
    }
    
    @:noCompletion
    public extern inline function set_goalradius(value:Int):Int {
        return untyped this.SetKeyValue("goalradius",untyped value);
    }
    
    /**
		Duration

		The morph will take place over this period of time (seconds). Ignored if flagged to occur instantly
	**/
    public var duration(get,set):Int;

    @:noCompletion
    public extern inline function get_duration():Int {
        return untyped this.GetKeyValues().duration;
    }
    
    @:noCompletion
    public extern inline function set_duration(value:Int):Int {
        return untyped this.SetKeyValue("duration",untyped value);
    }
    
    /**
		Displacement Fraction

		If set to 1, the terrain surface will be pulled exactly to this entity's position. If set to 0.5, the surface will be pulled exactly half way to this entity's position. If set to 2, the surface will be pulled to an imaginary point twice as far away as this entity. (Any Displacement Fraction greater than 1.0 will result in clipping. The surface cannot be pulled beyond This entity's position and any vertices attemping will clip to this entity's position. You may use this feature to create mesas.)
	**/
    public var fraction(get,set):Int;

    @:noCompletion
    public extern inline function get_fraction():Int {
        return untyped this.GetKeyValues().fraction;
    }
    
    @:noCompletion
    public extern inline function set_fraction(value:Int):Int {
        return untyped this.SetKeyValue("fraction",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_terrainmorph}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_terrainmorph}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_terrainmorph}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_terrainmorph}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_terrainmorphSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_terrainmorphSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_terrainmorphSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_terrainmorph");
    }
}



enum abstract Env_terrainmorphSpawnFlags(Int) to Int {
	var INSTANT = 1;
}

#end
