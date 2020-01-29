package gmod.engine_ents;
#if server
/**
	An entity that spawns a particle system built using the particle editor.
**/
@:forward
abstract Info_particle_system(Entity) to Entity {
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
		Tell the particle system to start emitting.
	**/
    public extern inline function FireStart(delay:Float) {
        untyped this.Fire("Start",untyped null,delay);
    }
    
    /**
		Tell the particle system to stop emitting.
	**/
    public extern inline function FireStop(delay:Float) {
        untyped this.Fire("Stop",untyped null,delay);
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
		Particle System Name
	**/
    public var effect_name(get,set):String;

    @:noCompletion
    public extern inline function get_effect_name():String {
        return untyped this.GetKeyValues().effect_name;
    }
    
    @:noCompletion
    public extern inline function set_effect_name(value:String):String {
        return untyped this.SetKeyValue("effect_name",untyped value);
    }
    
    /**
		Start Active?
	**/
    public var start_active(get,set):Info_particle_systemstart_activeChoices;

    @:noCompletion
    public extern inline function get_start_active():Info_particle_systemstart_activeChoices {
        return untyped this.GetKeyValues().start_active;
    }
    
    @:noCompletion
    public extern inline function set_start_active(value:Info_particle_systemstart_activeChoices):Info_particle_systemstart_activeChoices {
        return untyped this.SetKeyValue("start_active",untyped value);
    }
    
    /**
		Flag as Weather?

		Is this particle system going to be used as a weather effect?
	**/
    public var flag_as_weather(get,set):Info_particle_systemflag_as_weatherChoices;

    @:noCompletion
    public extern inline function get_flag_as_weather():Info_particle_systemflag_as_weatherChoices {
        return untyped this.GetKeyValues().flag_as_weather;
    }
    
    @:noCompletion
    public extern inline function set_flag_as_weather(value:Info_particle_systemflag_as_weatherChoices):Info_particle_systemflag_as_weatherChoices {
        return untyped this.SetKeyValue("flag_as_weather",untyped value);
    }
    
    /**
		Control Point 1

		If set, control point 1 of the effect will be at this entity's location.
	**/
    public var cpoint1(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint1():String {
        return untyped this.GetKeyValues().cpoint1;
    }
    
    @:noCompletion
    public extern inline function set_cpoint1(value:String):String {
        return untyped this.SetKeyValue("cpoint1",untyped value);
    }
    
    /**
		Control Point 2

		If set, control point 2 of the effect will be at this entity's location. If control point 1 is not set, this will be ignored.
	**/
    public var cpoint2(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint2():String {
        return untyped this.GetKeyValues().cpoint2;
    }
    
    @:noCompletion
    public extern inline function set_cpoint2(value:String):String {
        return untyped this.SetKeyValue("cpoint2",untyped value);
    }
    
    /**
		Control Point 3

		If set, control point 3 of the effect will be at this entity's location. If control point 2 is not set, this will be ignored.
	**/
    public var cpoint3(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint3():String {
        return untyped this.GetKeyValues().cpoint3;
    }
    
    @:noCompletion
    public extern inline function set_cpoint3(value:String):String {
        return untyped this.SetKeyValue("cpoint3",untyped value);
    }
    
    /**
		Control Point 4

		If set, control point 4 of the effect will be at this entity's location. If control point 3 is not set, this will be ignored.
	**/
    public var cpoint4(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint4():String {
        return untyped this.GetKeyValues().cpoint4;
    }
    
    @:noCompletion
    public extern inline function set_cpoint4(value:String):String {
        return untyped this.SetKeyValue("cpoint4",untyped value);
    }
    
    /**
		Control Point 5

		If set, control point 5 of the effect will be at this entity's location. If control point 4 is not set, this will be ignored.
	**/
    public var cpoint5(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint5():String {
        return untyped this.GetKeyValues().cpoint5;
    }
    
    @:noCompletion
    public extern inline function set_cpoint5(value:String):String {
        return untyped this.SetKeyValue("cpoint5",untyped value);
    }
    
    /**
		Control Point 6

		If set, control point 6 of the effect will be at this entity's location. If control point 5 is not set, this will be ignored.
	**/
    public var cpoint6(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint6():String {
        return untyped this.GetKeyValues().cpoint6;
    }
    
    @:noCompletion
    public extern inline function set_cpoint6(value:String):String {
        return untyped this.SetKeyValue("cpoint6",untyped value);
    }
    
    /**
		Control Point 7

		If set, control point 7 of the effect will be at this entity's location. If control point 6 is not set, this will be ignored.
	**/
    public var cpoint7(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint7():String {
        return untyped this.GetKeyValues().cpoint7;
    }
    
    @:noCompletion
    public extern inline function set_cpoint7(value:String):String {
        return untyped this.SetKeyValue("cpoint7",untyped value);
    }
    
    /**
		Control Point 8

		If set, control point 8 of the effect will be at this entity's location. If control point 7 is not set, this will be ignored.
	**/
    public var cpoint8(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint8():String {
        return untyped this.GetKeyValues().cpoint8;
    }
    
    @:noCompletion
    public extern inline function set_cpoint8(value:String):String {
        return untyped this.SetKeyValue("cpoint8",untyped value);
    }
    
    /**
		Control Point 9

		If set, control point 9 of the effect will be at this entity's location. If control point 8 is not set, this will be ignored.
	**/
    public var cpoint9(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint9():String {
        return untyped this.GetKeyValues().cpoint9;
    }
    
    @:noCompletion
    public extern inline function set_cpoint9(value:String):String {
        return untyped this.SetKeyValue("cpoint9",untyped value);
    }
    
    /**
		Control Point 10

		If set, control point 10 of the effect will be at this entity's location. If control point 9 is not set, this will be ignored.
	**/
    public var cpoint10(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint10():String {
        return untyped this.GetKeyValues().cpoint10;
    }
    
    @:noCompletion
    public extern inline function set_cpoint10(value:String):String {
        return untyped this.SetKeyValue("cpoint10",untyped value);
    }
    
    /**
		Control Point 11

		If set, control point 11 of the effect will be at this entity's location. If control point 10 is not set, this will be ignored.
	**/
    public var cpoint11(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint11():String {
        return untyped this.GetKeyValues().cpoint11;
    }
    
    @:noCompletion
    public extern inline function set_cpoint11(value:String):String {
        return untyped this.SetKeyValue("cpoint11",untyped value);
    }
    
    /**
		Control Point 12

		If set, control point 12 of the effect will be at this entity's location. If control point 11 is not set, this will be ignored.
	**/
    public var cpoint12(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint12():String {
        return untyped this.GetKeyValues().cpoint12;
    }
    
    @:noCompletion
    public extern inline function set_cpoint12(value:String):String {
        return untyped this.SetKeyValue("cpoint12",untyped value);
    }
    
    /**
		Control Point 13

		If set, control point 13 of the effect will be at this entity's location. If control point 12 is not set, this will be ignored.
	**/
    public var cpoint13(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint13():String {
        return untyped this.GetKeyValues().cpoint13;
    }
    
    @:noCompletion
    public extern inline function set_cpoint13(value:String):String {
        return untyped this.SetKeyValue("cpoint13",untyped value);
    }
    
    /**
		Control Point 14

		If set, control point 14 of the effect will be at this entity's location. If control point 13 is not set, this will be ignored.
	**/
    public var cpoint14(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint14():String {
        return untyped this.GetKeyValues().cpoint14;
    }
    
    @:noCompletion
    public extern inline function set_cpoint14(value:String):String {
        return untyped this.SetKeyValue("cpoint14",untyped value);
    }
    
    /**
		Control Point 15

		If set, control point 15 of the effect will be at this entity's location. If control point 14 is not set, this will be ignored.
	**/
    public var cpoint15(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint15():String {
        return untyped this.GetKeyValues().cpoint15;
    }
    
    @:noCompletion
    public extern inline function set_cpoint15(value:String):String {
        return untyped this.SetKeyValue("cpoint15",untyped value);
    }
    
    /**
		Control Point 16

		If set, control point 16 of the effect will be at this entity's location. If control point 15 is not set, this will be ignored.
	**/
    public var cpoint16(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint16():String {
        return untyped this.GetKeyValues().cpoint16;
    }
    
    @:noCompletion
    public extern inline function set_cpoint16(value:String):String {
        return untyped this.SetKeyValue("cpoint16",untyped value);
    }
    
    /**
		Control Point 17

		If set, control point 17 of the effect will be at this entity's location. If control point 16 is not set, this will be ignored.
	**/
    public var cpoint17(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint17():String {
        return untyped this.GetKeyValues().cpoint17;
    }
    
    @:noCompletion
    public extern inline function set_cpoint17(value:String):String {
        return untyped this.SetKeyValue("cpoint17",untyped value);
    }
    
    /**
		Control Point 18

		If set, control point 18 of the effect will be at this entity's location. If control point 17 is not set, this will be ignored.
	**/
    public var cpoint18(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint18():String {
        return untyped this.GetKeyValues().cpoint18;
    }
    
    @:noCompletion
    public extern inline function set_cpoint18(value:String):String {
        return untyped this.SetKeyValue("cpoint18",untyped value);
    }
    
    /**
		Control Point 19

		If set, control point 19 of the effect will be at this entity's location. If control point 18 is not set, this will be ignored.
	**/
    public var cpoint19(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint19():String {
        return untyped this.GetKeyValues().cpoint19;
    }
    
    @:noCompletion
    public extern inline function set_cpoint19(value:String):String {
        return untyped this.SetKeyValue("cpoint19",untyped value);
    }
    
    /**
		Control Point 20

		If set, control point 20 of the effect will be at this entity's location. If control point 19 is not set, this will be ignored.
	**/
    public var cpoint20(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint20():String {
        return untyped this.GetKeyValues().cpoint20;
    }
    
    @:noCompletion
    public extern inline function set_cpoint20(value:String):String {
        return untyped this.SetKeyValue("cpoint20",untyped value);
    }
    
    /**
		Control Point 21

		If set, control point 21 of the effect will be at this entity's location. If control point 10 is not set, this will be ignored.
	**/
    public var cpoint21(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint21():String {
        return untyped this.GetKeyValues().cpoint21;
    }
    
    @:noCompletion
    public extern inline function set_cpoint21(value:String):String {
        return untyped this.SetKeyValue("cpoint21",untyped value);
    }
    
    /**
		Control Point 22

		If set, control point 22 of the effect will be at this entity's location. If control point 21 is not set, this will be ignored.
	**/
    public var cpoint22(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint22():String {
        return untyped this.GetKeyValues().cpoint22;
    }
    
    @:noCompletion
    public extern inline function set_cpoint22(value:String):String {
        return untyped this.SetKeyValue("cpoint22",untyped value);
    }
    
    /**
		Control Point 23

		If set, control point 23 of the effect will be at this entity's location. If control point 22 is not set, this will be ignored.
	**/
    public var cpoint23(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint23():String {
        return untyped this.GetKeyValues().cpoint23;
    }
    
    @:noCompletion
    public extern inline function set_cpoint23(value:String):String {
        return untyped this.SetKeyValue("cpoint23",untyped value);
    }
    
    /**
		Control Point 24

		If set, control point 24 of the effect will be at this entity's location. If control point 23 is not set, this will be ignored.
	**/
    public var cpoint24(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint24():String {
        return untyped this.GetKeyValues().cpoint24;
    }
    
    @:noCompletion
    public extern inline function set_cpoint24(value:String):String {
        return untyped this.SetKeyValue("cpoint24",untyped value);
    }
    
    /**
		Control Point 25

		If set, control point 25 of the effect will be at this entity's location. If control point 24 is not set, this will be ignored.
	**/
    public var cpoint25(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint25():String {
        return untyped this.GetKeyValues().cpoint25;
    }
    
    @:noCompletion
    public extern inline function set_cpoint25(value:String):String {
        return untyped this.SetKeyValue("cpoint25",untyped value);
    }
    
    /**
		Control Point 26

		If set, control point 26 of the effect will be at this entity's location. If control point 25 is not set, this will be ignored.
	**/
    public var cpoint26(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint26():String {
        return untyped this.GetKeyValues().cpoint26;
    }
    
    @:noCompletion
    public extern inline function set_cpoint26(value:String):String {
        return untyped this.SetKeyValue("cpoint26",untyped value);
    }
    
    /**
		Control Point 27

		If set, control point 27 of the effect will be at this entity's location. If control point 26 is not set, this will be ignored.
	**/
    public var cpoint27(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint27():String {
        return untyped this.GetKeyValues().cpoint27;
    }
    
    @:noCompletion
    public extern inline function set_cpoint27(value:String):String {
        return untyped this.SetKeyValue("cpoint27",untyped value);
    }
    
    /**
		Control Point 28

		If set, control point 28 of the effect will be at this entity's location. If control point 27 is not set, this will be ignored.
	**/
    public var cpoint28(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint28():String {
        return untyped this.GetKeyValues().cpoint28;
    }
    
    @:noCompletion
    public extern inline function set_cpoint28(value:String):String {
        return untyped this.SetKeyValue("cpoint28",untyped value);
    }
    
    /**
		Control Point 29

		If set, control point 29 of the effect will be at this entity's location. If control point 28 is not set, this will be ignored.
	**/
    public var cpoint29(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint29():String {
        return untyped this.GetKeyValues().cpoint29;
    }
    
    @:noCompletion
    public extern inline function set_cpoint29(value:String):String {
        return untyped this.SetKeyValue("cpoint29",untyped value);
    }
    
    /**
		Control Point 30

		If set, control point 30 of the effect will be at this entity's location. If control point 29 is not set, this will be ignored.
	**/
    public var cpoint30(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint30():String {
        return untyped this.GetKeyValues().cpoint30;
    }
    
    @:noCompletion
    public extern inline function set_cpoint30(value:String):String {
        return untyped this.SetKeyValue("cpoint30",untyped value);
    }
    
    /**
		Control Point 31

		If set, control point 31 of the effect will be at this entity's location. If control point 30 is not set, this will be ignored.
	**/
    public var cpoint31(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint31():String {
        return untyped this.GetKeyValues().cpoint31;
    }
    
    @:noCompletion
    public extern inline function set_cpoint31(value:String):String {
        return untyped this.SetKeyValue("cpoint31",untyped value);
    }
    
    /**
		Control Point 32

		If set, control point 32 of the effect will be at this entity's location. If control point 31 is not set, this will be ignored.
	**/
    public var cpoint32(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint32():String {
        return untyped this.GetKeyValues().cpoint32;
    }
    
    @:noCompletion
    public extern inline function set_cpoint32(value:String):String {
        return untyped this.SetKeyValue("cpoint32",untyped value);
    }
    
    /**
		Control Point 33

		If set, control point 33 of the effect will be at this entity's location. If control point 32 is not set, this will be ignored.
	**/
    public var cpoint33(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint33():String {
        return untyped this.GetKeyValues().cpoint33;
    }
    
    @:noCompletion
    public extern inline function set_cpoint33(value:String):String {
        return untyped this.SetKeyValue("cpoint33",untyped value);
    }
    
    /**
		Control Point 34

		If set, control point 34 of the effect will be at this entity's location. If control point 33 is not set, this will be ignored.
	**/
    public var cpoint34(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint34():String {
        return untyped this.GetKeyValues().cpoint34;
    }
    
    @:noCompletion
    public extern inline function set_cpoint34(value:String):String {
        return untyped this.SetKeyValue("cpoint34",untyped value);
    }
    
    /**
		Control Point 35

		If set, control point 35 of the effect will be at this entity's location. If control point 34 is not set, this will be ignored.
	**/
    public var cpoint35(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint35():String {
        return untyped this.GetKeyValues().cpoint35;
    }
    
    @:noCompletion
    public extern inline function set_cpoint35(value:String):String {
        return untyped this.SetKeyValue("cpoint35",untyped value);
    }
    
    /**
		Control Point 36

		If set, control point 36 of the effect will be at this entity's location. If control point 35 is not set, this will be ignored.
	**/
    public var cpoint36(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint36():String {
        return untyped this.GetKeyValues().cpoint36;
    }
    
    @:noCompletion
    public extern inline function set_cpoint36(value:String):String {
        return untyped this.SetKeyValue("cpoint36",untyped value);
    }
    
    /**
		Control Point 37

		If set, control point 37 of the effect will be at this entity's location. If control point 36 is not set, this will be ignored.
	**/
    public var cpoint37(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint37():String {
        return untyped this.GetKeyValues().cpoint37;
    }
    
    @:noCompletion
    public extern inline function set_cpoint37(value:String):String {
        return untyped this.SetKeyValue("cpoint37",untyped value);
    }
    
    /**
		Control Point 38

		If set, control point 38 of the effect will be at this entity's location. If control point 37 is not set, this will be ignored.
	**/
    public var cpoint38(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint38():String {
        return untyped this.GetKeyValues().cpoint38;
    }
    
    @:noCompletion
    public extern inline function set_cpoint38(value:String):String {
        return untyped this.SetKeyValue("cpoint38",untyped value);
    }
    
    /**
		Control Point 39

		If set, control point 39 of the effect will be at this entity's location. If control point 38 is not set, this will be ignored.
	**/
    public var cpoint39(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint39():String {
        return untyped this.GetKeyValues().cpoint39;
    }
    
    @:noCompletion
    public extern inline function set_cpoint39(value:String):String {
        return untyped this.SetKeyValue("cpoint39",untyped value);
    }
    
    /**
		Control Point 40

		If set, control point 40 of the effect will be at this entity's location. If control point 39 is not set, this will be ignored.
	**/
    public var cpoint40(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint40():String {
        return untyped this.GetKeyValues().cpoint40;
    }
    
    @:noCompletion
    public extern inline function set_cpoint40(value:String):String {
        return untyped this.SetKeyValue("cpoint40",untyped value);
    }
    
    /**
		Control Point 41

		If set, control point 41 of the effect will be at this entity's location. If control point 40 is not set, this will be ignored.
	**/
    public var cpoint41(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint41():String {
        return untyped this.GetKeyValues().cpoint41;
    }
    
    @:noCompletion
    public extern inline function set_cpoint41(value:String):String {
        return untyped this.SetKeyValue("cpoint41",untyped value);
    }
    
    /**
		Control Point 42

		If set, control point 42 of the effect will be at this entity's location. If control point 41 is not set, this will be ignored.
	**/
    public var cpoint42(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint42():String {
        return untyped this.GetKeyValues().cpoint42;
    }
    
    @:noCompletion
    public extern inline function set_cpoint42(value:String):String {
        return untyped this.SetKeyValue("cpoint42",untyped value);
    }
    
    /**
		Control Point 43

		If set, control point 43 of the effect will be at this entity's location. If control point 42 is not set, this will be ignored.
	**/
    public var cpoint43(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint43():String {
        return untyped this.GetKeyValues().cpoint43;
    }
    
    @:noCompletion
    public extern inline function set_cpoint43(value:String):String {
        return untyped this.SetKeyValue("cpoint43",untyped value);
    }
    
    /**
		Control Point 44

		If set, control point 44 of the effect will be at this entity's location. If control point 43 is not set, this will be ignored.
	**/
    public var cpoint44(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint44():String {
        return untyped this.GetKeyValues().cpoint44;
    }
    
    @:noCompletion
    public extern inline function set_cpoint44(value:String):String {
        return untyped this.SetKeyValue("cpoint44",untyped value);
    }
    
    /**
		Control Point 45

		If set, control point 45 of the effect will be at this entity's location. If control point 44 is not set, this will be ignored.
	**/
    public var cpoint45(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint45():String {
        return untyped this.GetKeyValues().cpoint45;
    }
    
    @:noCompletion
    public extern inline function set_cpoint45(value:String):String {
        return untyped this.SetKeyValue("cpoint45",untyped value);
    }
    
    /**
		Control Point 46

		If set, control point 46 of the effect will be at this entity's location. If control point 45 is not set, this will be ignored.
	**/
    public var cpoint46(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint46():String {
        return untyped this.GetKeyValues().cpoint46;
    }
    
    @:noCompletion
    public extern inline function set_cpoint46(value:String):String {
        return untyped this.SetKeyValue("cpoint46",untyped value);
    }
    
    /**
		Control Point 47

		If set, control point 47 of the effect will be at this entity's location. If control point 46 is not set, this will be ignored.
	**/
    public var cpoint47(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint47():String {
        return untyped this.GetKeyValues().cpoint47;
    }
    
    @:noCompletion
    public extern inline function set_cpoint47(value:String):String {
        return untyped this.SetKeyValue("cpoint47",untyped value);
    }
    
    /**
		Control Point 48

		If set, control point 48 of the effect will be at this entity's location. If control point 47 is not set, this will be ignored.
	**/
    public var cpoint48(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint48():String {
        return untyped this.GetKeyValues().cpoint48;
    }
    
    @:noCompletion
    public extern inline function set_cpoint48(value:String):String {
        return untyped this.SetKeyValue("cpoint48",untyped value);
    }
    
    /**
		Control Point 49

		If set, control point 49 of the effect will be at this entity's location. If control point 48 is not set, this will be ignored.
	**/
    public var cpoint49(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint49():String {
        return untyped this.GetKeyValues().cpoint49;
    }
    
    @:noCompletion
    public extern inline function set_cpoint49(value:String):String {
        return untyped this.SetKeyValue("cpoint49",untyped value);
    }
    
    /**
		Control Point 50

		If set, control point 50 of the effect will be at this entity's location. If control point 49 is not set, this will be ignored.
	**/
    public var cpoint50(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint50():String {
        return untyped this.GetKeyValues().cpoint50;
    }
    
    @:noCompletion
    public extern inline function set_cpoint50(value:String):String {
        return untyped this.SetKeyValue("cpoint50",untyped value);
    }
    
    /**
		Control Point 51

		If set, control point 51 of the effect will be at this entity's location. If control point 50 is not set, this will be ignored.
	**/
    public var cpoint51(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint51():String {
        return untyped this.GetKeyValues().cpoint51;
    }
    
    @:noCompletion
    public extern inline function set_cpoint51(value:String):String {
        return untyped this.SetKeyValue("cpoint51",untyped value);
    }
    
    /**
		Control Point 52

		If set, control point 52 of the effect will be at this entity's location. If control point 51 is not set, this will be ignored.
	**/
    public var cpoint52(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint52():String {
        return untyped this.GetKeyValues().cpoint52;
    }
    
    @:noCompletion
    public extern inline function set_cpoint52(value:String):String {
        return untyped this.SetKeyValue("cpoint52",untyped value);
    }
    
    /**
		Control Point 53

		If set, control point 53 of the effect will be at this entity's location. If control point 52 is not set, this will be ignored.
	**/
    public var cpoint53(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint53():String {
        return untyped this.GetKeyValues().cpoint53;
    }
    
    @:noCompletion
    public extern inline function set_cpoint53(value:String):String {
        return untyped this.SetKeyValue("cpoint53",untyped value);
    }
    
    /**
		Control Point 54

		If set, control point 54 of the effect will be at this entity's location. If control point 53 is not set, this will be ignored.
	**/
    public var cpoint54(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint54():String {
        return untyped this.GetKeyValues().cpoint54;
    }
    
    @:noCompletion
    public extern inline function set_cpoint54(value:String):String {
        return untyped this.SetKeyValue("cpoint54",untyped value);
    }
    
    /**
		Control Point 55

		If set, control point 55 of the effect will be at this entity's location. If control point 54 is not set, this will be ignored.
	**/
    public var cpoint55(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint55():String {
        return untyped this.GetKeyValues().cpoint55;
    }
    
    @:noCompletion
    public extern inline function set_cpoint55(value:String):String {
        return untyped this.SetKeyValue("cpoint55",untyped value);
    }
    
    /**
		Control Point 56

		If set, control point 56 of the effect will be at this entity's location. If control point 55 is not set, this will be ignored.
	**/
    public var cpoint56(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint56():String {
        return untyped this.GetKeyValues().cpoint56;
    }
    
    @:noCompletion
    public extern inline function set_cpoint56(value:String):String {
        return untyped this.SetKeyValue("cpoint56",untyped value);
    }
    
    /**
		Control Point 57

		If set, control point 57 of the effect will be at this entity's location. If control point 56 is not set, this will be ignored.
	**/
    public var cpoint57(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint57():String {
        return untyped this.GetKeyValues().cpoint57;
    }
    
    @:noCompletion
    public extern inline function set_cpoint57(value:String):String {
        return untyped this.SetKeyValue("cpoint57",untyped value);
    }
    
    /**
		Control Point 58

		If set, control point 58 of the effect will be at this entity's location. If control point 57 is not set, this will be ignored.
	**/
    public var cpoint58(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint58():String {
        return untyped this.GetKeyValues().cpoint58;
    }
    
    @:noCompletion
    public extern inline function set_cpoint58(value:String):String {
        return untyped this.SetKeyValue("cpoint58",untyped value);
    }
    
    /**
		Control Point 59

		If set, control point 59 of the effect will be at this entity's location. If control point 58 is not set, this will be ignored.
	**/
    public var cpoint59(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint59():String {
        return untyped this.GetKeyValues().cpoint59;
    }
    
    @:noCompletion
    public extern inline function set_cpoint59(value:String):String {
        return untyped this.SetKeyValue("cpoint59",untyped value);
    }
    
    /**
		Control Point 60

		If set, control point 60 of the effect will be at this entity's location. If control point 59 is not set, this will be ignored.
	**/
    public var cpoint60(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint60():String {
        return untyped this.GetKeyValues().cpoint60;
    }
    
    @:noCompletion
    public extern inline function set_cpoint60(value:String):String {
        return untyped this.SetKeyValue("cpoint60",untyped value);
    }
    
    /**
		Control Point 61

		If set, control point 61 of the effect will be at this entity's location. If control point 60 is not set, this will be ignored.
	**/
    public var cpoint61(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint61():String {
        return untyped this.GetKeyValues().cpoint61;
    }
    
    @:noCompletion
    public extern inline function set_cpoint61(value:String):String {
        return untyped this.SetKeyValue("cpoint61",untyped value);
    }
    
    /**
		Control Point 62

		If set, control point 62 of the effect will be at this entity's location. If control point 61 is not set, this will be ignored.
	**/
    public var cpoint62(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint62():String {
        return untyped this.GetKeyValues().cpoint62;
    }
    
    @:noCompletion
    public extern inline function set_cpoint62(value:String):String {
        return untyped this.SetKeyValue("cpoint62",untyped value);
    }
    
    /**
		Control Point 63

		If set, control point 63 of the effect will be at this entity's location. If control point 62 is not set, this will be ignored.
	**/
    public var cpoint63(get,set):String;

    @:noCompletion
    public extern inline function get_cpoint63():String {
        return untyped this.GetKeyValues().cpoint63;
    }
    
    @:noCompletion
    public extern inline function set_cpoint63(value:String):String {
        return untyped this.SetKeyValue("cpoint63",untyped value);
    }
    
    /**
		Control Point 1's Parent

		If set and nonzero, control point 1 of the effect will use this point for its parent.
	**/
    public var cpoint1_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint1_parent():Int {
        return untyped this.GetKeyValues().cpoint1_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint1_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint1_parent",untyped value);
    }
    
    /**
		Control Point 2's Parent

		If set and nonzero, control point 2 of the effect will use this point for its parent.
	**/
    public var cpoint2_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint2_parent():Int {
        return untyped this.GetKeyValues().cpoint2_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint2_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint2_parent",untyped value);
    }
    
    /**
		Control Point 3's Parent

		If set and nonzero, control point 3 of the effect will use this point for its parent.
	**/
    public var cpoint3_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint3_parent():Int {
        return untyped this.GetKeyValues().cpoint3_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint3_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint3_parent",untyped value);
    }
    
    /**
		Control Point 4's Parent

		If set and nonzero, control point 4 of the effect will use this point for its parent.
	**/
    public var cpoint4_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint4_parent():Int {
        return untyped this.GetKeyValues().cpoint4_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint4_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint4_parent",untyped value);
    }
    
    /**
		Control Point 5's Parent

		If set and nonzero, control point 5 of the effect will use this point for its parent.
	**/
    public var cpoint5_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint5_parent():Int {
        return untyped this.GetKeyValues().cpoint5_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint5_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint5_parent",untyped value);
    }
    
    /**
		Control Point 6's Parent

		If set and nonzero, control point 6 of the effect will use this point for its parent.
	**/
    public var cpoint6_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint6_parent():Int {
        return untyped this.GetKeyValues().cpoint6_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint6_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint6_parent",untyped value);
    }
    
    /**
		Control Point 7's Parent

		If set and nonzero, control point 7 of the effect will use this point for its parent.
	**/
    public var cpoint7_parent(get,set):Int;

    @:noCompletion
    public extern inline function get_cpoint7_parent():Int {
        return untyped this.GetKeyValues().cpoint7_parent;
    }
    
    @:noCompletion
    public extern inline function set_cpoint7_parent(value:Int):Int {
        return untyped this.SetKeyValue("cpoint7_parent",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Info_particle_system}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Info_particle_system}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Info_particle_system}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Info_particle_system}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_particle_system");
    }
}

enum abstract Info_particle_systemstart_activeChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}
enum abstract Info_particle_systemflag_as_weatherChoices(Int) to Int {
	var NO = 0;
	var YES = 1;
}




#end
