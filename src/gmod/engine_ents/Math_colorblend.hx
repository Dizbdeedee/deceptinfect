package gmod.engine_ents;
#if server
/**
	Used to create a blend between two colors for controlling the color of another entity.
**/
@:forward
abstract Math_colorblend(Entity) to Entity {
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
		Input value and fire the output with the remapped value.
	**/
    public extern inline function FireInValue(param:Float,delay:Float) {
        untyped this.Fire("InValue",untyped param,delay);
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
		Minimum Valid Input Value

		Input values below this value will be ignored.
	**/
    public var inmin(get,set):Int;

    @:noCompletion
    public extern inline function get_inmin():Int {
        return untyped this.GetKeyValues().inmin;
    }
    
    @:noCompletion
    public extern inline function set_inmin(value:Int):Int {
        return untyped this.SetKeyValue("inmin",untyped value);
    }
    
    /**
		Maximum Valid Input Value

		Input values above this value will be ignored.
	**/
    public var inmax(get,set):Int;

    @:noCompletion
    public extern inline function get_inmax():Int {
        return untyped this.GetKeyValues().inmax;
    }
    
    @:noCompletion
    public extern inline function set_inmax(value:Int):Int {
        return untyped this.SetKeyValue("inmax",untyped value);
    }
    
    /**
		Output RGB color when input is min.

		When the input value is equal to 'Minimum Valid Input Value', this is the output RGB color.
	**/
    public var colormin(get,set):String;

    @:noCompletion
    public extern inline function get_colormin():String {
        return untyped this.GetKeyValues().colormin;
    }
    
    @:noCompletion
    public extern inline function set_colormin(value:String):String {
        return untyped this.SetKeyValue("colormin",untyped value);
    }
    
    /**
		Output RGB color when input is max.

		When the input value is equal to 'Maximum Valid Input Value', this is the output RGB color.
	**/
    public var colormax(get,set):String;

    @:noCompletion
    public extern inline function get_colormax():String {
        return untyped this.GetKeyValues().colormax;
    }
    
    @:noCompletion
    public extern inline function set_colormax(value:String):String {
        return untyped this.SetKeyValue("colormax",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Math_colorblend}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Math_colorblend}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Math_colorblend}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Math_colorblend}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired when the InValue input is received, with the remapped RGB color as the parameter.
	**/
    public extern inline function OutputOutColor(callback:Callback<{activator:Math_colorblend,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OutColor",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Math_colorblendSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Math_colorblendSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Math_colorblendSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("math_colorblend");
    }
}



enum abstract Math_colorblendSpawnFlags(Int) to Int {
	var IGNORE_OUT_OF_RANGE_INPUT_VALUES = 1;
}

#end
