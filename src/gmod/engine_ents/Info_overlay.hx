package gmod.engine_ents;
#if server
/**
	An entity that places an overlay on the world.
**/
@:forward
abstract Info_overlay(Entity) to Entity {
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
    
    //Keyvalues
    
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
		Material
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
		Brush faces
	**/
    public var sides(get,set):String;

    @:noCompletion
    public extern inline function get_sides():String {
        return untyped this.GetKeyValues().sides;
    }
    
    @:noCompletion
    public extern inline function set_sides(value:String):String {
        return untyped this.SetKeyValue("sides",untyped value);
    }
    
    /**
		Render Order

		Higher values render after lower values. This value can be 0-3.
	**/
    public var RenderOrder(get,set):Int;

    @:noCompletion
    public extern inline function get_RenderOrder():Int {
        return untyped this.GetKeyValues().RenderOrder;
    }
    
    @:noCompletion
    public extern inline function set_RenderOrder(value:Int):Int {
        return untyped this.SetKeyValue("RenderOrder",untyped value);
    }
    
    /**
		U Start
	**/
    public var StartU(get,set):Float;

    @:noCompletion
    public extern inline function get_StartU():Float {
        return untyped this.GetKeyValues().StartU;
    }
    
    @:noCompletion
    public extern inline function set_StartU(value:Float):Float {
        return untyped this.SetKeyValue("StartU",untyped value);
    }
    
    /**
		U End
	**/
    public var EndU(get,set):Float;

    @:noCompletion
    public extern inline function get_EndU():Float {
        return untyped this.GetKeyValues().EndU;
    }
    
    @:noCompletion
    public extern inline function set_EndU(value:Float):Float {
        return untyped this.SetKeyValue("EndU",untyped value);
    }
    
    /**
		V Start
	**/
    public var StartV(get,set):Float;

    @:noCompletion
    public extern inline function get_StartV():Float {
        return untyped this.GetKeyValues().StartV;
    }
    
    @:noCompletion
    public extern inline function set_StartV(value:Float):Float {
        return untyped this.SetKeyValue("StartV",untyped value);
    }
    
    /**
		V End
	**/
    public var EndV(get,set):Float;

    @:noCompletion
    public extern inline function get_EndV():Float {
        return untyped this.GetKeyValues().EndV;
    }
    
    @:noCompletion
    public extern inline function set_EndV(value:Float):Float {
        return untyped this.SetKeyValue("EndV",untyped value);
    }
    
    /**
		Overlay Basis Origin(Read-Only)
	**/
    public var BasisOrigin(get,never):Vector;

    @:noCompletion
    public extern inline function get_BasisOrigin():Vector {
        return untyped this.GetKeyValues().BasisOrigin;
    }
    
    /**
		Overlay Basis U(Read-Only)
	**/
    public var BasisU(get,never):Vector;

    @:noCompletion
    public extern inline function get_BasisU():Vector {
        return untyped this.GetKeyValues().BasisU;
    }
    
    /**
		Overlay Basis V(Read-Only)
	**/
    public var BasisV(get,never):Vector;

    @:noCompletion
    public extern inline function get_BasisV():Vector {
        return untyped this.GetKeyValues().BasisV;
    }
    
    /**
		Overlay Basis Normal(Read-Only)
	**/
    public var BasisNormal(get,never):Vector;

    @:noCompletion
    public extern inline function get_BasisNormal():Vector {
        return untyped this.GetKeyValues().BasisNormal;
    }
    
    /**
		Overlay Point 1(Read-Only)
	**/
    public var uv0(get,never):Vector;

    @:noCompletion
    public extern inline function get_uv0():Vector {
        return untyped this.GetKeyValues().uv0;
    }
    
    /**
		Overlay Point 2(Read-Only)
	**/
    public var uv1(get,never):Vector;

    @:noCompletion
    public extern inline function get_uv1():Vector {
        return untyped this.GetKeyValues().uv1;
    }
    
    /**
		Overlay Point 3(Read-Only)
	**/
    public var uv2(get,never):Vector;

    @:noCompletion
    public extern inline function get_uv2():Vector {
        return untyped this.GetKeyValues().uv2;
    }
    
    /**
		Overlay Point 4(Read-Only)
	**/
    public var uv3(get,never):Vector;

    @:noCompletion
    public extern inline function get_uv3():Vector {
        return untyped this.GetKeyValues().uv3;
    }
    
    /**
		Start Fade Dist

		Distance at which the overlay starts to fade (<0 = use fademaxdist).
	**/
    public var fademindist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademindist():Float {
        return untyped this.GetKeyValues().fademindist;
    }
    
    @:noCompletion
    public extern inline function set_fademindist(value:Float):Float {
        return untyped this.SetKeyValue("fademindist",untyped value);
    }
    
    /**
		End Fade Dist

		Maximum distance at which the overlay is visible (0 = don't fade out).
	**/
    public var fademaxdist(get,set):Float;

    @:noCompletion
    public extern inline function get_fademaxdist():Float {
        return untyped this.GetKeyValues().fademaxdist;
    }
    
    @:noCompletion
    public extern inline function set_fademaxdist(value:Float):Float {
        return untyped this.SetKeyValue("fademaxdist",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Info_overlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Info_overlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Info_overlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Info_overlay}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("info_overlay");
    }
}





#end
