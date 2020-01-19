package gmod.panels;
#if client

/**
    Underlined link label without a DoClick function. When a valid URL is set and the label is clicked, it will open a browser window and navigate to the address. 
	
	This panel uses gui.OpenURL internally and its restrictions apply.
**/
extern class DLabelURL extends URLLabel {
    /**
        Gets the current text color of the DLabelURL set by DLabelURL:SetTextColor.
		
		`**Returns:** The current text Color.
    **/
    
     
    public function GetTextColor():AnyTable;
    /**
        Sets the base text color of the DLabelURL. This is overridden by DLabelURL:SetTextColor.
		
		Name | Description
		--- | ---
		`color` | The Color to set
    **/
    
     
    public function SetTextStyleColor(color:AnyTable):Void;
    /**
        Sets the URL of a link-based panel such as [DLabelURL](https://wiki.garrysmod.com/page/Category:DLabelURL).
		
		Name | Description
		--- | ---
		`url` | The URL to set. This must begin with http://.
    **/
    
     
    public function SetURL(url:String):Void;
    /**
        Sets the text color of the DLabelURL. Overrides DLabelURL:SetTextStyleColor.
		
		Name | Description
		--- | ---
		`col` | The Color to use.
    **/
    
     
    public function SetTextColor(col:AnyTable):Void;
    /**
        Gets the current text color of the DLabelURL. Alias as DLabelURL:GetTextColor.
		
		`**Returns:** The current text Color.
    **/
    
     
    public function GetColor():AnyTable;
    /**
        Returns the color set by DLabelURL:SetTextStyleColor.
		
		`**Returns:** The Color structure
    **/
    
     
    public function GetTextStyleColor():Color;
    /**
        Alias of DLabelURL:SetTextColor.
		
		Name | Description
		--- | ---
		`col` | The Color to use.
    **/
    
     
    public function SetColor(col:AnyTable):Void;
    
}



#end