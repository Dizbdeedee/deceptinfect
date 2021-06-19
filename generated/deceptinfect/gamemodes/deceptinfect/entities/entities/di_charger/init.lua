ENT.Base = "base_anim"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = __deceptinfect_ents.di_charger.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

