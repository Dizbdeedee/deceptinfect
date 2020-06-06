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
	local ent = deceptinfect_HAXE_EXPORT.weapon_di_cure.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end

function SWEP:PrimaryAttack(...)
	self._gHaxeBurrow:PrimaryAttack(...)
end

