package gmod.hooks;
#if client

/**
    This is a list of hooks that are available on all panels. 
	
	See also Category:Panel_Hooks for hooks that only work if your panel is based on other specific panels.
**/
class Panel2 {
    
    /**
        Only works on elements defined with derma.DefineControl and only if the panel has AllowAutoRefresh set to true. 
		
		Called when derma.DefineControl is called with this panel's class name before applying changes to this panel. 
		
		 See also PANEL:PostAutoRefresh
    **/
    
    @:hook
    public function PreAutoRefresh():Void {}
    
    
    /**
        Called whenever the cursor was moved with the panels bounds.
		
		Name | Description
		--- | ---
		`cursorX` | The new x position of the cursor relative to the panels origin.
		`cursorY` | The new y position of the cursor relative to the panels origin.
		
		
		`**Returns:** Return true to suppress default action.
    **/
    
    @:hook
    public function OnCursorMoved(cursorX:Float, cursorY:Float):Bool {return null;}
    
    
    /**
        Called whenever the panel should apply its scheme(style).
    **/
    
    @:hook
    public function ApplySchemeSettings():Void {}
    
    
    /**
        Called by HTML panels when the page attempts to open a new child view (such as a popup or new tab).
		
		Name | Description
		--- | ---
		`sourceURL` | The URL of the page requesting to create a child.
		`targetURL` | The URL of the requested child.
		`isPopup` | True if the requested view is a popup.
    **/
    
    @:hook
    public function OnChildViewCreated(sourceURL:String, targetURL:String, isPopup:Bool):Void {}
    
    
    /**
        Called whenever the panel and all its children were drawn, return true to override the default drawing.
		
		Name | Description
		--- | ---
		`width` | The panels current width.
		`height` | The panels current height.
		
		
		`**Returns:** Should we disable default PaintOver rendering? This is useful in case with Derma panels that use Derma hooks.
    **/
    
    @:hook
    public function PaintOver(width:Float, height:Float):Bool {return null;}
    
    
    /**
        ***INTERNAL** 
		
		Called by [dragndrop](https://wiki.garrysmod.com/page/Category:dragndrop). [StartDragging](https://wiki.garrysmod.com/page/dragndrop/StartDragging) when the panel starts being dragged.
    **/
    @:deprecated("INTERNAL")
    @:hook
    public function OnStartDragging():Void {}
    
    
    /**
        Called whenever the panel gained or lost focus.
		
		**Note:** Panel:HasFocus will only be updated on the next frame and will return the "old" value at the time this hook is run. Same goes for vgui.GetKeyboardFocus.
		
		Name | Description
		--- | ---
		`gained` | Is the focus was gained ( true ) or lost ( false )
    **/
    
    @:hook
    public function OnFocusChanged(gained:Bool):Void {}
    
    
    /**
        Called by HTML panels when the panel's DOM has been set up. You can run JavaScript in here.
		
		Name | Description
		--- | ---
		`url` | The URL of the current page.
    **/
    
    @:hook
    public function OnDocumentReady(url:String):Void {}
    
    
    /**
        Called by HTML panels when the title of the loaded page has been changed.
		
		Name | Description
		--- | ---
		`newTitle` | The new title of the page.
    **/
    
    @:hook
    public function OnChangeTitle(newTitle:String):Void {}
    
    
    /**
        Called whenever the cursor left the panels bounds.
    **/
    
    @:hook
    public function OnCursorExited():Void {}
    
    
    /**
        Called whenever a keyboard key was pressed while the panel is focused.
		
		**Bug:** BUG This is not run for ESC/"cancelselect" binding. Issue Tracker: #2886
		
		Name | Description
		--- | ---
		`keyCode` | The key code of the pressed key, see KEY_ Enums.
		
		
		`**Returns:** Return true to suppress default action.
    **/
    
    @:hook
    public function OnKeyCodePressed(keyCode:KEY):Bool {return null;}
    
    
    /**
        Called whenever the panels layout was invalidated. This means all child panels must be re-positioned to fit the possibly new size of this panel.
		
		**Warning:** Do NOT call this function directly. Use Panel:InvalidateLayout instead!
		
		Name | Description
		--- | ---
		`width` | The panels current width.
		`height` | The panels current height.
    **/
    
    @:hook
    public function PerformLayout(width:Float, height:Float):Void {}
    
    
    /**
        ***INTERNAL** 
		
		Called by [Panel](https://wiki.garrysmod.com/page/Category:Panel): [DragMouseRelease](https://wiki.garrysmod.com/page/Panel/DragMouseRelease) when the panel object is released after being dragged.
    **/
    @:deprecated("INTERNAL")
    @:hook
    public function OnStopDragging():Void {}
    
    
    /**
        Called just after the panel size changes. 
		
		All size functions will return the new values when this hook is called.
		
		**Warning:** Changing the panel size in this hook will cause an infinite loop!
		
		Name | Description
		--- | ---
		`newWidth` | The new width of the panel
		`newHeight` | The new height of the panel
    **/
    
