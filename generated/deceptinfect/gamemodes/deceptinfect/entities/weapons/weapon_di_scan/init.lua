SWEP.Primary = {
Automatic = false,
ClipSize = -1,
DefaultClip = -1,
Ammo = "SMG1",
}
AddCSLuaFile("cl_init.lua")

function SWEP:Initialize(...)
	local ent = deceptinfect_HAXE_EXPORT.weapon_di_scan.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
end

