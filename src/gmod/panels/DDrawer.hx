package gmod.panels;
#if client

/**
    A simple Derma Drawer
**/
extern class DDrawer extends Panel {
    /**
        Closes the DDrawer.
    **/
    
     
    public function Close():Void;
    /**
        Set the height of DDrawer
		
		Name | Description
		--- | ---
		`Value` | Height of DDrawer. Default is 100.
    **/
    
     
    public function SetOpenSize(Value:Float):Void;
    /**
        Opens the DDrawer.
    **/
    
     
    public function Open():Void;
    /**
        Set the time (in seconds) for DDrawer to open.
		
		Name | Description
		--- | ---
		`value` | Length in seconds. Default is 0.3
    **/
    
     
    public function SetOpenTime(value:Float):Void;
    /**
        Return the Open Time of DDrawer.
		
		`**Returns:** Time in seconds.
    **/
    
     
    public function GetOpenTime():Float;
    /**
        Toggles the DDrawer.
    **/
    
     
    public function Toggle():Void;
    /**
        Return the Open Size of DDrawer.
		
		`**Returns:** Open size.
    **/
    
     
    public function GetOpenSize():Float;
    
}



#end