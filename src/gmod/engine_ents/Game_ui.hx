package gmod.engine_ents;
#if server
/**
	An entity used to override player input when the player is looking at it.
**/
@:forward
abstract Game_ui(Entity) to Entity {
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
		Return Player Control.
	**/
    public extern inline function FireDeactivate(delay:Float) {
        untyped this.Fire("Deactivate",untyped null,delay);
    }
    
    /**
		Take Player Control.
	**/
    public extern inline function FireActivate(param:String,delay:Float) {
        untyped this.Fire("Activate",untyped param,delay);
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
		FieldOfView

		The amount of tolerance in the view checking when determining whether the player's input is still under control. 1.0 = straight ahead, 0.0 = +/- 90 degrees, -1.0 = all directions. If the player isn't within the tolerance, the player regains control.
	**/
    public var FieldOfView(get,set):Float;

    @:noCompletion
    public extern inline function get_FieldOfView():Float {
        return untyped this.GetKeyValues().FieldOfView;
    }
    
    @:noCompletion
    public extern inline function set_FieldOfView(value:Float):Float {
        return untyped this.SetKeyValue("FieldOfView",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    
    /**
		Fired whenever this entity starts controlling the player's input.
	**/
    public extern inline function OutputPlayerOn(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerOn",callback);
    }
    
    /**
		Fired whenever this entity stops controlling the player's input.
	**/
    public extern inline function OutputPlayerOff(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PlayerOff",callback);
    }
    
    /**
		Fired whenever the player presses the moveleft key.
	**/
    public extern inline function OutputPressedMoveLeft(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedMoveLeft",callback);
    }
    
    /**
		Fired whenever the player presses the moveright key.
	**/
    public extern inline function OutputPressedMoveRight(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedMoveRight",callback);
    }
    
    /**
		Fired whenever the player presses the forward key.
	**/
    public extern inline function OutputPressedForward(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedForward",callback);
    }
    
    /**
		Fired whenever the player presses the backward key.
	**/
    public extern inline function OutputPressedBack(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedBack",callback);
    }
    
    /**
		Fired whenever the player presses the attack key.
	**/
    public extern inline function OutputPressedAttack(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedAttack",callback);
    }
    
    /**
		Fired whenever the player presses the secondary attack key.
	**/
    public extern inline function OutputPressedAttack2(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"PressedAttack2",callback);
    }
    
    /**
		Fired whenever the player releases the moveleft key.
	**/
    public extern inline function OutputUnpressedMoveLeft(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedMoveLeft",callback);
    }
    
    /**
		Fired whenever the player releases the moveright key.
	**/
    public extern inline function OutputUnpressedMoveRight(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedMoveRight",callback);
    }
    
    /**
		Fired whenever the player releases the forward key.
	**/
    public extern inline function OutputUnpressedForward(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedForward",callback);
    }
    
    /**
		Fired whenever the player releases the backward key.
	**/
    public extern inline function OutputUnpressedBack(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedBack",callback);
    }
    
    /**
		Fired whenever the player releases the attack key.
	**/
    public extern inline function OutputUnpressedAttack(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedAttack",callback);
    }
    
    /**
		Fired whenever the player releases the secondary attack key.
	**/
    public extern inline function OutputUnpressedAttack2(callback:Callback<{activator:Game_ui}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"UnpressedAttack2",callback);
    }
    
    /**
		An output that fires whenever the X axis of the player's input changes. i.e. -1 when the player has moveleft key down, 1 when the player has moveright key down, and 0 if neither.
	**/
    public extern inline function OutputXAxis(callback:Callback<{activator:Game_ui,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"XAxis",callback);
    }
    
    /**
		An output that fires whenever the Y axis of the player's input changes. i.e. -1 when the player has backward key down, 1 when the player has forward key down, and 0 if neither.
	**/
    public extern inline function OutputYAxis(callback:Callback<{activator:Game_ui,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"YAxis",callback);
    }
    
    /**
		An output that fires whenever the state of the player's attack key changes. i.e. 1 when the player has the attack key down, 0 otherwise.
	**/
    public extern inline function OutputAttackAxis(callback:Callback<{activator:Game_ui,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"AttackAxis",callback);
    }
    
    /**
		An output that fires whenever the state of the player's secondary attack key changes. i.e. 1 when the player has the secondary attack key down, 0 otherwise.
	**/
    public extern inline function OutputAttack2Axis(callback:Callback<{activator:Game_ui,data:String}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"Attack2Axis",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Game_uiSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Game_uiSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Game_uiSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("game_ui");
    }
}



enum abstract Game_uiSpawnFlags(Int) to Int {
	var FREEZE_PLAYER = 32;
	var HIDE_WEAPON = 64;
	var USE_DEACTIVATES = 128;
	var JUMP_DEACTIVATES = 256;
}

#end
