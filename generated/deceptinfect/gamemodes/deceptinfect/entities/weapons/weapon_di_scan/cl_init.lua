SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "Smg1",
}

function SWEP:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function SWEP:Initialize()
	local ent = deceptinfect.weapon_di_scan.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end

