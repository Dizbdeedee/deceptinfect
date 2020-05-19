SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "None",
}
AddCSLuaFile("cl_init.lua")

function SWEP:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.di_cure.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function SWEP:PrimaryAttack(...)
	self._gHaxeBurrow:PrimaryAttack(...)
end

