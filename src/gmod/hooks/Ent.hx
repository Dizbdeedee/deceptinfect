package gmod.hooks;


/**
    A list of hooks only available for Scripted Entities. 
	
	The only exceptions to this rule are ENTITY:RenderOverride and ENTITY:CalcAbsolutePosition, which can also be applied to engine entities. 
	
	 Some more "hooks" are available for all entities (including engine entities) with the function Entity:AddCallback. 
	
	 See also: ENT structure 
	
	 
**/
extern class Ent {
    
    /**
        Allows you to override trace result when a trace hits the entitys Bounding Box. 
		
		
		Name | Description
		--- | ---
		`startpos` | Start position of the trace
		`delta` | Offset from startpos to the endpos of the trace
		`isbox` | Is the trace a hull trace?
		`extents` | Size of the hull trace?
		`mask` | The CONTENTS_ Enums mask
		
		
		**Returns:** A table containing new HitPos, Fraction and Normal. Returning nothing allows the trace to ignore the entity completely.
		
		___
		### Lua Examples
		#### Example 1
		Example taken from lua/entities/widget_base.lua
		
		```lua 
		function ENT:TestCollision( startpos, delta, isbox, extents )
		
		        if ( isbox ) then return end
		        if ( !widgets.Tracing ) then return end
		        
		        -- TODO. Actually trace against our cube!
		        
		        return 
		        { 
		                HitPos                = self:GetPos(),
		                Fraction        = 0.5 * self:GetPriority()
		        }
		
		end
		```
		
		
    **/
    
    @:hook
    public function TestCollision(startpos:Vector, delta:Vector, isbox:Bool, extents:Vector, mask:Float):AnyTable;
    
    #if server
    /**
        Called when another entity uses this entity, example would be a player pressing "+use" this entity. 
		
		To change how often the function is called, see Entity:SetUseType. 
		
		 
		Name | Description
		--- | ---
		`activator` | The entity that caused this input. This will usually be the player who pressed their use key
		`caller` | The entity responsible for the input. This will typically be the same as activator unless some other entity is acting as a proxy
		`useType` | Use type, see USE_ Enums.
		`value` | Any passed value.
		
		
		___
		### Lua Examples
		#### Example 1
		Kills any player that uses this entity.
		
		```lua 
		function ENT:Use( activator )
		
		    if activator:IsPlayer() then 
		
		        activator:Kill()
		
		    end
		
		end
		```
		
		
    **/
    
    @:hook
    public function Use(activator:Entity, caller:Entity, useType:Float, value:Float):Void;
    #end
    #if client
    /**
        Specify a mesh that should be rendered instead of this SENT's model. 
		
		
		**Returns:** A table containing the following keys: IMesh Mesh - Required IMaterial Material - Required VMatrix Matrix - Optional
		
		___
		### Lua Examples
		#### Example 1
		A box that renders nicely with ambient lighting, projected textures, and bumpmaps. Performed in the most lines of code possible.
		
		```lua 
		AddCSLuaFile()
		
		DEFINE_BASECLASS( "base_anim" )
		
		ENT.PrintName = "Other Cube"
		ENT.Spawnable = true
		
		ENT.Mins = Vector( -16, -16, -16 )
		ENT.Maxs = Vector(  16,  16,  16 )
		
		ENT.Material = Material( "hunter/myplastic" )
		
		function ENT:SpawnFunction( ply, tr, ClassName )
		    local ent = ents.Create( ClassName )
		    ent:SetPos( tr.HitPos + tr.HitNormal * 32 )
		    ent:Spawn()
		    return ent
		end
		
		function ENT:Initialize()
		    if CLIENT then
		        self:CreateMesh()
		        self:SetRenderBounds( self.Mins, self.Maxs )
		    end
		
		    self:DrawShadow( false )
		end
		
		function ENT:GetRenderMesh()
		    return { Mesh = self.Mesh, Material = self.Material }
		end
		
		function ENT:CreateMesh()
		    self.Mesh = Mesh()
		
		    local positions = {
		        Vector( -0.5, -0.5, -0.5 ),
		        Vector(  0.5, -0.5, -0.5 ),
		        Vector( -0.5,  0.5, -0.5 ),
		        Vector(  0.5,  0.5, -0.5 ),
		        Vector( -0.5, -0.5,  0.5 ),
		        Vector(  0.5, -0.5,  0.5 ),
		        Vector( -0.5,  0.5,  0.5 ),
		        Vector(  0.5,  0.5,  0.5 ),
		    };
		
		    local indices = {
		        1, 7, 5,
		        1, 3, 7,
		        6, 4, 2,
		        6, 8, 4,
		        1, 6, 2,
		        1, 5, 6,
		        3, 8, 7,
		        3, 4, 8,
		        1, 4, 3,
		        1, 2, 4,
		        5, 8, 6,
		        5, 7, 8,
		    }
		
		    local normals = {
		       Vector( -1,  0,  0 ),
		       Vector(  1,  0,  0 ),
		       Vector(  0, -1,  0 ),
		       Vector(  0,  1,  0 ),
		       Vector(  0,  0, -1 ),
		       Vector(  0,  0,  1 ),
		    }
		
		    local tangents = {
		        { 0, 1, 0, -1 },
		        { 0, 1, 0, -1 },
		        { 0, 0, 1, -1 },
		        { 1, 0, 0, -1 },
		        { 1, 0, 0, -1 },
		        { 0, 1, 0, -1 },
		    }
		
		    local uCoords = {
		       0, 1, 0,
		       0, 1, 1,
		       0, 1, 0,
		       0, 1, 1,
		       0, 1, 0,
		       0, 1, 1,
		       0, 1, 0,
		       0, 1, 1,
		       0, 1, 0,
		       0, 1, 1,
		       0, 1, 0,
		       0, 1, 1,
		    }
		
		    local vCoords = {
		       0, 1, 1,
		       0, 0, 1,
		       0, 1, 1,
		       0, 0, 1,
		       0, 1, 1,
		       0, 0, 1,
		       0, 1, 1,
		       0, 0, 1,
		       0, 1, 1,
		       0, 0, 1,
		       0, 1, 1,
		       0, 0, 1,
		    }
		
		    local verts = {}
		    local scale = self.Maxs - self.Mins
		
		    for vert_i = 1, #indices do
		        local face_i = math.ceil( vert_i / 6 )
		
		        verts[vert_i] = {
		            pos = positions[indices[vert_i]] * scale,
		            normal = normals[face_i],
		            u = uCoords[vert_i],
		            v = vCoords[vert_i],
		            userdata = tangents[face_i]
		        }
		    end
		    
		    self.Mesh:BuildFromTriangles( verts )
		end
		```
		
		
    **/
    
    @:hook
    public function GetRenderMesh():AnyTable;
    #end
    #if client
    /**
        Called when a bullet trace hits this entity and allows you to override the default behavior by returning true. 
		
		
		Name | Description
		--- | ---
		`traceResult` | The trace that hit this entity as a TraceResult structure.
		`damageType` | The damage bits associated with the trace, see DMG_ Enums
		`customImpactName` | The effect name to override the impact effect with. Possible arguments are ImpactJeep, AirboatGunImpact, HelicopterImpact, ImpactGunship.
		
		
		**Returns:** Return true to override the default impact effects.
		
		___
		### Lua Examples
		#### Example 1
		Hides the original bullet impact effect and dispatches explosions instead.
		
		```lua 
		function ENT:ImpactTrace(trace,dmgtype,customimpactname)
		    local effectdata = EffectData()
		    effectdata:SetOrigin( trace.HitPos )
		    util.Effect( "Explosion", effectdata )
		    return true
		end
		```
		
		
    **/
    
    @:hook
    public function ImpactTrace(traceResult:AnyTable, damageType:Float, ?customImpactName:String):Bool;
    #end
    #if server
    /**
        Triggers all outputs stored using ENTITY:StoreOutput. 
		
		
		Name | Description
		--- | ---
		`output` | Name of output to fire
		`activator` | Activator entity
		`data` | The data to give to the output.
		
		
		
    **/
    
    @:hook
    public function TriggerOutput(output:String, activator:Entity, ?data:String):Void;
    #end
    #if server
    /**
        Called when an engine task has been started on the entity. 
		
		
		Name | Description
		--- | ---
		`taskID` | Task ID to start, see ai_task.h
		`TaskData` | Task data
		
		
		**Returns:** true to stop default action
		
		
    **/
    
    @:hook
    public function StartEngineTask(taskID:Float, TaskData:Float):Bool;
    #end
    
    /**
        Called whenever the physics of the entity are updated. 
		
		
		Name | Description
		--- | ---
		`phys` | The physics object of the entity.
		
		
		
    **/
    
    @:hook
    public function PhysicsUpdate(phys:PhysObj):Void;
    
    #if server
    /**
        Called when an NPC's expression has finished.   
		Name | Description
		--- | ---
		`strExp` | The path of the expression.
		
		
		
    **/
    
    @:hook
    public function ExpressionFinished(strExp:String):Void;
    #end
    #if server
    /**
        Called after the duplicator library pastes the entity, after the bone/entity modifiers have been applied to the entity. 
		
		This hook is called after ENTITY:OnDuplicated. 
		
		 
		Name | Description
		--- | ---
		`ply` | The player who pasted the entity. WARNING This may not be a valid player in some circumstances. For example, when a save is loaded from the main menu, this hook will be called before the player is spawned. This argument will be a NULL entity in that case. BUG This will be nil for invalid players. Pull Request: #1408
		`ent` | The entity itself. Same as 'self'.
		`createdEntities` | All entities that are within the placed dupe. NOTE The keys of each value in this table are the original entity indexes when the duplication was created. This can be utilized to restore entity references that don't get saved in duplications.
		
		
		
    **/
    
    @:hook
    public function PostEntityPaste(ply:Player, ent:Entity, createdEntities:AnyTable):Void;
    #end
    #if server
    /**
        Called from the engine every 0.1 seconds. 
		
		
		
    **/
    
    @:hook
    public function RunAI():Void;
    #end
    
    /**
        Called whenever the entity's position changes. A callback for when an entity's angle changes is available via Entity:AddCallback. 
		
		Like ENTITY:RenderOverride, this hook works on any entity (scripted or not) it is applied on. 
		
		 
		Name | Description
		--- | ---
		`pos` | The entity's actual position. May differ from Entity: GetPos
		`ang` | The entity's actual angles. May differ from Entity: GetAngles
		
		
		Name | Description
		--- | ---
		`a` | New position
		`b` | New angles
		
		
		
    **/
    
    @:hook
    public function CalcAbsolutePosition(pos:Vector, ang:Angle):EntCalcAbsolutePositionReturn;
    
    #if server
    /**
        Called every think on running task. The actual task function should tell us when the task is finished. 
		
		
		Name | Description
		--- | ---
		`task` | The task to run
		
		
		
    **/
    
    @:hook
    public function RunTask(task:AnyTable):Void;
    #end
    
    /**
        Called from the Entity's motion controller to simulate physics. 
		
		This will only be called after using Entity:StartMotionController on a scripted entity of "anim" type. 
		
		 
		Name | Description
		--- | ---
		`phys` | The physics object of the entity.
		`deltaTime` | Time since the last call.
		
		
		Name | Description
		--- | ---
		`a` | Angular force
		`b` | Linear force
		`c` | One of the SIM_ Enums.
		
		
		
    **/
    
    @:hook
    public function PhysicsSimulate(phys:PhysObj, deltaTime:Float):EntPhysicsSimulateReturn;
    
    
    /**
        Called so the entity can override the bullet impact effects it makes. 
		
		
		Name | Description
		--- | ---
		`tr` | A TraceResult structure from the bullet's start point to the impact point
		`damageType` | The damage type of bullet. See DMG_ Enums
		
		
		**Returns:** Return true to not do the default thing - which is to call UTIL_ImpactTrace in C++
		
		___
		### Lua Examples
		#### Example 1
		Makes the ENT have the AR2 bullet impact effect.
		
		```lua 
		function ENT:DoImpactEffect( tr, nDamageType )
		
		    if ( tr.HitSky ) then return end
		    
		    local effectdata = EffectData()
		    effectdata:SetOrigin( tr.HitPos + tr.HitNormal )
		    effectdata:SetNormal( tr.HitNormal )
		    util.Effect( "AR2Impact", effectdata )
		
		end
		```
		
		
    **/
    
    @:hook
    public function DoImpactEffect(tr:AnyTable, damageType:Float):Bool;
    
    #if server
    /**
        Called when the engine sets a value for this scripted entity. 
		
		See GM:EntityKeyValue for a hook that works for all entities. See WEAPON:KeyValue for a hook that works for scripted weapons. 
		
		 
		Name | Description
		--- | ---
		`key` | The key that was affected.
		`value` | The new value.
		
		
		**Returns:** Return true to suppress this KeyValue or return false or nothing to apply this key value.
		
		
    **/
    
    @:hook
    public function KeyValue(key:String, value:String):Bool;
    #end
    #if server
    /**
        Called when the entity stops touching another entity. 
		
		
		Name | Description
		--- | ---
		`entity` | The entity which was touched.
		
		
		
    **/
    
    @:hook
    public function EndTouch(entity:Entity):Void;
    #end
    #if server
    /**
        Called from the engine when TaskComplete is called. This allows us to move onto the next task - even when TaskComplete was called from an engine side task. 
		
		
		
    **/
    
    @:hook
    public function OnTaskComplete():Void;
    #end
    #if server
    /**
        Starts an engine schedule. 
		
		
		Name | Description
		--- | ---
		`scheduleID` | Schedule ID to start. See SCHED_ Enums
		
		
		
    **/
    
    @:hook
    public function StartEngineSchedule(scheduleID:Float):Void;
    #end
    #if server
    /**
        Called whenever an engine schedule is being ran. 
		
		
		
    **/
    
    @:hook
    public function DoingEngineSchedule():Void;
    #end
    
    /**
        Controls if a property can be used on this entity or not. 
		
		This hook will only work in Sandbox derived gamemodes that do not have SANDBOX:CanProperty overridden. 
		
		 
		Name | Description
		--- | ---
		`ply` | Player, that tried to use the property
		`property` | Class of the property that is tried to use, for example - bonemanipulate
		
		
		**Returns:** Return false to disallow using that property, return true to allow. You must return a value. Not returning anything can cause unexpected results.
		
		
    **/
    
    @:hook
    public function CanProperty(ply:Player, property:String):Bool;
    
    #if server
    /**
        Called whenever the transmit state should be updated. 
		
		
		**Returns:** Transmit state to set, see TRANSMIT_ Enums.
		
		___
		### Lua Examples
		#### Example 1
		Entity pickup example, stops the entity from being networked after it's been picked up, and restores it once it "respawns".
		
		```lua 
		function ENT:Touch( other )
		    if ( self.NextRespawn > CurTime() ) then return end
		    
		    self.NextRespawn = CurTime() + 5
		    self:AddEFlags( EFL_FORCE_CHECK_TRANSMIT )
		end
		
		function ENT:UpdateTransmitState()
		    if ( self.NextRespawn > CurTime() ) then
		        return TRANSMIT_NEVER
		    end
		    
		    return TRANSMIT_PVS
		end
		
		function ENT:Think()
		    if ( self.NextRespawn != -1 && self.NextRespawn < CurTime() ) then
		        self.NextRespawn = -1
		        self:AddEFlags( EFL_FORCE_CHECK_TRANSMIT )
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function UpdateTransmitState():Float;
    #end
    #if server
    /**
        Called when an engine task is ran on the entity. 
		
		
		Name | Description
		--- | ---
		`taskID` | The task ID, see ai_task.h
		`taskData` | The task data.
		
		
		**Returns:** true to prevent default action
		
		
    **/
    
    @:hook
    public function RunEngineTask(taskID:Float, taskData:Float):Bool;
    #end
    #if server
    /**
        Sets the current task. 
		
		
		Name | Description
		--- | ---
		`task` | The task to set.
		
		
		
    **/
    
    @:hook
    public function SetTask(task:AnyTable):Void;
    #end
    #if server
    /**
        Called once on starting task. 
		
		
		Name | Description
		--- | ---
		`task` | The task to start, created by ai_task. New.
		
		
		___
		### Lua Examples
		#### Example 1
		How it is defined:
		
		```lua 
		function ENT:StartTask( task )
		    task:Start( self.Entity )
		end
		```
		
		
    **/
    
    @:hook
    public function StartTask(task:Task):Void;
    #end
    #if server
    /**
        Called when deciding if the Scripted NPC should be able to perform a certain jump or not. 
		
		
		Name | Description
		--- | ---
		`startPos` | Start of the jump
		`apex` | Apex point of the jump
		`endPos` | The landing position
		
		
		**Returns:** Return true if this jump should be allowed to be performed, false otherwise. Not returning anything, or returning a non boolean will perform the default action.
		
		
    **/
    
    @:hook
    public function IsJumpLegal(startPos:Vector, apex:Vector, endPos:Vector):Bool;
    #end
    #if server
    /**
        Returns how many seconds we've been doing this current task 
		
		
		**Returns:** How many seconds we've been doing this current task
		
		
    **/
    
    @:hook
    public function TaskTime():Float;
    #end
    #if server
    /**
        Starts a schedule previously created by ai_schedule.New. 
		
		Not to be confused with ENTITY:StartEngineSchedule or NPC:SetSchedule which start an Engine-based schedule. 
		
		 
		Name | Description
		--- | ---
		`sched` | Schedule to start.
		
		
		
    **/
    
    @:hook
    public function StartSchedule(sched:Schedule):Void;
    #end
    #if server
    /**
        Called when the entity collides with anything. The move type and solid type must be VPHYSICS for the hook to be called. 
		
		
		Name | Description
		--- | ---
		`colData` | Information regarding the collision. See CollisionData structure.
		`collider` | The physics object that collided.
		
		
		___
		### Lua Examples
		#### Example 1
		Play a sound when we hit something.
		
		```lua 
		function ENT:PhysicsCollide( data, phys )
		    if ( data.Speed > 50 ) then self:EmitSound( Sound( "Flashbang.Bounce" ) ) end
		end
		```
		
		
    **/
    
    @:hook
    public function PhysicsCollide(colData:AnyTable, collider:PhysObj):Void;
    #end
    #if server
    /**
        Called when the entity is taking damage. 
		
		
		Name | Description
		--- | ---
		`damage` | The damage to be applied to the entity.
		
		
		___
		### Lua Examples
		#### Example 1
		All damage taken by this entity is applied twice. This will count the damage taken as two distinctive hits as opposed to just scaling it in GM:EntityTakeDamage.
		
		```lua 
		function ENT:OnTakeDamage( dmginfo )
		    -- Make sure we're not already applying damage a second time
		    -- This prevents infinite loops
		    if ( not self.m_bApplyingDamage ) then
		        self.m_bApplyingDamage = true
		        self:TakeDamageInfo( dmginfo )
		        self.m_bApplyingDamage = false
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function OnTakeDamage(damage:CTakeDamageInfo):Void;
    #end
    #if server
    /**
        Called to determine how good an NPC is at using a particular weapon. 
		
		
		Name | Description
		--- | ---
		`wep` | The weapon being used by the NPC.
		`target` | The target the NPC is attacking
		
		
		**Returns:** The number of degrees of inaccuracy in the NPC's attack.
		
		
    **/
    
    @:hook
    public function GetAttackSpread(wep:Entity, target:Entity):Float;
    #end
    #if server
    /**
        Polls whenever the entity should trigger the brush. 
		
		
		Name | Description
		--- | ---
		`ent` | The entity that is about to trigger.
		
		
		**Returns:** Should trigger or not.
		
		___
		### Lua Examples
		#### Example 1
		How this is supposed to work internally
		
		```lua 
		ENT.Entities = {}
		
		function ENT:IsTouchedBy( ent )
		    return table.HasValue( self.Entities, ent )
		end
		
		function ENT:StartTouch( ent )
		    if ( !self:PassesTriggerFilters( ent ) ) then return end
		    table.insert( self.Entities, ent )
		
		    -- Code 
		end
		
		function ENT:Touch( ent )
		    if ( !self:PassesTriggerFilters( ent ) ) then return end
		    if ( !table.HasValue( ent ) ) then table.insert( self.Entities, ent ) end
		
		    -- Code 
		end
		
		function ENT:EndTouch( ent )
		    if ( !self:IsTouchedBy( ent ) ) then return end
		    table.RemoveByValue( self.Entities, ent )
		
		    -- Code 
		end
		```
		
		
    **/
    
    @:hook
    public function PassesTriggerFilters(ent:Entity):Bool;
    #end
    #if server
    /**
        Called every tick for every entity being "touched". 
		
		See also ENTITY:StartTouch and ENTITY:EndTouch. 
		
		 
		Name | Description
		--- | ---
		`entity` | The entity that touched it.
		
		
		___
		### Lua Examples
		#### Example 1
		
		
		```lua 
		function ENTITY:Touch(entity)
		    self:EmitSound("ambient/explosions/explode_" .. math.random(1, 9) .. ".wav")
		    self:Remove()
		end
		```
		
		
    **/
    
    @:hook
    public function Touch(entity:Entity):Void;
    #end
    
    /**
        Called when this entity is about to be punted with the gravity gun (primary fire). 
		
		Only works in Sandbox derived gamemodes and only if GM:GravGunPunt is not overridden. 
		
		 
		Name | Description
		--- | ---
		`ply` | The player pressing left-click with the gravity gun at an entity
		
		
		**Returns:** Return true or false to enable or disable punting respectively.
		
		___
		### Lua Examples
		#### Example 1
		Enables a scripted entity to be punted even when frozen.
		
		```lua 
		function ENT:GravGunPunt( ply )
		    self:GetPhysicsObject():EnableMotion( true )
		    return true
		end
		```
		
		
    **/
    
    @:hook
    public function GravGunPunt(ply:Player):Bool;
    
    #if server
    /**
        Called when another entity fires an event to this entity. 
		
		
		Name | Description
		--- | ---
		`inputName` | The name of the input that was triggered.
		`activator` | The initial cause for the input getting triggered. (EG the player who pushed a button)
		`caller` | The entity that directly triggered the input. (EG the button that was pushed)
		`data` | The data passed.
		
		
		**Returns:** Should we suppress the default action for this input?
		
		
    **/
    
    @:hook
    public function AcceptInput(inputName:String, activator:Entity, caller:Entity, data:String):Bool;
    #end
    
    /**
        Called when the entity is about to be removed. 
		
		See also Entity:CallOnRemove, which can even be used on engine (non-Lua) entities. 
		
		 
		
    **/
    
    @:hook
    public function OnRemove():Void;
    
    #if server
    /**
        Set the schedule we should be playing right now. 
		
		
		Name | Description
		--- | ---
		`iNPCState` | 
		
		
		___
		### Lua Examples
		#### Example 1
		Creates a new schedule and assigns it to a scripted NPC.
		
		```lua 
		local schdTest = ai_schedule.New( "Test Schedule" )
		 
		schdTest:EngTask( "TASK_GET_PATH_TO_RANDOM_NODE",  128 )
		schdTest:EngTask( "TASK_RUN_PATH",            0   )
		schdTest:EngTask( "TASK_WAIT_FOR_MOVEMENT",        0   )
		 
		 
		function ENT:SelectSchedule()
		 
		    self:StartSchedule( schdTest )
		 
		end
		```
		**Output:**
		
		The scripted NPC will run around when spawned.
		
		
    **/
    
    @:hook
    public function SelectSchedule(iNPCState:Float):Void;
    #end
    #if server
    /**
        Called before the duplicator copies the entity. 
		
		If you are looking for a way to make the duplicator spawn another entity when duplicated. ( For example, you duplicate a "prop_physics", but you want the duplicator to spawn "prop_physics_my" ), you should add prop_physics.ClassOverride = "prop_physics_my". The duplication table should be also stored on that prop_physics, not on prop_physics_my. 
		
		 
		___
		### Lua Examples
		#### Example 1
		Example on how to store values for duplicator, and then restore them afterwards
		
		```lua 
		-- Store the value for duplicator
		function ENT:PreEntityCopy()
		    self.MyDuplicatorVariasble = self:GetSequence()
		end
		
		-- Restore the saved value
		function ENT:PostEntityPaste()
		    -- Always validate data before using it
		    if ( !self.MyDuplicatorVariasble ) then return end
		
		    self:ResetSequence( self.MyDuplicatorVariasble )
		end
		```
		
		
    **/
    
    @:hook
    public function PreEntityCopy():Void;
    #end
    
    /**
        Called when the entity is created. This is called when you Entity:Spawn the custom entity. 
		
		This is called after ENTITY:SetupDataTables and GM:OnEntityCreated. 
		
		 
		___
		### Lua Examples
		#### Example 1
		Example Initialize function
		
		```lua 
		function ENT:Initialize()
		    -- Sets what model to use
		    self:SetModel( "models/props/cs_assault/money.mdl" )
		
		    -- Sets what color to use
		    self:SetColor( Color( 200, 255, 200 ) )
		
		    -- Physics stuff
		    self:SetMoveType( MOVETYPE_VPHYSICS )
		    self:SetSolid( SOLID_VPHYSICS )
		
		    -- Init physics only on server, so it doesn't mess up physgun beam
		    if ( SERVER ) then self:PhysicsInit( SOLID_VPHYSICS ) end
		    
		    -- Make prop to fall on spawn
		    local phys = self:GetPhysicsObject()
		    if ( IsValid( phys ) ) then phys:Wake() end
		end
		```
		
		#### Example 2
		Fixes the function not being called clientside.
		
		```lua 
		function SWEP:Initialize()
		    self.m_bInitialized = true
		
		    -- Other code
		end
		
		function SWEP:Think()
		    if (not self.m_bInitialized) then
		        self:Initialize()
		    end
		
		    -- Other code
		end
		```
		
		
    **/
    
    @:hook
    public function Initialize():Void;
    
    #if server
    /**
        Start the next task in specific schedule. 
		
		
		Name | Description
		--- | ---
		`sched` | The schedule to start next task in.
		
		
		
    **/
    
    @:hook
    public function NextTask(sched:AnyTable):Void;
    #end
    #if server
    /**
        Called before firing serverside animation events, such as weapon reload, drawing and holstering for NPCs, scripted sequences, etc. 
		
		See ENTITY:FireAnimationEvent for the clientside version. 
		
		 
		Name | Description
		--- | ---
		`event` | The event ID of happened even. See this page.
		`eventTime` | The absolute time this event occurred using CurTime.
		`cycle` | The frame this event occurred as a number between 0 and 1.
		`type` | Event type. See the Source SDK.
		`options` | Name or options of this event.
		
		
		
    **/
    
    @:hook
    public function HandleAnimEvent(event:Float, eventTime:Float, cycle:Float, type:Float, options:String):Void;
    #end
    #if server
    /**
        Called by GM:GravGunPickupAllowed on ALL entites in Sandbox-derived gamemodes and acts as an override. 
		
		
		Name | Description
		--- | ---
		`ply` | The player aiming at us
		
		
		**Returns:** Return true to allow the entity to be picked up
		
		
    **/
    
    @:hook
    public function GravGunPickupAllowed(ply:Player):Bool;
    #end
    #if server
    /**
        Runs a Lua schedule. Runs tasks inside the schedule. 
		
		
		Name | Description
		--- | ---
		`sched` | The schedule to run.
		
		
		
    **/
    
    @:hook
    public function DoSchedule(sched:AnyTable):Void;
    #end
    
    /**
        Called every frame on the client. Called every tick on the server. 
		
		
		**Returns:** Return true if you used Entity: NextThink to override the next execution time.
		
		___
		### Lua Examples
		#### Example 1
		Force the think hook to run at the maximum frequency. This is generally only used for anim entities, if the entity has to play any animations.
		
		```lua 
		ENT.AutomaticFrameAdvance = true -- Must be set on client
		
		function ENT:Think()
		    -- Do stuff
		
		    self:NextThink( CurTime() )
		    return true
		end
		```
		
		
    **/
    
    @:hook
    public function Think():Bool;
    
    #if client
    /**
        Called if and when the entity should be drawn opaquely, based on the Entity:GetRenderGroup of the entity. 
		
		See ENT structure and RENDERGROUP_ Enums for more information. 
		
		 See also ENTITY:DrawTranslucent. 
		
		 
		Name | Description
		--- | ---
		`flags` | The bit flags from STUDIO_ Enums
		
		
		___
		### Lua Examples
		#### Example 1
		Draws the model and makes a rotating text over the entity
		
		```lua 
		-- Draw some 3D text
		local function Draw3DText( pos, ang, scale, text, flipView )
		    if ( flipView ) then
		        -- Flip the angle 180 degrees around the UP axis
		        ang:RotateAroundAxis( Vector( 0, 0, 1 ), 180 )
		    end
		
		    cam.Start3D2D( pos, ang, scale )
		        -- Actually draw the text. Customize this to your liking.
		        draw.DrawText( text, "Default", 0, 0, Color( 0, 255, 0, 255 ), TEXT_ALIGN_CENTER )
		    cam.End3D2D()
		end
		
		function ENT:Draw()
		    -- Draw the model
		    self:DrawModel()
		
		    -- The text to display
		    local text = "Example Text"
		
		    -- The position. We use model bounds to make the text appear just above the model. Customize this to your liking.
		    local mins, maxs = self:GetModelBounds()
		    local pos = self:GetPos() + Vector( 0, 0, maxs.z + 2 )
		
		    -- The angle
		    local ang = Angle( 0, SysTime() * 100 % 360, 90 )
		
		    -- Draw front
		    Draw3DText( pos, ang, 0.2, text, false )
		    -- DrawDraw3DTextback
		    Draw3DText( pos, ang, 0.2, text, true )
		end
		```
		
		
    **/
    
    @:hook
    public function Draw(flags:Float):Void;
    #end
    #if server
    /**
        Called when scripted NPC needs to check how he "feels" against another entity, such as when NPC:Disposition is called. 
		
		
		Name | Description
		--- | ---
		`ent` | The entity in question
		
		
		**Returns:** How our scripter NPC "feels" towards the entity in question. See D_ Enums.
		
		
    **/
    
    @:hook
    public function GetRelationship(ent:Entity):Float;
    #end
    #if server
    /**
        Called when the entity starts touching another entity. 
		
		
		Name | Description
		--- | ---
		`entity` | The entity which is being touched.
		
		
		
    **/
    
    @:hook
    public function StartTouch(entity:Entity):Void;
    #end
    #if client
    /**
        Called before firing clientside animation events, such as muzzle flashes or shell ejections. 
		
		See ENTITY:HandleAnimEvent for the serverside version. 
		
		 
		Name | Description
		--- | ---
		`pos` | Position of the effect
		`ang` | Angle of the effect
		`event` | The event ID of happened even. See this page.
		`name` | Name of the event
		
		
		**Returns:** Return true to disable the effect
		
		
    **/
    
    @:hook
    public function FireAnimationEvent(pos:Vector, ang:Angle, event:Float, name:String):Bool;
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
    #if server
    /**
        Called after the duplicator finished copying the entity. 
		
		See also ENTITY:PreEntityCopy and ENTITY:PostEntityPaste. 
		
		 
		
    **/
    
    @:hook
    public function PostEntityCopy():Void;
    #end
    
    /**
        Called when the entity should set up its Data Tables. 
		
		This is a much better option than using Set/Get Networked Values. 
		
		 This hook is called after GM:OnEntityCreated and GM:NetworkEntityCreated. 
		
		 
		___
		### Lua Examples
		#### Example 1
		Sets up networked variables, adds functions SetAmount, GetAmount, GetBloodPos, SetBloodPos, GetUrinePos, SetUrinePos.This function only supports 64 data tables per type (#0-63), except for strings which only supports 4.
		
		```lua 
		function ENT:SetupDataTables()
		
		    self:NetworkVar( "Float", 0, "Amount" )
		    self:NetworkVar( "Vector", 0, "BloodPos" )
		    self:NetworkVar( "Vector", 1, "UrinePos" )
		
		    if SERVER then
		        self:SetAmount( 3 )
		        self:SetBloodPos( Vector( 0, -32, 0 ) )
		        self:SetUrinePos( Vector( 0, 0, -16 ) )
		    end
		
		end
		```
		
		
    **/
    
    @:hook
    public function SetupDataTables():Void;
    
    #if server
    /**
        Called whenever a schedule is finished. 
		
		
		
    **/
    
    @:hook
    public function ScheduleFinished():Void;
    #end
    #if server
    /**
        Called by Entity:PassesFilter and engine entities to determine whether an entity passes this filter's filter. 
		
		
		Name | Description
		--- | ---
		`trigger` | The 'caller' entity, the one that wants to know if the entity passes the filter
		`ent` | The entity in question that is being tested
		
		
		**Returns:** Whether the entity passes the filter ( true ) or not ( false )
		
		
    **/
    
    @:hook
    public function PassesFilter(trigger:Entity, ent:Entity):Bool;
    #end
    #if client
    /**
        Called when the entity should be drawn translucently. 
		
		
		Name | Description
		--- | ---
		`flags` | The bit flags from STUDIO_ Enums
		
		
		___
		### Lua Examples
		#### Example 1
		The default action for this hook is to call ENTITY:Draw.
		
		```lua 
		function ENT:DrawTranslucent()
		
		    -- This is here just to make it backwards compatible.
		    -- You shouldn't really be drawing your model here unless it's translucent
		
		    self:Draw()
		
		end
		```
		
		
    **/
    
    @:hook
    public function DrawTranslucent(flags:Float):Void;
    #end
    #if server
    /**
        Called after duplicator finishes saving the entity, allowing you to modify the save data. 
		
		This is called after ENTITY:PostEntityCopy. 
		
		 
		Name | Description
		--- | ---
		`data` | The save EntityCopyData structure that you can modify.
		
		
		___
		### Lua Examples
		#### Example 1
		Prevent this entity from being copied and subsequently pasted.
		
		```lua 
		function ENT:OnEntityCopyTableFinish( data )
		    for k, v in pairs( data ) do data[ k ] = nil end
		end
		```
		
		
    **/
    
    @:hook
    public function OnEntityCopyTableFinish(data:AnyTable):Void;
    #end
    
    /**
        Toggles automatic frame advancing for animated sequences on an entity. 
		
		This has the same effect as setting the ENT.AutomaticFrameAdvance property. 
		
		 
		Name | Description
		--- | ---
		`enable` | Whether or not to set automatic frame advancing.
		
		
		
    **/
    
    @:hook
    public function SetAutomaticFrameAdvance(enable:Bool):Void;
    
    #if client
    /**
        Called instead of the engine drawing function of the entity. This hook works on any entity (scripted or not) it is applied on. 
		
		This does not work on "physgun_beam", use GM:DrawPhysgunBeam instead. 
		
		 
		___
		### Lua Examples
		#### Example 1
		Set the entity the player is looking at to not draw if the player is its owner.
		
		```lua 
		local function DontDrawMe( self )
		    if ( self:GetOwner() == LocalPlayer() ) then
		        return
		    end
		    
		    self:DrawModel()
		end
		
		local pickent = LocalPlayer():GetEyeTrace().Entity
		
		if ( IsValid( pickent ) ) then
		    pickent.RenderOverride = DontDrawMe
		end
		```
		
		
    **/
    
    @:hook
    public function RenderOverride():Void;
    #end
    #if server
    /**
        Called on any entity after it has been created by the duplicator library and before any bone/entity modifiers have been applied. 
		
		This hook is called after ENTITY:Initialize and before ENTITY:PostEntityPaste. 
		
		 
		Name | Description
		--- | ---
		`entTable` | EntityCopyData structure of the source entity.
		
		
		
    **/
    
    @:hook
    public function OnDuplicated(entTable:AnyTable):Void;
    #end
    #if server
    /**
        Called by Entity:PassesDamageFilter and engine entities to determine whether an entity passes this filter's damage filter. 
		
		
		Name | Description
		--- | ---
		`dmg` | Damage to test.
		
		
		**Returns:** Whether the entity passes the damage filter ( true ) or not. ( false )
		
		
    **/
    
    @:hook
    public function PassesDamageFilter(dmg:CTakeDamageInfo):Bool;
    #end
    #if server
    /**
        Used to store an output so it can be triggered with ENTITY:TriggerOutput. Outputs compiled into a map are passed to entities as key/value pairs through ENTITY:KeyValue. 
		
		TriggerOutput will do nothing if this function has not been called first. 
		
		 
		Name | Description
		--- | ---
		`name` | Name of output to store
		`info` | Output info
		
		
		___
		### Lua Examples
		#### Example 1
		Stores all outputs that are assigned to an entity in Hammer.
		
		```lua 
		function ENT:KeyValue( k, v )
		    -- 99% of all outputs are named 'OnSomethingHappened'.
		    if ( string.Left( k, 2 ) == "On" ) then
		        self:StoreOutput( k, v )
		    end
		end
		```
		
		
    **/
    
    @:hook
    public function StoreOutput(name:String, info:String):Void;
    #end
    #if server
    /**
        ***INTERNAL:**  
		
		Called just before :  for "ai" type entities only. 
		
    **/
    @:deprecated
    @:hook
    public function CreateSchedulesInternal():Void;
    #end
    
    /**
        Called when the entity is reloaded from a Source Engine save (not the Sandbox saves or dupes) or on a changelevel (for example Half-Life 2 campaign level transitions). 
		
		For the duplicator library callbacks, see ENTITY:OnDuplicated. 
		
		 
		
    **/
    
    @:hook
    public function OnRestore():Void;
    
    #if server
    /**
        Called each time the NPC updates its condition. 
		
		
		Name | Description
		--- | ---
		`conditionID` | The ID of condition. See NPC: ConditionName.
		
		
		
    **/
    
    @:hook
    public function OnCondition(conditionID:Float):Void;
    #end
    
    /**
        Called when the entity is reloaded by the lua auto-refresh system, i.e. when the developer edits the lua file for the entity while the game is running. 
		
		
		
    **/
    
    @:hook
    public function OnReloaded():Void;
    
    #if server
    /**
        Called when the entity is blocked. 
		
		
		Name | Description
		--- | ---
		`other` | The entity that is blocking this entity.
		
		
		
    **/
    
    @:hook
    public function Blocked(other:Entity):Void;
    #end
    #if server
    /**
        Called whenever an engine schedule is finished. 
		
		
		
    **/
    
    @:hook
    public function EngineScheduleFinish():Void;
    #end
    #if server
    /**
        Returns true if the current running Task is finished. 
		
		
		**Returns:** Is the current running Task is finished or not.
		
		
    **/
    
    @:hook
    public function TaskFinished():Bool;
    #end
    
}


@:multiReturn extern class EntPhysicsSimulateReturn {
var a:Vector;
var b:Vector;
var c:Float;

}
@:multiReturn extern class EntCalcAbsolutePositionReturn {
var a:Vector;
var b:Angle;

}

