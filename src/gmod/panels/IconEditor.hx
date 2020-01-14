package gmod.panels;
#if client

/**
    An icon editor that permits a user to modify a SpawnIcon and re-render it. This is used by the spawn menu and is what is shown when you right-click an icon and select Edit Icon. 
	
	This makes use of the DAdjustableModelPanel element. 
	
	 
**/
extern class IconEditor extends DFrame {
    /**
        Updates the internal DAdjustableModelPanel and SpawnIcon. 
		
		This should be called immediately after setting the SpawnIcon with IconEditor:SetIcon. 
		
		 
		
    **/
    
     
    public function Refresh():Void;
    /**
        Applies the top-down view camera settings for the model in the DAdjustableModelPanel. 
		
		Called when a user clicks the Above (third) button (See the example). 
		
		 
		
    **/
    
     
    public function AboveLayout():Void;
    /**
        Sets the editor's model and icon from an entity. Alternative to IconEditor:SetIcon, with uses a SpawnIcon. 
		
		You do not need to call IconEditor:Refresh after this. 
		
		 
		Name | Description
		--- | ---
		`ent` | The entity to retrieve the model and skin from.
		
		
		
    **/
    
     
    public function SetFromEntity(ent:Entity):Void;
    /**
        ***INTERNAL:**  
		
		Sets up the default ambient and directional lighting for the . Called by : . 
		
    **/
    @:deprecated
     
    public function SetDefaultLighting():Void;
    /**
        Applies the front view camera settings for the model in the DAdjustableModelPanel. 
		
		Called when a user clicks the Front (second) button (See the example). 
		
		 
		
    **/
    
     
    public function FullFrontalLayout():Void;
    /**
        ***INTERNAL:**  
		
		Updates the entity being rendered in the internal . Called by the model panel's :  method.   
		Name | Description
		--- | ---
		`ent` | The entity being rendered within the model panel.
		
		
		
    **/
    @:deprecated
     
    public function UpdateEntity(ent:Entity):Void;
    /**
        Sets the SpawnIcon to modify. You should call Panel:Refresh immediately after this, as the user will not be able to make changes to the icon beforehand. 
		
		
		Name | Description
		--- | ---
		`icon` | The SpawnIcon object to be modified.
		
		
		
    **/
    
     
    public function SetIcon(icon:Panel):Void;
    /**
        Re-renders the SpawnIcon. 
		
		Called when a user clicks the RENDER button, this retrieves the render data from the internal DAdjustableModelPanel and passes it as a table to Panel:RebuildSpawnIconEx. 
		
		 
		
    **/
    
     
    public function RenderIcon():Void;
    /**
        Applies the right side view camera settings for the model in the DAdjustableModelPanel. 
		
		Called when a user clicks the Right (fourth) button (See the example). (Note: The icon for this points left.) 
		
		 
		
    **/
    
     
    public function RightLayout():Void;
    /**
        Applies the best camera settings for the model in the DAdjustableModelPanel, using the values returned by PositionSpawnIcon. 
		
		Called when a user clicks the wand button (See the example) and when IconEditor:Refresh is called. 
		
		 
		
    **/
    
     
    public function BestGuessLayout():Void;
    /**
        ***INTERNAL:**  
		
		Fills the  on the left of the editor with the model entity's animation list. Called by : .   
		Name | Description
		--- | ---
		`ent` | The entity being rendered within the model panel.
		
		
		
    **/
    @:deprecated
     
    public function FillAnimations(ent:Entity):Void;
    /**
        Places the camera at the origin (0,0,0), relative to the entity, in the DAdjustableModelPanel. 
		
		Called when a user clicks the Center (fifth) button (See the example). 
		
		 
		
    **/
    
     
    public function OriginLayout():Void;
    
}



#end