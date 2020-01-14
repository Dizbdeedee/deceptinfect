package gmod.panels;
#if client

/**
    The DHTML control wraps the internal Awesomium framework, supports calling Javascript functions from Lua, as well as running Lua from within the HTML. Running Lua code is disabled by default. 
	
	
**/
extern class DHTML extends Awesomium {
    /**
        Stops the loading of the HTML panel's current page. 
		
		
		
    **/
    
     
    public function StopLoading():Void;
    /**
        Defines a Javascript function that when called will call a Lua callback. 
		
		
		Name | Description
		--- | ---
		`library` | Library name of the JS function you are defining.
		`name` | Name of the JS function you are defining.
		`callback` | Function called when the JS function is called. Arguments passed to the JS function will be passed here.
		
		
		___
		### Lua Examples
		#### Example 1
		Prints text from Javascript to the console in color.
		
		```lua 
		-- Create the frame
		local f = vgui.Create("DFrame")
		f:SetSize(800, 600)
		f:Center()
		
		-- Create a green color variable
		local color_green = Color(0, 255, 0)
		
		-- Define the Javascript function in the DHTML element
		local DHTML = vgui.Create("DHTML", f)
		DHTML:Dock(FILL)
		DHTML:OpenURL("http://wiki.garrysmod.com/page/VGUI/Elements/DHTML")
		DHTML:AddFunction("console", "luaprint", function(str)
		    MsgC(color_green, str) -- Print the given string
		end)
		
		--This runs our function. Our function could also be called from Javascript on the DHTML's page.
		DHTML:RunJavascript("console.luaprint('Hello from Javascript!');")
		```
		
		
    **/
    
     
    public function AddFunction(library:String, name:String, callback:Function):Void;
    /**
        Runs/Executes a string as JavaScript code. 
		
		
		Name | Description
		--- | ---
		`js` | Specify JavaScript code to be executed.
		
		
		___
		### Lua Examples
		#### Example 1
		Shows how to change document.body.innerHTML property by calling this function on DHTML panel.
		
		```lua 
		-- First we create a container, in this case it is a full-screen Derma Frame window.
		local dframe = vgui.Create( 'DFrame' )
		dframe:SetSize( ScrW(), ScrH() )
		dframe:SetTitle( "Garry's Mod Wiki" )
		dframe:Center()
		dframe:MakePopup() -- Enable keyboard and mouse interaction for DFrame panel.
		
		-- Create a new DHTML panel as a child of dframe, and dock-fill it.
		local dhtml = vgui.Create( 'DHTML', dframe )
		dhtml:Dock( FILL )
		-- Navigate to Garry's Mod wikipedia website.
		dhtml:OpenURL( 'https://wiki.garrysmod.com/index.php' )
		-- Run JavaScript code.
		dhtml:Call( [[document.body.innerHTML = 'HTML changed from Lua using JavaScript!';]] )
		
		-- This does not throw an error/exception, but instead returns nil/no value.
		-- That means you can't pass/return values from JavaScript back to Lua context using this function.
		local number = dhtml:Call( '22;' )
		print( number )
		```
		**Output:**
		
		Inner HTML of document body in DHTML panel is now set to "HTML changed from Lua using JavaScript!".
		
		
    **/
    
     
    public function Call(js:String):Void;
    /**
        Determines whether the loaded page can run Lua code or not. See DHTML for how to run Lua from a DHTML window. 
		
		
		Name | Description
		--- | ---
		`allow` | Whether or not to allow Lua.
		
		
		
    **/
    
     
    public function SetAllowLua(?allow:Bool):Void;
    /**
        Returns if the loaded page can run Lua code, set by DHTML:SetAllowLua 
		
		
		**Returns:** Whether or not Lua code can be called from the loaded page.
		
		
    **/
    
     
    public function GetAllowLua():Bool;
    /**
        Called when the page inside the DHTML window runs console.log. This can also be called within the Lua environment to emulate console.log. If the contained message begins with RUNLUA: the following text will be executed as code within the Lua environment (this is how Lua is called from DHTML windows). 
		
		
		Name | Description
		--- | ---
		`msg` | The message to be logged (or Lua code to be executed; see above).
		
		
		
    **/
    
     
    public function ConsoleMessage(msg:String):Void;
    /**
        ***Deprecated:**   Broken. Use the CSS overflow rule instead.
		
		Sets if the loaded window should display scrollbars when the webpage is larger than the viewing window. This is similar to the CSS  rule.   
		Name | Description
		--- | ---
		`show` | True if scrollbars should be visible.
		
		
		
    **/
    @:deprecated
     
    public function SetScrollbars(show:Bool):Void;
    /**
        Runs/Executes a string as JavaScript code. 
		
		
		Name | Description
		--- | ---
		`js` | Specify JavaScript code to be executed.
		
		
		___
		### Lua Examples
		#### Example 1
		Shows how to change document.body.innerHTML property by calling this function on DHTML panel.
		
		```lua 
		-- First we create a container, in this case it is a full-screen Derma Frame window.
		local dframe = vgui.Create( 'DFrame' )
		dframe:SetSize( ScrW(), ScrH() )
		dframe:SetTitle( "Garry's Mod Wiki" )
		dframe:Center()
		dframe:MakePopup() -- Enable keyboard and mouse interaction for DFrame panel.
		
		-- Create a new DHTML panel as a child of dframe, and dock-fill it.
		local dhtml = vgui.Create( 'DHTML', dframe )
		dhtml:Dock( FILL )
		-- Navigate to Garry's Mod wikipedia website.
		dhtml:OpenURL( 'https://wiki.garrysmod.com/index.php' )
		-- Run JavaScript code.
		dhtml:QueueJavascript( [[document.body.innerHTML = 'HTML changed from Lua using JavaScript!';]] )
		
		-- This does not throw an error/exception, but instead returns nil/no value.
		-- That means you can't pass/return values from JavaScript back to Lua context using this function.
		local number = dhtml:QueueJavascript( '22;' )
		print( number )
		```
		**Output:**
		
		Inner HTML of document body in DHTML panel is now set to "HTML changed from Lua using JavaScript!".
		
		
    **/
    
     
    public function QueueJavascript(js:String):Void;
    
}



#end