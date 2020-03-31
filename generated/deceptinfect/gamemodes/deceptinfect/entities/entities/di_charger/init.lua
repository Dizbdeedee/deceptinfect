ENT.Base = "base_entity"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.di_charger.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

