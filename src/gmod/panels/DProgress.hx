package gmod.panels;
#if client

/**
    A progressbar, works with a fraction between 0 and 1 where 0 is 0% and 1 is 100%.
**/
extern class DProgress extends Panel {
    /**
        Sets the fraction of the progress bar. 0 is 0% and 1 is 100%.
		
		Name | Description
		--- | ---
		`fraction` | Fraction of the progress bar. Range is 0 to 1 (0% to 100%).
    **/
    
     
    public function SetFraction(fraction:Float):Void;
    /**
        Returns the progress bar's fraction. 0 is 0% and 1 is 100%.
		
		`**Returns:** Current fraction of the progress bar.
    **/
    
     
    public function GetFraction():Float;
    
}



#end