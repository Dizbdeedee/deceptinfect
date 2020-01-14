package gmod.panels;
#if client

/**
    A checkbox panel similar to DCheckBox and DImageButton with customizable checked state image. 
	
	Uses the Material panel internally. Can't have a label. 
	
	 
**/
extern class ImageCheckBox extends Button {
    /**
        Sets the material that will be visible when the ImageCheckBox is checked. 
		
		Internally calls Material:SetMaterial. 
		
		 
		Name | Description
		--- | ---
		`mat` | The file path of the material to set (relative to "garrysmod/materials/").
		
		
		
    **/
    
     
    public function SetMaterial(mat:String):Void;
    /**
        Sets the checked state of the checkbox. 
		
		Checked state can be obtained via ImageCheckBox:GetChecked 
		
		 
		Name | Description
		--- | ---
		`bOn` | true for checked, false otherwise
		
		
		
    **/
    
     
    public function SetChecked(bOn:Bool):Void;
    /**
        Sets the checked state of the checkbox. 
		
		Checked state can be obtained by ImageCheckBox.State. 
		
		 
		Name | Description
		--- | ---
		`OnOff` | true for checked, false otherwise
		
		
		
    **/
    
     
    public function Set(OnOff:Bool):Void;
    /**
        Returns the checked state of the ImageCheckBox 
		
		
		**Returns:** true for checked, false otherwise
		
		
    **/
    
     
    public function GetChecked():Bool;
    
}



#end