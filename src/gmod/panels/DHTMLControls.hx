package gmod.panels;
#if client

/**
    An element providing navigation controls for a DHTML window.
**/
extern class DHTMLControls extends Panel {
    /**
        Sets the color of the navigation buttons.
		
		Name | Description
		--- | ---
		`clr` | A Color structure
    **/
    
     
    public function SetButtonColor(clr:Color):Void;
    /**
        ***INTERNAL** 
		
		Basically adds an URL to the history.
		
		Name | Description
		--- | ---
		`url` | 
    **/
    @:deprecated("INTERNAL")
     
    public function UpdateHistory(url:String):Void;
    /**
        ***INTERNAL** 
    **/
    @:deprecated("INTERNAL")
     
    public function FinishedLoading():Void;
    /**
        ***INTERNAL** 
    **/
    @:deprecated("INTERNAL")
     
    public function UpdateNavButtonStatus():Void;
    /**
        ***INTERNAL** 
    **/
    @:deprecated("INTERNAL")
     
    public function StartedLoading():Void;
    /**
        Sets the DHTML element to control with these DHTMLControls.
		
		Name | Description
		--- | ---
		`dhtml` | The HTML panel
    **/
    
     
    public function SetHTML(dhtml:Panel):Void;
    
}



#end