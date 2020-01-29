package gmod.engine_ents;
#if server
/**
	An entity that displays text on player's screens.
**/
@:forward
abstract Game_text(Entity) to Entity {
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
		Display the message text.
	**/
    public extern inline function FireDisplay(delay:Float) {
        untyped this.Fire("Display",untyped null,delay);
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
		Message Text

		Message to display onscreen.
	**/
    public var message(get,set):String;

    @:noCompletion
    public extern inline function get_message():String {
        return untyped this.GetKeyValues().message;
    }
    
    @:noCompletion
    public extern inline function set_message(value:String):String {
        return untyped this.SetKeyValue("message",untyped value);
    }
    
    /**
		X (0 - 1.0 = left to right) (-1 centers)

		Horizontal position on the player's screens to draw the text. The value should be between 0 and 1, where 0 is the far left of the screen and 1 is the far right. -1 centers the text.
	**/
    public var x(get,set):String;

    @:noCompletion
    public extern inline function get_x():String {
        return untyped this.GetKeyValues().x;
    }
    
    @:noCompletion
    public extern inline function set_x(value:String):String {
        return untyped this.SetKeyValue("x",untyped value);
    }
    
    /**
		Y (0 - 1.0 = top to bottom) (-1 centers)

		Vertical position on the player's screens to draw the text. The value should be between 0 and 1, where 0 is the top of the screen and 1 is the bottom. -1 centers the text.
	**/
    public var y(get,set):String;

    @:noCompletion
    public extern inline function get_y():String {
        return untyped this.GetKeyValues().y;
    }
    
    @:noCompletion
    public extern inline function set_y(value:String):String {
        return untyped this.SetKeyValue("y",untyped value);
    }
    
    /**
		Text Effect
	**/
    public var effect(get,set):Choices;

    @:noCompletion
    public extern inline function get_effect():Choices {
        return untyped this.GetKeyValues().effect;
    }
    
    @:noCompletion
    public extern inline function set_effect(value:Choices):Choices {
        return untyped this.SetKeyValue("effect",untyped value);
    }
    
    /**
		Color1
	**/
    public var color(get,set):String;

    @:noCompletion
    public extern inline function get_color():String {
        return untyped this.GetKeyValues().color;
    }
    
    @:noCompletion
    public extern inline function set_color(value:String):String {
        return untyped this.SetKeyValue("color",untyped value);
    }
    
    /**
		Color2
	**/
    public var color2(get,set):String;

    @:noCompletion
    public extern inline function get_color2():String {
        return untyped this.GetKeyValues().color2;
    }
    
    @:noCompletion
    public extern inline function set_color2(value:String):String {
        return untyped this.SetKeyValue("color2",untyped value);
    }
    
    /**
		Fade in Time (or character scan time)

		The time it should take for the text to fully fade in.
	**/
    public var fadein(get,set):String;

    @:noCompletion
    public extern inline function get_fadein():String {
        return untyped this.GetKeyValues().fadein;
    }
    
    @:noCompletion
    public extern inline function set_fadein(value:String):String {
        return untyped this.SetKeyValue("fadein",untyped value);
    }
    
    /**
		Fade Out Time

		The time it should take for the text to fade out, after the hold time has expired.
	**/
    public var fadeout(get,set):String;

    @:noCompletion
    public extern inline function get_fadeout():String {
        return untyped this.GetKeyValues().fadeout;
    }
    
    @:noCompletion
    public extern inline function set_fadeout(value:String):String {
        return untyped this.SetKeyValue("fadeout",untyped value);
    }
    
    /**
		Hold Time

		The time the text should stay onscreen, after fading in, before it begins to fade out.
	**/
    public var holdtime(get,set):String;

    @:noCompletion
    public extern inline function get_holdtime():String {
        return untyped this.GetKeyValues().holdtime;
    }
    
    @:noCompletion
    public extern inline function set_holdtime(value:String):String {
        return untyped this.SetKeyValue("holdtime",untyped value);
    }
    
    /**
		Scan time (scan effect only)

		If the 'Text Effect' is set to Scan Out, this is the time it should take to scan out all the letters in the text.
	**/
    public var fxtime(get,set):String;

    @:noCompletion
    public extern inline function get_fxtime():String {
        return untyped this.GetKeyValues().fxtime;
    }
    
    @:noCompletion
    public extern inline function set_fxtime(value:String):String {
        return untyped this.SetKeyValue("fxtime",untyped value);
    }
    
    /**
		Text Channel

		You can have up to four individual game_text messages onscreen at once, stored in channels. Select which channel this text should be placed in, which will overwrite any active message already in that channel.
	**/
    public var channel(get,set):Game_textchannelChoices;

    @:noCompletion
    public extern inline function get_channel():Game_textchannelChoices {
        return untyped this.GetKeyValues().channel;
    }
    
    @:noCompletion
    public extern inline function set_channel(value:Game_textchannelChoices):Game_textchannelChoices {
        return untyped this.SetKeyValue("channel",untyped value);
    }
    
    /**
		Master

		Legacy support: The name of a master entity. If the master hasn't been activated, this entity will not activate.
	**/
    public var master(get,set):String;

    @:noCompletion
    public extern inline function get_master():String {
        return untyped this.GetKeyValues().master;
    }
    
    @:noCompletion
    public extern inline function set_master(value:String):String {
        return untyped this.SetKeyValue("master",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Game_text}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Game_text}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Game_text}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Game_text}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    public extern inline function addSpawnFlag(spawnflag:Game_textSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.bor(spawnflag,this.GetKeyValues().spawnflags));
    }

    public extern inline function removeSpawnFlag(spawnflag:Game_textSpawnFlags) {
        this.SetKeyValue("spawnflags",gmod.libs.BitLib.band(gmod.libs.BitLib.bnot(spawnflag),this.GetKeyValues().spawnflags));    
    }

    public extern inline function setSpawnFlags(spawnflags:Array<Game_textSpawnFlags>) {
        var cur:Float = 0;
        for (spawnflag in spawnflags) {
            cur = gmod.libs.BitLib.bor(spawnflag,cur);
        }
        this.SetKeyValue("spawnflags",cur);
    }
    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("game_text");
    }
}

enum abstract Game_textchannelChoices(Int) to Int {
	var CHANNEL_1 = 1;
	var CHANNEL_2 = 2;
	var CHANNEL_3 = 3;
	var CHANNEL_4 = 4;
}


enum abstract Game_textSpawnFlags(Int) to Int {
	var ALL_PLAYERS = 1;
}

#end
