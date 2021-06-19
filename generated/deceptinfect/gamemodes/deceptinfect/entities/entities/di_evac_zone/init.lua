ENT.Base = "base_brush"
ENT.Type = "brush"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_evac_zone.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function ENT:StartTouch(...)
	self._gHaxeBurrow:StartTouch(...)
end

function ENT:EndTouch(...)
	self._gHaxeBurrow:EndTouch(...)
end

