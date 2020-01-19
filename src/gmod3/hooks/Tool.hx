package gmod.hooks;


/**
    A list of hooks (or callbacks) that are available for you to override in a tool. This is only applicable to sandbox and sandbox-derived gamemodes. 
	
	See also: TOOL structure and Tool Functions. 
	
	 
**/
extern class Tool {
    
    /**
        Called when WEAPON:Deploy of the toolgun is called. 
		
		This is also called when switching from another tool on the server. 
		
		 
		
    **/
    
    @:hook
    public function Deploy():Void;
    
    
    /**
        Called when the user left clicks with the tool 
		
		
		Name | Description
		--- | ---
		`tr` | A trace from users eyes to wherever he aims at. See TraceResult structure
		
		
		**Returns:** Return true to make the tool gun beam and play fire animations, false otherwise
		
		
    **/
    
    @:hook
    public function LeftClick(tr:AnyTable):Bool;
    
    
    /**
        Called when the user right clicks with the tool. 
		
		
		Name | Description
		--- | ---
		`tr` | A trace from users eyes to wherever he aims at. See TraceResult structure
		
		
		**Returns:** Return true to make the tool gun beam and play fire animations, false otherwise
		
		
    **/
    
    @:hook
    public function RightClick(tr:AnyTable):Bool;
    
    #if client
    /**
        Called when WEAPON:DrawHUD of the toolgun is called, only when the user has this tool selected. 
		
		
		
    **/
    
    @:hook
    public function DrawHUD():Void;
    #end
    
    /**
        Called when the user presses the reload key with the tool out. 
		
		
		Name | Description
		--- | ---
		`tr` | A trace from users eyes to wherever he aims at. See TraceResult structure
		
		
		**Returns:** Return true to make the tool gun beam and play fire animations, false otherwise
		
		
    **/
    
    @:hook
    public function Reload(tr:AnyTable):Bool;
    
    
    /**
        Called when WEAPON:Holster of the toolgun is called, as well as when switching between different toolguns. 
		
		
		___
		### Lua Examples
		#### Example 1
		Clears any objects set by Tool:SetObject.
		
		```lua 
		function TOOL:Holster()
		
		    self:ClearObjects()
		
		end
		```
		
		
    **/
    
    @:hook
    public function Holster():Void;
    
    
    /**
        Called when WEAPON:Think of the toolgun is called. This only happens when the tool gun is currently equipped/selected by the player and the selected tool is this tool. 
		
		
		
    **/
    
    @:hook
    public function Think():Void;
    
    #if client
    /**
        Called after the default tool screen has been drawn from WEAPON:RenderScreen. 
		
		
		Name | Description
		--- | ---
		`width` | The width of the tool's screen in pixels.
		`height` | The height of the tool's screen in pixels.
		
		
		___
		### Lua Examples
		#### Example 1
		White text that says "Hello world!" on a black background.
		
		```lua 
		function TOOL:DrawToolScreen( width, height )
		    -- Draw black background
		    surface.SetDrawColor( Color( 20, 20, 20 ) )
		    surface.DrawRect( 0, 0, width, height )
		    
		    -- Draw white text in middle
		    draw.SimpleText( "Hello world!", "DermaLarge", width / 2, height / 2, Color( 200, 200, 200 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		```
		
		
    **/
    
    @:hook
    public function DrawToolScreen(width:Float, height:Float):Void;
    #end
    #if client
    /**
        Called when WEAPON:Think of the toolgun is called, only when the user has this tool selected. 
		
		
		**Returns:** Return true to freeze the player
		
		
    **/
    
    @:hook
    public function FreezeMovement():Bool;
    #end
    
}



