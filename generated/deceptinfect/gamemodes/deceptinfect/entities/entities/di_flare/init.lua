ENT.Base = "base_entity"
ENT.Type = "anim"
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.di_flare.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function ENT:Touch(...)
	self._gHaxeBurrow:Touch(...)
end

function ENT:Use(...)
	self._gHaxeBurrow:Use(...)
end

