package gmod.panels;
#if client

/**
    An internal panel used by DMenu. It acts as a menu option that can be checked. It automatically sets and reads the given console variable. 
	
	It can be right clicked to toggle without closing the DMenu. 
	
	 Use DMenu:AddCVar instead. 
	
	 
**/
extern class DMenuOptionCVar extends DMenuOption {
    /**
        Return the value of the console variable when the DMenuOptionCVar is checked. 
		
		
		**Returns:** The value
		
		
    **/
    
     
    public function GetValueOn():String;
    /**
        Returns the console variable used by the DMenuOptionCVar. 
		
		
		**Returns:** The console variable used
		
		
    **/
    
     
    public function GetConVar():String;
    /**
        Sets the value of the console variable when the DMenuOptionCVar is not checked. 
		
		
		Name | Description
		--- | ---
		`value` | The value
		
		
		
    **/
    
     
    public function SetValueOff(value:String):Void;
    /**
        Sets the value of the console variable when the DMenuOptionCVar is checked. 
		
		
		Name | Description
		--- | ---
		`value` | The value
		
		
		
    **/
    
     
    public function SetValueOn(value:String):Void;
    /**
        Returns the value of the console variable when the DMenuOptionCVar is not checked. 
		
		
		**Returns:** The value
		
		
    **/
    
     
    public function GetValueOff():String;
    /**
        Sets the console variable to be used by DMenuOptionCVar. 
		
		
		Name | Description
		--- | ---
		`cvar` | The console variable name to set
		
		
		
    **/
    
     
    public function SetConVar(cvar:String):Void;
    
}



#end