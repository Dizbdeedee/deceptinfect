SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "Smg1",
}
AddCSLuaFile("cl_init.lua")

function SWEP:Initialize()
	local ent = __deceptinfect_ents.weapon_di_scan.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

function SWEP:PrimaryAttack(...)
	self._gHaxeBurrow:PrimaryAttack(...)
end

function SWEP:SecondaryAttack(...)
	self._gHaxeBurrow:SecondaryAttack(...)
end

