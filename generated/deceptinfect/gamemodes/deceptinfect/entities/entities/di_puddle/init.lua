ENT.Base = "base_entity"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_puddle.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function ENT:Touch(...)
	self._gHaxeBurrow:Touch(...)
end

