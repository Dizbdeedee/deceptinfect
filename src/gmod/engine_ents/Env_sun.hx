package gmod.engine_ents;
#if server
/**
	An entity to control & draw a sun effect in the sky.
**/
@:forward
abstract Env_sun(Entity) to Entity {
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
		Enable sun rendering.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Disable sun rendering.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Change the sun's color. Format: <Red 0-255> <Green 0-255> <Blue 0-255>
	**/
    public extern inline function FireSetColor(param:String,delay:Float) {
        untyped this.Fire("SetColor",untyped param,delay);
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
		Viewer entity

		Name of an entity used to determine where the sun is in the skybox. The sun should be lined up on a line from this entity to the env_sun entity.
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
		UseAngles

		The old way to orient env_sun is to point it at a target. The new way is to specify the angles. If you use the new way, set this property to YES.
	**/
    public var use_angles(get,set):Env_sunuse_anglesChoices;

    @:noCompletion
    public extern inline function get_use_angles():Env_sunuse_anglesChoices {
        return untyped this.GetKeyValues().use_angles;
    }
    
    @:noCompletion
    public extern inline function set_use_angles(value:Env_sunuse_anglesChoices):Env_sunuse_anglesChoices {
        return untyped this.SetKeyValue("use_angles",untyped value);
    }
    
    /**
		Pitch
	**/
    public var pitch(get,set):Int;

    @:noCompletion
    public extern inline function get_pitch():Int {
        return untyped this.GetKeyValues().pitch;
    }
    
    @:noCompletion
    public extern inline function set_pitch(value:Int):Int {
        return untyped this.SetKeyValue("pitch",untyped value);
    }
    
    /**
		Sun Color (R G B)
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
		Overlay Color (R G B)

		A value of 0 0 0 will act the old way.
	**/
    public var overlaycolor(get,set):String;

    @:noCompletion
    public extern inline function get_overlaycolor():String {
        return untyped this.GetKeyValues().overlaycolor;
    }
    
    @:noCompletion
    public extern inline function set_overlaycolor(value:String):String {
        return untyped this.SetKeyValue("overlaycolor",untyped value);
    }
    
    /**
		Size
	**/
    public var size(get,set):Int;

    @:noCompletion
    public extern inline function get_size():Int {
        return untyped this.GetKeyValues().size;
    }
    
    @:noCompletion
    public extern inline function set_size(value:Int):Int {
        return untyped this.SetKeyValue("size",untyped value);
    }
    
    /**
		Overlay Size

		A value of -1 means the overlay will act the old way.
	**/
    public var overlaysize(get,set):Int;

    @:noCompletion
    public extern inline function get_overlaysize():Int {
        return untyped this.GetKeyValues().overlaysize;
    }
    
    @:noCompletion
    public extern inline function set_overlaysize(value:Int):Int {
        return untyped this.SetKeyValue("overlaysize",untyped value);
    }
    
    /**
		Material Name

		Material of the inner glow.
	**/
    public var material(get,set):String;

    @:noCompletion
    public extern inline function get_material():String {
        return untyped this.GetKeyValues().material;
    }
    
    @:noCompletion
    public extern inline function set_material(value:String):String {
        return untyped this.SetKeyValue("material",untyped value);
    }
    
    /**
		Overlay Material Name

		Material of the overlay glow.
	**/
    public var overlaymaterial(get,set):String;

    @:noCompletion
    public extern inline function get_overlaymaterial():String {
        return untyped this.GetKeyValues().overlaymaterial;
    }
    
    @:noCompletion
    public extern inline function set_overlaymaterial(value:String):String {
        return untyped this.SetKeyValue("overlaymaterial",untyped value);
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
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_sun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_sun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_sun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_sun}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_sun");
    }
}

enum abstract Env_sunuse_anglesChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