    @:hook
    public function OnSizeChanged(newWidth:Float, newHeight:Float):Void {}
    
    
    /**
        Called whenever the panel should be drawn. 
		
		You can create panels with a customized appearance by overriding their Paint() function, which will prevent the default appearance from being drawn.
		
		**Note:** Render operations from the surface library (and consequentially the draw library) are always offset by the global position of this panel, as seen in the example below
		
		**Note:** This hook will not run if the panel is completely off the screen. The hook will still run however if any parts of the panel are still on screen.
		
		Name | Description
		--- | ---
		`width` | The panel's width.
		`height` | The panel's height.
		
		
		`**Returns:** Returning true prevents the background from being drawn.
		
		___
		### Lua Examples
		#### Example 1
		Creates a DPanel and overrides its Paint() function to draw a 100x100 pixel black rounded box in the center of the screen.
		
		```lua 
		local panel = vgui.Create( "DPanel" )
		panel:SetSize( 100, 100 )
		panel:SetPos( ScrW() / 2 - 50, ScrH() / 2 - 50 )
		
		function panel:Paint( w, h )
		    draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
		end
		```
    **/
    
    @:hook
    public function Paint(width:Float, height:Float):Bool {return null;}
    
    
    /**
        Called by HTML panels when the target URL of the frame has changed, this happens when you hover over a link.
		
		Name | Description
		--- | ---
		`targetURL` | New target URL.
    **/
    
    @:hook
    public function OnChangeTargetURL(targetURL:String):Void {}
    
    
    /**
        Called whenever a mouse key was pressed while the panel is focused.
		
		Name | Description
		--- | ---
		`keyCode` | They key code of the key pressed, see MOUSE_ Enums.
		
		
		`**Returns:** Return true to suppress default action such as right click opening edit menu for DTextEntry.
    **/
    
    @:hook
    public function OnMousePressed(keyCode:MOUSE):Bool {return null;}
    
    
    /**
        Called when an object is dragged and hovered over this panel for 0.1 seconds. 
		
		This is used by DPropertySheet and DTree, for example to open a tab or expand a node when an object is hovered over it.
		
		Name | Description
		--- | ---
		`hoverTime` | The time the object was hovered over this panel.
    **/
    
    @:hook
    public function DragHoverClick(hoverTime:Float):Void {}
    
    
    /**
        Called when the panel is about to be removed.
    **/
    
    @:hook
    public function OnRemove():Void {}
    
    
    /**
        Called when the player's screen resolution of the game changes. 
		
		ScrW and ScrH will return the new values when this hook is called.
		
		Name | Description
		--- | ---
		`oldWidth` | The previous width of the game's window
		`oldHeight` | The previous height of the game's window
    **/
    
    @:hook
    public function OnScreenSizeChanged(oldWidth:Float, oldHeight:Float):Void {}
    
    
    /**
        Called when this panel is dropped onto another panel. 
		
		Only works for panels derived from DDragBase.
		
		Name | Description
		--- | ---
		`pnl` | The panel we are dropped onto
    **/
    
    @:hook
    public function DroppedOn(pnl:Panel):Void {}
    
    
    /**
        Called when the panel should generate example use case / example code to use for this panel. Used in the panel opened by derma_controls console command.
		
		Name | Description
		--- | ---
		`class` | The classname of the panel to generate example for. This will be the class name of your panel.
		`dpropertysheet` | A DPropertySheet to add your example to. See examples below.
		`width` | Width of the property sheet?
		`height` | Width of the property sheet?
		
		
		___
		### Lua Examples
		#### Example 1
		Example usage of this hook from DButton's code.
		
		```lua 
		function PANEL:GenerateExample( ClassName, PropertySheet, Width, Height )
		
		    local ctrl = vgui.Create( ClassName )
		    ctrl:SetText( "Example Button" )
		    ctrl:SetWide( 200 )
		
		    PropertySheet:AddSheet( ClassName, ctrl, nil, true, true )
		
		end
		
		derma.DefineControl( "DButton", "A standard Button", PANEL, "DLabel" )
		```
		**Output:**
		
		A tab named "DButton" will appear in derma_controls menu.
    **/
    
    @:hook
    public function GenerateExample(_class:String, dpropertysheet:Panel, width:Float, height:Float):Void {}
    
    
    /**
        Called after Panel:SetCookieName is called on this panel to apply the just loaded cookie values for this panel.
		
		___
		### Lua Examples
		#### Example 1
		
		
		```lua 
		function PANEL:LoadCookies()
		
		    local value = self:GetCookieNumber( "SavedCookieName", 0 )
		    print( value )
		
		    -- Do your stuff with the loaded value
		
		end
		```
    **/
    
