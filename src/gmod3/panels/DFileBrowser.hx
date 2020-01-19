package gmod.panels;
#if client

/**
    A tree and list-based file browser. 
	
	It allows filtering by folder (directory) name and file extension, and can display models as SpawnIcons. 
	
	 
**/
extern class DFileBrowser extends DPanel {
    /**
        Sets the search filter for the file tree. 
		
		This accepts the same wildcards as file.Find. 
		
		 
		Name | Description
		--- | ---
		`filter` | The filter to use on the file tree.
		
		
		
    **/
    
     
    public function SetSearch(?filter:String):Void;
    /**
        Returns the current directory/folder being displayed. 
		
		
		**Returns:** The directory the file list is currently displaying.
		
		
    **/
    
     
    public function GetCurrentFolder():String;
    /**
        Sets the directory/folder from which to display the file list. 
		
		
		Name | Description
		--- | ---
		`currentDir` | The directory to display files from.
		
		
		
    **/
    
     
    public function SetCurrentFolder(currentDir:String):Void;
    /**
        ***INTERNAL:**  
		
		Called to set up the  and file viewer when a base path has been set. Calls DFileBrowser:SetupTree and DFileBrowser:SetupFiles. 
		
		
		**Returns:** Whether or not the variables needed to set up have been defined.
		
		
    **/
    @:deprecated
     
    public function Setup():Bool;
    /**
        Sets the name to use for the file tree. 
		
		
		Name | Description
		--- | ---
		`treeName` | The name for the root of the file tree. Passing no value causes this to be the base folder name. See DFileBrowser: SetBaseFolder.
		
		
		
    **/
    
     
    public function SetName(?treeName:String):Void;
    /**
        Called when a file is right-clicked. 
		
		
		Name | Description
		--- | ---
		`filePath` | The path to the file that was right-clicked.
		`selectedPanel` | The panel that was right-clicked to select this file. This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser: SetModels.
		
		
		
    **/
    
    @:hook 
    public function OnRightClick(filePath:String, selectedPanel:Panel):Void;
    /**
        Enables or disables the model viewer mode. In this mode, files are displayed as SpawnIcons instead of a list. 
		
		
		Name | Description
		--- | ---
		`showModels` | Whether or not to display files using SpawnIcons.
		
		
		
    **/
    
     
    public function SetModels(?showModels:Bool):Void;
    /**
        Returns the name being used for the file tree. 
		
		
		**Returns:** The name used for the root of the file tree.
		
		
    **/
    
     
    public function GetName():String;
    /**
        Returns the DTree Node that the file tree stems from. 
		
		This is a child of the root node of the DTree. 
		
		 
		**Returns:** The DTree_Node used for the tree.
		
		
    **/
    
     
    public function GetFolderNode():Panel;
    /**
        Sorts the file list. 
		
		
		Name | Description
		--- | ---
		`descending` | The sort order. true for descending (z-a), false for ascending (a-z).
		
		
		
    **/
    
     
    public function SortFiles(?descending:Bool):Void;
    /**
        Called when a file is selected. 
		
		
		Name | Description
		--- | ---
		`filePath` | The path to the file that was selected.
		`selectedPanel` | The panel that was clicked to select this file. This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser: SetModels.
		
		
		
    **/
    
    @:hook 
    public function OnSelect(filePath:String, selectedPanel:Panel):Void;
    /**
        ***INTERNAL:**  
		
		Builds the file or icon list for the current directory. You should use DFileBrowser:SetCurrentFolder to change the directory. 
		
		
		Name | Description
		--- | ---
		`currentDir` | The directory to populate the list from.
		
		
		
    **/
    @:deprecated
     
    public function ShowFolder(currentDir:String):Void;
    /**
        Returns the current file type filter on the file list. 
		
		
		**Returns:** The current filter applied to the file list.
		
		
    **/
    
     
    public function GetFileTypes():String;
    /**
        ***INTERNAL:**  
		
		Called to set up the  or  by : . The icon browser is used when in models mode. See DFileBrowser:SetModels. 
		
		
		**Returns:** Whether or not the files pane was set up successfully.
		
		
    **/
    @:deprecated
     
    public function SetupFiles():Bool;
    /**
        Returns the current search filter on the file tree. 
		
		
		**Returns:** The filter in use on the file tree.
		
		
    **/
    
     
    public function GetSearch():String;
    /**
        ***INTERNAL:**  
		
		Called to set up the  by : .   
		**Returns:** Whether or not the tree was set up successfully.
		
		
    **/
    @:deprecated
     
    public function SetupTree():Bool;
    /**
        Sets the access path for the file tree. This is set to GAME by default. 
		
		See file.Read for how paths work. 
		
		 
		Name | Description
		--- | ---
		`path` | The access path i.e. "GAME", "LUA", "DATA" etc.
		
		
		
    **/
    
     
    public function SetPath(path:String):Void;
    /**
        Sets the root directory/folder of the file tree. 
		
		This needs to be set for the file tree to be displayed. 
		
		 
		Name | Description
		--- | ---
		`baseDir` | The path to the folder to use as the root.
		
		
		
    **/
    
     
    public function SetBaseFolder(baseDir:String):Void;
    /**
        Clears the file tree and list, and resets all values. 
		
		
		
    **/
    
     
    public function Clear():Void;
    /**
        Opens or closes the file tree. 
		
		
		Name | Description
		--- | ---
		`open` | true to open the tree, false to close it.
		`useAnim` | If true, the DTree's open/close animation is used.
		
		
		
    **/
    
     
    public function SetOpen(?open:Bool, ?useAnim:Bool):Void;
    /**
        Returns the root directory/folder of the file tree. 
		
		
		**Returns:** The path to the root folder.
		
		
    **/
    
     
    public function GetBaseFolder():String;
    /**
        Returns the access path of the file tree. This is GAME unless changed with DFileBrowser:SetPath. 
		
		See file.Read for how paths work. 
		
		 
		**Returns:** The current access path i.e. "GAME", "LUA", "DATA" etc.
		
		
    **/
    
     
    public function GetPath():String;
    /**
        Sets the file type filter for the file list. 
		
		This accepts the same file extension wildcards as file.Find. 
		
		 
		Name | Description
		--- | ---
		`fileTypes` | A list of file types to display, separated by spaces e.g. "*.lua *.txt *.mdl"
		
		
		
    **/
    
     
    public function SetFileTypes(?fileTypes:String):Void;
    /**
        Returns whether or not the model viewer mode is enabled. In this mode, files are displayed as SpawnIcons instead of a list. 
		
		
		**Returns:** Whether or not files will be displayed using SpawnIcons.
		
		
    **/
    
     
    public function GetModels():Bool;
    /**
        Returns whether or not the file tree is open. 
		
		
		**Returns:** Whether or not the file tree is open.
		
		
    **/
    
     
    public function GetOpen():Bool;
    /**
        Called when a file is double-clicked. 
		
		
		Name | Description
		--- | ---
		`filePath` | The path to the file that was double-clicked.
		`selectedPanel` | The panel that was double-clicked to select this file. This will either be a DListView_Line or SpawnIcon depending on whether the model viewer mode is enabled. See DFileBrowser: SetModels.
		
		
		
    **/
    
    @:hook 
    public function OnDoubleClick(filePath:String, selectedPanel:Panel):Void;
    
}



#end