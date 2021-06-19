ENT.Base = "base_entity"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_ragdoll.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

