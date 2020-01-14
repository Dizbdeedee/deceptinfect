package gmod.panels;
#if client

/**
    Creates a slider that can be moved along the X and/or Y axis 
	
	
**/
extern class DSlider extends DPanel {
    /**
        ***Deprecated:**  
		
		Does nothing. 
		
		
		Name | Description
		--- | ---
		`slider` | 
		
		
		
    **/
    @:deprecated
     
    public function SetNumSlider(slider:Any):Void;
    /**
        ***Deprecated:**  
		
		Appears to be non functioning, however is still used by panels such as DNumSlider. 
		
		
		Name | Description
		--- | ---
		`trap` | 
		
		
		
    **/
    @:deprecated
     
    public function SetTrapInside(trap:Bool):Void;
    /**
        ***INTERNAL:**  
		
		Used to position the draggable panel of the slider on the Y axis. 
		
		
		Name | Description
		--- | ---
		`y` | The value range seems to be from 0 to 1
		
		
		
    **/
    @:deprecated
     
    public function SetSlideY(y:Float):Void;
    /**
        Identical to DSlider:IsEditing 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function GetDragging():Bool;
    /**
        Returns true if this element is being edited by the player. 
		
		
		**Returns:** 
		
		
    **/
    
     
    public function IsEditing():Bool;
    /**
        ***Deprecated:**  
		
		Appears to be non functioning, however is still used by panels such as DNumSlider. 
		
		
		**Returns:** 
		
		
    **/
    @:deprecated
     
    public function GetTrapInside():Bool;
    /**
        ***Deprecated:**  
		
		Appears to be non functioning, however is still used by panels such as DNumSlider. 
		
		
		Name | Description
		--- | ---
		`notches` | 
		
		
		
    **/
    @:deprecated
     
    public function SetNotches(notches:Float):Void;
    /**
        ***Deprecated:**  
		
		Does nothing. 
		
		
		**Returns:** 
		
		
    **/
    @:deprecated
     
    public function GetNumSlider():Any;
    /**
        For override by child panels, such as DNumSlider. 
		
		
		Name | Description
		--- | ---
		`x` | 
		`y` | 
		
		
		Name | Description
		--- | ---
		`a` | x
		`b` | y
		
		
		
    **/
    
     
    public function TranslateValues(x:Float, y:Float):DSliderTranslateValuesReturn;
    /**
        ***INTERNAL:**  
		
		Sets whether or not the slider is being dragged. 
		
		
		Name | Description
		--- | ---
		`dragging` | 
		
		
		
    **/
    @:deprecated
     
    public function SetDragging(dragging:Bool):Void;
    /**
        ***Deprecated:**  
		
		Does nothing. 
		
		
		
    **/
    @:deprecated
     
    public function SetImageColor():Void;
    /**
        Sets the background for the slider. 
		
		
		Name | Description
		--- | ---
		`path` | Path to the image.
		
		
		
    **/
    
     
    public function SetBackground(path:String):Void;
    /**
        Returns the draggable panel's lock on the X axis. 
		
		See DSlider:SetLockX for more info. 
		
		 
		**Returns:** 
		
		
    **/
    
     
    public function GetLockX():Float;
    /**
        ***INTERNAL:**  
		
		Used to position the draggable panel of the slider on the X axis. 
		
		
		Name | Description
		--- | ---
		`x` | The value range seems to be from 0 to 1
		
		
		
    **/
    @:deprecated
     
    public function SetSlideX(x:Float):Void;
    /**
        Returns the draggable panel's lock on the Y axis. 
		
		See DSlider:SetLockY for more info. 
		
		 
		**Returns:** 
		
		
    **/
    
     
    public function GetLockY():Float;
    /**
        ***Deprecated:**  
		
		Appears to be non functioning, however is still used by panels such as DNumSlider. 
		
		
		**Returns:** 
		
		
    **/
    @:deprecated
     
    public function GetNotches():Float;
    /**
        Returns the target position of the draggable "knob" panel of the slider on the X axis. 
		
		Set by DSlider:SetSlideX. 
		
		 
		**Returns:** The value range seems to be from 0 to 1
		
		
    **/
    
     
    public function GetSlideX():Float;
    /**
        Returns the target position of the draggable "knob" panel of the slider on the Y axis. 
		
		Set by DSlider:SetSlideY. 
		
		 
		**Returns:** The value range seems to be from 0 to 1
		
		
    **/
    
     
    public function GetSlideY():Float;
    /**
        ***Deprecated:**  
		
		Does nothing. 
		
		
		
    **/
    @:deprecated
     
    public function SetImage():Void;
    /**
        Sets the lock on the Y axis. 
		
		For example the value 0.5 will lock the draggable panel to half the height of the slider's panel. 
		
		 
		Name | Description
		--- | ---
		`lockY` | Set to nil to reset lock. The value range is from 0 to 1.
		
		
		
    **/
    
     
    public function SetLockY(?lockY:Float):Void;
    /**
        Sets the lock on the X axis. 
		
		For example the value 0.5 will lock the draggable panel to half the width of the slider's panel. 
		
		 
		Name | Description
		--- | ---
		`lockX` | Set to nil to reset lock. The value range is from 0 to 1.
		
		
		___
		### Lua Examples
		#### Example 1
		Example of a slider that can be dragged on the X and Y axis.
		
		```lua 
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 500, 300 )
		frame:Center()
		frame:MakePopup()
		
		local Slider = vgui.Create( "DSlider", frame )
		Slider:SetPos( 50, 50 )
		Slider:SetSize( 100, 100 )
		Slider:SetLockX()
		Slider:SetLockY()
		```
		
		
    **/
    
     
    public function SetLockX(?lockX:Float):Void;
    
}


@:multiReturn extern class DSliderTranslateValuesReturn {
var a:Float;
var b:Float;

}

#end