SWEP.Primary = {
Automatic = false,
ClipSize = -1,
DefaultClip = -1,
Ammo = "SMG1",
}

function SWEP:Think(...)
	if (not self._gHaxeInit) then
		self._gHaxeBurrow:Initalize()
	end
	self._gHaxeBurrow:Think(...)
end


function SWEP:Initialize(...)
	local ent = deceptinfect_HAXE_EXPORT.weapon_di_scan.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeBurrow:Initialize()
	self._gHaxeInit = true
end

