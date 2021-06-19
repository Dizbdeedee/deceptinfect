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

function SWEP:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function SWEP:Initialize()
	local ent = __deceptinfect_ents.weapon_di_spit.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
	self._gHaxeInit = true
end

