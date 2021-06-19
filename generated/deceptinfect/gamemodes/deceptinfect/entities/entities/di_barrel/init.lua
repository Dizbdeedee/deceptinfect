ENT.Base = "base_anim"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_barrel.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function ENT:Use(...)
	self._gHaxeBurrow:Use(...)
end

function ENT:OnTakeDamage(...)
	self._gHaxeBurrow:OnTakeDamage(...)
end

