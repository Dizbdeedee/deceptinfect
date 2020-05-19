SWEP.Primary = {
Automatic = true,
ClipSize = -1,
DefaultClip = -1,
Ammo = "None",
}

function SWEP:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function SWEP:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.di_cure.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end

