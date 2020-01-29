package gmod.engine_ents;
#if server
/**
	A env_sprite that allows orientation.
**/
@:forward
abstract Env_sprite_oriented(Entity) to Entity {
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
		Sets the red color channel's value (0 - 255).
	**/
    public extern inline function FireColorRedValue(param:Float,delay:Float) {
        untyped this.Fire("ColorRedValue",untyped param,delay);
    }
    
    /**
		Sets the green color channel's value (0 - 255).
	**/
    public extern inline function FireColorGreenValue(param:Float,delay:Float) {
        untyped this.Fire("ColorGreenValue",untyped param,delay);
    }
    
    /**
		Sets the blue color channel's value (0 - 255).
	**/
    public extern inline function FireColorBlueValue(param:Float,delay:Float) {
        untyped this.Fire("ColorBlueValue",untyped param,delay);
    }
    
    /**
		Set the sprite's scale (0 - 8.0).
	**/
    public extern inline function FireSetScale(param:Float,delay:Float) {
        untyped this.Fire("SetScale",untyped param,delay);
    }
    
    /**
		Hide the sprite. Won't be drawn until the 'ShowSprite' input is received.
	**/
    public extern inline function FireHideSprite(delay:Float) {
        untyped this.Fire("HideSprite",untyped null,delay);
    }
    
    /**
		Show the sprite.
	**/
    public extern inline function FireShowSprite(delay:Float) {
        untyped this.Fire("ShowSprite",untyped null,delay);
    }
    
    /**
		Toggle the sprite between hidden and shown.
	**/
    public extern inline function FireToggleSprite(delay:Float) {
        untyped this.Fire("ToggleSprite",untyped null,delay);
    }
    
    /**
		Sets the red color channel's value (0 - 255).
	**/
    public extern inline function FireColorRedValue(param:Float,delay:Float) {
        untyped this.Fire("ColorRedValue",untyped param,delay);
    }
    
    /**
		Sets the green color channel's value (0 - 255).
	**/
    public extern inline function FireColorGreenValue(param:Float,delay:Float) {
        untyped this.Fire("ColorGreenValue",untyped param,delay);
    }
    
    /**
		Sets the blue color channel's value (0 - 255).
	**/
    public extern inline function FireColorBlueValue(param:Float,delay:Float) {
        untyped this.Fire("ColorBlueValue",untyped param,delay);
    }
    
    /**
		Set the sprite's scale (0 - 8.0).
	**/
    public extern inline function FireSetScale(param:Float,delay:Float) {
        untyped this.Fire("SetScale",untyped param,delay);
    }
    
    /**
		Hide the sprite. Won't be drawn until the 'ShowSprite' input is received.
	**/
    public extern inline function FireHideSprite(delay:Float) {
        untyped this.Fire("HideSprite",untyped null,delay);
    }
    
    /**
		Show the sprite.
	**/
    public extern inline function FireShowSprite(delay:Float) {
        untyped this.Fire("ShowSprite",untyped null,delay);
    }
    
    /**
		Toggle the sprite between hidden and shown.
	**/
    public extern inline function FireToggleSprite(delay:Float) {
        untyped this.Fire("ToggleSprite",untyped null,delay);
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
    public var mindxlevel(get,set):Env_sprite_orientedmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Env_sprite_orientedmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Env_sprite_orientedmindxlevelChoices):Env_sprite_orientedmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Env_sprite_orientedmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Env_sprite_orientedmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Env_sprite_orientedmaxdxlevelChoices):Env_sprite_orientedmaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Env_sprite_orientedgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Env_sprite_orientedgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Env_sprite_orientedgmod_allowphysgunChoices):Env_sprite_orientedgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Env_sprite_orientedrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Env_sprite_orientedrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Env_sprite_orientedrendermodeChoices):Env_sprite_orientedrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Env_sprite_orienteddisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Env_sprite_orienteddisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Env_sprite_orienteddisablereceiveshadowsChoices):Env_sprite_orienteddisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Env_sprite_orientedrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Env_sprite_orientedrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Env_sprite_orientedrenderfxChoices):Env_sprite_orientedrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
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
		Minimum DX Level
	**/
    public var mindxlevel(get,set):Env_sprite_orientedmindxlevelChoices;

    @:noCompletion
    public extern inline function get_mindxlevel():Env_sprite_orientedmindxlevelChoices {
        return untyped this.GetKeyValues().mindxlevel;
    }
    
    @:noCompletion
    public extern inline function set_mindxlevel(value:Env_sprite_orientedmindxlevelChoices):Env_sprite_orientedmindxlevelChoices {
        return untyped this.SetKeyValue("mindxlevel",untyped value);
    }
    
    /**
		Maximum DX Level
	**/
    public var maxdxlevel(get,set):Env_sprite_orientedmaxdxlevelChoices;

    @:noCompletion
    public extern inline function get_maxdxlevel():Env_sprite_orientedmaxdxlevelChoices {
        return untyped this.GetKeyValues().maxdxlevel;
    }
    
    @:noCompletion
    public extern inline function set_maxdxlevel(value:Env_sprite_orientedmaxdxlevelChoices):Env_sprite_orientedmaxdxlevelChoices {
        return untyped this.SetKeyValue("maxdxlevel",untyped value);
    }
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Env_sprite_orientedgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Env_sprite_orientedgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Env_sprite_orientedgmod_allowphysgunChoices):Env_sprite_orientedgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Env_sprite_orientedrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Env_sprite_orientedrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Env_sprite_orientedrendermodeChoices):Env_sprite_orientedrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Env_sprite_orienteddisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Env_sprite_orienteddisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Env_sprite_orienteddisablereceiveshadowsChoices):Env_sprite_orienteddisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Env_sprite_orientedrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Env_sprite_orientedrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Env_sprite_orientedrenderfxChoices):Env_sprite_orientedrenderfxChoices {
        return untyped this.SetKeyValue("renderfx",untyped value);
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
		Framerate

		Rate at which the sprite should animate, if at all.
	**/
    public var framerate(get,set):String;

    @:noCompletion
    public extern inline function get_framerate():String {
        return untyped this.GetKeyValues().framerate;
    }
    
    @:noCompletion
    public extern inline function set_framerate(value:String):String {
        return untyped this.SetKeyValue("framerate",untyped value);
    }
    
    /**
		Sprite Name

		Material of the sprite to be drawn.
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Scale

		Scale multiplier of the sprite.
	**/
    public var scale(get,set):String;

    @:noCompletion
    public extern inline function get_scale():String {
        return untyped this.GetKeyValues().scale;
    }
    
    @:noCompletion
    public extern inline function set_scale(value:String):String {
        return untyped this.SetKeyValue("scale",untyped value);
    }
    
    /**
		Size of Glow Proxy Geometry.

		Size of the glow to be rendered for visibility testing. Must be larger than the distance from the sprite center to empty space.  So if this glow is inside geometry (like a light bulb), set this value to be bigger than the bulb's radius. Any time a sphere of this radius would be visible (poking through any nearby geometry), the glow will be rendered.
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
    
    /**
		Framerate

		Rate at which the sprite should animate, if at all.
	**/
    public var framerate(get,set):String;

    @:noCompletion
    public extern inline function get_framerate():String {
        return untyped this.GetKeyValues().framerate;
    }
    
    @:noCompletion
    public extern inline function set_framerate(value:String):String {
        return untyped this.SetKeyValue("framerate",untyped value);
    }
    
    /**
		Sprite Name

		Material of the sprite to be drawn.
	**/
    public var model(get,set):String;

    @:noCompletion
    public extern inline function get_model():String {
        return untyped this.GetKeyValues().model;
    }
    
    @:noCompletion
    public extern inline function set_model(value:String):String {
        return untyped this.SetKeyValue("model",untyped value);
    }
    
    /**
		Scale

		Scale multiplier of the sprite.
	**/
    public var scale(get,set):String;

    @:noCompletion
    public extern inline function get_scale():String {
        return untyped this.GetKeyValues().scale;
    }
    
    @:noCompletion
    public extern inline function set_scale(value:String):String {
        return untyped this.SetKeyValue("scale",untyped value);
    }
    
    /**
		Size of Glow Proxy Geometry.

		Size of the glow to be rendered for visibility testing. Must be larger than the distance from the sprite center to empty space.  So if this glow is inside geometry (like a light bulb), set this value to be bigger than the bulb's radius. Any time a sphere of this radius would be visible (poking through any nearby geometry), the glow will be rendered.
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
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Env_sprite_oriented}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Env_sprite_orientedSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Env_sprite_orientedSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Env_sprite_orientedSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("env_sprite_oriented");
    }
}

enum abstract Env_sprite_orientedrendermodeChoices(Int) to Int {
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
enum abstract Env_sprite_orientedrenderfxChoices(Int) to Int {
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
enum abstract Env_sprite_orientedmindxlevelChoices(Int) to Int {
	var DEFAULT_LOWEST = 0;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Env_sprite_orientedmaxdxlevelChoices(Int) to Int {
	var DEFAULT_HIGHEST = 0;
	var DX6 = 60;
	var DX7 = 70;
	var DX80_4600TI = 80;
	var DX81_FX5200 = 81;
	var DX9_SM20 = 90;
	var DX9_SM30 = 95;
}
enum abstract Env_sprite_orientedgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Env_sprite_orienteddisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Env_sprite_orientedSpawnFlags(Int) to Int {
	var START_ON = 1;
	var PLAY_ONCE = 2;
	var START_ON = 1;
	var PLAY_ONCE = 2;
}

#end
