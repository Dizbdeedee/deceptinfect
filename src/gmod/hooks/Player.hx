package gmod.hooks;


/**
    A list of hooks available in player classes.
**/
class Player {
    #if client
    /**
        Called after the viewmodel has been drawn
		
		Name | Description
		--- | ---
		`viewmodel` | The viewmodel
		`weapon` | The weapon
    **/
    
    @:hook
    public function PostDrawViewModel(viewmodel:Entity, weapon:Entity):Void {}
    #end
    #if server
    /**
        Called on spawn to give the player their default loadout
    **/
    
    @:hook
    public function Loadout():Void {}
    #end
    #if server
    /**
        Called when we need to set player model from the class.
		
		**Note:** This will only be called if you have not overridden GM:PlayerSetModel or call this function from it or anywhere else using player_manager.RunClass
    **/
    
    @:hook
    public function SetModel():Void {}
    #end
    #if client
    /**
        Called before the viewmodel is drawn
		
		Name | Description
		--- | ---
		`viewmodel` | The viewmodel
		`weapon` | The weapon
    **/
    
    @:hook
    public function PreDrawViewModel(viewmodel:Entity, weapon:Entity):Void {}
    #end
    #if client
    /**
        Called from GM:FinishMove.
		
		**Warning:** This hook will not work if the current gamemode overrides GM:FinishMove and does not call this hook.
		
		**Note:** This hook is run after the drive.FinishMove has been called.
		
		Name | Description
		--- | ---
		`mv` | 
		
		
		`**Returns:** Return true to prevent default action
    **/
    
    @:hook
    public function FinishMove(mv:CMoveData):Bool {return null;}
    #end
    #if client
    /**
        Called on player spawn to determine which hand model to use
		
		`**Returns:** A table containing info about view model hands model to be set. See examples.
		
		___
		### Lua Examples
		#### Example 1
		Default action of player_default class
		
		```lua 
		function PLAYER:GetHandsModel()
		
		    -- return { model = "models/weapons/c_arms_cstrike.mdl", skin = 1, body = "0100000" }
		
		    local playermodel = player_manager.TranslateToPlayerModelName( self.Player:GetModel() )
		    return player_manager.TranslatePlayerHands( playermodel )
		
		end
		```
		**Output:**
		
		View model hands model is chosen according to players player model.
    **/
    
    @:hook
    public function GetHandsModel():AnyTable {return null;}
    #end
    #if client
    /**
        Called when the player changes their weapon to another one causing their viewmodel model to change
		
		Name | Description
		--- | ---
		`viewmodel` | The viewmodel that is changing
		`old` | The old model
		`new` | The new model
    **/
    
    @:hook
    public function ViewModelChanged(viewmodel:Entity, old:String, _new:String):Void {}
    #end
    #if client
    /**
        Called from GM:Move.
		
		**Warning:** This hook will not work if the current gamemode overrides GM:Move and does not call this hook.
		
		**Note:** This hook is run after the drive.Move has been called.
		
		Name | Description
		--- | ---
		`mv` | Movement information
		
		
		`**Returns:** Return true to prevent default action
    **/
    
    @:hook
    public function Move(mv:CMoveData):Bool {return null;}
    #end
    #if client
    /**
        Called from GM:CreateMove.
		
		**Warning:** This hook will not work if the current gamemode overrides GM:SetupMove and does not call this hook.
		
		**Note:** This hook is run after the drive.StartMove has been called.
		
		Name | Description
		--- | ---
		`mv` | 
		`cmd` | 
		
		
		`**Returns:** Return true to prevent default action
    **/
    
    @:hook
    public function StartMove(mv:CMoveData, cmd:CUserCmd):Bool {return null;}
    #end
    
    /**
        Called when the class object is created
    **/
    
    @:hook
    public function Init():Void {}
    
    
    /**
        Setup the network table accessors.
		
		___
		### Lua Examples
		#### Example 1
		Example usage.
		
		```lua 
		function PLAYER:SetupDataTables()
		    self.Player:NetworkVar( "Int", 0, "Money" )
		end
		```
    **/
    
    @:hook
    public function SetupDataTables():Void {}
    
    #if server
    /**
        Called when the player spawns
    **/
    
    @:hook
    public function Spawn():Void {}
    #end
    
}



