package gmod.panels;
#if client

/**
    A really simple grid layout panel. 
	
	
**/
extern class DGrid extends Panel {
    /**
        Adds a new item to the grid. 
		
		
		Name | Description
		--- | ---
		`item` | The item to add. It will be forced visible and parented to the DGrid.
		
		
		
    **/
    
     
    public function AddItem(item:Panel):Void;
    /**
        Sorts the items in the grid. Does not visually update the grid, use Panel:InvalidateLayout for that. 
		
		
		Name | Description
		--- | ---
		`key` | A key in the panel from DGrid: GetItems. The key's value must be numeric.
		`desc` | True for descending order, false for ascending.
		
		
		
    **/
    
     
    public function SortByMember(key:String, ?desc:Bool):Void;
    /**
        Returns a list of panels in the grid. 
		
		
		**Returns:** A list of Panels.
		
		
    **/
    
     
    public function GetItems():AnyTable;
    /**
        Returns the height of each row of the DGrid, which is set by DGrid:SetRowHeight. 
		
		
		**Returns:** The height of each row
		
		
    **/
    
     
    public function GetRowHeight():Float;
    /**
        Returns the number of columns of this DGrid. Set by DGrid:SetCols. 
		
		
		**Returns:** The number of columns of this DGrid
		
		
    **/
    
     
    public function GetCols():Float;
    /**
        Removes given panel from the DGrid:GetItems. 
		
		
		Name | Description
		--- | ---
		`item` | Item to remove from the grid
		`bDontDelete` | If set to true, the actual panel will not be removed via Panel: Remove.
		
		
		
    **/
    
     
    public function RemoveItem(item:Panel, ?bDontDelete:Bool):Void;
    /**
        Returns the width of each column of the DGrid, which is set by DGrid:SetColWide. 
		
		
		**Returns:** The width of each column
		
		
    **/
    
     
    public function GetColWide():Float;
    /**
        Sets the number of columns this panel should have. 
		
		The DGrid will resize its width to match this value. 
		
		 
		Name | Description
		--- | ---
		`cols` | The desired number of columns
		
		
		
    **/
    
     
    public function SetCols(cols:Float):Void;
    /**
        Sets the height of each row. 
		
		The cell panels (grid items) will not be resized or centered. 
		
		 
		Name | Description
		--- | ---
		`rowHeight` | The height of each row
		
		
		
    **/
    
     
    public function SetRowHeight(rowHeight:Float):Void;
    /**
        Sets the width of each column. 
		
		The cell panels (grid items) will not be resized or centered. 
		
		 
		Name | Description
		--- | ---
		`colWidth` | The width of each column.
		
		
		
    **/
    
     
    public function SetColWide(colWidth:Float):Void;
    
}



#end