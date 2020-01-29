package gmod.engine_ents;
#if server
/**
	A physically simulated spring. 'Length' is what's known as the 'natural spring length'. This is how long the spring would be if it was at rest (nothing hanging on it or attached). When you attach something to the spring, it will stretch longer than its 'natural length'. The amount of stretch is determined by the 'Sprint Constant'. The larger the spring constant the less stretch the spring.
**/
@:forward
abstract Phys_spring(Entity) to Entity {
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
		Set the Spring Constant.
	**/
    public extern inline function FireSetSpringConstant(param:Float,delay:Float) {
        untyped this.Fire("SetSpringConstant",untyped param,delay);
    }
    
    /**
		Set the Spring Length.
	**/
    public extern inline function FireSetSpringLength(param:Float,delay:Float) {
        untyped this.Fire("SetSpringLength",untyped param,delay);
    }
    
    /**
		Set the Spring Damping.
	**/
    public extern inline function FireSetSpringDamping(param:Float,delay:Float) {
        untyped this.Fire("SetSpringDamping",untyped param,delay);
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
		Entity 1
	**/
    public var attach1(get,set):String;

    @:noCompletion
    public extern inline function get_attach1():String {
        return untyped this.GetKeyValues().attach1;
    }
    
    @:noCompletion
    public extern inline function set_attach1(value:String):String {
        return untyped this.SetKeyValue("attach1",untyped value);
    }
    
    /**
		Entity 2
	**/
    public var attach2(get,set):String;

    @:noCompletion
    public extern inline function get_attach2():String {
        return untyped this.GetKeyValues().attach2;
    }
    
    @:noCompletion
    public extern inline function set_attach2(value:String):String {
        return untyped this.SetKeyValue("attach2",untyped value);
    }
    
    /**
		Spring Axis

		Use the helper. Drag it out to match the virtual spring.
	**/
    public var springaxis(get,set):String;

    @:noCompletion
    public extern inline function get_springaxis():String {
        return untyped this.GetKeyValues().springaxis;
    }
    
    @:noCompletion
    public extern inline function set_springaxis(value:String):String {
        return untyped this.SetKeyValue("springaxis",untyped value);
    }
    
    /**
		Spring Length

		How long the spring would be if it was at rest (nothing hanging on it or attached). 0 means the length of the brush.
	**/
    public var length(get,set):String;

    @:noCompletion
    public extern inline function get_length():String {
        return untyped this.GetKeyValues().length;
    }
    
    @:noCompletion
    public extern inline function set_length(value:String):String {
        return untyped this.SetKeyValue("length",untyped value);
    }
    
    /**
		Spring Constant

		Stiffness of the spring.  The larger the number the less the spring will stretch.
	**/
    public var constant(get,set):String;

    @:noCompletion
    public extern inline function get_constant():String {
        return untyped this.GetKeyValues().constant;
    }
    
    @:noCompletion
    public extern inline function set_constant(value:String):String {
        return untyped this.SetKeyValue("constant",untyped value);
    }
    
    /**
		Damping Constant

		How much energy the spring loses.  The larger the number, the less bouncy the spring.
	**/
    public var damping(get,set):String;

    @:noCompletion
    public extern inline function get_damping():String {
        return untyped this.GetKeyValues().damping;
    }
    
    @:noCompletion
    public extern inline function set_damping(value:String):String {
        return untyped this.SetKeyValue("damping",untyped value);
    }
    
    /**
		Relative Damping Constant

		The amount of energy the spring loses proportional to the relative velocity of the two objects the spring is attached to.
	**/
    public var relativedamping(get,set):String;

    @:noCompletion
    public extern inline function get_relativedamping():String {
        return untyped this.GetKeyValues().relativedamping;
    }
    
    @:noCompletion
    public extern inline function set_relativedamping(value:String):String {
        return untyped this.SetKeyValue("relativedamping",untyped value);
    }
    
    /**
		Break on Length

		If the spring's length ever exceeds this length, the spring breaks.
	**/
    public var breaklength(get,set):String;

    @:noCompletion
    public extern inline function get_breaklength():String {
        return untyped this.GetKeyValues().breaklength;
    }
    
    @:noCompletion
    public extern inline function set_breaklength(value:String):String {
        return untyped this.SetKeyValue("breaklength",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Phys_spring}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Phys_spring}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Phys_spring}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Phys_spring}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Phys_springSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Phys_springSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Phys_springSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("phys_spring");
    }
}



enum abstract Phys_springSpawnFlags(Int) to Int {
	var FORCE_ONLY_ON_STRETCH = 1;
}

#end
