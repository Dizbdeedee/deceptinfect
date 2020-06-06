SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "Smg1",
}
AddCSLuaFile("cl_init.lua")

function SWEP:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.weapon_di_cure.new(self)
	self._gHaxeBurrow = ent
end

function SWEP:PrimaryAttack(...)
	self._gHaxeBurrow:PrimaryAttack(...)
end

