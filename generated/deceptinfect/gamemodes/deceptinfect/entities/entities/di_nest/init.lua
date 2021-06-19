ENT.Base = "base_entity"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_nest.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function ENT:Think(...)
	self._gHaxeBurrow:Think(...)
end

function ENT:TestCollision(...)
	self._gHaxeBurrow:TestCollision(...)
end

