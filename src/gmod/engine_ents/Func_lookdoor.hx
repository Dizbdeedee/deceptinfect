package gmod.engine_ents;
#if server
/**
	A door that moves either when looked by a targeted object or when a target object comes near the door.  Behavior can be either based on viewing direction or proximity alone, or on a combination of both.  If inverted the doors behavior will be the opposite.
**/
@:forward
abstract Func_lookdoor(Entity) to Entity {
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
		Move the brush to the end position (starting position + (move direction * move distance)).
	**/
    public extern inline function FireOpen(delay:Float) {
        untyped this.Fire("Open",untyped null,delay);
    }
    
    /**
		Move the brush to the starting position.
	**/
    public extern inline function FireClose(delay:Float) {
        untyped this.Fire("Close",untyped null,delay);
    }
    
    /**
		Move the brush to a specific position between 0.0 and 1.0, where 0 is the starting position and 1 is the starting position + (move direction * move distance).
	**/
    public extern inline function FireSetPosition(param:String,delay:Float) {
        untyped this.Fire("SetPosition",untyped param,delay);
    }
    
    /**
		Set the speed and update immediately.
	**/
    public extern inline function FireSetSpeed(param:Float,delay:Float) {
        untyped this.Fire("SetSpeed",untyped param,delay);
    }
    
    /**
		InvertOn - when set behavior of door is inverted.
	**/
    public extern inline function FireInvertOn(delay:Float) {
        untyped this.Fire("InvertOn",untyped null,delay);
    }
    
    /**
		InvertOff - when set behavior of door is normal.
	**/
    public extern inline function FireInvertOff(delay:Float) {
        untyped this.Fire("InvertOff",untyped null,delay);
    }
    
    //Keyvalues
    
    /**
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_lookdoorgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_lookdoorgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_lookdoorgmod_allowphysgunChoices):Func_lookdoorgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_lookdoorrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_lookdoorrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_lookdoorrendermodeChoices):Func_lookdoorrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_lookdoordisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_lookdoordisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_lookdoordisablereceiveshadowsChoices):Func_lookdoordisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_lookdoorrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_lookdoorrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_lookdoorrenderfxChoices):Func_lookdoorrenderfxChoices {
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
		Allow Physics Gun

		If set, players cannot use Physics Gun on this entity.
	**/
    public var gmod_allowphysgun(get,set):Func_lookdoorgmod_allowphysgunChoices;

    @:noCompletion
    public extern inline function get_gmod_allowphysgun():Func_lookdoorgmod_allowphysgunChoices {
        return untyped this.GetKeyValues().gmod_allowphysgun;
    }
    
    @:noCompletion
    public extern inline function set_gmod_allowphysgun(value:Func_lookdoorgmod_allowphysgunChoices):Func_lookdoorgmod_allowphysgunChoices {
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
    public var rendermode(get,set):Func_lookdoorrendermodeChoices;

    @:noCompletion
    public extern inline function get_rendermode():Func_lookdoorrendermodeChoices {
        return untyped this.GetKeyValues().rendermode;
    }
    
    @:noCompletion
    public extern inline function set_rendermode(value:Func_lookdoorrendermodeChoices):Func_lookdoorrendermodeChoices {
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
    public var disablereceiveshadows(get,set):Func_lookdoordisablereceiveshadowsChoices;

    @:noCompletion
    public extern inline function get_disablereceiveshadows():Func_lookdoordisablereceiveshadowsChoices {
        return untyped this.GetKeyValues().disablereceiveshadows;
    }
    
    @:noCompletion
    public extern inline function set_disablereceiveshadows(value:Func_lookdoordisablereceiveshadowsChoices):Func_lookdoordisablereceiveshadowsChoices {
        return untyped this.SetKeyValue("disablereceiveshadows",untyped value);
    }
    
    /**
		Render FX
	**/
    public var renderfx(get,set):Func_lookdoorrenderfxChoices;

    @:noCompletion
    public extern inline function get_renderfx():Func_lookdoorrenderfxChoices {
        return untyped this.GetKeyValues().renderfx;
    }
    
    @:noCompletion
    public extern inline function set_renderfx(value:Func_lookdoorrenderfxChoices):Func_lookdoorrenderfxChoices {
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
		Move Direction (Pitch Yaw Roll)

		The direction the brushes will move, when told to.
	**/
    public var movedir(get,set):Angle;

    @:noCompletion
    public extern inline function get_movedir():Angle {
        return untyped this.GetKeyValues().movedir;
    }
    
    @:noCompletion
    public extern inline function set_movedir(value:Angle):Angle {
        return untyped this.SetKeyValue("movedir",untyped value);
    }
    
    /**
		Start Position

		Position of brush when spawned. The range is a value between 0.0 and 1.0, where 0 is the starting position and 1 is the starting position + (move direction * move distance).
	**/
    public var startposition(get,set):Float;

    @:noCompletion
    public extern inline function get_startposition():Float {
        return untyped this.GetKeyValues().startposition;
    }
    
    @:noCompletion
    public extern inline function set_startposition(value:Float):Float {
        return untyped this.SetKeyValue("startposition",untyped value);
    }
    
    /**
		Speed

		The speed that the brush moves, in inches per second.
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
		Move Distance

		The distance from the starting point that the brush should move, in inches.
	**/
    public var movedistance(get,set):Float;

    @:noCompletion
    public extern inline function get_movedistance():Float {
        return untyped this.GetKeyValues().movedistance;
    }
    
    @:noCompletion
    public extern inline function set_movedistance(value:Float):Float {
        return untyped this.SetKeyValue("movedistance",untyped value);
    }
    
    /**
		Block Damage

		The amount of damage to do to any entity that blocks the brushes, per frame.
	**/
    public var blockdamage(get,set):Float;

    @:noCompletion
    public extern inline function get_blockdamage():Float {
        return untyped this.GetKeyValues().blockdamage;
    }
    
    @:noCompletion
    public extern inline function set_blockdamage(value:Float):Float {
        return untyped this.SetKeyValue("blockdamage",untyped value);
    }
    
    /**
		Sound played when the brush starts moving.
	**/
    public var startsound(get,set):String;

    @:noCompletion
    public extern inline function get_startsound():String {
        return untyped this.GetKeyValues().startsound;
    }
    
    @:noCompletion
    public extern inline function set_startsound(value:String):String {
        return untyped this.SetKeyValue("startsound",untyped value);
    }
    
    /**
		Sound played when the brush stops moving.
	**/
    public var stopsound(get,set):String;

    @:noCompletion
    public extern inline function get_stopsound():String {
        return untyped this.GetKeyValues().stopsound;
    }
    
    @:noCompletion
    public extern inline function set_stopsound(value:String):String {
        return untyped this.SetKeyValue("stopsound",untyped value);
    }
    
    /**
		Proximity Distance

		If non-zero, proximity range over which door will move
	**/
    public var ProximityDistance(get,set):String;

    @:noCompletion
    public extern inline function get_ProximityDistance():String {
        return untyped this.GetKeyValues().ProximityDistance;
    }
    
    @:noCompletion
    public extern inline function set_ProximityDistance(value:String):String {
        return untyped this.SetKeyValue("ProximityDistance",untyped value);
    }
    
    /**
		Proximity Offset

		Offset from the target object
	**/
    public var ProximityOffset(get,set):String;

    @:noCompletion
    public extern inline function get_ProximityOffset():String {
        return untyped this.GetKeyValues().ProximityOffset;
    }
    
    @:noCompletion
    public extern inline function set_ProximityOffset(value:String):String {
        return untyped this.SetKeyValue("ProximityOffset",untyped value);
    }
    
    /**
		FieldOfView

		If non-zero, field of view over which door will move
	**/
    public var FieldOfView(get,set):String;

    @:noCompletion
    public extern inline function get_FieldOfView():String {
        return untyped this.GetKeyValues().FieldOfView;
    }
    
    @:noCompletion
    public extern inline function set_FieldOfView(value:String):String {
        return untyped this.SetKeyValue("FieldOfView",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the brush reaches the end position (starting position + (move direction * move distance)).
	**/
    public extern inline function OutputOnFullyOpen(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyOpen",callback);
    }
    
    /**
		Fired when the brush reaches the starting position.
	**/
    public extern inline function OutputOnFullyClosed(callback:Callback<{activator:Func_lookdoor}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnFullyClosed",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Func_lookdoorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Func_lookdoorSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Func_lookdoorSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("func_lookdoor");
    }
}

enum abstract Func_lookdoorrendermodeChoices(Int) to Int {
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
enum abstract Func_lookdoorrenderfxChoices(Int) to Int {
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
enum abstract Func_lookdoorgmod_allowphysgunChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Func_lookdoordisablereceiveshadowsChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}


enum abstract Func_lookdoorSpawnFlags(Int) to Int {
	var NOT_SOLID = 8;
	var LOOKDOOR_THRESHOLD = 8192;
	var LOOKDOOR_INVERT = 16384;
	var LOOKDOOR_FROM_OPEN = 32768;
}

#end
