package gmod.panels;
#if client

/**
    Choose a number from a number line, with zooming for precision. Zoom in by moving your mouse forward and moving back does the opposite. Looks like a blue circle until you click and hold on it 
	
	
**/
extern class DNumberScratch extends DImageButton {
    /**
        Returns the real value of the DNumberScratch as a string. 
		
		See also DNumberScratch:GetFloatValue and DNumberScratch:GetFraction. 
		
		 
		**Returns:** The real value of the DNumberScratch
		
		
    **/
    
     
    public function GetTextValue():String;
    /**
        ***INTERNAL:**  
		
		Used by DNumberScratch:PaintScratchWindow. 
		
		
		Name | Description
		--- | ---
		`x` | 
		`y` | 
		`w` | 
		`h` | 
		
		
		
    **/
    @:deprecated
     
    public function DrawScreen(x:Float, y:Float, w:Float, h:Float):Void;
    /**
        Sets the minimum value that can be selected on the number scratch. 
		
		
		Name | Description
		--- | ---
		`min` | The minimum number
		
		
		
    **/
    
     
    public function SetMin(min:Float):Void;
    /**
        Called when the value of the DNumberScratch is changed. 
		
		
		Name | Description
		--- | ---
		`newValue` | The new value
		
		
		
    **/
    
    @:hook 
    public function OnValueChanged(newValue:Float):Void;
    /**
        Sets the zoom level of the scratch panel. 
		
		
		Name | Description
		--- | ---
		`zoom` | 
		
		
		
    **/
    
     
    public function SetZoom(zoom:Float):Void;
    /**
        Returns the real value of the DNumberScratch as a number. 
		
		See also DNumberScratch:GetTextValue and DNumberScratch:GetFraction. 
		
		 
		**Returns:** The real value of the DNumberScratch
		
		
    **/
    
     
    public function GetFloatValue():Float;
    /**
        Returns the ideal zoom level for the panel based on the DNumberScratch:GetRange. 
		
		
		**Returns:** The ideal zoom level for the panel based on the panels range.
		
		
    **/
    
     
    public function IdealZoom():Float;
    /**
        Sets the max value that can be selected on the number scratch 
		
		
		Name | Description
		--- | ---
		`max` | The maximum number
		
		
		
    **/
    
     
    public function SetMax(max:Float):Void;
    /**
        Sets the value of the DNumberScratch as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the DNumberScratch 
		
		
		Name | Description
		--- | ---
		`frac` | A value between 0 and 1
		
		
		
    **/
    
     
    public function SetFraction(frac:Float):Void;
    /**
        Returns whether the player is currently editing the value of the DNumberScratch. 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function IsEditing():Bool;
    /**
        ***INTERNAL:**  
		
		Sets whether or not the panel is 'active'. 
		
		Forcing this panel to be active may not work. 
		
		 
		Name | Description
		--- | ---
		`active` | true to activate, false to deactivate.
		
		
		
    **/
    @:deprecated
     
    public function SetActive(active:Bool):Void;
    /**
        Returns whether the scratch window should be visible or not. 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function GetShouldDrawScreen():Bool;
    /**
        ***INTERNAL:**  
		
		Used to paint the 'scratch' window. 
		
		
		
    **/
    @:deprecated
     
    public function PaintScratchWindow():Void;
    /**
        ***INTERNAL:**  
		
		Used to lock the cursor in place. 
		
		
		
    **/
    @:deprecated
     
    public function LockCursor():Void;
    /**
        Returns whether this panel is active or not, i.e. if the player is currently changing its value. 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function GetActive():Bool;
    /**
        Sets the value of the DNumberScratch and triggers DNumberScratch:OnValueChanged 
		
		
		Name | Description
		--- | ---
		`val` | The value to set.
		
		
		
    **/
    
     
    public function SetValue(val:Float):Void;
    /**
        Returns the minimum value that can be selected on the number scratch 
		
		
		**Returns:** The minimum value that can be selected on the number scratch
		
		
    **/
    
     
    public function GetMin():Float;
    /**
        Returns the range of the DNumberScratch. Basically max value - min value. 
		
		
		**Returns:** The range of the DNumberScratch
		
		
    **/
    
     
    public function GetRange():Float;
    /**
        ***INTERNAL:**  
		
		Used by DNumberScratch:DrawScreen. 
		
		
		Name | Description
		--- | ---
		`level` | 
		`x` | 
		`y` | 
		`w` | 
		`h` | 
		`range` | 
		`value` | 
		`min` | 
		`max` | 
		
		
		
    **/
    @:deprecated
     
    public function DrawNotches(level:Float, x:Float, y:Float, w:Float, h:Float, range:Float, value:Float, min:Float, max:Float):Void;
    /**
        Returns the maximum value that can be selected on the number scratch 
		
		
		**Returns:** The maximum value that can be selected on the number scratch
		
		
    **/
    
     
    public function GetMax():Float;
    /**
        ***INTERNAL:**  
		
		Sets if the scratch window should be drawn or not. Cannot be used to force it to draw, only to hide it, which will not stop the panel from working with invisible window. 
		
		
		Name | Description
		--- | ---
		`shouldDraw` | 
		
		
		
    **/
    @:deprecated
     
    public function SetShouldDrawScreen(shouldDraw:Bool):Void;
    /**
        Returns the desired amount of numbers after the decimal point. 
		
		
		**Returns:** 0 for whole numbers only, 1 for one number after the decimal point, etc.
		
		
    **/
    
     
    public function GetDecimals():Float;
    /**
        ***INTERNAL:**  
		
		Forces the assigned ConVar to be updated to the value of this DNumberScratch 
		
		
		
    **/
    @:deprecated
     
    public function UpdateConVar():Void;
    /**
        Returns the value of the DNumberScratch as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the DNumberScratch. 
		
		See also: 
		
		 
		**Returns:** A value between 0 and 1
		
		
    **/
    
     
    public function GetFraction():Float;
    /**
        Returns the zoom level of the scratch window 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function GetZoom():Float;
    /**
        ***INTERNAL:**  
		
		Does not trigger DNumberScratch:OnValueChanged 
		
		Use DNumberScratch:SetValue instead. 
		
		 
		Name | Description
		--- | ---
		`val` | The value to set
		
		
		
    **/
    @:deprecated
     
    public function SetFloatValue(val:Float):Void;
    /**
        Sets the desired amount of numbers after the decimal point. 
		
		
		Name | Description
		--- | ---
		`decimals` | 0 for whole numbers only, 1 for one number after the decimal point, etc.
		
		
		
    **/
    
     
    public function SetDecimals(decimals:Float):Void;
    
}



#end