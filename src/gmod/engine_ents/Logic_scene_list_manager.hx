package gmod.engine_ents;
#if server
/**
	Manages a list of logic_choreographed_scene entities. Store choreo scenes in them in order that they will be played by other inputs. Whenever a scene plays, the manager will remove all scenes before that one in the list. The name of another logic_scene_list_manager can be entered in a slot instead of an invididual scene, which will cause all scenes in that manager to be removed when a later scene in this list is played.
**/
@:forward
abstract Logic_scene_list_manager(Entity) to Entity {
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
		Remove the manager and all scenes referenced by it (and all scenes referenced by logic_scene_list_manager's embedded in this one).
	**/
    public extern inline function FireShutdown(delay:Float) {
        untyped this.Fire("Shutdown",untyped null,delay);
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
		Scene 1

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene0(get,set):String;

    @:noCompletion
    public extern inline function get_scene0():String {
        return untyped this.GetKeyValues().scene0;
    }
    
    @:noCompletion
    public extern inline function set_scene0(value:String):String {
        return untyped this.SetKeyValue("scene0",untyped value);
    }
    
    /**
		Scene 2

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene1(get,set):String;

    @:noCompletion
    public extern inline function get_scene1():String {
        return untyped this.GetKeyValues().scene1;
    }
    
    @:noCompletion
    public extern inline function set_scene1(value:String):String {
        return untyped this.SetKeyValue("scene1",untyped value);
    }
    
    /**
		Scene 3

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene2(get,set):String;

    @:noCompletion
    public extern inline function get_scene2():String {
        return untyped this.GetKeyValues().scene2;
    }
    
    @:noCompletion
    public extern inline function set_scene2(value:String):String {
        return untyped this.SetKeyValue("scene2",untyped value);
    }
    
    /**
		Scene 4

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene3(get,set):String;

    @:noCompletion
    public extern inline function get_scene3():String {
        return untyped this.GetKeyValues().scene3;
    }
    
    @:noCompletion
    public extern inline function set_scene3(value:String):String {
        return untyped this.SetKeyValue("scene3",untyped value);
    }
    
    /**
		Scene 5

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene4(get,set):String;

    @:noCompletion
    public extern inline function get_scene4():String {
        return untyped this.GetKeyValues().scene4;
    }
    
    @:noCompletion
    public extern inline function set_scene4(value:String):String {
        return untyped this.SetKeyValue("scene4",untyped value);
    }
    
    /**
		Scene 6

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene5(get,set):String;

    @:noCompletion
    public extern inline function get_scene5():String {
        return untyped this.GetKeyValues().scene5;
    }
    
    @:noCompletion
    public extern inline function set_scene5(value:String):String {
        return untyped this.SetKeyValue("scene5",untyped value);
    }
    
    /**
		Scene 7

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene6(get,set):String;

    @:noCompletion
    public extern inline function get_scene6():String {
        return untyped this.GetKeyValues().scene6;
    }
    
    @:noCompletion
    public extern inline function set_scene6(value:String):String {
        return untyped this.SetKeyValue("scene6",untyped value);
    }
    
    /**
		Scene 8

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene7(get,set):String;

    @:noCompletion
    public extern inline function get_scene7():String {
        return untyped this.GetKeyValues().scene7;
    }
    
    @:noCompletion
    public extern inline function set_scene7(value:String):String {
        return untyped this.SetKeyValue("scene7",untyped value);
    }
    
    /**
		Scene 9

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene8(get,set):String;

    @:noCompletion
    public extern inline function get_scene8():String {
        return untyped this.GetKeyValues().scene8;
    }
    
    @:noCompletion
    public extern inline function set_scene8(value:String):String {
        return untyped this.SetKeyValue("scene8",untyped value);
    }
    
    /**
		Scene 10

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene9(get,set):String;

    @:noCompletion
    public extern inline function get_scene9():String {
        return untyped this.GetKeyValues().scene9;
    }
    
    @:noCompletion
    public extern inline function set_scene9(value:String):String {
        return untyped this.SetKeyValue("scene9",untyped value);
    }
    
    /**
		Scene 11

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene10(get,set):String;

    @:noCompletion
    public extern inline function get_scene10():String {
        return untyped this.GetKeyValues().scene10;
    }
    
    @:noCompletion
    public extern inline function set_scene10(value:String):String {
        return untyped this.SetKeyValue("scene10",untyped value);
    }
    
    /**
		Scene 12

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene11(get,set):String;

    @:noCompletion
    public extern inline function get_scene11():String {
        return untyped this.GetKeyValues().scene11;
    }
    
    @:noCompletion
    public extern inline function set_scene11(value:String):String {
        return untyped this.SetKeyValue("scene11",untyped value);
    }
    
    /**
		Scene 13

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene12(get,set):String;

    @:noCompletion
    public extern inline function get_scene12():String {
        return untyped this.GetKeyValues().scene12;
    }
    
    @:noCompletion
    public extern inline function set_scene12(value:String):String {
        return untyped this.SetKeyValue("scene12",untyped value);
    }
    
    /**
		Scene 14

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene13(get,set):String;

    @:noCompletion
    public extern inline function get_scene13():String {
        return untyped this.GetKeyValues().scene13;
    }
    
    @:noCompletion
    public extern inline function set_scene13(value:String):String {
        return untyped this.SetKeyValue("scene13",untyped value);
    }
    
    /**
		Scene 15

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene14(get,set):String;

    @:noCompletion
    public extern inline function get_scene14():String {
        return untyped this.GetKeyValues().scene14;
    }
    
    @:noCompletion
    public extern inline function set_scene14(value:String):String {
        return untyped this.SetKeyValue("scene14",untyped value);
    }
    
    /**
		Scene 16

		The name of a logic_choreographed_scene, or logic_scene_list_manager.
	**/
    public var scene15(get,set):String;

    @:noCompletion
    public extern inline function get_scene15():String {
        return untyped this.GetKeyValues().scene15;
    }
    
    @:noCompletion
    public extern inline function set_scene15(value:String):String {
        return untyped this.SetKeyValue("scene15",untyped value);
    }
    
    //Outputs
    
    /**
		Fired in response to FireUser1 input.
	**/
    public extern inline function OutputOnUser1(callback:Callback<{activator:Logic_scene_list_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser1",callback);
    }
    
    /**
		Fired in response to FireUser2 input.
	**/
    public extern inline function OutputOnUser2(callback:Callback<{activator:Logic_scene_list_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser2",callback);
    }
    
    /**
		Fired in response to FireUser3 input.
	**/
    public extern inline function OutputOnUser3(callback:Callback<{activator:Logic_scene_list_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser3",callback);
    }
    
    /**
		Fired in response to FireUser4 input.
	**/
    public extern inline function OutputOnUser4(callback:Callback<{activator:Logic_scene_list_manager}>):CallbackLink {
        return gmod.OutputRunner.addOutput(this,"OnUser4",callback);
    }
    

    
    
    public extern inline function new() {
        this = cast gmod.libs.EntsLib.Create("logic_scene_list_manager");
    }
}





#end
