ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Think()
	if (not self._gHaxeInit) then
		self:Initialize()
	end
end


function ENT:Initialize()
	local ent = deceptinfect_HAXE_EXPORT.di_weaponcache.new(self)
	self._gHaxeBurrow = ent
	self._gHaxeInit = true
end
