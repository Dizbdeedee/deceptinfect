package gmod.panels;
#if client

/**
    Vertical version of DHorizontalDivider.
**/
extern class DVerticalDivider extends DPanel {
    /**
        Sets the height of the divider bar between the top and bottom content panels of the DVerticalDivider.
		
		Name | Description
		--- | ---
		`height` | The height of the divider bar.
    **/
    
     
    public function SetDividerHeight(height:Float):Void;
    /**
        Sets the passed panel as the top content of the DVerticalDivider.
		
		Name | Description
		--- | ---
		`pnl` | The panel to set as the top content.
    **/
    
     
    public function SetTop(pnl:Panel):Void;
    /**
        Sets the minimum height of the bottom content panel.
		
		Name | Description
		--- | ---
		`height` | The minimum height of the bottom content panel. Default is 50.
    **/
    
     
    public function SetBottomMin(height:Float):Void;
    /**
        Sets the maximum height of the top content panel. This is ignored if the panel would exceed the minimum bottom content panel height set from DVerticalDivider:SetBottomMin.
		
		Name | Description
		--- | ---
		`height` | The maximum height of the top content panel. Default is 4096.
    **/
    
     
    public function SetTopMax(height:Float):Void;
    /**
        Returns whether the divider is being dragged or not.
		
		`**Returns:** If true, mouse movement will alter the size of the divider.
    **/
    
     
    public function GetDragging():Bool;
    /**
        Returns the bottom content panel of the DVerticalDivider.
		
		`**Returns:** The bottom content panel.
    **/
    
     
    public function GetBottom():Panel;
    /**
        Returns the middle content panel of the DVerticalDivider.
		
		`**Returns:** The middle content panel.
    **/
    
     
    public function GetMiddle():Panel;
    /**
        ***INTERNAL** 
		
		Sets whether the divider is being dragged or not.
		
		Name | Description
		--- | ---
		`isDragging` | Setting this to true causes cursor movement to alter the position of the divider.
    **/
    @:deprecated("INTERNAL")
     
    public function SetDragging(isDragging:Bool):Void;
    /**
        Sets the passed panel as the bottom content of the DVerticalDivider.
		
		Name | Description
		--- | ---
		`pnl` | The panel to set as the bottom content.
    **/
    
     
    public function SetBottom(pnl:Panel):Void;
    /**
        Returns the maximum height of the top content panel. See DVerticalDivider:SetTopMax for more information.
		
		`**Returns:** The maximum height of the top content panel.
    **/
    
     
    public function GetTopMax():Float;
    /**
        ***INTERNAL** 
		
		Sets the local Y position of where the user starts dragging the divider.
		
		Name | Description
		--- | ---
		`y` | The local Y position where divider dragging has started.
    **/
    @:deprecated("INTERNAL")
     
    public function SetHoldPos(y:Float):Void;
    /**
        Returns the minimum height of the top content panel.
		
		`**Returns:** The minimum height of the top content panel.
    **/
    
     
    public function GetTopMin():Float;
    /**
        Returns the height of the divider bar between the top and bottom content panels of the DVerticalDivider.
		
		`**Returns:** The height of the divider bar.
    **/
    
     
    public function GetDividerHeight():Float;
    /**
        Returns the minimum height of the bottom content panel.
		
		`**Returns:** The minimum height of the bottom content panel.
    **/
    
     
    public function GetBottomMin():Float;
    /**
        Sets the minimum height of the top content panel.
		
		Name | Description
		--- | ---
		`height` | The minimum height of the top content panel. Default is 50.
    **/
    
     
    public function SetTopMin(height:Float):Void;
    /**
        Returns the current height of the top content panel set by DVerticalDivider:SetTopHeight or by the user.
		
		`**Returns:** The current height of the DVerticalDivider.
    **/
    
     
    public function GetTopHeight():Float;
    /**
        ***INTERNAL** 
		
		Causes the user to start dragging the divider.
    **/
    @:deprecated("INTERNAL")
     
    public function StartGrab():Void;
    /**
        Returns the top content panel of the DVerticalDivider.
		
		`**Returns:** The top content panel.
    **/
    
     
    public function GetTop():Panel;
    /**
        ***INTERNAL** 
		
		Returns the local Y position of where the user starts dragging the divider.
		
		`**Returns:** The local Y position where divider dragging has started.
    **/
    @:deprecated("INTERNAL")
     
    public function GetHoldPos():Float;
    /**
        Places the passed panel in between the top and bottom content panels of the DVerticalDivider.
		
		Name | Description
		--- | ---
		`pnl` | The panel to set as the middle content.
    **/
    
     
    public function SetMiddle(pnl:Panel):Void;
    /**
        Sets the height of the top content panel. 
		
		The height of the bottom content panel is automatically calculated by taking the total height of the DVerticalDivider and subtracting it with the height of the top content panel and the divider bar.
		
		Name | Description
		--- | ---
		`height` | The height of the top content panel.
    **/
    
     
    public function SetTopHeight(height:Float):Void;
    
}



#end