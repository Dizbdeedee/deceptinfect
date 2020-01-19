package gmod.panels;
#if client

/**
    A very basic horizontal scrollable panel, similar to DScrollPanel. 
	
	Used internally in DPropertySheet.
**/
extern class DHorizontalScroller extends Panel {
    /**
        Same as DDragBase:SetUseLiveDrag
		
		Name | Description
		--- | ---
		`newState` | 
    **/
    
     
    public function SetUseLiveDrag(newState:Bool):Void;
    /**
        
		
		`**Returns:** 
    **/
    
     
    public function GetOverlap():Float;
    /**
        
		
		Name | Description
		--- | ---
		`newState` | 
    **/
    
     
    public function SetShowDropTargets(newState:Bool):Void;
    /**
        Called when the panel is scrolled.
    **/
    
    @:hook 
    public function OnDragModified():Void;
    /**
        Adds a panel to the DHorizontalScroller.
		
		Name | Description
		--- | ---
		`pnl` | The panel to add. It will be automatically parented.
    **/
    
     
    public function AddPanel(pnl:Panel):Void;
    /**
        Scrolls the DHorizontalScroller to given child panel.
		
		Name | Description
		--- | ---
		`target` | The target child panel. Must be a child of DHorizontalScroller: GetCanvas
    **/
    
     
    public function ScrollToChild(target:Panel):Void;
    /**
        Returns the internal canvas panel where the content of DHorizontalScroller are placed on.
		
		`**Returns:** The DDragBase panel.
    **/
    
     
    public function GetCanvas():Panel;
    /**
        Controls the spacing between elements of the horizontal scroller.
		
		Name | Description
		--- | ---
		`overlap` | Overlap in pixels. Positive numbers will make elements overlap each other, negative will add spacing.
    **/
    
     
    public function SetOverlap(overlap:Float):Void;
    /**
        Same as DDragBase:MakeDroppable. TODO: Transclude or whatever to here?
		
		Name | Description
		--- | ---
		`name` | 
    **/
    
     
    public function MakeDroppable(name:String):Void;
    /**
        Sets the scroll amount, automatically clamping the value.
		
		Name | Description
		--- | ---
		`scroll` | The new scroll amount
    **/
    
     
    public function SetScroll(scroll:Float):Void;
    /**
        
		
		`**Returns:** 
    **/
    
     
    public function GetShowDropTargets():Bool;
    
}



#end