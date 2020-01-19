package gmod.panels;
#if client

/**
    A scrollbar used in [DScrollPanel](https://wiki.garrysmod.com/page/Category:DScrollPanel). The scrollbar notably contains DVScrollBar.btnUp, DVScrollBar.btnDown, and DVScrollBar.btnGrip which are the up button, down button, and grip respectively. Editing the paint functions of these allows custom scrollbar styling. See DScrollPanel:GetVBar for an example.
**/
extern class DVScrollBar extends Panel {
    /**
        Returns the amount of scroll level from the top in pixels
		
		`**Returns:** The amount of scroll level from the top
    **/
    
     
    public function GetScroll():Float;
    /**
        Allows hiding the up and down buttons for better visual stylisation.
		
		Name | Description
		--- | ---
		`hide` | True to hide
    **/
    
     
    public function SetHideButtons(hide:Bool):Void;
    /**
        
		
		`**Returns:** 
    **/
    
     
    public function BarScale():Float;
    /**
        Sets up the scrollbar for use. 
		
		The scrollbar will automatically disable itself if the total height of the canvas is lower than the height of the panel that holds the canvas during this function call.
		
		Name | Description
		--- | ---
		`barSize` | The size of the panel that holds the canvas, basically size of "1 page".
		`cavasSize` | The total size of the canvas, this typically is the bigger number.
    **/
    
     
    public function SetUp(barSize:Float, cavasSize:Float):Void;
    /**
        Returns the negative of DVScrollBar:GetScroll.
		
		`**Returns:** 
    **/
    
     
    public function GetOffset():Float;
    /**
        Smoothly scrolls to given level.
		
		Name | Description
		--- | ---
		`scroll` | The scroll level to animate to. In pixels from the top ( from 0 )
		`length` | Length of the animation in seconds
		`delay` | Delay of the animation in seconds
		`ease` | See Panel: NewAnimation for explanation.
    **/
    
     
    public function AnimateTo(scroll:Float, length:Float, ?delay:Float, ?ease:Float):Void;
    /**
        Adds specified amount of scroll in pixels.
		
		Name | Description
		--- | ---
		`add` | How much to scroll downwards. Can be negative for upwards scroll
		
		
		`**Returns:** True if the scroll level was changed (i.e. if we did or did not scroll)
    **/
    
     
    public function AddScroll(add:Float):Bool;
    /**
        ***INTERNAL** 
		
		Called from within DScrollBarGrip
    **/
    @:deprecated("INTERNAL")
     
    public function Grip():Void;
    /**
        Returns whether or not the manual up/down scroll buttons are visible or not. Set by DVScrollBar:SetHideButtons.
		
		`**Returns:** Whether or not the manual up/down scroll buttons are visible or not.
    **/
    
     
    public function GetHideButtons():Bool;
    /**
        Sets the scroll level in pixels.
		
		Name | Description
		--- | ---
		`scroll` | 
    **/
    
     
    public function SetScroll(scroll:Float):Void;
    /**
        ***Deprecated:** 
		
		Should return nil in all cases. See DVScrollBar:GetScroll.
		
		`**Returns:** 
    **/
    @:deprecated("")
     
    public function Value():Dynamic;
    
}



#end