    @:hook
    public function LoadCookies():Void {}
    
    
    /**
        Called whenever a keyboard key was released while the panel is focused.
		
		**Bug:** BUG This is not run for TILDE/"toggleconsole" binding. Issue Tracker: #2886
		
		Name | Description
		--- | ---
		`keyCode` | The key code of the released key, see KEY_ Enums.
		
		
		`**Returns:** Return true to suppress default action.
    **/
    
    @:hook
    public function OnKeyCodeReleased(keyCode:KEY):Bool {return null;}
    
    
    /**
        Only works on elements defined with derma.DefineControl and only if the panel has AllowAutoRefresh set to true. 
		
		Called after derma.DefineControl is called with panel's class name. 
		
		 See also PANEL:PreAutoRefresh
    **/
    
    @:hook
    public function PostAutoRefresh():Void {}
    
    
    /**
        ***INTERNAL** 
		
		Called when we are activated during level load. Used by the loading screen panel.
    **/
    @:deprecated("INTERNAL")
    @:hook
    public function OnActivate():Void {}
    
    
    /**
        Called every frame while Panel:IsVisible is true.
    **/
    
    @:hook
    public function Think():Void {}
    
    
    /**
        Called when the panel is created. This is called for each base type that the panel has.
		
		___
		### Lua Examples
		#### Example 1
		Shows how this method is called recursively for each base type a panel has.
		
		```lua 
		local BASE = {}
		function BASE:Init()
		    print("Base Init Called")
		end
		
		
		local PANEL = {}
		function PANEL:Init()
		    print("Panel Init Called")
		end
		
		
		vgui.Register("MyBase", BASE, "DFrame")
		vgui.Register("MyPanel", PANEL, "MyBase")
		
		local panel = vgui.Create("MyPanel")
		```
		**Output:**
		
		Base Init Called Panel Init Called
    **/
    
    @:hook
    public function Init():Void {}
    
    
    /**
        Called whenever a mouse key was released while the panel is focused.
		
		Name | Description
		--- | ---
		`keyCode` | They key code of the key released, see MOUSE_ Enums.
		
		
		`**Returns:** Return true to suppress default action.
    **/
    
    @:hook
    public function OnMouseReleased(keyCode:MOUSE):Bool {return null;}
    
    
    /**
        Called whenever the mouse wheel was used.
		
		Name | Description
		--- | ---
		`scrollDelta` | The scroll delta, indicating how much the user turned the mouse wheel.
		
		
		`**Returns:** Return true to suppress default action.
    **/
    
    @:hook
    public function OnMouseWheeled(scrollDelta:Float):Bool {return null;}
    
    
    /**
        ***INTERNAL** 
		
		Called when we are deactivated during level load. Used by the loading screen panel.
    **/
    @:deprecated("INTERNAL")
    @:hook
    public function OnDeactivate():Void {}
    
    
    /**
        Called whenever a child of the panel is about to removed.
		
		Name | Description
		--- | ---
		`child` | The child which is about to be removed.
    **/
    
    @:hook
    public function OnChildRemoved(child:Panel):Void {}
    
    
    /**
        We're being dropped on something We can create a new panel here and return it, so that instead of dropping us - it drops the new panel instead! We remain where we are! 
		
		Only works for panels derived from DDragBase.
		
		`**Returns:** The panel to drop instead of us. By default you should return self.
    **/
    
    @:hook
    public function OnDrop():Panel {return null;}
    
    
    /**
        Called whenever the cursor entered the panels bounds.
    **/
    
    @:hook
    public function OnCursorEntered():Void {}
    
    
    /**
        Called whenever a panel receives a command signal from one of its children. 
		
		This hook is called when using Panel:Command, when clicking a Button with Panel:SetCommand set, and when clicking text within a RichText panel that is marked as click-able.
		
		Name | Description
		--- | ---
		`signalName` | The name of the signal, usually the sender of the signal or the command name.
		`signalValue` | The value of the signal, usually a command argument.
    **/
    
    @:hook
    public function ActionSignal(signalName:String, signalValue:String):Void {}
    
    
    /**
        Called whenever a child was parented to the panel.
		
		**Bug:** BUG This is called before the panel's metatable is set. Issue Tracker: #2759
		
		Name | Description
		--- | ---
		`child` | The child which was added.
    **/
    
    @:hook
    public function OnChildAdded(child:Panel):Void {}
    
    
    /**
        Called every frame unless Panel:IsVisible is set to false. Similar to PANEL:Think, but can be disabled by Panel:SetAnimationEnabled as explained below. 
		
		If you are overriding this, you must call Panel:AnimationThinkInternal every frame, else animations will cease to work. 
		
		 If you want to "disable" this hook with Panel:SetAnimationEnabled, you must call it after defining this hook. Once disabled, a custom hook will not be re-enabled by Panel:SetAnimationEnabled again - the hook will have to be re-defined.
    **/
    
    @:hook
    public function AnimationThink():Void {}
    
    
}



#end