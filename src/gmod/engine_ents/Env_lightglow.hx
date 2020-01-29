package gmod.engine_ents;
#if server
/**
	An entity that puts an additive glow in the world, mostly used over light sources.
**/
@:forward
abstract Env_lightglow(Entity) to Entity {
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
		Change the render color of the glow. Format: <Red 0-255> <Green 0-255> <Blue 0-255>
	**/
    public extern inline function FireColor(param:String,delay:Float) {
        untyped this.Fire("Color",untyped param,delay);
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
		Vertical Size
	**/
    public var VerticalGlowSize(get,set):Int;

    @:noCompletion
    public extern inline function get_VerticalGlowSize():Int {
        return untyped this.GetKeyValues().VerticalGlowSize;
    }
    
    @:noCompletion
    public extern inline function set_VerticalGlowSize(value:Int):Int {
        return untyped this.SetKeyValue("VerticalGlowSize",untyped value);
    }
    
    /**
		Horizontal Size
	**/
    public var HorizontalGlowSize(get,set):Int;

    @:noCompletion
    public extern inline function get_HorizontalGlowSize():Int {
        return untyped this.GetKeyValues().HorizontalGlowSize;
    }
    
    @:noCompletion
    public extern inline function set_HorizontalGlowSize(value:Int):Int {
        return untyped this.SetKeyValue("HorizontalGlowSize",untyped value);
    }
    
    /**
		Minimum Distance

		The distance at which this effect will be fully translucent.
	**/
    public var MinDist(get,set):Int;

    @:noCompletion
    public extern inline function get_MinDist():Int {
        return untyped this.GetKeyValues().MinDist;
    }
    
    @:noCompletion
    public extern inline function set_MinDist(value:Int):Int {
        return untyped this.SetKeyValue("MinDist",untyped value);
    }
    
    /**
		Maximum Distance

		The distance at which this effect will be at full intensity.
	**/
    public var MaxDist(get,set):Int;

    @:noCompletion
    public extern inline function get_MaxDist():Int {
        return untyped this.GetKeyValues().MaxDist;
    }
    
    @:noCompletion
    public extern inline function set_MaxDist(value:Int):Int {
        return untyped this.SetKeyValue("MaxDist",untyped value);
    }
    
    /**
		Outer Maximum Distance

		If larger than the maximum distance, this is the length at which the glow will fade completely out, between the span of the maximum distance and this length.
	**/
    public var OuterMaxDist(get,set):Int;

    @:noCompletion
    public extern inline function get_OuterMaxDist():Int {
        return untyped this.GetKeyValues().OuterMaxDist;
    }
    
    @:noCompletion
    public extern inline function set_OuterMaxDist(value:Int):Int {
        return untyped this.SetKeyValue("OuterMaxDist",untyped value);
    }
    
    /**
		Glow Proxy Geometry Size

		Size of the glow to be rendered for visibility testing. Must be larger than the distance from the sprite center to empty space. So if this glow is inside geometry (like a light bulb), set this value to be bigger than the bulb's radius. Any time a sphere of this radius would be visible (poking through any nearby geometry), the glow will be rendered.
	**/
    public var GlowProxySize(get,set):Float;

    @:noCompletion
    public extern inline function get_GlowProxySize():Float {
        return untyped this.GetKeyValues().GlowProxySize;
    }
    
    @:noCompletion
    public extern inline function set_GlowProxySize(value:Float):Float {
        return untyped this.SetKeyValue("GlowProxySize",untyped value);
    }
    
    /**
		HDR color scale.

		float value to multiply sprite color by when running in HDR mode.
	**/
    public var HDRColorScale(get,set):Float;

    @:noCompletion
    public extern inline function get_HDRColorScale():Float {
        return untyped this.GetKeyValues().HDRColorScale;
    }
    
    @:noCompletion
    public extern inline function set_HDRColorScale(value:Float):Float {
        return untyped this.SetKeyValue("HDRColorScale",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_lightglow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_lightglow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_lightglow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_lightglow}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_lightglowSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_lightglowSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_lightglowSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_lightglow");
    }
}



enum abstract Env_lightglowSpawnFlags(Int) to Int {
	var VISIBLE_ONLY_FROM_FRONT = 1;
}

#end
