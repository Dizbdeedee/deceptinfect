package gmod.engine_ents;
#if server
/**
	An entity that creates tesla lightning arcs around its origin.
**/
@:forward
abstract Point_tesla(Entity) to Entity {
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
		Turn emitter on.
	**/
    public extern inline function FireTurnOn(delay:Float) {
        untyped this.Fire("TurnOn",untyped null,delay);
    }
    
    /**
		Turn emitter off.
	**/
    public extern inline function FireTurnOff(delay:Float) {
        untyped this.Fire("TurnOff",untyped null,delay);
    }
    
    /**
		Force a single arc.
	**/
    public extern inline function FireDoSpark(delay:Float) {
        untyped this.Fire("DoSpark",untyped null,delay);
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
		Source Entity

		If specified, tesla lightning will originate from the specified entity. Otherwise, they originate from this entity.
	**/
    public var m_SourceEntityName(get,set):String;

    @:noCompletion
    public extern inline function get_m_SourceEntityName():String {
        return untyped this.GetKeyValues().m_SourceEntityName;
    }
    
    @:noCompletion
    public extern inline function set_m_SourceEntityName(value:String):String {
        return untyped this.SetKeyValue("m_SourceEntityName",untyped value);
    }
    
    /**
		Sound Name

		Sound to be played whenever lightning is created.
	**/
    public var m_SoundName(get,set):String;

    @:noCompletion
    public extern inline function get_m_SoundName():String {
        return untyped this.GetKeyValues().m_SoundName;
    }
    
    @:noCompletion
    public extern inline function set_m_SoundName(value:String):String {
        return untyped this.SetKeyValue("m_SoundName",untyped value);
    }
    
    /**
		Sprite Name

		Material to use for the tesla lightning beams.
	**/
    public var texture(get,set):String;

    @:noCompletion
    public extern inline function get_texture():String {
        return untyped this.GetKeyValues().texture;
    }
    
    @:noCompletion
    public extern inline function set_texture(value:String):String {
        return untyped this.SetKeyValue("texture",untyped value);
    }
    
    /**
		Color
	**/
    public var m_Color(get,set):String;

    @:noCompletion
    public extern inline function get_m_Color():String {
        return untyped this.GetKeyValues().m_Color;
    }
    
    @:noCompletion
    public extern inline function set_m_Color(value:String):String {
        return untyped this.SetKeyValue("m_Color",untyped value);
    }
    
    /**
		Radius

		Radius around the origin to find a point to strike with a tesla lightning beam.
	**/
    public var m_flRadius(get,set):Int;

    @:noCompletion
    public extern inline function get_m_flRadius():Int {
        return untyped this.GetKeyValues().m_flRadius;
    }
    
    @:noCompletion
    public extern inline function set_m_flRadius(value:Int):Int {
        return untyped this.SetKeyValue("m_flRadius",untyped value);
    }
    
    /**
		Min # of Beams

		Minimum number of tesla lightning beams to create when creating an arc.
	**/
    public var beamcount_min(get,set):Int;

    @:noCompletion
    public extern inline function get_beamcount_min():Int {
        return untyped this.GetKeyValues().beamcount_min;
    }
    
    @:noCompletion
    public extern inline function set_beamcount_min(value:Int):Int {
        return untyped this.SetKeyValue("beamcount_min",untyped value);
    }
    
    /**
		Max # of Beams

		Maximum number of tesla lightning beams to create when creating an arc.
	**/
    public var beamcount_max(get,set):Int;

    @:noCompletion
    public extern inline function get_beamcount_max():Int {
        return untyped this.GetKeyValues().beamcount_max;
    }
    
    @:noCompletion
    public extern inline function set_beamcount_max(value:Int):Int {
        return untyped this.SetKeyValue("beamcount_max",untyped value);
    }
    
    /**
		Min Beam Width

		Minimum width of the tesla lightning beams.
	**/
    public var thick_min(get,set):String;

    @:noCompletion
    public extern inline function get_thick_min():String {
        return untyped this.GetKeyValues().thick_min;
    }
    
    @:noCompletion
    public extern inline function set_thick_min(value:String):String {
        return untyped this.SetKeyValue("thick_min",untyped value);
    }
    
    /**
		Max Beam Width

		Maximum width of the tesla lightning beams.
	**/
    public var thick_max(get,set):String;

    @:noCompletion
    public extern inline function get_thick_max():String {
        return untyped this.GetKeyValues().thick_max;
    }
    
    @:noCompletion
    public extern inline function set_thick_max(value:String):String {
        return untyped this.SetKeyValue("thick_max",untyped value);
    }
    
    /**
		Min Time Visible

		Minimum lifetime of the tesla lightning beams.
	**/
    public var lifetime_min(get,set):String;

    @:noCompletion
    public extern inline function get_lifetime_min():String {
        return untyped this.GetKeyValues().lifetime_min;
    }
    
    @:noCompletion
    public extern inline function set_lifetime_min(value:String):String {
        return untyped this.SetKeyValue("lifetime_min",untyped value);
    }
    
    /**
		Max Time Visible

		Maximum lifetime of the tesla lightning beams.
	**/
    public var lifetime_max(get,set):String;

    @:noCompletion
    public extern inline function get_lifetime_max():String {
        return untyped this.GetKeyValues().lifetime_max;
    }
    
    @:noCompletion
    public extern inline function set_lifetime_max(value:String):String {
        return untyped this.SetKeyValue("lifetime_max",untyped value);
    }
    
    /**
		Min Time Between Arcs

		Minimum time delay between random arcing.
	**/
    public var interval_min(get,set):String;

    @:noCompletion
    public extern inline function get_interval_min():String {
        return untyped this.GetKeyValues().interval_min;
    }
    
    @:noCompletion
    public extern inline function set_interval_min(value:String):String {
        return untyped this.SetKeyValue("interval_min",untyped value);
    }
    
    /**
		Max Time Between Arcs

		Maximum time delay between random arcing.
	**/
    public var interval_max(get,set):String;

    @:noCompletion
    public extern inline function get_interval_max():String {
        return untyped this.GetKeyValues().interval_max;
    }
    
    @:noCompletion
    public extern inline function set_interval_max(value:String):String {
        return untyped this.SetKeyValue("interval_max",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Point_tesla}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Point_tesla}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Point_tesla}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Point_tesla}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("point_tesla");
    }
}





#end
