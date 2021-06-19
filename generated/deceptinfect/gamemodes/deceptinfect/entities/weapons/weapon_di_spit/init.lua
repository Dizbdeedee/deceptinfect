SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "None",
}
SWEP.Secondary = {
Automatic = false,
ClipSize = 0,
DefaultClip = 0,
Ammo = "none",
}
AddCSLuaFile("cl_init.lua")

function SWEP:Initialize()
	local ent = __deceptinfect_ents.weapon_di_spit.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function SWEP:PrimaryAttack(...)
	self._gHaxeBurrow:PrimaryAttack(...)
end

