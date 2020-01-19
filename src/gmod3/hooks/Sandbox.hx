package gmod.hooks;


/**
    This is a list of hooks that are only available in Sandbox or Sandbox derived gamemodes. 
	
	Easiest way to tell if a gamemode is Sandbox derived is to check if this variable exists: 
	
	 
**/
extern class Sandbox extends Gm {
    #if server
    /**
        Called when a player attempts to spawn a ragdoll from the Q menu. 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to spawn a ragdoll.
		`model` | Path to the model of the ragdoll the player is attempting to spawn.
		
		
		**Returns:** Should the player be able to spawn the ragdoll or not.
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from spawning ragdolls.
		
		```lua 
		function GM:PlayerSpawnRagdoll( ply, model )
		    if ( not ply:IsAdmin() ) then
		        return false
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function PlayerSpawnRagdoll(ply:Player, model:String):Bool;
    #end
    #if client
    /**
        Called right after the Lua Loaded tool menus are reloaded. This is a good place to set up any ControlPanels. 
		
		
		
    **/
    
    @:hook
    public function PostReloadToolsMenu():Void;
    #end
    #if client
    /**
        Called when spawnmenu is trying to be opened. 
		
		
		**Returns:** Return false to dissallow opening the spawnmenu
		
		___
		### Lua Examples
		#### Example 1
		Only allow the people you want to open the spawn menu.
		
		```lua 
		local allowed = {
		    ["STEAM_0:0:00000000"] = true,
		    ["STEAM_0:0:10000000"] = true
		}
		
		hook.Add( "SpawnMenuOpen", "SpawnMenuWhitelist", function()
		    if ( !allowed[ LocalPlayer():SteamID() ] ) then
		        return false
		    end
		end )
		```
		
		
    **/
    
    @:hook
    public function SpawnMenuOpen():Bool;
    #end
    #if client
    /**
        Called from GM:HUDPaint to draw world tips. By default, enabling cl_drawworldtooltips will stop world tips from being drawn here. See AddWorldTip for more information. 
		
		
		
    **/
    
    @:hook
    public function PaintWorldTips():Void;
    #end
    #if client
    /**
        Called when the context menu is created. 
		
		
		Name | Description
		--- | ---
		`g_ContextMenu` | The created context menu panel
		
		
		
    **/
    
    @:hook
    public function ContextMenuCreated(g_ContextMenu:Panel):Void;
    #end
    #if client
    /**
        ***Deprecated:**   This hook is never called. Use SANDBOX: PopulateToolMenu, instead.
		
		Called to populate the Scripted Tool menu. 
		
		
		
    **/
    @:deprecated
    @:hook
    public function PopulateSTOOLMenu():Void;
    #end
    #if client
    /**
        Called from GM:HUDPaint; does nothing by default. 
		
		
		
    **/
    
    @:hook
    public function PaintNotes():Void;
    #end
    #if server
    /**
        Called after the player spawned an NPC. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that spawned the NPC
		`ent` | The spawned NPC itself
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedNPC(ply:Player, ent:Entity):Void;
    #end
    #if server
    /**
        Called to ask if player allowed to spawn a particular effect or not. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that wants to spawn an effect
		`model` | The effect model that player wants to spawn
		
		
		**Returns:** Return false to disallow spawning that effect
		
		
    **/
    
    @:hook
    public function PlayerSpawnEffect(ply:Player, model:String):Bool;
    #end
    
    /**
        Controls if a property can be used or not. 
		
		
		Name | Description
		--- | ---
		`ply` | Player, that tried to use the property
		`property` | Class of the property that is tried to use, for example - bonemanipulate WARNING This is not guaranteed to be the internal property name used in properties.Add!
		`ent` | The entity, on which property is tried to be used on
		
		
		**Returns:** Return false to disallow using that property
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from using the remover property.
		
		```lua 
		hook.Add( "CanProperty", "block_remover_property", function( ply, property, ent )
		    if ( !ply:IsAdmin() && property == "remover" ) then return false end
		end )
		```
		
		
    **/
    
    @:hook
    public function CanProperty(ply:Player, property:String, ent:Entity):Bool;
    
    #if server
    /**
        Called to ask if player allowed to spawn a particular vehicle or not. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that wants to spawn that vehicle
		`model` | The vehicle model that player wants to spawn
		`name` | Vehicle name
		`table` | Table of that vehicle, containing info about it
		
		
		**Returns:** Return false to disallow spawning that vehicle
		
		
    **/
    
    @:hook
    public function PlayerSpawnVehicle(ply:Player, model:String, name:String, table:AnyTable):Bool;
    #end
    #if client
    /**
        ***INTERNAL:**  
		
		This hook is used to add default tool tabs to spawnmenu. 
		
		Do not override or hook this function, use SANDBOX:AddToolMenuTabs! 
		
		 
		
    **/
    @:deprecated
    @:hook
    public function AddGamemodeToolMenuTabs():Void;
    #end
    #if client
    /**
        This hook is used to add new tool tabs to spawnmenu. 
		
		
		___
		### Lua Examples
		#### Example 1
		Add a new tab and a few categories into it.
		
		```lua 
		hook.Add( "AddToolMenuTabs", "myHookClass", function()
		    spawnmenu.AddToolTab("myTab", "My Tab", "icon16/shield.png") -- Add a new tab
		
		    spawnmenu.AddToolCategory("myTab", "myCategory", "My Category") -- Add a category into that new tab
		
		    spawnmenu.AddToolMenuOption( "myTab", "myCategory", "myEntry", "My Entry", "", "", function( panel )
		        panel:AddControl( "Header", { Text = "Hello!" } )
		    end ) -- Add an entry to our new category
		end)
		```
		
		
    **/
    
    @:hook
    public function AddToolMenuTabs():Void;
    #end
    #if server
    /**
        Called after the player has spawned a scripted entity. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that spawned the SENT
		`ent` | The spawned SENT
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedSENT(ply:Player, ent:Entity):Void;
    #end
    #if client
    /**
        This hook is used to add new categories to spawnmenu tool tabs. 
		
		
		___
		### Lua Examples
		#### Example 1
		Adds default categories to Utilities tab in spawnmenu.
		
		```lua 
		local function CreateUtilitiesCategories()
		
		        spawnmenu.AddToolCategory( "Utilities", "User", "#spawnmenu.utilities.user" )
		        spawnmenu.AddToolCategory( "Utilities", "Admin", "#spawnmenu.utilities.admin" )
		
		end        
		hook.Add( "AddToolMenuCategories", "CreateUtilitiesCategories", CreateUtilitiesCategories )
		```
		
		
    **/
    
    @:hook
    public function AddToolMenuCategories():Void;
    #end
    
    /**
        Called when a player attempts to drive a prop via Prop Drive 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to use Prop Drive.
		`ent` | The entity the player is attempting to drive
		
		
		**Returns:** Return true to allow driving, false to disallow
		
		___
		### Lua Examples
		#### Example 1
		Stops nonadmins from using Prop Drive
		
		```lua 
		function GM:CanDrive( ply, ent )
		    if !ply:IsAdmin() then return false end
		end
		```
		
		
    **/
    
    @:hook
    public function CanDrive(ply:Player, ent:Entity):Bool;
    
    #if server
    /**
        Called after the player has spawned a scripted weapon from the spawnmenu with a middle mouse click. 
		
		For left mouse click spawns, see SANDBOX:PlayerGiveSWEP. 
		
		 
		Name | Description
		--- | ---
		`ply` | The player that spawned the SWEP
		`ent` | The SWEP itself
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedSWEP(ply:Player, ent:Entity):Void;
    #end
    #if server
    /**
        Called when a player attempts to spawn a weapon from the Q menu. ( Mouse wheel clicks on an icon ) 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to spawn a weapon.
		`weapon` | Class name of the weapon the player tried to spawn.
		`swep` | Information about the weapon the player is trying to spawn, see SWEP structure
		
		
		**Returns:** Can the SWEP be spawned
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from spawning weapons.
		
		```lua 
		hook.Add( "PlayerSpawnSWEP", "SpawnBlockSWEP", function( ply, class, info )
		    if ( not ply:IsAdmin() ) then
		        return false
		    end
		end )
		```
		
		
    **/
    
    @:hook
    public function PlayerSpawnSWEP(ply:Player, weapon:String, swep:AnyTable):Bool;
    #end
    #if client
    /**
        Add the STOOLS to the tool menu. You want to call spawnmenu.AddToolMenuOption in this hook. 
		
		
		
    **/
    
    @:hook
    public function PopulateToolMenu():Void;
    #end
    #if client
    /**
        Called when the context menu is trying to be opened. Return false to disallow it. 
		
		
		**Returns:** Allow menu to open.
		
		
    **/
    
    @:hook
    public function ContextMenuOpen():Bool;
    #end
    #if server
    /**
        Called when a player attempts to spawn an Entity from the Q menu. 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to spawn the entity.
		`class` | Class name of the entity the player tried to spawn.
		
		
		**Returns:** can_spawn
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from spawning entities.
		
		```lua 
		function GM:PlayerSpawnSENT( ply, class )
		    if not ply:IsAdmin() then
		        return false
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function PlayerSpawnSENT(ply:Player, _class:String):Bool;
    #end
    #if client
    /**
        Called right before the Lua Loaded tool menus are reloaded. 
		
		
		
    **/
    
    @:hook
    public function PreReloadToolsMenu():Void;
    #end
    #if server
    /**
        Called after the player spawned an effect. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that spawned the effect
		`model` | The model of spawned effect
		`ent` | The spawned effect itself
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedEffect(ply:Player, model:String, ent:Entity):Void;
    #end
    #if server
    /**
        Called to ask if player allowed to spawn a particular NPC or not. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that wants to spawn that NPC
		`npc_type` | The npc type that player is trying to spawn
		`weapon` | The weapon of that NPC
		
		
		**Returns:** Return false to disallow spawning that NPC
		
		
    **/
    
    @:hook
    public function PlayerSpawnNPC(ply:Player, npc_type:String, weapon:String):Bool;
    #end
    #if client
    /**
        ***INTERNAL:**  
		
		This hook is used to add default categories to spawnmenu tool tabs. 
		
		Do not override or hook this function, use SANDBOX:AddToolMenuCategories! 
		
		 
		
    **/
    @:deprecated
    @:hook
    public function AddGamemodeToolMenuCategories():Void;
    #end
    #if server
    /**
        Called to ask whether player is allowed to spawn a given model. This includes props, effects and ragdolls and is called before the respective PlayerSpawn* hook. 
		
		
		Name | Description
		--- | ---
		`ply` | The player in question
		`model` | Model path
		`skin` | Skin number
		
		
		**Returns:** Return false to disallow the player to spawn the given model.
		
		
    **/
    
    @:hook
    public function PlayerSpawnObject(ply:Player, model:String, skin:Float):Bool;
    #end
    #if client
    /**
        Called when player selects an item on the spawnmenu sidebar at the left. 
		
		
		Name | Description
		--- | ---
		`parent` | The panel that holds spawnicons and the sidebar of spawnmenu
		`node` | The item player selected
		
		
		
    **/
    
    @:hook
    public function ContentSidebarSelection(parent:Panel, node:Panel):Void;
    #end
    #if server
    /**
        Called when a player has successfully spawned a prop from the Q menu. 
		
		
		Name | Description
		--- | ---
		`ply` | The player who spawned a prop.
		`model` | Path to the model of the prop the player is attempting to spawn.
		`entity` | The entity that was spawned.
		
		
		___
		### Lua Examples
		#### Example 1
		Turns the spawned prop green.
		
		```lua 
		function GM:PlayerSpawnedProp(ply, model, ent)
		    ent:SetColor(Color(0, 255, 0))
		end
		```
		
		
    **/
    
    @:hook
    public function PlayerSpawnedProp(ply:Player, model:String, entity:Entity):Void;
    #end
    #if server
    /**
        Called when a player attempts to spawn a prop from the Q menu. 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to spawn a prop.
		`model` | Path to the model of the prop the player is attempting to spawn.
		
		
		**Returns:** Should the player be able to spawn the prop or not.
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from spawning props.
		
		```lua 
		function GM:PlayerSpawnProp( ply, model )
		    if ( !ply:IsAdmin() ) then
		        return false
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function PlayerSpawnProp(ply:Player, model:String):Bool;
    #end
    #if server
    /**
        Called when a player attempts to give themselves a weapon from the Q menu. ( Left mouse clicks on an icon ) 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to give themselves a weapon.
		`weapon` | Class name of the weapon the player tried to give themselves.
		`swep` | The swep table of this weapon, see SWEP structure
		
		
		**Returns:** Can the SWEP be given to the player
		
		___
		### Lua Examples
		#### Example 1
		Stops non-admins from giving themselves weapons.
		
		```lua 
		hook.Add( "PlayerGiveSWEP", "BlockPlayerSWEPs", function( ply, class, swep )
		    if ( not ply:IsAdmin() ) then
		        return false
		    end
		end )
		```
		
		
    **/
    
    @:hook
    public function PlayerGiveSWEP(ply:Player, weapon:String, swep:AnyTable):Bool;
    #end
    #if client
    /**
        If false is returned then the spawn menu is never created. This saves load times if your mod doesn't actually use the spawn menu for any reason. 
		
		
		**Returns:** Whether to create spawnmenu or not.
		
		
    **/
    
    @:hook
    public function SpawnMenuEnabled():Bool;
    #end
    #if server
    /**
        Called after the player spawned a ragdoll. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that spawned the ragdoll
		`model` | The ragdoll model that player wants to spawn
		`ent` | The spawned ragdoll itself
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedRagdoll(ply:Player, model:String, ent:Entity):Void;
    #end
    #if server
    /**
        Called after the player spawned a vehicle. 
		
		
		Name | Description
		--- | ---
		`ply` | The player that spawned the vehicle
		`ent` | The vehicle itself
		
		
		
    **/
    
    @:hook
    public function PlayerSpawnedVehicle(ply:Player, ent:Entity):Void;
    #end
    
    /**
        Called when a player attempts to fire their tool gun. Return true to specifically allow the attempt, false to block it. 
		
		
		Name | Description
		--- | ---
		`ply` | The player who attempted to use their toolgun.
		`tr` | A trace from the players eye to where in the world their crosshair/cursor is pointing. See TraceResult structure
		`tool` | The tool mode the player currently has selected.
		
		
		**Returns:** Can use toolgun or not.
		
		___
		### Lua Examples
		#### Example 1
		Stops players from removing doors.
		
		```lua 
		function GM:CanTool( ply, tr, tool )
		   if tool == "remover" and IsValid( tr.Entity ) and tr.Entity:GetClass() == "prop_door_rotating" then
		      return false
		   end
		end
		```
		
		
    **/
    
    @:hook
    public function CanTool(ply:Player, tr:AnyTable, tool:String):Bool;
    
    #if server
    /**
        Called when persistent props are loaded. 
		
		
		
    **/
    
    @:hook
    public function PersistenceLoad():Void;
    #end
    #if server
    /**
        Called when persistent props are saved. 
		
		
		
    **/
    
    @:hook
    public function PersistenceSave():Void;
    #end
    #if client
    /**
        This hook makes the engine load the spawnlist text files. It calls spawnmenu.PopulateFromEngineTextFiles by default. 
		
		
		___
		### Lua Examples
		#### Example 1
		Source code for this hook.
		
		```lua 
		function GM:PopulatePropMenu()
		
		    -- This function makes the engine load the spawn menu text files.
		    -- We call it here so that any gamemodes not using the default 
		    -- spawn menu can totally not call it.
		    spawnmenu.PopulateFromEngineTextFiles()
		
		end
		```
		
		
    **/
    
    @:hook
    public function PopulatePropMenu():Void;
	#end
	
	#if server
    /**
        This is the spawn function. It's called when a player spawns the entity from the spawnmenu. 
		
		If you want to make your SENT spawnable you need this function to properly create the entity. 
		
		 
		Name | Description
		--- | ---
		`ply` | The player that is spawning this SENT
		`tr` | A TraceResult structure from player eyes to their aim position
		`ClassName` | The classname of your entity
		
		
		___
		### Lua Examples
		#### Example 1
		This is how it is defined in sent_ball
		
		```lua 
		function ENT:SpawnFunction( ply, tr, ClassName )
		
		    if ( !tr.Hit ) then return end
		
		    local SpawnPos = tr.HitPos + tr.HitNormal * 16
		
		    local ent = ents.Create( ClassName )
		    ent:SetPos( SpawnPos )
		    ent:SetBallSize( math.random( 16, 48 ) )
		    ent:Spawn()
		    ent:Activate()
		
		    return ent
		
		end
		```
		
		#### Example 2
		This is how base_edit spawns (also rotates the entity to face the player, remove * 10 if it spawns in the air)
		
		```lua 
		function ENT:SpawnFunction( ply, tr, ClassName )
		
		    if ( !tr.Hit ) then return end
		    
		    local SpawnPos = tr.HitPos + tr.HitNormal * 10
		    local SpawnAng = ply:EyeAngles()
		    SpawnAng.p = 0
		    SpawnAng.y = SpawnAng.y + 180
		    
		    local ent = ents.Create( ClassName )
		    ent:SetPos( SpawnPos )
		    ent:SetAngles( SpawnAng )
		    ent:Spawn()
		    ent:Activate()
		    
		    return ent
		    
		end
		```
		
		
    **/
    
    @:hook
    public function SpawnFunction(ply:Player, tr:AnyTable, ClassName:String):Void;
    #end
    
}



