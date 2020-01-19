package gmod.panels;
#if client

/**
    A panel used by the Editable Entities system. 
	
	
**/
extern class DEntityProperties extends DProperties {
    /**
        ***INTERNAL:**  
		
		Called internally by DEntityProperties:RebuildControls. 
		
		
		Name | Description
		--- | ---
		`varname` | 
		`editdata` | 
		
		
		
    **/
    @:deprecated
     
    public function EditVariable(varname:String, editdata:AnyTable):Void;
    /**
        ***INTERNAL:**  
		
		Called internally when an entity being edited became invalid. 
		
		You should use DEntityProperties:OnEntityLost instead. 
		
		 
		
    **/
    @:deprecated
     
    public function EntityLost():Void;
    /**
        Sets the entity to be edited by this panel. The entity must support the Editable Entities system or nothing will happen. 
		
		
		Name | Description
		--- | ---
		`ent` | The entity to edit
		
		
		
    **/
    
     
    public function SetEntity(ent:Entity):Void;
    /**
        Called when we were editing an entity and then it became invalid (probably removed) 
		
		
		
    **/
    
    @:hook 
    public function OnEntityLost():Void;
    /**
        ***INTERNAL:**  
		
		Called internally by DEntityProperties:SetEntity to rebuild the controls. 
		
		
		
    **/
    @:deprecated
     
    public function RebuildControls():Void;
    
}



#end