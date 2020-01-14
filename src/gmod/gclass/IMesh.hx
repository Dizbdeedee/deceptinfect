package gmod.gclass;
#if client

/**
    Renderable mesh object, can be used to create models on the fly. The only way to create your own IMesh object is to call Mesh. 
	
	
**/
extern class IMesh {
    
    /**
        Deletes the mesh and frees the memory used by it. 
		
		
		
    **/
    
    public function Destroy():Void;
    
    
    /**
        Builds the mesh from a table mesh vertexes. 
		
		See Mesh and util.GetModelMeshes for examples. 
		
		 
		Name | Description
		--- | ---
		`vertexes` | A table consisting of MeshVertex structures.
		
		
		
    **/
    
    public function BuildFromTriangles(vertexes:AnyTable):Void;
    
    
    /**
        Renders the mesh with the active matrix. 
		
		
		___
		### Lua Examples
		#### Example 1
		Properly renders the mesh using the SENT's model matrix.
		
		```lua 
		self.Mesh
		```
		
		
    **/
    
    public function Draw():Void;
    
    
}



#end