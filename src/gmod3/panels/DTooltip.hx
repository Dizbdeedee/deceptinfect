package gmod.panels;
#if client

/**
    The panel used internally for tool tips. See Panel:SetTooltip. 
	
	
**/
extern class DTooltip extends DLabel {
    /**
        Sets up the tooltip for display for given panel and starts the timer. 
		
		
		Name | Description
		--- | ---
		`pnl` | 
		
		
		
    **/
    
     
    public function OpenForPanel(pnl:Panel):Void;
    /**
        Forces the tooltip to close. This will remove the panel. 
		
		
		
    **/
    
     
    public function Close():Void;
    /**
        Used to draw a triangle beneath the DTooltip 
		
		
		Name | Description
		--- | ---
		`x` | arrow location on the x axis
		`y` | arrow location on the y axis
		
		
		
    **/
    
     
    public function DrawArrow(x:Float, y:Float):Void;
    /**
        ***INTERNAL:**  
		
		Positions the DTooltip so it doesn't stay in the same draw position. 
		
		
		
    **/
    @:deprecated
     
    public function PositionTooltip():Void;
    /**
        What Panel you want put inside of the DTooltip 
		
		
		Name | Description
		--- | ---
		`panel` | Contents
		`bDelete` | If set to true, the panel in the first argument will be automatically removed when DTooltip is closed via DTooltip: Close.
		
		
		
    **/
    
     
    public function SetContents(panel:Panel, ?bDelete:Bool):Void;
    
}



#end